*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Test scenario
    [Setup]    Open browser    http://localhost:4680/tbuis/index.jsp    browser=gc
    Click element    xpath://*[@id="header.link.login"]
    Click element    xpath://*[@id="loginPage.userNameInput"]
    Input text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click element    xpath://*[@id="loginPage.passwordInput"]
    Input text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click element    xpath://*[@id="stu.menu.myExamDates"]
    Click element    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Should Be True    ${element_present}
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]/tbody/tr[1]/td[1]    Benjamin Green
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]/tbody/tr[2]/td[1]    Mia Orange
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]/tbody/tr[3]/td[1]    Charlotte Purple
    Element Should Contain    xpath://*[@id="stu.myExamDates.participantsModal.table"]/tbody/tr[4]/td[1]    Isabella Yellow
    [Teardown]    Close browser