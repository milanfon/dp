*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Open And Validate Page Contents
    [Setup]  Open Browser With Settings
    [Teardown]  Close Browser
    Execute Page Steps
    Check Names On Page
    Click Close Modal Button Cross
    Click On Second List Of Students Button
    Validate No Students Text

*** Keywords ***
Open Browser With Settings
    Open Browser    about:blank    Chrome
    Set Selenium Speed    2
    Set Window Size    1501    1104

Execute Page Steps
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

Check Names On Page
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

Click Close Modal Button Cross
    Click Element    xpath=//*[@id="closeModalButtonCross"]

Click On Second List Of Students Button
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

Validate No Students Text
    Page Should Contain    No students