*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Student Page
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    xpath//*[@id="header.link.login"]    delay=2s
    Click Element    xpath//*[@id="loginPage.userNameInput"]    delay=2s
    Input Text    xpath//*[@id="loginPage.userNameInput"]    gray    delay=2s
    Press Keys    xpath//*[@id="loginPage.userNameInput"]    TAB    delay=2s
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass    delay=2s
    Press Keys    xpath//*[@id="loginPage.passwordInput"]    ENTER    delay=2s
    Click Element    xpath//*[@id="stu.menu.mySubjects"]    delay=2s
    Click Element    xpath//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]    delay=2s
    Click Element    xpath//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]    delay=2s
    Page Should Contain Element    xpath//*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath//*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath//td[text()="Database Systems"]
    Close Browser

Open Teacher Page
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    xpath//*[@id="header.link.login"]    delay=2s
    Click Element    xpath//*[@id="loginPage.userNameInput"]    delay=2s
    Input Text    xpath//*[@id="loginPage.userNameInput"]    pedant    delay=2s
    Press Keys    xpath//*[@id="loginPage.userNameInput"]    TAB    delay=2s
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass    delay=2s
    Press Keys    xpath//*[@id="loginPage.passwordInput"]    ENTER    delay=2s
    Click Element    xpath//*[@id="tea.menu.mySubjects"]    delay=2s
    Page Should Contain Element    xpath//*[@id="tea.mySubjects.table.listOfStudentsButton-1" and text()="Students (0) "]
    Click Element    xpath//*[@id="tea.menu.myExamDates"]    delay=2s
    Page Should Contain Element    xpath//*[@id="tea.myExamDates.table.participantsButton-1-0" and text()="Participants (0/10) "]
    Click Element    xpath//*[@id="tea.menu.setEvaluation"]    delay=2s
    Select From List By Index    xpath//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1    delay=2s
    Click Element    xpath//*[@id="tea.menu.evaluationTable"]    delay=2s
    Select From List By Index    xpath//*[@id="tea.evalTable.filter.subjectSelect"]    2    delay=2s
    Click Element    xpath//*[@id="tea.evalTable.filter.submitButton"]    delay=2s
    Page Should Contain Element    xpath//td[text()="No students on this exam date"]
    Close Browser