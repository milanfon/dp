*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${DELAY}          2s
${ELEMENT_ID}     stu.myExamDates.participantsModal.title
${NAMES}          Benjamin Green|Mia Orange|Charlotte Purple|Isabella Yellow

*** Test Cases ***
Check Elements After Login
    Open Browser To Login Page
    Login With Credentials    orange    pass
    Navigate To My Exam Dates
    Click Participants Button
    Check If Element Is Visible    id=${ELEMENT_ID}
    Check If Td Elements Contain Values    ${NAMES}
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    id=loginPage.userNameInput    ${username}
    Input Text    id=loginPage.passwordInput    ${password}
    Click Element    id=loginPage.loginFormSubmit

Navigate To My Exam Dates
    Click Element    id=stu.menu.myExamDates

Click Participants Button
    Click Element    id=stu.myExamDates.table.ParticipantsButton-1

Check If Td Elements Contain Values
    [Arguments]    ${names}
    @{name_list} =    Split String    ${names}    separator=|
    :FOR    ${name}    IN    @{name_list}
    \    Wait Until Page Contains Element    xpath=//td[contains(text(),"${name}")]    timeout=10s
    \    Page Should Contain Element    xpath=//td[contains(text(),"${name}")]