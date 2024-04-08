*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Open Browser And Navigate
    Open Browser    http://localhost:4680/tbuis/index.jsp    browser=Chrome
    Sleep        10
    Click Element    xpath://*[@id="header.link.login"]
    Sleep        10
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep        10
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep        10
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep        10
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep        10
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

Check Names
    Sleep        10
    ${names}=    Get Text    xpath://*[@id="tea.listOfStudents.table"]
    Should Contain    ${names}    Benjamin Green
    Should Contain    ${names}    Mia Orange
    Should Contain    ${names}    Charlotte Purple
    Should Contain    ${names}    Isabella Yellow

Close Browser
    Close Browser

*** Test Cases ***
Login And Check Names
    Open Browser And Navigate
    Check Names
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Check Names
    Close Browser