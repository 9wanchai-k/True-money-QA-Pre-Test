*** Settings ***
Resource    ../../data/import.robot

*** Keywords ***
Check go to secure page
    [Documentation]    Check go to secure page when login
    Wait Until Element Is Visible              xpath=//div[contains(text(),"You logged into a secure area!")]

Click logout
    common.Click Element When Ready            xpath=//i[contains(@class,'icon-signout')]