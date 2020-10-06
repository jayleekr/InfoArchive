# FAQ about Computer Network on Linux
## Preface
모든 예제는 Ubuntu상의 terminal에서 실행하였다.
다른 OS의 경우에는 각자 OS에 맞는 pacakage manager를 사용할 것을 권한다.

## 1. Linux 에서 대역 내에 사용중이 ip를 확인 (ip scan)

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

## 2. ifconfig 를 이용한 network 정보 변경
먼저 ifconfig가 없다면 설치하자
```sh
$ sudo apt-get install net-tools
```
아래와 같이 실행 시키면 모든 linux 에 연결된 network device의 정보가 뜬다.
```sh
$ ifconfig
enp6s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.208.198.46  netmask 255.255.255.0  broadcast 10.208.198.255
        inet6 fe80::a5a0:9155:6310:9c2  prefixlen 64  scopeid 0x20<link>
        ether b4:2e:99:a1:f2:4f  txqueuelen 1000  (Ethernet)
        RX packets 14950815  bytes 8656376582 (8.6 GB)
        RX errors 0  dropped 214  overruns 0  frame 0
        TX packets 4358150  bytes 508129387 (508.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device memory 0xf6900000-f691ffff  

enp7s0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether 00:1b:21:dc:a5:55  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device memory 0xf6300000-f63fffff  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 1175041  bytes 347365165 (347.3 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1175041  bytes 347365165 (347.3 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth9691171: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::b8dd:aeff:fe64:5508  prefixlen 64  scopeid 0x20<link>
        ether ba:dd:ae:64:55:08  txqueuelen 0  (Ethernet)
        RX packets 909503  bytes 62718454 (62.7 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1561437  bytes 3041036074 (3.0 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth4b24600: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::9833:56ff:fe25:6169  prefixlen 64  scopeid 0x20<link>
        ether 9a:33:56:25:61:69  txqueuelen 0  (Ethernet)
        RX packets 821  bytes 64490 (64.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3534  bytes 823325 (823.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlp5s0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether 50:e0:85:bc:9d:d7  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```



