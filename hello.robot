*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${url}    https://www.baidu.com
${Browser}    chrome

*** Test Cases ***
case1
    Open Browser    ${url}    ${Browser}
    ${title}    Baidu Search    robot framework
    should contain    ${title}    robot framework_百度搜索
    close Browser
case2
    Open Browser    ${url}    ${Browser}
    ${title}    Baidu Search    selenium
    should contain    ${title}    selenium_百度搜索
    close Browser
*** Keywords ***
Baidu Search
    [Arguments]    ${search_key}
    Input text    id:kw    ${search_key}
    click button    id:su
    Evaluate    time.sleep(2)    time
    ${title}    Get Title
    [Return]    ${title}