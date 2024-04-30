*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    2s
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Verify Students Presence And Absence
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Benjamin Green")]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Mia Orange")]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Charlotte Purple")]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Isabella Yellow")]
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Element Is Visible    xpath=//*[contains(text(), "No students")]