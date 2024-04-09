*** Settings ***
Documentation     A test suite for student exam registration and teacher verification.
Library           SeleniumLibrary

Suite Setup       Open Browser    about:blank    ${BROWSER}
Suite Teardown    Close All Browsers
Test Setup        Set Browser Viewport Size    1501    1104
Test Teardown     Close Browser

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Student Registers For Exam And Verifies Success
    Navigate To Page    http://localhost:4680/tbuis/
    Student Login    green    pass
    Register For Exam    stu.otherExamDates.table.registerButton-2-0
    Verify Registration Success    stu.otherExamDates.successAlert
    Verify Exam In My Exam Dates    Programming in Java

Teacher Verifies Student Registration
    Navigate To Page    http://localhost:4680/tbuis/
    Teacher Login    strict    pass
    Verify Student Registration    Mia Orange

*** Keywords ***
Set Browser Viewport Size
    [Arguments]    ${width}    ${height}
    Set Window Size    ${width}    ${height}

Navigate To Page
    [Arguments]    ${url}
    Go To    ${url}
    Sleep    2s

Student Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Register For Exam
    [Arguments]    ${register_button_id}
    Click Element    xpath=//*[@id="${register_button_id}"]
    Sleep    2s

Verify Registration Success
    [Arguments]    ${success_alert_id}
    Wait Until Element Is Visible    id=${success_alert_id}    5s

Verify Exam In My Exam Dates
    [Arguments]    ${exam_name}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),"${exam_name}")]

Teacher Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Student Registration
    [Arguments]    ${student_name}
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),"${student_name}")]