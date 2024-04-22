*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
Test Teardown     Close Browser
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Login As Teacher
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Open Others Subjects
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]

Open My Exam Dates
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]

Open New Exam Dates
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.newExamDates"]

Open List Of All Teachers
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]

Login As Student
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Open Other Subjects
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]

*** Test Cases ***
Teacher Participation
    Login As Teacher
    Open Others Subjects
    Sleep    2s
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2s
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.successAlert"]
    Sleep    2s

Teacher Exam Dates
    Open My Exam Dates
    Sleep    2s
    Page Should Contain    Linear Algebra
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.
    Sleep    2s

Teacher New Exam Dates
    Open New Exam Dates
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.newExamDates.subjectSelect"]//option[contains(text(), 'Linear Algebra')]
    Sleep    2s

Teacher List Of All Teachers
    Open List Of All Teachers
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Sleep    2s
    Element Text Should Match    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Sleep    2s

Student Other Subjects
    Login As Student
    Open Other Subjects
    Sleep    2s
    Element Text Should Match    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Sleep    2s
    Element Text Should Match    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Sleep    2s 
