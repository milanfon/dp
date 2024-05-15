*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
University Information System Interaction
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Element Text Should Be    xpath=//td[text()="Benjamin Green"]    Benjamin Green
    Element Text Should Be    xpath=//td[text()="Mia Orange"]    Mia Orange
    Element Text Should Be    xpath=//td[text()="Charlotte Purple"]    Charlotte Purple
    Element Text Should Be    xpath=//td[text()="Isabella Yellow"]    Isabella Yellow
    Close Browser