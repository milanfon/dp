*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
University Information System Navigation Test
    [Setup]    Open Browser And Set Size
    Navigate To Login Page
    Perform Login
    Navigate To My Exam Dates
    Open Participants
    Check Participants Data
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Set Size
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104

Navigate To Login Page
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s

Perform Login
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s

Open Participants
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s

Check Participants Data
    Wait Until Element Is Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    1s
    Element Should Contain    xpath=//td    Benjamin Green
    Sleep    1s
    Element Should Contain    xpath=//td    Mia Orange
    Sleep    1s
    Element Should Contain    xpath=//td    Charlotte Purple
    Sleep    1s
    Element Should Contain    xpath=//td    Isabella Yellow
    Sleep    1s