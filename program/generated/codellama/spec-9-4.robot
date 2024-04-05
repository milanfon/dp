*** Variables ***
${URL}  http://localhost:4680/tbuis/index.jsp
${BROWSER}  Chrome

*** Test Cases ***
Test Case
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    Click Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]  10s
    Element Text Should Be  xpath://*[@id="stu.myExamDates.participantsModal.title"]  Participants
    Element Should Contain  xpath://*[@id="stu.myExamDates.participantsModal.table"]  Benjamin Green
    Element Should Contain  xpath://*[@id="stu.myExamDates.participantsModal.table"]  Mia Orange
    Element Should Contain  xpath://*[@id="stu.myExamDates.participantsModal.table"]  Charlotte Purple
    Element Should Contain  xpath://*[@id="stu.myExamDates.participantsModal.table"]  Isabella Yellow
    [Teardown]  Close Browser