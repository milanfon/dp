*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    http://localhost:4680/tbuis/index.jsp
${browser}    Chrome

*** Test Cases ***
Open Page and Check Names
    Open Browser    ${url}    ${browser}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-0
    Click Element    id:closeModalButtonCross
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-2
    Wait Until Element Is Visible    xpath://*[contains(text(), 'Benjamin Green')]
    Wait Until Element Is Visible    xpath://*[contains(text(), 'Mia Orange')]
    Wait Until Element Is Visible    xpath://*[contains(text(), 'Charlotte Purple')]
    Wait Until Element Is Visible    xpath://*[contains(text(), 'Isabella Yellow')]
    Close Browser