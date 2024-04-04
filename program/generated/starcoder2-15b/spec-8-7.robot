*** Settings ***

Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***

Student
    Set Selenium Speed  1
    Open Browser  http://localhost:4680/tbuis/  chrome
    Click Element  xpath=//*[@id="header.link.login"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  green
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="stu.menu.otherExamDates"]
    Click Element  xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Click Element  xpath=//*[@id="stu.menu.myExamDates"]
    Element Should Be Visible  xpath=//*[@id="stu.myExamDates.table.table"]//tbody//tr//td//a
    Close Browser

Teacher
    Open Browser  http://localhost:4680/tbuis/  chrome
    Click Element  xpath=//*[@id="header.link.login"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="tea.menu.myExamDates"]
    Click Element  xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Element Should Be Visible  xpath=//*[@id="tea.myExamDates.participants.table.table"]//tbody//tr//td
    Close Browser
