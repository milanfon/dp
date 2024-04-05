*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Browser Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.title"]    Exam Dates
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.participantsTable"]    Benjamin Green
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.participantsTable"]    Mia Orange
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.participantsTable"]    Charlotte Purple
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.participantsTable"]    Isabella Yellow
    Close Browser