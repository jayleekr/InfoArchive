# SomeIP

## 관련기사
http://www.autoelectronics.co.kr/article/articleView.asp?idx=1441


## ETC

* Instance
  * radar_ProvidedSomeipServiceInstance
    * service interface ref : /apd/da/deployment/radar_Someip
    * id : 19
    * provided event groups : 1,2
    * sd-server-config-ref (SOMEIP-SD-SERVER-SERVICE-INSTANCE-CONFIG) : radar_SomeipServerServiceInstanceConfig
  * radar_RequiredSomeipServiceInstance
    * service interface ref : /apd/da/deployment/radar_Someip
    * id : 19
    * required event groups : 1,2
    * sd-client-config-ref (SOMEIP-SD-CLIENT-SERVICE-INSTANCE-CONFIG) : radar_SomeipClientServiceInstanceConfig
* Mapping
  * SOMEIP-SERVICE-INSTANCE-TO-MACHINE-MAPPING
    * name : Radar ProvidedServiceInstance to Machine
    * 
    * udp prot : 5000
* service instance = someip deamon's name 

* Radar ProvidedServiceInstance to Machine
  * UDP5000
* Radar ProvidedServiceInstance to Port
  * 

Ra