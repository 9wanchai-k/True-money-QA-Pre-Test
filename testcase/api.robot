*** Settings ***
Resource    ${CURDIR}../../web/data/import.robot
*** Test Cases ***
Get user profile success
    Create Session      assetSession             https://reqres.in
    ${headers}=     Create Dictionary       Content-Type=application/json;
    ${get_resp}=    GET On Session      assetSession    /api/users/12         headers=${headers}    expected_status=200
    Should be Equal    '${get_resp.json()['data']['id']}'            '12'
    Should be Equal    '${get_resp.json()['data']['email']}'         'rachel.howell@reqres.in'
    Should be Equal    '${get_resp.json()['data']['first_name']}'    'Rachel'
    Should be Equal    '${get_resp.json()['data']['last_name']}'     'Howell'
    Should be Equal    '${get_resp.json()['data']['avatar']}'        'https://reqres.in/img/faces/12-image.jpg'

Get user profile but user not found
    Create Session      assetSession             https://reqres.in
    ${headers}=     Create Dictionary       Content-Type=application/json;
    ${get_resp}=    GET On Session      assetSession    /api/users/1234         headers=${headers}    expected_status=404
    Should Be Equal As Strings      Not Found      ${get_resp.reason}
    Should be Equal    '{}'    '${get_resp.json()}'