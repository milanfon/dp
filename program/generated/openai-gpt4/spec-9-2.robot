*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Verify Participants Modal And Student Names
    Set Window Size    1501    1104
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath=//td[text()="Benjamin Green"]
    Page Should Contain Element    xpath=//td[text()="Mia Orange"]
    Page Should Contain Element    xpath=//td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath=//td[text()="Isabella Yellow"]