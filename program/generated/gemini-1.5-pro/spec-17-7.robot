*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    ${url}    ${browser}
Test Teardown     Close Browser

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp
${browser}        chrome

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
    Sleep    2s

Open Others Subjects Page
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    2s

Open My Exam Dates Page
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s

Open New Exam Dates Page
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    2s

Open List Of All Teachers Page
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s

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
    Sleep    2s

Open Other Subjects Page Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s

*** Test Cases ***
TC 17 Teacher Participation
    Login As Teacher
    Open Others Subjects Page
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    2s
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    id=tea.otherSubjects.successAlert

TC 17 Teacher My Exam Dates
    Login As Teacher
    Open My Exam Dates Page
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    text=No exam dates.

TC 17 Teacher New Exam Dates
    Login As Teacher
    Open New Exam Dates Page
    Page Should Contain Element    xpath=//option[text()="Linear Algebra"]

TC 17 Teacher List Of All Teachers
    Login As Teacher
    Open List Of All Teachers Page
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    text=Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    text=Alice Pedant

TC 17 Student Other Subjects
    Login As Student
    Open Other Subjects Page Student
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    text=Linear Algebra
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    text=Alice Pedant 
