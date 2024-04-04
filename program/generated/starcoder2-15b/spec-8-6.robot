*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SERVER} =  localhost:4680/tbuis
${BROWSER} =  Chrome
${DELAY} =  0

*** Keywords ***
Open Browser To Login Page
    Open Browser  http://${SERVER}/  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  University information system

*** Test Cases ***
Scenario: Test scenario for spec 8 student

    Open Browser To Login Page
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  green
    Input Text  id=loginPage.passwordInput  pass
    Click Element  id=loginPage.loginFormSubmit
    Click Element  id=stu.menu.otherExamDates
    Click Element  id=stu.otherExamDates.table.registerButton-2-0
    Click Element  id=stu.menu.myExamDates
    Close Browser

Scenario: Test scenario for spec 8 teacher

    Open Browser To Login Page
    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  strict
    Input Text  id=loginPage.passwordInput  pass
    Click Element  id=loginPage.loginFormSubmit
    Click Element  id=tea.menu.myExamDates
    Click Element  id=tea.myExamDates.table.participantsButton-1-0
    Close Browser
