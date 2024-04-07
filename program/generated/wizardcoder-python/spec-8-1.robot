*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_URL}  http://localhost:4680/tbuis/
${BROWSER}  Chrome
${DELAY}  0.5s

*** Test Cases ***
spec 8 student
    Open browser  ${LOGIN_URL}  ${BROWSER}
    Input text  id:loginPage.userNameInput  green
    Input text  id:loginPage.passwordInput  pass
    Click button  id:loginPage.loginFormSubmit
    Click link  xpath://*[@id="stu.menu.otherExamDates"]
    Click button  id:stu.otherExamDates.table.registerButton-2-0
    Click link  xpath://*[@id="stu.menu.myExamDates"]
    ${exists}  Run keyword and return status  Element should be visible  xpath://*[@id="stu.otherExamDates.successAlert"]
    Run keyword if  not ${exists}  Fail  Element with id "stu.otherExamDates.successAlert" not found
    ${exists}  Run keyword and return status  Element should be visible  xpath://td[contains(.,"Programming in Java")]
    Run keyword if  not ${exists}  Fail  Element with text "Programming in Java" not found
    Close All Browsers

spec 8 teacher
    Open browser  ${LOGIN_URL}  ${BROWSER}
    Input text  id:loginPage.userNameInput  strict
    Input text  id:loginPage.passwordInput  pass
    Click button  id:loginPage.loginFormSubmit
    Click link  xpath://*[@id="tea.menu.myExamDates"]
    Click button  id:tea.myExamDates.table.participantsButton-1-0
    ${exists}  Run keyword and return status  Element should be visible  xpath://td[contains(.,"Mia Orange")]
    Run keyword if  not ${exists}  Fail  Element with text "Mia Orange" not found
    Close All Browsers