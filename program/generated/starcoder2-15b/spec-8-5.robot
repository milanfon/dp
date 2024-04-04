*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser To Login Page
Test Teardown  Close Browser

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

    Click Element  id=header.link.login
    Input Text  id=loginPage.userNameInput  green
    Input Text  id=loginPage.passwordInput  pass
    Click Element  id=loginPage.loginFormSubmit
    Click Element  id=stu.menu.otherExamDates
    Click Element  id=stu.otherExamDates.table.registerButton-2-0
    Click Element  id=stu.menu.myExamDates
