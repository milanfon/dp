*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/

*** Test Cases ***
Student View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Other Exam Dates page
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherExamDates.successAlert"]    10

    # My Exam Dates page
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath://td[text()='Programming in Java']
    Close Browser

Teacher View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5

    # Login steps
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # My Exam Dates page
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain Element    xpath://td[text()='Mia Orange']
    Close Browser