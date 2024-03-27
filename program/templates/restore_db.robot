*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}    http://localhost:4680/tbuis
${SUCCESS_ALERT_ID}    homePage.successAlert

*** Test Cases ***
Reset Database And Check Success Alert
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Browser Implicit Wait    5
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.restoreDB"]
    Wait Until Page Contains Element    xpath=//*[@id="${SUCCESS_ALERT_ID}"]
    Element Should Be Visible    xpath=//*[@id="${SUCCESS_ALERT_ID}"]
    [Teardown]    Close Browser
