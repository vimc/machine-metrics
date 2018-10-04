#!/usr/bin/env bash
set -e

HERE=$(dirname $(realpath $0))
TARGET=/etc/systemd/system/machine-metrics.service

if [[ "$HOME" != /root ]]; then
    echo "Run with sudo -H ./install.sh (home was $HOME)"
    exit 1;
fi

set -x
snap install --classic go
go get github.com/prometheus/node_exporter
cd ${GOPATH-$HOME/go}/src/github.com/prometheus/node_exporter
make build

cp $HERE/run.sh /usr/local/bin/machine-metrics-exporter

cp $HERE/machine-metrics.service $TARGET
sed -i "s:__PATH__:$HERE:g" $TARGET
systemctl enable machine-metrics
systemctl start machine-metrics

set +x
echo ""
echo "Prometheus node exporter is installed at a service and is running at:"
echo ""
echo "http://localhost:9100/metrics"
echo ""
