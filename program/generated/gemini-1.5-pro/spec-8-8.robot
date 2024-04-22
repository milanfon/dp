*** Settings ***
Library           SeleniumLibrary
Documentation     Suite description
...               These tests check student and teacher views.
Suite Setup       Open Browser    ${url}    ${browser}
Suite Teardown    Close Browser
Test Setup       Set Window Size    1501    1104

*** Variables ***
${url}            http://localhost:4680/tbuis/
${browser}        chrome

*** Test Cases ***
Student View
    Sleep    1s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Link    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Button    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep    1s
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath://td[text()='Programming in Java']

Teacher View
    Sleep    1s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Button    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain Element    xpath://td[text()='Mia Orange'] 
