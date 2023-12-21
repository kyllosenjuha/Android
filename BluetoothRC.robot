*** Settings ***
Library             AppiumLibrary
Test Setup          Setup And Open Android Phone
Test Template       Click My Buttons
Test Teardown       Close Application

*** Variables ***
${APPIUM_SERVER1}     http://127.0.0.1:4723/wd/hub

*** Test Cases ***    
Click My Buttons
    onBluetoothButton      15        bluetoothStatusTextView    CONNECTED    Bluetooth is not CONNECTED
    onButton1              2         textView1                  CH1 ON       CH1 is not ON
    onButton2              2         textView2                  CH2 ON       CH2 is not ON
    onButton3              2         textView3                  CH3 ON       CH3 is not ON
    onButton4              2         textView4                  CH4 ON       CH4 is not ON
    offButton1             2         textView1                  CH1 OFF      CH1 is not OFF
    offButton2             2         textView2                  CH2 OFF      CH2 is not OFF
    offButton3             2         textView3                  CH3 OFF      CH3 is not OFF
    offButton4             2         textView4                  CH4 OFF      CH4 is not OFF
    offBluetoothButton     15        bluetoothStatusTextView    CLOSED       Bluetooth is not CLOSED 

*** Keywords ***
Setup And Open Android Phone
    ${androiddriver1}=    Open Application    ${APPIUM_SERVER1}      platformName=Android    platformVersion=12.0    deviceName=0a4b68af0410
    ...    automationName=UiAutomator2    appPackage=juha.redmi.bluetoothremote    newCommandTimeout=2500    appActivity=juha.redmi.bluetoothremote.MainActivity
    ...    ignoreHiddenApiPolicyError=${True}    autoGrantPermissions=${True}    enforceAppInstall=${True}
    Set Suite Variable    ${androiddriver1}
    Sleep    15

Click My Buttons
    [Arguments]    ${MY_ID_CLICK_ELEMENT}
    ...            ${MY_SLEEP}
    ...            ${MY_ID_ELEMENT_TEXT_SHOULD_BE}
    ...            ${MY_EXPECTED}
    ...            ${MY_MESSAGE}

    Click Element    id=${MY_ID_CLICK_ELEMENT}
    Sleep            ${MY_SLEEP}
    Element Text Should Be    id=${MY_ID_ELEMENT_TEXT_SHOULD_BE}    expected=${MY_EXPECTED}    message=${MY_MESSAGE}
    