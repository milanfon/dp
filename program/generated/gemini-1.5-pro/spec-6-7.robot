*** Settings ***
Library           SeleniumLibrary
Documentation     Enroll to the course and check if student is enrolled

*** Variables ***
${DELAY}          2s
${BROWSER}        chrome
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Enroll to the course and check if student is enrolled
    Open Browser To Login Page
    Login As Student
    Enroll To Course
    Check Enrollment
    Close Browser

Login as teacher and check students list
    Open Browser To Login Page
    Login As Teacher
    Open My Subjects Page
    Check Students List Button
    Open Students List
    Check Student In List
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form    xpath://*[@id="loginPage.loginForm"]
    Sleep    ${DELAY}

Enroll To Course
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}

Check Enrollment
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Sleep    ${DELAY}

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form    xpath://*[@id="loginPage.loginForm"]
    Sleep    ${DELAY}

Open My Subjects Page
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

Check Students List Button
    Page Should Contain Button    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Sleep    ${DELAY}

Open Students List
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}

Check Student In List 
    Page Should Contain Element    xpath://td[text()="William Maroon"]
    Sleep    ${DELAY} 
