*** Settings ***
Library     SeleniumLibrary
Library     DebugLibrary
Library     JSONLibrary
Library     OperatingSystem
Library     RequestsLibrary
Library     ImapLibrary2
Library     Collections
Library     html2text
Library     DateTime
Library     String

Resource    ../keywords/common/common.robot
Resource    ../keywords/pages/login_page.robot
Resource    ../keywords/pages/secure_page.robot
Variables   data.yaml