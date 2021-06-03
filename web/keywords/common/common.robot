*** Settings ***
Resource    ../../data/import.robot

*** Keywords ***
Open Website 
    ${chrome options}=      Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver  
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Maximize Browser Window
    Goto    ${url}

Input Text To Element When Ready
    [Documentation]  Input Text To Element
    [Arguments]     ${locator_element}   ${text_to_input}
    Wait Until Element Is Visible   ${locator_element}
    Input Text     ${locator_element}    ${text_to_input}

Click Element When Ready
    [Documentation]  Tap Element When Ready
    [Arguments]    ${locator_element}
    Wait Until Element Is Visible    ${locator_element}
    Click Element   ${locator_element}

Clear Text To Element When Ready
    [Documentation]  Clear Text To Element When Ready
    [Arguments]    ${locator_element}
    Wait Until Element Is Visible    ${locator_element}
    Clear Text    ${locator_element}