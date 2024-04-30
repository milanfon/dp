*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${DELAY}          2s
${BROWSER}        chrome
${SPEED}          2
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Spec 11
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${SPEED}
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Page Contains Element    xpath://*[text()="Benjamin Green"]
    Wait Until Page Contains Element    xpath://*[text()="Mia Orange"]
    Wait Until Page Contains Element    xpath://*[text()="Charlotte Purple"]
    Wait Until Page Contains Element    xpath://*[text()="Isabella Yellow"]
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Page Contains    No students
    Close Browser
