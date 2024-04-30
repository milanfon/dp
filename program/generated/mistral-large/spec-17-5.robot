Scenario: spec 17 teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Others' Subjects page
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]

    # My Exam Dates page
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://tr[@id="tea.myExamDates.table.noRecords-2"]

    # New Exam Dates page
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath://option[text()="Linear Algebra"]

    # List of All Teachers page
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][text()="Alice Pedant"]

    Close Browser

Scenario: spec 17 student
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Other Subjects page
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][text()="Linear Algebra"]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][text()="Alice Pedant"]

    Close Browser