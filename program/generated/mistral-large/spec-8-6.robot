*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/
${USERNAME}    green
${PASSWORD}    pass
${TEACHER_USERNAME}    strict

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Login As Student
    Click Element    xpath://a[contains(text(),'Other Exam Dates')]
    Click Element    xpath://button[contains(text(),'Register')]
    Wait Until Page Contains Element    id=stu.otherExamDates.successAlert    10
    Click Element    xpath://a[contains(text(),'My Exam Dates')]
    Page Should Contain Element    xpath://td[contains(text(),'Programming in Java')]
    Close Browser

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Login As Teacher
    Click Element    xpath://a[contains(text(),'My Exam Dates')]
    Click Element    xpath://button[contains(text(),'Participants (8/10)')]
    Page Should Contain Element    xpath://td[contains(text(),'Mia Orange')]
    Close Browser

*** Keywords ***
Login As Student
    Input Text    id=loginPage.userNameInput    ${USERNAME}
    Input Password    id=loginPage.passwordInput    ${PASSWORD}
    Click Element    id=loginPage.loginFormSubmit

Login As Teacher
    Input Text    id=loginPage.userNameInput    ${TEACHER_USERNAME}
    Input Password    id=loginPage.passwordInput    ${PASSWORD}
    Click Element    id=loginPage.loginFormSubmit