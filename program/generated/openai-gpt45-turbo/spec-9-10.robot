*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Test Cases ***
Open University Information System and Check Participant Names
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Sleep    1s
    Table Should Contain    xpath=//table    Benjamin Green
    Table Should Contain    xpath=//table    Mia Orange
    Table Should Contain    xpath=//table    Charlotte Purple
    Table Should Contain    xpath=//table    Isabella Yellow
    [Teardown]    Close Browser