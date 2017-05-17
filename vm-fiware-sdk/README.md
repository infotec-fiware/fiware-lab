#### Get up the Virtual Machine with the next command:

```bash
vagrant up
```
#### Get into the Virtual Machine

```bash
vagrant ssh
```

#### In order to find out the assigned IP, run the next command:
```bash
ip a
```
the output in the shell is something like the next output:

```bash
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 52:54:00:22:5b:53 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 85937sec preferred_lft 85937sec
    inet6 fe80::5054:ff:fe22:5b53/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN 
    link/ether 02:42:3f:e3:7d:75 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
```

Here we have three network interface. In order to subscribe to the orion context broker we are going to use the last network interface `docker0` with the assigned ip `172.17.0.1`.

#### Getting up the Orion Context Broker

```bash
docker-compose up -d
```

#### Getting up the Orion Subscriber:
Change to the fiware-orion-subscriber folder:

```bash
cd fiware-orion-subscriber/
```

#### Getting up the Orion Subscriber:
```bash
mvn spring-boot:run
```

#### Testing the Orion Context Broker
```javascript
http://localhost:1026/version
```

#### Testing the Orion Subscriber
```javascript
http://localhost:8080/
```

The default user is:
```javascript
username: blanca.vazquez
password: blanca.vazquez
```

#### Orion Context Broker Subscription Example:

In this example the assigned IP was `172.17.0.1` so the subscription payload could be:

```javascript
{
	"description": "Update average rating",
	"subject": {
		"entities": [
			{
				"id": "Station1",
				"type": "EstacionMonitoreoContaminantes"
			}
		],
		"condition": {
			"attrs": [
				"o3"
			]
		}
	},
	"notification": {
		"http": {
			"url": "http://172.17.0.1:8080/notifications",
			"method": "POST"
		},
		"attrsFormat": "keyValues",
		"attrs": [
			"id",
			"nombre",
			"o3",
			"latitud",
			"longitud"
		]
	},
	"expires": "2020-04-05T14:00:00.00Z",
	"throttling": 1
}
```
Great!
