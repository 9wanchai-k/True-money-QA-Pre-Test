*** Settings ***
Resource    ../../data/import.robot

*** Keywords ***
Check go to login page
    [Documentation]    Check go to login page when open link
    Wait Until Element Is Visible              xpath=//div[@class='example']//h2[.="Login Page"]

Input username
    [Arguments]    ${username}
    common.Input Text To Element When Ready    xpath=//input[@id='username']   ${username}

Input Password
    [Arguments]    ${password}
    common.Input Text To Element When Ready    xpath=//input[@id='password']    ${password}

Click Login
    common.Click Element When Ready            xpath=//button[@type='submit']

Check go to login page by logout
    [Documentation]    Check go to login page when click logout
    Wait Until Element Is Visible              xpath=//div[contains(text(),"You logged out of the secure area!")]

Check error message
    [Arguments]    ${error_message}
    Wait Until Element Is Visible              xpath=//div[contains(text(),"${error_message}")]