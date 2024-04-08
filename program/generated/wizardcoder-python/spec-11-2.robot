*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}     http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Login and check students
    Open browser    ${URL}    ${BROWSER}
    Set window size    1501    104
    Input Text    //*[@id="loginPage.userNameInput"]    pedant
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Button    //*[@id="loginPage.loginFormSubmit"]
    Click Element    //*[@id="tea.menu.mySubjects"]
    Click Element    //*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click Element    //*[@id="closeModalButtonCross"]
    ${students}=    Get WebElements    //*[@id="tea.mySubjects.table.students"]//*[contains(., "Benjamin Green")]
    ${students2}=    Get WebElements    //*[@id="tea.mySubjects.table.students"]//*[contains(., "Mia Orange")]
    ${students3}=    Get WebElements    //*[@id="tea.mySubjects.table.students"]//*[contains(., "Charlotte Purple")]
    ${students4}=    Get WebElements    //*[@id="tea.mySubjects.table.students"]//*[contains(., "Isabella Yellow")]
    Should Not Be Empty    ${students}
    Should Not Be Empty    ${students2}
    Should Not Be Empty    ${students3}
    Should Not Be Empty    ${students4}
    Close Browser