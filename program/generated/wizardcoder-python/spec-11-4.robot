*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}   0
${BROWSER_IMPLICIT_WAIT}   10

*** Test Cases ***
Check Names
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Implicit Wait    ${BROWSER_IMPLICIT_WAIT}
    Set Window Size    1501    104
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    ${listOfStudents}    Get Text    xpath://*[@id="tea.mySubjects.table.listOfStudents"]
    Should Contain    ${listOfStudents}    Benjamin Green
    Should Contain    ${listOfStudents}    Mia Orange
    Should Contain    ${listOfStudents}    Charlotte Purple
    Should Contain    ${listOfStudents}    Isabella Yellow
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Sleep    ${DELAY}
    Close Browser