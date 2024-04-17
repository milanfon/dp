*** Test Cases ***

Open browser to the login page
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5s

Login as a teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

Teacher Scenario
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id="tea.myExamDates.table.noRecords-2"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath://option[contains(text(), "Linear Algebra")]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(text(), "Alice Pedant")]
    Close Browser

Login as a student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

Student Scenario
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), "Alice Pedant")]
    Close Browser