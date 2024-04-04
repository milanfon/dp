*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}    0
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Spec 1
    Open Browser To Page    ${URL}
    Check Element Not Present    id=header.link.login
    Check Element Value    id=header.title.userHome    Noah Brown
    Check Element Present    id=header.link.logout
    Check Element Present    querySelector=#header.student-view-nav

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Check Element Not Present
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    10
    Element Should Not Be Visible    ${locator}

Check Element Value
    [Arguments]    ${locator}    ${expected_value}
    Wait Until Page Contains Element    ${locator}    10
    ${actual_value}=    Get Text    ${locator}
    Should Be Equal    ${actual_value}    ${expected_value}

Check Element Present
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    10
    Element Should Be Visible    ${locator}
