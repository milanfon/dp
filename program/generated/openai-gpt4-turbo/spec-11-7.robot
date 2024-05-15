*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2
${SPEED}    2

*** Test Cases ***
Navigate and Verify Student Names
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Selenium Speed    ${SPEED}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    Page Should Contain    No students
    Close Browser