## Solution


*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    ${5}    # In seconds

*** Test Cases ***
Spec 9
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    ${500}    ${500}
    Set Selenium Speed    ${DELAY}
    
    # Step 1
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    
    # Step 2
    Wait Until Element Is Visible    aria/Username
    Click Element    aria/Username
    Input Text    aria/Username    orange
    
    # Step 3
    Wait Until Element Is Visible    aria/Password
    Click Element    aria/Password
    Input Text    aria/Password    pass
    
    # Step 4
    Wait Until Element Is Visible    aria/Login[role="button"]
    Click Element    aria/Login[role="button"]
    
    # Step 5
    Wait Until Element Is Visible    aria/My Exam Dates
    Click Element    aria/My Exam Dates
    
    # Step 6
    Wait Until Element Is Visible    id:stu.myExamDates.table.ParticipantsButton-1
    Click Element    id:stu.myExamDates.table.ParticipantsButton-1
    
    # Step 7
    Wait Until Element Is Visible    id:stu.myExamDates.modal.title
    Element Should Contain    id:stu.myExamDates.modal.title    Participants
    
    # Step 8
    Wait Until Element Is Visible    xpath://td[.="Benjamin Green"]
    Wait Until Element Is Visible    xpath://td[.="Mia Orange"]
    Wait Until Element Is Visible    xpath://td[.="Charlotte Purple"]
    Wait Until Element Is Visible    xpath://td[.="Isabella Yellow"]
    
    Close Browser



# To run this test, make sure you have installed the SeleniumLibrary and have the correct driver for the ${BROWSER} you want to use. 