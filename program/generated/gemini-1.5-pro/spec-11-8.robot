*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${EMPTY}    ${BROWSER}
Suite Teardown    Close Browser
Test Setup        Set Selenium Speed    ${SELENIUM_SPEED}

*** Variables ***
${BROWSER}        chrome
${SELENIUM_SPEED}    2

*** Test Cases ***
Check Students

    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    2s
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Sleep    2s
    Click Element    id=closeModalButtonCross
    Sleep    2s
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    2s
    Page Should Contain    No students
