# machine-metrics
Script to install and run Prometheus Node Exporter (https://github.com/prometheus/node_exporter)

Usage:

```
sudo -H ./install
```

You can then control the service as per a normal systemd service, i.e.

* `sudo systemctl [start|stop|enable|disable] machine-metrics.service`
* `systemctl status machine-metrics.service`
* `sudo journalctl --unit machine-metrics`

## Deploy onto a machine

* ssh onto the machine you want to export machine metrics from
* Clone this repo
* Run `sudo -h ./install`

This will make machine metrics available at `localhost:9100/metrics`.

To make the machine metrics accessible to Prometheus, add a new job in `prometheus.yml` to monitor the URL at `<server_name>:9100/metrics`.
