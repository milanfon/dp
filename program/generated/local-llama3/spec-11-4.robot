*** Settings ***
Library    SeleniumLibrary
Library    Selenium2Library
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Scenario 11
    Set Selenium Speed    2
    Set Window Size    1501    1104
    Navigate    http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains    Teacher's View
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Page Contains    Benjamin Green
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow
    Click Element    xpath://*[@id="closeModalButtonCross"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students
    Sleep    2