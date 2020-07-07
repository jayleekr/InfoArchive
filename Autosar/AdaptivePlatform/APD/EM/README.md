# Execution Management
## ExecutionManager
### ::ExecutionManager()
    InitialIize()
### ::Initialize()
    LoadMachineConfiguration();
    InitializeCgroups();
    LoadExecutablesConfiguration();
### ::LoadMachineConfiguration()
    Loading Machine Manifest from /etc/system/machine_manifest.json
    MachineStates, FunctionGroups, ResourceGroups

### ::InitializeCgroups()
    Initialize Cgroups from ResourceGroups dictated in manifest

### ::LoadExecutablesConfiguration()
    Load Executable Manifest in /opt/bin/ /opt/etc/

### ::Run()
    SetState({StateClient::StateChange{kMachineFunctionGroupName, ara::exec::config::kStateMachineStartup}})


### ::SetState(funtionGroupStates)
    State Change 에 따른 Shutdown, Restart를 founctionGroupStates를 돌며 찾습니다

    변화가 있을시 Terminate() 먼저 후 Execute()를 수행합니다

    수행후 실행이 됐는지에 대해 확인하고 Success,Failed,Timeout 중 한가지 값을 리턴합니다

### ::Execute(startupConfigurations)
    StartupConfiguration::Start()를 호출하여 해당 설정에 맞추어 실행합니다
    


## StartupConfiguration
### ::StartupConfiguration()
    arguments_에 순서대로 executablePath_, manifestPath, startupConfig.GetArguments 를 넣습니다
    
    environment, dependencies, resourceGroup, cgroup 을 설정합니다

### ::Start()
    Executable을 arguments_ 와 함께 실행합니다
    그러므로 항상 manifest 경로를 첫번째 argument로 넣습니다

