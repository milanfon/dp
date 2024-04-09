*** Settings ***
Documentation     Scenario to navigate and verify specific names and text presence.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${SELENIUM_SPEED}    2

*** Test Cases ***
Navigate And Verify Specific Names And Text
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    2s
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    2s
    Page Should Contain    No students
    Close Browser