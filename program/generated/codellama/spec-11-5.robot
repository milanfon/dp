*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    http://localhost

*** Test Cases ***
Check Benjamin Green, Mia Orange, Charlotte Purple, and Isabella Yellow are present
    Open Browser To Page    ${URL}
    Set Browser Viewport    width=1501    height=1104
    Navigate To Page    ${URL}
    Title Should Be    University Information System
    Click Element    xpath=//*[@aria-label="Benjamin Green"]
    Click Element    xpath=//*[@aria-label="Mia Orange"]
    Click Element    xpath=//*[@aria-label="Charlotte Purple"]
    Click Element    xpath=//*[@aria-label="Isabella Yellow"]
    Close Browser

*** Keywords ***
Open Browser To Page
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}

Set Browser Viewport
    [Arguments]    ${width}    ${height}
    Set Window Size    ${width}    ${height}

Navigate To Page
    [Arguments]    ${url}
    Go To    ${url}

Title Should Be
    [Arguments]    ${title}
    Title Should Be    ${title}

Click Element
    [Arguments]    ${xpath}
    Click Element    ${xpath}

Close Browser
    Close Browser