*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Test Cases ***

Scenario1
    [Tags]    student

    *** Settings ***
    Set Viewport    1501    1104

    *** Variables ***
    ${student_url}    http://localhost:4680/tbuis/

    *** Step Keyword ***
    Set Viewport    ${width}    ${height}
    Navigate To    ${student_url}
    Login    LoginPage    userNameInput    ${username}    passwordInput    ${password}
    Click Button    Other Exam Dates
    Click Button    Register
    Wait Until Page Contains    successAlert
    Click Button    My Exam Dates
    Element Should Contain    //td[contains(text(), 'Programming in Java')]

    *** Teardown ***
    Close Browser

Scenario2
    [Tags]    teacher

    *** Settings ***
    Set Viewport    1501    1104

    *** Variables ***
    ${teacher_url}    http://localhost:4680/tbuis/

    *** Step Keyword ***
    Set Viewport    ${width}    ${height}
    Navigate To    ${teacher_url}
    Login    LoginPage    userNameInput    ${teacher_username}    passwordInput    ${teacher_password}
    Click Button    My Exam Dates
    Element Should Contain    //td[contains(text(), 'Mia Orange')]

    *** Teardown ***
    Close Browser

*** Keywords ***

Login
    [Arguments]    ${page}    ${userNameInput}    ${userName}    ${passwordInput}    ${password}

    [Documentation]    This keyword logs in to the application

    [Returns]    None

    ${element} =    Get Element    ${page}    ${userNameInput}
    Input Text    ${element}    ${userName}
    ${element} =    Get Element    ${page}    ${passwordInput}
    Input Text    ${element}    ${password}
    Click Element    ${element}

    *** Teardown ***
    [Documentation]    This keyword performs any cleanup actions that should be done after the test case

    Click Element    ${page}    //button[@aria-label='Logout']
    Sleep    ${delay}