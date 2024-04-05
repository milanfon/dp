
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Check If Names Are Present On The Page
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    Set Selenium Speed    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Page Should Contain Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students