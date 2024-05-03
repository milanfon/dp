*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary  timeout=10

*** Variables ***
${BROWSER}  Chrome
${DELAY}  1

*** Test Cases ***
Student Login
    Open Browser  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Navigate  http://localhost:4680/tbuis/
    Click Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  green
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="stu.menu.otherExamDates"]
    Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Element Is Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Element Is Visible  xpath://*[@id="stu.myExamDates.table"]//td[contains(text(), "Programming in Java")]
    Close Browser

Teacher Login
    Open Browser  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Navigate  http://localhost:4680/tbuis/index.jsp
    Click Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Wait Until Element Is Visible  xpath://*[@id="tea.myExamDates.table"]//td[contains(text(), "Mia Orange")]
    Close Browser