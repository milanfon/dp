*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Check names on the page
    Open browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Element Is Visible    //*[@id="header.link.login"]
    Click Element    //*[@id="header.link.login"]
    Wait Until Element Is Visible    //*[@id="loginPage.userNameInput"]
    Input Text    //*[@id="loginPage.userNameInput"]    pedant
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    //*[@id="tea.menu.mySubjects"]
    Click Element    //*[@id="tea.menu.mySubjects"]
    Wait Until Element Is Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element    //*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Element Is Visible    //*[@id="closeModalButtonCross"]
    Click Element    //*[@id="closeModalButtonCross"]
    Wait Until Element Is Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Click Element    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Element Is Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Element Text Should Be Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Benjamin Green
    Element Text Should Be Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Mia Orange
    Element Text Should Be Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Charlotte Purple
    Element Text Should Be Visible    //*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Isabella Yellow
    Close Browser