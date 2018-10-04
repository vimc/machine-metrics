# machine-metrics
Script to install and run Prometheus Node Exporter (https://github.com/prometheus/node_exporter)

Usage:

```
sudo -H ./install.sh
```

You can then control the service as per a normal systemd service, i.e.

* `sudo systemctl [start|stop|enable|disable] machine-metrics.service`
* `systemctl status machine-metrics.service`
* `sudo journalctl --unit montagu-staging`
