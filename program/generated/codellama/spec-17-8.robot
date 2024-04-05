
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    Chrome

*** Test Cases ***
Test 17 Teacher
    [Setup]    Open Browser    ${EMPTY}    ${browser}
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    3s
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Page Should Contain    Linear Algebra
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    No exam dates.
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath://*[@id="tea.newExamDates.table.subjectOption-3"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
    Page Should Contain    Linear Algebra    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Page Should Contain    Alice Pedant    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
    [Teardown]    Close Browser

Test 17 Student
    [Setup]    Open Browser    ${EMPTY}    ${browser}
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
    Page Should Contain    Linear Algebra    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    Page Should Contain    Alice Pedant    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
    [Teardown]    Close Browser