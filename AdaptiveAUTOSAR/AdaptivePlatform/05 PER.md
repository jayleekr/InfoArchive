## Persistency
### Overview
    Application과 FC(Functional Cluster)에 Adaptive Machine의 non-volatile 메모리에 정보를 저장하는 기능을 제공
    **Key-Value Storage** 와 **File Storage**의 형태로 제공
    Persistant data는 하나의 application에게만 종속
    같은 프로세스내의 context를 구동하는 같은 application내의 멀티쓰레드의 concurrent access를 handle할수 있어야함
    저장된 data의 Integrity를 제공해야함 (**CRC**, **MoutofN**) 
    사용된 리소스들의 수에대한 통계를 제공해야함
    물리적 저장장치에 저장되기전 Data Encryption기능을 제공해야함

### Key-Value Storage
    하나의 저장 위치에 여러개의 Key-Value pair들을 저장하고 가져오는 기능을 제공
    SWS_AdaptivePlatformTypes에 저장된 Data 제공
    Application상 복잡한 타입들의 stream을 간단한 bytes array로 표현가능 
    다음 두가지에서 언급한 모든 Implemention Data Type 제공 
        1. PersistencyKeyValueDatabaseInterfac의 dataTypeForSerialization
        2. Application Design의 PersistencyDataElements 

### File Storage
    File Storage Port는 application이 storage location에 access/create 기능을 제공
    일반적인 file system access 와 비슷하므로 API는 잘알려진 C++ std::iostream 의 subset형태로 design하였음

### Use cases for handling persistent data for UCM
    Installation, Update, Uninstallation of application sw to the Adaptive Machine

    
    