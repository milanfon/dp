*** Settings ***
Documentation     Verify student enrollment and teacher's view of enrolled students.
Library           SeleniumLibrary

Suite Setup       Open Browser    about:blank    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Set Browser Viewport Size    1501    1104
Test Teardown     Close Browser

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Enroll In Subject And Verify Success Alert
    Navigate To Page    http://localhost:4680/tbuis/index.jsp
    Login As Student    maroon    pass
    Enroll In Other Subjects
    Verify Success Alert

Verify Enrollment In My Subjects
    Navigate To My Subjects
    Verify Enrollment Details    Software Quality Assurance    Peter Strict

Login As Teacher And Verify Student Count
    Navigate To Page    http://localhost:4680/tbuis/index.jsp
    Login As Teacher    strict    pass
    Verify Students Count    tea.mySubjects.table.listOfStudentsButton-3    Students (2)
    Verify Student Name    William Maroon

*** Keywords ***
Set Browser Viewport Size
    [Arguments]    ${width}    ${height}
    Set Window Size    ${width}    ${height}

Navigate To Page
    [Arguments]    ${url}
    Go To    ${url}
    Sleep    2s

Login As Student
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s

Enroll In Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s

Verify Success Alert
    Wait Until Element Is Visible    id=stu.otherSubjects.successAlert    5s

Navigate To My Subjects
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s

Verify Enrollment Details
    [Arguments]    ${course_name}    ${instructor_name}
    Wait Until Page Contains Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(), "${course_name}")]
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(), "${instructor_name}")]

Login As Teacher
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Students Count
    [Arguments]    ${button_id}    ${expected_text}
    Wait Until Element Contains    id=${button_id}    ${expected_text}    5s

Verify Student Name
    [Arguments]    ${student_name}
    Click Element    xpath=//td[contains(text(), "${student_name}")]
    Wait Until Page Contains    ${student_name}    5s