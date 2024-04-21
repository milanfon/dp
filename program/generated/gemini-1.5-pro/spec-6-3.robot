*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${STUDENT}        maroon
${TEACHER}        strict
${PASSWORD}        pass

*** Test Cases ***
Spec 6 Student
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Submit Form
    Sleep    2s
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Button    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Click Link    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Sleep    2s

Spec 6 Teacher
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Submit Form
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Sleep    2s
    Click Button    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()="William Maroon"] 
    Sleep    2s 
