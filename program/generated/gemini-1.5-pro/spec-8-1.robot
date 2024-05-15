*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/
${username_student}    green
${password_student}    pass
${username_teacher}    strict
${password_teacher}    pass

*** Test Cases ***
Student View
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    1s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username_student}
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password_student}
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Link    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Button    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep    1s
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath://td[text()="Programming in Java"]
    Sleep    1s
    Close Browser

Teacher View
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    1s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username_teacher}
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password_teacher}
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Button    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Sleep    1s
    Close Browser
