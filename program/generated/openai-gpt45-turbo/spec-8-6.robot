*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student Exam Registration and Verification
    Open Browser    http://localhost:4680/tbuis/    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5 seconds
    # Login steps
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    # Navigate to Other Exam Dates
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Sleep    1s
    # Navigate to My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[contains(., "Programming in Java")]
    Sleep    1s
    Close Browser

Teacher Exam Participants Verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5 seconds
    # Login steps
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    # Navigate to My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    # Click on Participants button
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[contains(., "Mia Orange")]
    Sleep    1s
    Close Browser