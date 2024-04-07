*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    0.5

*** Test Cases ***
Test Login And Open My Exam Dates
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Window Size    1501    104
    Set Selenium Speed    ${DELAY}
    
    Login
    Open My Exam Dates
    
    ${element}    Get Webelement    xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Wait Until Element Is Visible    ${element}
    Element Should Contain    ${element}    Participants
    
    ${table}    Get Webelement    xpath://*[@id="stu.myExamDates.participantsModal.table"]
    Wait Until Element Is Visible    ${table}
    ${rows}    Get Webelements    xpath://*[@id="stu.myExamDates.participantsModal.table"]//td
    Elements Should Be Visible    ${rows}
    Element Text Should Be    ${rows[0]}    Benjamin Green
    Element Text Should Be    ${rows[1]}    Mia Orange
    Element Text Should Be    ${rows[2]}    Charlotte Purple
    Element Text Should Be    ${rows[3]}    Isabella Yellow

    Close Browser

*** Keywords ***
Login
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit

Open My Exam Dates
    Click Element    id:stu.menu.myExamDates
    Click Element    id:stu.myExamDates.table.ParticipantsButton-1