*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.otherSubjects
    Click Element    id:tea.otherSubjects.table.participateButton-3
    Page Should Contain Element    id:tea.otherSubjects.successAlert
    Click Element    id:tea.menu.myExamDates
    Page Should Contain    Linear Algebra
    Page Should Contain Element    id:tea.myExamDates.table.noRecords-2    No exam dates.
    Click Element    id:tea.menu.newExamDates
    Page Should Contain Element    xpath://option[text()="Linear Algebra"]
    Click Element    id:tea.menu.listOfAllTeachers
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser

Student Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    id:header.link.login
    Input Text    id:loginPage.userNameInput    yellow
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser