*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${DELAY}    0.5s

*** Test Cases ***
Test Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "No students")]    ${DELAY}
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    No students
    Close Browser