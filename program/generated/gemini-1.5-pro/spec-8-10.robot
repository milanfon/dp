*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/
${BROWSER}         chrome

*** Test Cases ***
Student Register To Exam
    Open Browser    ${URL}    ${BROWSER}
    Sleep    1s
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath///*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Element    xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Element Should Be Visible    xpath///*[@id="stu.otherExamDates.successAlert"]
    Sleep    1s
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath///*[contains(text(), "Programming in Java")]

Teacher See Participants
    Open Browser    ${URL}    ${BROWSER}
    Sleep    1s
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath///*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain Element    xpath///*[contains(text(), "Mia Orange")]
