*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Test Cases ***
Verify Participants Modal And Names
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Page Should Contain Element    id=stu.myExamDates.participantsModal.title
    Page Should Contain Element    xpath=//td[contains(., "Benjamin Green")]
    Page Should Contain Element    xpath=//td[contains(., "Mia Orange")]
    Page Should Contain Element    xpath=//td[contains(., "Charlotte Purple")]
    Page Should Contain Element    xpath=//td[contains(., "Isabella Yellow")]
    Close Browser
