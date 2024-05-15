*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Button    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), 'Programming in Java')]
    Close Browser

Teacher Scenario  
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window 
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s  
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]  
    Sleep    2s
    Click Button    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath://td[contains(text(), 'Mia Orange')]
    Close Browser