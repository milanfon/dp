*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}         http://localhost:4680/tbuis/index.jsp
${BROWSER}     Chrome
${DELAY}       0.5s
${BENJAMIN}     //*[contains(text(), 'Benjamin Green')]
${MIA}         //*[contains(text(), 'Mia Orange')]
${CHARLOTTE}    //*[contains(text(), 'Charlotte Purple')]
${ISABELLA}     //*[contains(text(), 'Isabella Yellow')]

*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

*** Test Cases ***
Login And Open Students Page
    Open Browser To Page
    Input Text    ${BROWSER}.//*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    ${BROWSER}.//*[@id="loginPage.passwordInput"]    pass
    Click Element    ${BROWSER}.//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    ${BROWSER}.//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    ${BROWSER}.//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}
    Click Element    ${BROWSER}.//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    ${DELAY}
    Click Element    ${BROWSER}.//*[@id="closeModalButtonCross"]
    Sleep    ${DELAY}
    Element Should Contain    ${BROWSER}.//*[@id="tea.mySubjects.table.listOfStudents"]    ${BENJAMIN}
    Element Should Contain    ${BROWSER}.//*[@id="tea.mySubjects.table.listOfStudents"]    ${MIA}
    Element Should Contain    ${BROWSER}.//*[@id="tea.mySubjects.table.listOfStudents"]    ${CHARLOTTE}
    Close Browser