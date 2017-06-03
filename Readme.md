Measure temperature and humidity with an HTU21D, and publish to MQTT.

To run:
```docker run -t --rm --device /dev/i2c-1 --volume /etc/localtime:/etc/localtime:ro --net=host mjenz/rpi-temperature-logger```

To install as a service:
```docker run --detach -t --device /dev/i2c-1 --volume /etc/localtime:/etc/localtime:ro --net=host --restart unless-stopped --name temp-logger mjenz/rpi-temperature-logger```

To enable i2c on osmc:
```
sudo modprobe i2c-bcm2708
sudo modprobe i2c-dev
echo "dtparam=i2c_arm=on" | sudo tee -a /boot/config.txt
sudo adduser osmc i2c
reboot
```
