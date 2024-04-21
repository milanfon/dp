*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Example Test
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Wait Until Page Contains Element    stu.myExamDates.participantsModal.title    timeout=30s
    Wait Until Page Contains Element    xpath://td[contains(text(), 'Benjamin Green')]    timeout=30s
    Wait Until Page Contains Element    xpath://td[contains(text(), 'Mia Orange')]    timeout=30s
    Wait Until Page Contains Element    xpath://td[contains(text(), 'Charlotte Purple')]    timeout=30s
    Wait Until Page Contains Element    xpath://td[contains(text(), 'Isabella Yellow')]    timeout=30s
    Close Browser