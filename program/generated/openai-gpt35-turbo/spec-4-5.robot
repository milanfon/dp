*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements for Student
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    gray
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath///*[@id="stu.menu.mySubjects"]
    Click Element    xpath///*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath///*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Close Browser

Open Page and Check Elements for Teacher
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant
    Press Keys    xpath///*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath///*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Click Element    xpath///*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Select From List by Index    xpath///*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Click Element    xpath///*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List by Index    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    2
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Close Browser