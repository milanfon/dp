*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${STUDENT_USERNAME}    green
${STUDENT_PASSWORD}    pass
${TEACHER_USERNAME}    strict
${TEACHER_PASSWORD}    pass
${BASE_URL}           http://localhost:4680/tbuis

*** Test Cases ***
Verify Student Registration For Other Exam Dates
    Open Browser    ${BASE_URL}    Chrome
    Set Window Size    1501    1104
    Student Login And Registration
    Verify Registration Success Alert
    Verify Exam Registration In My Exam Dates
    Close Browser

Verify Teacher View For Student Registration
    Open Browser    ${BASE_URL}    Chrome
    Set Window Size    1501    1104
    Teacher Login And Check Registration
    Close Browser

*** Keywords ***
Student Login And Registration
    Login    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s

Verify Registration Success Alert
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    10s

Verify Exam Registration In My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),"Programming in Java")]

Teacher Login And Check Registration
    Login    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),"Mia Orange")]

Login
    [Arguments]    ${username}    ${password}
    Go To    ${BASE_URL}/login
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
