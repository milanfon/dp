*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Exam Registration And Check
    Open Browser    http://localhost:4680/tbuis/    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),'Programming in Java')]
    Close Browser

Teacher Check For Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),'Mia Orange')]
    Close Browser