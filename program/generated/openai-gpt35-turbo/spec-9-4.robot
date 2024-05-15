*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${delay}          2s

*** Test Cases ***
CheckExamParticipants
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Wait Until Element Is Visible    id=stu.myExamDates.participantsModal.title    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Benjamin Green']    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Mia Orange']    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Charlotte Purple']    timeout=10s
    Wait Until Element Is Visible    xpath=//td[text()='Isabella Yellow']    timeout=10s
    Close Browser

*** Keywords ***
Set Viewport
    [Arguments]    ${width}    ${height}
    ${viewport} =    Evaluate    {'width': ${width}, 'height': ${height}, 'deviceScaleFactor': 1, 'isMobile': false, 'hasTouch': false, 'isLandscape': false}
    Execute JavaScript    return new Promise(resolve => {window.scrollTo(${viewport.width}, ${viewport.height}); resolve();})
    Sleep    ${delay}