*** Settings ***
Resource    ${CURDIR}../../web/data/import.robot
Suite Teardown  Close Browser
*** Test Cases ***
Login success
    common.Open Website
    login_page.Check go to login page
    login_page.Input username        ${login['username_success']}
    login_page.Input Password        ${login['password_success']}
    login_page.Click Login
    secure_page.Check go to secure page
    secure_page.Click logout
    login_page.Check go to login page by logout
    Close Browser

Login failed - Password incorrect
    common.Open Website
    login_page.Check go to login page
    login_page.Input username         ${login['username_success']}
    login_page.Input Password         ${login['password_incorrect']}
    login_page.Click Login
    login_page.Check error message    ${login['pass_invalid']}
    Close Browser

Login failed - Username not found
    common.Open Website
    login_page.Check go to login page
    login_page.Input username         ${login['username_not_found']}
    login_page.Input Password         ${login['password_success']}
    login_page.Click Login
    login_page.Check error message    ${login['user_invalid']}
    Close Browser

