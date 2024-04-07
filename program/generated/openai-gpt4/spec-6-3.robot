*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${STUDENT_USERNAME}    maroon
${STUDENT_PASSWORD}    pass
${TEACHER_USERNAME}    strict
${TEACHER_PASSWORD}    pass
${BASE_URL}            http://localhost:4680/tbuis
${BROWSER}             Chrome

*** Test Cases ***
Student Enrolls In Other Subjects
    Open Browser To University Information System
    Login As Student    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Navigate To "Other Subjects"
    Enroll In A Subject
    Verify Success Alert
    Navigate To "My Subjects"
    Verify Subject Enrollment    Software Quality Assurance    Peter Strict
    Close Browser

Teacher Verifies Enrollment
    Open Browser To University Information System
    Login As Teacher    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Navigate To "My Subjects"
    Verify Students Count    Students (2)
    Verify Student Name In List    William Maroon
    Close Browser

*** Keywords ***
Open Browser To University Information System
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Login As Student
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Press Keys    None    ENTER
    Sleep    2s

Login As Teacher
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To
    [Arguments]    ${page}
    Click Element    xpath=//*[@id="stu.menu.${page}"]
    Sleep    2s

Enroll In A Subject
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s

Verify Success Alert
    Element Should Be Visible    id=stu.otherSubjects.successAlert

Verify Subject Enrollment
    [Arguments]    ${subject}    ${teacher}
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(),"${subject}")]
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(),"${teacher}")]

Verify Students Count
    [Arguments]    ${expectedText}
    ${text}=    Get Text    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal    ${text}    ${expectedText}

Verify Student Name In List
    [Arguments]    ${name}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain    ${name}

Close Browser
    Close All Browsers