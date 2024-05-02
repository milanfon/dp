*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${EMPTY}  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Student
    Set Window Size  1501  1104
    Go To  http://localhost:4680/tbuis/
    Click Element  xpath://*[@id="header.link.login"]
    Sleep  1
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Sleep  1
    Input Text  xpath://*[@id="loginPage.userNameInput"]  green
    Sleep  1
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Sleep  1
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Sleep  1
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep  1
    Click Element  xpath://*[@id="stu.menu.otherExamDates"]
    Sleep  1
    Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep  1
    Element Should Be Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep  1
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Sleep  1
    Element Should Contain  xpath://*[@id="stu.myExamDates.table"]  Programming in Java
    Sleep  1
    Close Browser

Teacher
    Set Window Size  1501  1104
    Go To  http://localhost:4680/tbuis/index.jsp
    Click Element  xpath://*[@id="header.link.login"]
    Sleep  1
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Sleep  1
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Sleep  1
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Sleep  1
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Sleep  1
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep  1
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    Sleep  1
    Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep  1
    Element Should Contain  xpath://*[@id="tea.myExamDates.table"]  Mia Orange
    Sleep  1
    Close Browser