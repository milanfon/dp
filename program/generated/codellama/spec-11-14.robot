*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Check names on page
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]    Benjamin Green
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Mia Orange
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    Charlotte Purple
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Isabella Yellow
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]    No students
    [Teardown]    Close Browser