*** Settings ***
Library    SeleniumLibrary
Suite Setup    Run Keywords    Open Browser To Student Page    AND    Open Browser To Teacher Page
Suite Teardown    Close All Browsers

*** Keywords ***
Open Browser To Student Page
    Open Browser    about:blank    Chrome    alias=Student
    Set Window Size    1501    1104

Open Browser To Teacher Page
    Open Browser    about:blank    Chrome    alias=Teacher
    Set Window Size    1501    1104

*** Test Cases ***
Student Enroll And Check Subjects
    [Setup]    Switch Browser    Student
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]

Teacher Checks Students Enrolled
    [Setup]    Switch Browser    Teacher
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    1s
    Page Should Contain    William Maroon