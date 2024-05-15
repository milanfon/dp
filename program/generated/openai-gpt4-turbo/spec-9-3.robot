*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Page and Verify Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath=//td[contains(., 'Benjamin Green')]
    Page Should Contain Element    xpath=//td[contains(., 'Mia Orange')]
    Page Should Contain Element    xpath=//td[contains(., 'Charlotte Purple')]
    Page Should Contain Element    xpath=//td[contains(., 'Isabella Yellow')]
    Close Browser