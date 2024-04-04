*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DELAY_BETWEEN_STEPS}    2 seconds

*** Test Cases ***
Open Page and Verify Elements
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains Element    xpath=//td[contains(text(),'Programming in Java')]
    Close Browser

Login as Teacher and Verify Element
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Wait Until Page Contains Element    xpath=//td[contains(text(),'Mia Orange')]
    Close Browser
