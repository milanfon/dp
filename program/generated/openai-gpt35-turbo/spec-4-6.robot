*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements for Student
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Sleep    2s
    Click Element    xpath    //*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    gray
    Sleep    1s
    Press Keys    xpath    //*[@id="loginPage.userNameInput"]    TAB
    Press Keys    xpath    //*[@id="loginPage.passwordInput"]    pass    ENTER
    Sleep    2s
    Click Element    xpath    //*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath    //*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    2s
    Click Element    xpath    //*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    2s
    Close Browser

Open Page and Check Elements for Teacher
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Sleep    2s
    Click Element    xpath    //*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Press Keys    xpath    //*[@id="loginPage.userNameInput"]    TAB
    Press Keys    xpath    //*[@id="loginPage.passwordInput"]    pass    ENTER
    Sleep    2s
    Click Element    xpath    //*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath    //*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath    //*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Click Element    xpath    //*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep    1s
    Select From List by Index    xpath    //*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    2s
    Click Element    xpath    //*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Click Element    xpath    //*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    1s
    Select From List by Index    xpath    //*[@id="tea.evalTable.filter.subjectSelect"]    2
    Click Element    xpath    //*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Close Browser