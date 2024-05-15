*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Exam Registration and Verification
    Open Browser    http://localhost:4680/tbuis/    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    3s
    Element Should Be Visible    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    3s
    Page Should Contain Element    xpath=//td[contains(text(), "Programming in Java")]
    Close Browser

    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    3s
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(), "Mia Orange")]
    Close Browser