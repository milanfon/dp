*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${EMPTY}    ${BROWSER}
Suite Teardown    Close Browser
Test Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${DELAY}      2s
${SPEED}      2

*** Keywords ***
Open Application
    Set Selenium Speed    ${SPEED}
    Go To    http://localhost:4680/tbuis/index.jsp

Login As Pedant
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Go To My Subjects Page
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

*** Test Cases ***
Check Names
    Open Application
    Login As Pedant
    Go To My Subjects Page
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    Page Should Contain    No students 
