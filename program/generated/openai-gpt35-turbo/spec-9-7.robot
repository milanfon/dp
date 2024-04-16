*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Wait Until Page Contains Element    aria/Login    timeout=10s
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username    timeout=10s
    Input Text    aria/Username    orange
    Wait Until Page Contains Element    aria/Password    timeout=10s
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/My Exam Dates    timeout=10s
    Click Element    aria/My Exam Dates
    Wait Until Page Contains Element    stu.myExamDates.table.ParticipantsButton-1    timeout=10s
    Click Element    stu.myExamDates.table.ParticipantsButton-1
    Wait Until Page Contains Element    stu.myExamDates.participantsModal.title    timeout=10s
    ${participants}    Get WebElements    xpath=//td
    FOR    ${participant}    IN    @{participants}
        ${text}=    Get Text    ${participant}
        Run Keyword If    '${text}' in ['Benjamin Green', 'Mia Orange', 'Charlotte Purple', 'Isabella Yellow']    Log    '${text}' is present
    END
    Close Browser