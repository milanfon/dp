*** Settings ***
Library    SeleniumLibrary

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
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    [Teardown]    Close Browser

Check names on page with delays
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    1
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    1
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    1
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    1
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    1
    Page Should Contain    Benjamin Green
    Sleep    1
    Page Should Contain    Mia Orange
    Sleep    1
    Page Should Contain    Charlotte Purple
    Sleep    1
    Page Should Contain    Isabella Yellow
    Sleep    1
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Sleep    1
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    1
    Page Should Contain    No students
    Sleep    1
    [Teardown]    Close Browser