Here is the Robot Framework scenario:

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Exam Registration
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Maximize Browser Window
    Click Element    xpath://a[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://input[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Input Password    xpath://input[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://button[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://a[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Button    xpath://button[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    xpath://div[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://a[@id="stu.menu.myExamDates"] 
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), "Programming in Java")]
    Close Browser

Teacher Checks Exam Participants
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Click Element    xpath://a[@id="header.link.login"]
    Sleep    1s  
    Input Text    xpath://input[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Password    xpath://input[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://button[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://a[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Button    xpath://button[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), "Mia Orange")]
    Close Browser