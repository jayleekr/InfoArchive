# emo_sample.md

## Summary
The example is instantiating 4 applications (TestAppl1 to TestAppl4) that shows how to use the MachineState interface to communicate and react on different machine states communicated by the ExecutionManager. All 4 applications are forked during StartingUp state. After 4 loops in main function TestAppl1 is requesting a change to Driving state. Then TestAppl1 and TestAppl2 is restarted and the others are terminated. This restart of TestAppl1 and TestAppl2 is configured in the application Manifest files. A console printout of what you see is shown below.

## Machine Manifest (json)
/etc/system/machine_manifest.json

![](machine.gif)

## Test application 1
![](1.gif)

## Test application 2
![](2.gif)
