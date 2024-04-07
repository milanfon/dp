*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}    Chrome
${DELAY}     1s
${URL}       http://localhost:4680/tbuis/index.jsp
${USER}      orange
${PASSWORD}  pass
${BROWSER}    Chrome

*** Test Cases ***
Login and check table
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    ${USER}
    Input Text    id:loginPage.passwordInput    ${PASSWORD}
    Click Element    id:loginPage.loginFormSubmit
    Wait Until Element Is Visible    id:stu.myExamDates.participantsModal.title    ${DELAY}
    Click Element    id:stu.myExamDates.table.ParticipantsButton-1
    Wait Until Element Is Visible    id:stu.myExamDates.participantsModal.title    ${DELAY}
    Element Should Contain    id:stu.myExamDates.participantsModal.title    Participants
    ${tds} =    Get Elements    xpath://td
    ${count} =    Get Length    ${tds}
    Should Be True    ${count} > 0
    ${td0} =    Get Text    xpath://td[1]
    Should Be Equal    ${td0}    Benjamin Green
    ${td1} =    Get Text    xpath://td[2]
    Should Be Equal    ${td1}    Mia Orange
    ${td2} =    Get Text    xpath://td[3]
    Should Be Equal    ${td2}    Charlotte Purple
    ${td3} =    Get Text    xpath://td[4]
    Should Be Equal    ${td3}    Isabella Yellow
    Close Browser