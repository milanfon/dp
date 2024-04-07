*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login as Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input Text    id:loginPage.userNameInput    maroon
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects
    Click Element    id:stu.otherSubjects.table.enrollButton-10
    Click Element    id:stu.menu.mySubjects
    ${status}    Get Element Attribute    id:stu.otherSubjects.successAlert@class
    Should Be Equal    ${status}    visible
    ${status}    Get Element Attribute    id:stu.mySubjects.enrolledTable.subjectRow-2    id
    Should Be Equal    ${status}    stu.mySubjects.enrolledTable.subjectRow-2
    ${status}    Get Text    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]
    Should Be Equal    ${status}    Software Quality Assurance
    ${status}    Get Text    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]
    Should Be Equal    ${status}    Peter Strict
    Close Browser

Login as Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-3
    ${status}    Get Element Attribute    id:tea.mySubjects.table.listOfStudentsButton-3@title
    Should Be Equal    ${status}    Students (2)
    ${status}    Get Text    xpath://td[contains(text(), "William Maroon")]
    Should Be Equal    ${status}    William Maroon
    Close Browser