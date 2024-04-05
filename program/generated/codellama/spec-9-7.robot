*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check elements on page
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Element Is Visible    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Element Is Visible    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Element Text Should Be    xpath://*[@id="stu.myExamDates.participantsModal.title"]    Your Exam Participants
    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.table"]
    Table Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]    Benjamin Green
    Table Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]    Mia Orange
    Table Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]    Charlotte Purple
    Table Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]    Isabella Yellow
    [Teardown]    Close Browser