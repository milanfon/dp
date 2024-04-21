*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/
${BROWSER}        chrome

*** Test Cases ***
Student View Other Exam Dates
    Open Browser    ${INDEX URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Link    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Button    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep    2s
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.myExamDates.table"]//td[text()="Programming in Java"]
    Sleep    2s
    Close Browser

Teacher View My Exam Dates
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Button    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.participantsDialog"]//td[text()="Mia Orange"]
    Sleep    2s
    Close Browser
