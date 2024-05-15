*** Settings ***
Documentation     Scenario to navigate through a university information system, login, and verify student names.
Library           SeleniumLibrary

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}      http://localhost:4680/tbuis/login
${TEACHER_VIEW}   http://localhost:4680/tbuis/teacher-view/overview
${MY_SUBJECTS}    http://localhost:4680/tbuis/teacher-view/mySubjects

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    Chrome
    Set Selenium Speed    2

Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View

Navigate To My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains    Teacher's View

Verify Student Names
    ${names}    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    :FOR    ${name}    IN    @{names}
    \    Page Should Contain    ${name}

Close Student Modal
    Click Element    xpath=//*[@id="closeModalButtonCross"]

Click On Specific Student List Button
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

Check For No Students Text
    Wait Until Page Contains    No students

*** Test Cases ***
Verify Student Names In System
    [Documentation]    Verify specific student names are present in the system after login.
    Login As Teacher
    Navigate To My Subjects
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Verify Student Names
    Close Student Modal
    Click On Specific Student List Button
    Check For No Students Text