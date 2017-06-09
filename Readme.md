# Measure temperature and humidity with an HTU21D, and publish to MQTT

[![](https://images.microbadger.com/badges/image/mjenz/rpi-temperature-logger.svg)](https://microbadger.com/images/mjenz/rpi-temperature-logger "Get your own image badge on microbadger.com")

To run:
```docker run -t --rm --device /dev/i2c-1 --volume /etc/localtime:/etc/localtime:ro --net=host mjenz/rpi-temperature-logger```

To install as a service:
```docker run --detach -t --device /dev/i2c-1 --volume /etc/localtime:/etc/localtime:ro --net=host --restart unless-stopped --name temp-logger mjenz/rpi-temperature-logger```

To enable i2c on osmc:
```
echo "i2c-bcm2708" | sudo tee -a /etc/modules
echo "i2c-dev" | sudo tee -a /etc/modules
echo "dtparam=i2c_arm=on" | sudo tee -a /boot/config.txt
sudo adduser osmc i2c
reboot
```
