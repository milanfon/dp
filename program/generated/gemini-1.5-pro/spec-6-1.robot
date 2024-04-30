*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}        http://localhost:4680/tbuis/index.jsp
${username_student}    maroon
${password}    pass
${username_teacher}    strict

*** Test Cases ***
Student Enrolls On Subject
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username_student}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep    2s
    Submit Form
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Sleep    2s
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Sleep    2s
    Close Browser

Teacher Checks Enrolled Students
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username_teacher}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep    2s
    Submit Form
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Sleep    2s
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text()="William Maroon"]
    Sleep    2s
    Close Browser
