*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${url}    http://127.0.0.1:8000/api/
${Browser}    chrome

*** Test Cases ***
#查询发布会
test_get_event_list
    ${payload}=    Create Dictionary    eid=1
    Create Session    event    ${url}
    ${r}=    Get Request    event    get_event_list/    params=${payload}
    log    ${r.json()}
    Should Be Equal As Strings    ${r.status_code}    200
    ${dict}    Set Variable    ${r.json()}
#断言结果
    ${msg}    Get From Dictionary    ${dict}    message
    Should Be Equal    ${msg}    成功
    ${sta}    Get From Dictionary    ${dict}    status
    ${status}    Evaluate    int(200)
    Should Be Equal    ${sta}    ${status}
#添加发布会
test_add_event
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${payload}=    Create Dictionary    eid=1
    Create Session    event    ${url}
    ${r}=    Post Request    event    add_event/    params=${payload}    headers=${headers}
    log    ${r.json()}
    Should Be Equal As Strings    ${r.status_code}    200
    ${dict}    Set Variable    ${r.json()}
#断言结果
    ${msg}    Get From Dictionary    ${dict}    message
    Should Be Equal    ${msg}    参数不能为空
    ${sta}    Get From Dictionary    ${dict}    status
    ${status}    Evaluate    int(10021)
    Should Be Equal    ${sta}    ${status}