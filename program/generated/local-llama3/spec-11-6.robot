*** Settings ***
Library           SeleniumLibrary
Speed             2
Default Browser  Chrome

*** Test Cases ***
Spec 11
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    1    # add a 1-second delay
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Sleep    1    # add a 1-second delay
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    [Teardown]    Close Browser