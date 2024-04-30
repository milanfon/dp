*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    2 seconds

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Verify Student Names And Check Modal
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Login    pedant    pass
    Navigate To My Subjects And List Students
    Check Student Names Present
    Close Student List Modal
    Check No Students In Other Subject
    [Teardown]    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]

Navigate To My Subjects And List Students
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

Check Student Names Present
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

Close Student List Modal
    Click Element    xpath=//*[@id="closeModalButtonCross"]

Check No Students In Other Subject
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain    No students