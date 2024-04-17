*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/
${DELAY}      2s

*** Test Cases ***
Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login As Student
    Check Other Exam Dates
    Check My Exam Dates
    Close Browser

Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login As Teacher
    Check Teacher's Exam Dates
    Close Browser

*** Keywords ***
Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Check Other Exam Dates
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    id=stu.otherExamDates.successAlert    timeout=10s

Check My Exam Dates
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath://td[text()="Programming in Java"]

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Check Teacher's Exam Dates
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
