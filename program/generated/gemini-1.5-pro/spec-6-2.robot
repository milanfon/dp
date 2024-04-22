*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Test Teardown     Close Browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${STUDENT}        maroon
${PASSWORD}       pass
${TEACHER}        strict

*** Keywords ***
Login Student
    Click Link    xpath://*[@id="header.link.login"]
    Sleep         2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT}
    Sleep         2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep         2s
    Submit Form

Login Teacher
    Click Link    xpath://*[@id="header.link.login"]
    Sleep         2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER}
    Sleep         2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep         2s
    Submit Form

Check Student Other Subjects
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep         2s
    Click Button    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep         2s
    Element Should Be Visible    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep         2s

Check Student My Subjects
    Click Link    xpath://*[@id="stu.menu.mySubjects"]
    Sleep         2s
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Sleep         2s
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Sleep         2s

Check Teacher My Subjects
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Sleep         2s
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Sleep         2s
    Click Button    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep         2s
    Element Should Contain    xpath://td[text()="William Maroon"]
    Sleep         2s

*** Test Cases ***
Student Enrolls
    Login Student
    Check Student Other Subjects
    Check Student My Subjects

Teacher Checks
    Login Teacher
    Check Teacher My Subjects
