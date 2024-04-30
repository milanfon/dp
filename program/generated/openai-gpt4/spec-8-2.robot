*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}           http://localhost:4680/tbuis
${BROWSER}            Chrome

*** Test Cases ***
Student Registers For Exam And Checks Registration
    Open Browser And Login    ${BASE_URL}    green    pass
    Register For Exam
    Check Registration Success
    Check Exam Registration In My Exam Dates
    [Teardown]    Close Browser

Teacher Verifies Student Registration
    Open Browser And Login    ${BASE_URL}    strict    pass    teacher
    Verify Student Registration    Mia Orange
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Login
    [Arguments]    ${url}    ${username}    ${password}    ${role}=student
    Open Browser    ${url}    ${BROWSER}
    Set Window Size    1501    1104
    Wait Until Page Contains Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Run Keyword If    '${role}' == 'student'    Student View Setup
    ...    ELSE    Teacher View Setup

Student View Setup
    Wait Until Page Contains    Student's View

Teacher View Setup
    Wait Until Page Contains    Teacher's View

Register For Exam
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s

Check Registration Success
    Element Should Be Visible    id=stu.otherExamDates.successAlert

Check Exam Registration In My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(), "Programming in Java")]

Verify Student Registration
    [Arguments]    ${student_name}
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Contain    ${student_name}