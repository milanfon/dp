*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${url}        http://localhost:4680/tbuis/
${browser}    Chrome

*** Test Cases ***
Spec 9
    Open Browser    ${url}    ${browser}
    
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    
    Wait Until Element Is Visible    id:stu.myExamDates.table.ParticipantsButton-1
    Click Element    id:stu.myExamDates.table.ParticipantsButton-1
    
    Wait Until Element Is Visible    id:stu.myExamDates.participantsModal.title
    
    Element Should Contain    id:stu.myExamDates.participantsModal.title    Participants
    
    ${rows}=    Get Matching Xpath Count    //td
    Should Be True    ${rows} > 0
    
    ${tds}=    Get WebElements    //td
    
    ${expected}=    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    
    FOR    ${td}    IN    @{tds}
        ${text}=    Get Text    ${td}
        Run Keyword If    '${text} in ${expected}'    Continue For Loop
        Exit For Loop
    END
    
    Close Browser