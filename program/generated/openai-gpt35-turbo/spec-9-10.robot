*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${delay}          2s

*** Test Cases ***
CheckParticipants
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104
    Wait Until Page Contains Element    id=stu.myExamDates.participantsModal.title    timeout=30s
    Wait Until Page Contains Element    xpath=//td[text()="Benjamin Green"]    timeout=30s
    Wait Until Page Contains Element    xpath=//td[text()="Mia Orange"]    timeout=30s
    Wait Until Page Contains Element    xpath=//td[text()="Charlotte Purple"]    timeout=30s
    Wait Until Page Contains Element    xpath=//td[text()="Isabella Yellow"]    timeout=30s
    Close Browser

