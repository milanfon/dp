*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Test Cases ***
Open Student View And Verify Registration
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    2s
    Page Should Contain Element    id=stu.otherExamDates.successAlert
    Close Browser

    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(), "Programming in Java")]
    Close Browser

Login As Teacher And Verify Participant
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(), "Mia Orange")]
    Close Browser