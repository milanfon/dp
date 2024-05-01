*** Settings ***
Library                SeleniumLibrary
Browser                Chrome

*** Test Cases ***

Scenario1
    [Documentation]        Test scenario for teacher
    [Tags]                  teacher
    [Preparation]          Set Up
    [Preparation]          Set Up Chrome

    [Steps]                 Set Viewport 1501 1104 1 0 False False
    [Steps]                 Navigate To http://localhost:4680/tbuis/index.jsp
    [Steps]                 Click Element #header.link.login
    [Steps]                 Input Text pierce loginPage.userNameInput username
    [Steps]                 Input Text pierce loginPage.passwordInput password
    [Steps]                 Click Element #loginPage.loginFormSubmit
    [Steps]                 Click Element #tea.menu.otherSubjects
    [Steps]                 Click Element #tea.otherSubjects.table.participateButton-3
    [Steps]                 Click Element #tea.menu.myExamDates
    [Steps]                 Click Element #tea.menu.newExamDates
    [Steps]                 Click Element #tea.menu.listOfAllTeachers

    [Steps]                 Element Should Be Visible id=tea.otherSubjects.successAlert
    [Steps]                 Element Should Contain id=tea.myExamDates.table text=Linear Algebra
    [Steps]                 Element Should Contain id=tea.myExamDates.table text=No exam dates.
    [Steps]                 Element Should Contain id=tea.listOfAllTeachers.table.teacherRow-3 text=Linear Algebra
    [Steps]                 Element Should Contain id=tea.listOfAllTeachers.table.teacherRow-3 text=Alice Pedant

    [Steps]                 Set Up
    [Steps]                 Set Up Chrome

    [Steps]                 Set Viewport 1501 1104 1 0 False False
    [Steps]                 Navigate To http://localhost:4680/tbuis/index.jsp
    [Steps]                 Click Element #header.link.login
    [Steps]                 Input Text pierce loginPage.userNameInput student
    [Steps]                 Input Text pierce loginPage.passwordInput studentpassword
    [Steps]                 Click Element #loginPage.loginFormSubmit
    [Steps]                 Click Element #stu.menu.otherSubjects

    [Steps]                 Element Should Contain id=stu.otherSubjects.table.subjectRow-2 text=Linear Algebra
    [Steps]                 Element Should Contain id=stu.otherSubjects.table.subjectRow-2 text=Alice Pedant

    [Teardown]             Close Browser

Scenario2
    [Documentation]        Test scenario for student
    [Tags]                  student
    [Preparation]          Set Up
    [Preparation]          Set Up Chrome

    [Steps]                 Set Viewport 1501 1104 1 0 False False
    [Steps]                 Navigate To http://localhost:4680/tbuis/index.jsp
    [Steps]                 Click Element #header.link.login
    [Steps]                 Input Text pierce loginPage.userNameInput student
    [Steps]                 Input Text pierce loginPage.passwordInput studentpassword
    [Steps]                 Click Element #loginPage.loginFormSubmit
    [Steps]                 Click Element #stu.menu.otherSubjects

    [Steps]                 Element Should Contain id=stu.otherSubjects.table.subjectRow-2 text=Linear Algebra
    [Steps]                 Element Should Contain id=stu.otherSubjects.table.subjectRow-2 text=Alice Pedant

    [Teardown]             Close Browser