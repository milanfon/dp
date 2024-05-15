*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Student Page    AND    Open Browser To Teacher Page
Suite Teardown    Close All Browsers

*** Keywords ***
Open Browser To Student Page
    Open Browser    about:blank    Chrome    alias=Student
    Set Window Size    1501    1104

Open Browser To Teacher Page
    Open Browser    about:blank    Chrome    alias=Teacher
    Set Window Size    1501    1104

*** Test Cases ***
Student Registers For Exam And Checks My Exam Dates
    [Setup]    Switch Browser    Student
    Go To    http://localhost:4680/tbuis/
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[text()="Programming in Java"]

Teacher Checks Exam Participants
    [Setup]    Switch Browser    Teacher
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[text()="Mia Orange"]