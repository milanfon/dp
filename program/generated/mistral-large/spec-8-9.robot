*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/
${USERNAME}    green
${PASSWORD}    pass

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherExamDates.successAlert"]    10

    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath://td[text()='Programming in Java']

    Close Browser

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain Element    xpath://td[text()='Mia Orange']

    Close Browser