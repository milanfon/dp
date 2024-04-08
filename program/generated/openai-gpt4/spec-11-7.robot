*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Check Students
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.listOfStudentsButton-2
    Click Element    id:closeModalButtonCross
    ${students}=    Get WebElements    xpath://*[contains(text(), 'Benjamin Green') or contains(text(), 'Mia Orange') or contains(text(), 'Charlotte Purple') or contains(text(), 'Isabella Yellow')]
    ${length}=    Get Length    ${students}
    Should Be True    ${length} > 0
    Close Browser