# FAQ about Computer Network

## 1. Linux 에서 대역 내 사용중이 ip를 확인하고 싶을 때

Ubuntu 를 예로 들겠다
``` sh
$ sudo apt-get install -y arp-scan
$ sudo arp-scan 10.208.198.0/24
Interface: enp6s0, datalink type: EN10MB (Ethernet)
Starting arp-scan 1.9 with 256 hosts (http://www.nta-monitor.com/tools/arp-scan/)
10.208.198.1    00:00:0c:07:ac:ce       HSRP (last octet is group number)
10.208.198.2    70:81:05:54:ba:7f       CISCO SYSTEMS, INC.
10.208.198.3    70:81:05:8b:82:bf       CISCO SYSTEMS, INC.
10.208.198.5    10:78:ce:20:00:0a       Hanvit SI, Inc.
10.208.198.6    a8:ca:b9:06:b5:c9       (Unknown)
...
...
10.208.198.239  98:83:89:85:f4:15       (Unknown)
10.208.198.242  88:36:6c:42:bd:80       (Unknown)
10.208.198.243  50:b7:c3:a7:9a:c1       Samsung Electronics CO., LTD
10.208.198.245  54:10:ec:a6:e6:5d       (Unknown)
10.208.198.244  98:83:89:7b:a9:7c       (Unknown)
10.208.198.246  48:0f:cf:59:af:a4       (Unknown)
10.208.198.247  98:83:89:9e:3c:e6       (Unknown)
10.208.198.249  e8:03:9a:6f:b0:e1       Samsung Electronics CO., LTD
10.208.198.248  98:83:89:7b:8c:86       (Unknown)
10.208.198.250  1c:7d:22:08:73:06       (Unknown)
10.208.198.251  1c:7d:22:08:72:f9       (Unknown)

160 packets received by filter, 0 packets dropped by kernel
Ending arp-scan 1.9: 256 hosts scanned in 3.648 seconds (70.18 hosts/sec). 160 responded
```

