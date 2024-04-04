*** Settings ***
Documentation     Test Scenario for Verifying Presence of Specific <td> Elements
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Verify Presence of Specific <td> Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath=//td[contains(text(),'Benjamin Green')]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[contains(text(),'Mia Orange')]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[contains(text(),'Charlotte Purple')]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[contains(text(),'Isabella Yellow')]
    Close Browser
