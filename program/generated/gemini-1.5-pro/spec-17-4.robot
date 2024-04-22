*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
Test Teardown     Close Browser
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Login As Student
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Teacher
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Click Others Subjects
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    2s

Click Participate
    Sleep    1s
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2s

Click My Exam Dates
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s

Click New Exam Dates
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    2s

Click List of All Teachers
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s

Click Other Subjects As Student
    Sleep    1s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s

*** Test Cases ***
Teacher Registers For Subject
    Login As Teacher
    Click Others Subjects
    Click Participate
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click My Exam Dates
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Click New Exam Dates
    Page Should Contain Element    xpath://*[@id="tea.newExamDates.subject"]//option[text()='Linear Algebra']
    Click List of All Teachers
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    text=Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    text=Alice Pedant

Student Sees New Subject and Teacher
    Login As Student
    Click Other Subjects As Student
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    text=Linear Algebra
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    text=Alice Pedant
