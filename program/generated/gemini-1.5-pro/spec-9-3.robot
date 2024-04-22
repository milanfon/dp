*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN PAGE}    http://localhost:4680/tbuis/login
${OVERVIEW PAGE}  http://localhost:4680/tbuis/student-view/overview
${MY EXAMS PAGE} http://localhost:4680/tbuis/student-view/myExamDates

*** Test Cases ***
Spec 9
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s
    
    Title Should Be    University information system
    Click Element    xpath//*[@id="header.link.login"]
    Sleep    2s

    Location Should Be    ${LOGIN PAGE}
    Click Element    xpath//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    Location Should Be    ${OVERVIEW PAGE}
    Click Element    xpath//*[@id="stu.menu.myExamDates"]
    Sleep    2s

    Location Should Be    ${MY EXAMS PAGE}
    Click Element    xpath//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s

    Element Should Be Visible    xpath//*[@id="stu.myExamDates.participantsModal.title"]
    Page Should Contain Element    xpath//td[text()="Benjamin Green"]
    Page Should Contain Element    xpath//td[text()="Mia Orange"]
    Page Should Contain Element    xpath//td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath//td[text()="Isabella Yellow"]