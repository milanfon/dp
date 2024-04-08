*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${USER}    pedant
${PASS}    pass

*** Test Cases ***
Login and check students
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASS}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Element Is Visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Element Is Visible    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Wait Until Element Is Visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Element Is Visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Benjamin Green
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Mia Orange
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Charlotte Purple
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Isabella Yellow
    Close Browser