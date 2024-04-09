*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          1s

*** Test Cases ***
Student Registers For Exam And Checks My Exam Dates
    Open Browser    http://localhost:4680/tbuis/    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    id=stu.otherExamDates.successAlert
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[text()="Programming in Java"]
    Close Browser

Teacher Checks For Student's Registration
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[text()="Mia Orange"]
    Close Browser