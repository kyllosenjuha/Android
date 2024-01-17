*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER1}     http://127.0.0.1:4723/wd/hub

*** Keywords ***
Setup And Open Android Phone
    ${androiddriver1}=    Open Application    
    ...    ${APPIUM_SERVER1}                     platformName=Android           
    ...    platformVersion=12.0                  deviceName=0a4b68af0410               
    ...    automationName=UiAutomator2           appPackage=juha.redmi.bluetoothremote    
    ...    newCommandTimeout=2500                appActivity=juha.redmi.bluetoothremote.MainActivity
    ...    ignoreHiddenApiPolicyError=${True}    autoGrantPermissions=${True}    
    ...    enforceAppInstall=${True}
    
    Set Suite Variable    ${androiddriver1}
    Sleep    15