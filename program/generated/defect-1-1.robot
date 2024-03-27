*** Settings ***
Documentation     A test suite for a University information system
Library           SeleniumLibrary

Suite Setup       Open Browser    http://localhost:4680/tbuis/    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Navigate And Check Button Background Color
    [Documentation]    Navigate through the system and check the button's background color
    Set Window Size    1501    1104
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Sleep    1s
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    ${backgroundColor}=    Get Element Css Value    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-0"]    background-color
    Should Be Equal As Strings    ${backgroundColor}    rgb(0, 123, 255)
