*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${url}            http://localhost:4680/tbuis/
${username_student}    green
${username_teacher}    strict
${password}        pass

*** Test Cases ***
Student View
    Open Browser    ${url}    chrome
    Sleep    2s
    Click Link    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${username_student}
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${password}
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Link    xpath///*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Element Should Be Visible    xpath///*[@id="stu.otherExamDates.successAlert"]
    Sleep    2s
    Click Link    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath///*[text() = "Programming in Java"]

Teacher View
    Open Browser    ${url}    chrome
    Sleep    2s
    Click Link    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${username_teacher}
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${password}
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Link    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath///*[text() = "Mia Orange"]
