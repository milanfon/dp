*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DELAY}  ${0.5}
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/
${BROWSER_OPTIONS}  --headless

*** Test Cases ***
spec 8 student
    Open Browser  ${URL}  ${BROWSER}  options=${BROWSER_OPTIONS}
    Set Selenium Speed  ${DELAY}
    Input Text  id:loginPage.userNameInput  green
    Input Text  id:loginPage.passwordInput  pass
    Click Button  id:loginPage.loginFormSubmit
    Click Link  id:stu.menu.otherExamDates
    Click Button  id:stu.otherExamDates.table.registerButton-2-0
    Click Link  id:stu.menu.myExamDates
    Wait Until Element Is Visible  id:stu.otherExamDates.successAlert
    Click Link  id:stu.menu.myExamDates
    Wait Until Element Is Visible  xpath://td[contains(text(), 'Programming in Java')]
    Close Browser

spec 8 teacher
    Open Browser  ${URL}  ${BROWSER}  options=${BROWSER_OPTIONS}
    Set Selenium Speed  ${DELAY}
    Input Text  id:loginPage.userNameInput  strict
    Input Text  id:loginPage.passwordInput  pass
    Click Button  id:loginPage.loginFormSubmit
    Click Link  id:tea.menu.myExamDates
    Click Button  id:tea.myExamDates.table.participantsButton-1-0
    Click Link  id:tea.menu.myExamDates
    Wait Until Element Is Visible  xpath://td[contains(text(), 'Mia Orange')]
    Close Browser