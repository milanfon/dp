*** Settings ***
Documentation     Validate Participants in My Exam Dates
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Open Page and Validate Participants
    Open Browser    about:blank    ${BROWSER}
    Set Browser Implicit Wait    10
    Set Selenium Speed    ${DELAY}
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//a[@id='header.link.login']
    Input Text    xpath=//*[@id='loginPage.userNameInput']    orange
    Input Text    xpath=//*[@id='loginPage.passwordInput']    pass
    Click Element    xpath=//*[@id='loginPage.loginFormSubmit']
    Click Element    xpath=//a[contains(text(),'Exam Dates')]
    Click Element    xpath=//*[@id='stu.myExamDates.table.ParticipantsButton-1']
    Wait Until Element Is Visible    xpath=//*[@id='stu.myExamDates.participantsModal.title']
    Page Should Contain Element    xpath=//td[text()='Benjamin Green']
    Page Should Contain Element    xpath=//td[text()='Mia Orange']
    Page Should Contain Element    xpath=//td[text()='Charlotte Purple']
    Page Should Contain Element    xpath=//td[text()='Isabella Yellow']
    Close Browser
