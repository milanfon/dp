*** Settings ***
Documentation     A test suite with scenarios for both student and teacher roles in the University Information System.
Library           SeleniumLibrary

*** Variables ***
${STUDENT_USERNAME}    maroon
${STUDENT_PASSWORD}    pass
${TEACHER_USERNAME}    strict
${TEACHER_PASSWORD}    pass
${BASE_URL}            http://localhost:4680/tbuis

*** Test Cases ***
Student Scenario
    Open And Set Up Browser
    Log In As Student
    Navigate To Other Subjects And Enroll
    Verify Enrollment Success
    Navigate To My Subjects And Verify Enrollment
    Close Browser

Teacher Scenario
    Open And Set Up Browser
    Log In As Teacher
    Verify Students Count In Subject
    Verify Student Enrollment
    Close Browser

*** Keywords ***
Open And Set Up Browser
    Open Browser    ${BASE_URL}/index.jsp    Chrome
    Set Window Size    1501    1104
    Sleep    2s

Log In As Student
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Press Keys    None    ENTER
    Sleep    2s

Log In As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To Other Subjects And Enroll
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s

Verify Enrollment Success
    Element Should Be Visible    id=stu.otherSubjects.successAlert

Navigate To My Subjects And Verify Enrollment
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]

Verify Students Count In Subject
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    ${studentsCount}=    Get Text    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${studentsCount}    Students (2)

Verify Student Enrollment
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[text()="William Maroon"]

Close Browser
    Close Browser