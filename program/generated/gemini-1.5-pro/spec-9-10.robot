*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Link       xpath://*[@id="header.link.login"]
    Sleep            2s
    Input Text      xpath://*[@id="loginPage.userNameInput"]     orange
    Sleep            2s
    Input Text      xpath://*[@id="loginPage.passwordInput"]     pass
    Sleep            2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep            2s

*** Test Cases ***
Check Participants Modal
    Click Link       xpath://*[@id="stu.menu.myExamDates"]
    Sleep            2s
    Click Button    xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep            2s
    Page Should Contain Element    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Sleep            2s
    Page Should Contain    Benjamin Green
    Sleep            2s
    Page Should Contain    Mia Orange
    Sleep            2s
    Page Should Contain    Charlotte Purple
    Sleep            2s
    Page Should Contain    Isabella Yellow
    Sleep            2s 
