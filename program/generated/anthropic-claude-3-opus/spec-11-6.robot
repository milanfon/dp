*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 11 Test
    Set Selenium Speed    2
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath///*[@id="header.link.login"]
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.mySubjects"]
    Click Button    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    id=closeModalButtonCross
    Click Button    xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    Close Browser