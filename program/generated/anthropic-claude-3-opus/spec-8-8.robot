*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Test Cases ***
Spec 8 Student
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Click Button    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath=//td[contains(text(), "Programming in Java")]
    Close Browser

Spec 8 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Button    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain Element    xpath=//td[contains(text(), "Mia Orange")]
    Close Browser