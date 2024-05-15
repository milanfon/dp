*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Page
Suite Teardown    Close Browser
Test Teardown    Close Browser

*** Variables ***
${BROWSER}        chrome
${DELAY}          500ms
${SPEED}          2
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${SPEED}
    Maximize Browser Window

Check Page Contains Names
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

*** Test Cases ***
Test Spec 11
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}
    Check Page Contains Names
    Click Element    id=closeModalButtonCross
    Sleep    ${DELAY}
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    ${DELAY}
    Page Should Contain    No students 
