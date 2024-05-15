*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 9
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath=//td[contains(text(), "Benjamin Green")]
    Page Should Contain Element    xpath=//td[contains(text(), "Mia Orange")]
    Page Should Contain Element    xpath=//td[contains(text(), "Charlotte Purple")]
    Page Should Contain Element    xpath=//td[contains(text(), "Isabella Yellow")]
    Close Browser