*** Settings ***
Library           SeleniumLibrary
Documentation     Student registers for an exam, teacher views the participant list

*** Variables ***
${url}            http://localhost:4680/tbuis/
${username_student}   green
${password_student}   pass
${username_teacher}   strict
${password_teacher}   pass

*** Test Cases ***
Student registers
    Open Browser    ${url}    chrome
    Sleep   2s
    Click Link    xpath///*[@id="header.link.login"]
    Sleep   2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${username_student}
    Sleep   2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${password_student}
    Sleep   2s
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep   2s
    Click Link    xpath///*[@id="stu.menu.otherExamDates"]
    Sleep   2s
    Click Button    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep   2s
    Element Should Be Visible    xpath///*[@id="stu.otherExamDates.successAlert"]
    Sleep   2s
    Click Link    xpath///*[@id="stu.menu.myExamDates"]
    Sleep   2s
    Page Should Contain Element    xpath///*[text()="Programming in Java"]
    Sleep   2s
    Close Browser

Teacher views participants
    Open Browser    ${url}    chrome
    Sleep   2s
    Click Link    xpath///*[@id="header.link.login"]
    Sleep   2s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    ${username_teacher}
    Sleep   2s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    ${password_teacher}
    Sleep   2s
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep   2s
    Click Link    xpath///*[@id="tea.menu.myExamDates"]
    Sleep   2s
    Click Button    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep   2s
    Page Should Contain Element    xpath///*[text()="Mia Orange"]
    Sleep   2s
    Close Browser
