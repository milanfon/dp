*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/

*** Test Cases ***
Spec 8 Student
    [Setup]  Open Browser  ${URL}  browser=chrome
    Click Element  xpath=//*[@id="header.link.login"]
    Click Element  xpath=//*[@id="loginPage.userNameInput"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  green
    Click Element  xpath=//*[@id="loginPage.passwordInput"]
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="stu.menu.otherExamDates"]
    Click Element  xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Element Should Be Visible  xpath=//*[@id="stu.otherExamDates.successAlert"]
    Click Element  xpath=//*[@id="stu.menu.myExamDates"]
    Element Should Be Visible  xpath=//td[.="Programming in Java"]
    [Teardown]  Close Browser

Spec 8 Teacher
    [Setup]  Open Browser  ${URL}  browser=chrome
    Click Element  xpath=//*[@id="header.link.login"]
    Click Element  xpath=//*[@id="loginPage.userNameInput"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  strict
    Click Element  xpath=//*[@id="loginPage.passwordInput"]
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="tea.menu.myExamDates"]
    Element Should Be Visible  xpath=//td[.="Mia Orange"]
    [Teardown]  Close Browser
