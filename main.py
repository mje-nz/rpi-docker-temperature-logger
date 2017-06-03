from __future__ import print_function

import time

import paho.mqtt.client as mqtt
from sensor import HTU21D


def main(mqtt_server='localhost', period=60):
    client = mqtt.Client()
    client.on_connect = lambda c, u, f, r: print('Connected')
    client.connect_async(mqtt_server, port=1883, keepalive=60)
    try:
        client.loop_start()
        htu = HTU21D.HTU21D(1, 0x40)
        while True:
            humidity, temperature = htu.all()
            print('[%s] Humidity: %.1f%%, temperature: %.1fC' % (
                time.strftime('%H:%M:%S'), humidity.RH, temperature.C))
            client.publish('tv/temp', '%.2f' % temperature.C, qos=1, retain=True)
            client.publish('tv/hum', '%.2f' % humidity.RH, qos=1, retain=True)
            time.sleep(period - time.time() % period)
    except KeyboardInterrupt:
        print('Exiting')
    finally:
        client.loop_stop()

if __name__ == '__main__':
    main()
