*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${STUDENT_USERNAME}    green
${STUDENT_PASSWORD}    pass
${TEACHER_USERNAME}    strict
${TEACHER_PASSWORD}    pass
${BASE_URL}           http://localhost:4680/tbuis
${BROWSER}            Chrome

*** Test Cases ***
Register For Other Exam Dates As Student
    Open Browser    ${BASE_URL}/    ${BROWSER}
    Set Window Size    1501    1104
    Student Login    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Go To Other Exam Dates
    Register For Exam
    Verify Registration Success
    Go To My Exam Dates
    Verify Exam Registration    Programming in Java
    Close Browser

Verify Student Registration As Teacher
    Open Browser    ${BASE_URL}/    ${BROWSER}
    Set Window Size    1501    1104
    Teacher Login    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Go To My Exam Dates
    Verify Student Name    Mia Orange
    Close Browser

*** Keywords ***
Student Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Teacher Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Go To Other Exam Dates
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    2s

Register For Exam
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s

Verify Registration Success
    Element Should Be Visible    id=stu.otherExamDates.successAlert

Go To My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s

Verify Exam Registration
    [Arguments]    ${exam_name}
    Page Should Contain Element    xpath=//td[contains(text(), "${exam_name}")]

Go To My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s

Verify Student Name
    [Arguments]    ${student_name}
    Page Should Contain    ${student_name}