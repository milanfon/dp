*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${STUDENT USER}   green
${STUDENT PASS}   pass
${TEACHER USER}   strict
${TEACHER PASS}   pass

*** Test Cases ***
Student View
    Open Browser    ${LOGIN URL}    chrome
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT USER}
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${STUDENT PASS}
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text() = "Programming in Java"]
    Sleep    2s
    Close Browser

Teacher View
    Open Browser    ${LOGIN URL}    chrome
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER USER}
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${TEACHER PASS}
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath://td[text() = "Mia Orange"]
    Sleep    2s
    Close Browser 
