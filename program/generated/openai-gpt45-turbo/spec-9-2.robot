*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open University Information System and Check Participants
    [Setup]    Open Browser And Perform Steps
    Check If Modal Title Has Appeared
    Check If Participant Names Are Present
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Perform Steps
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s

Check If Modal Title Has Appeared
    Page Should Contain Element    xpath=//*[@id="stu.myExamDates.participantsModal.title"]

Check If Participant Names Are Present
    Table Should Contain    xpath=//table    Benjamin Green
    Table Should Contain    xpath=//table    Mia Orange
    Table Should Contain    xpath=//table    Charlotte Purple
    Table Should Contain    xpath=//table    Isabella Yellow