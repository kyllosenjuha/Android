*** Settings ***
Library             AppiumLibrary
Library             XML
Resource            MyAndroidPhone.resource
Test Setup          Setup And Open Android Phone
Test Template       Click Button And Check Toast message
Test Teardown       Close Application 

*** Test Cases ***    
Click Button And Check Toast message
    onBluetoothButton       Enable Bluetooth first!            10
    offBluetoothButton      Enable Bluetooth first!            10
    onButton1               Enable Bluetooth first!            10
    offButton1              Enable Bluetooth first!            10

*** Keywords ***
Click Button And Check Toast message
    [Arguments]    ${MY_ID_CLICK_ELEMENT}
    ...            ${MY_EXPECTED_TOAST_MESSAGE}
    ...            ${MY_SLEEP}
    
    Log To Console    Clicking Element id: ${MY_ID_CLICK_ELEMENT}
    Click Element     id=${MY_ID_CLICK_ELEMENT}
    
    ${mysource}=      Get Source
    ${xlm_obj}=       Parse Xml    ${mysource}
    ${element}=       XML.Get Element Attribute    ${xlm_obj}    text    .//android.widget.Toast[1]
    
    Log To Console     Toast message was: ${element}
    Should Be Equal As Strings    ${element}    ${MY_EXPECTED_TOAST_MESSAGE}    msg=Toast message was not as expected: ${MY_EXPECTED_TOAST_MESSAGE}

    Sleep     ${MY_SLEEP}
    