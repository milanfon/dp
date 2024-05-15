*** Settings ***
Documentation     Scenario to perform operations following the provided JSON recording.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome

*** Test Cases ***
Execute Steps From JSON Recording
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s

    # Checks
    Element Should Be Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    1s
    Table Should Contain    xpath=//table    Benjamin Green
    Sleep    1s
    Table Should Contain    xpath=//table    Mia Orange
    Sleep    1s
    Table Should Contain    xpath=//table    Charlotte Purple
    Sleep    1s
    Table Should Contain    xpath=//table    Isabella Yellow

    Close Browser