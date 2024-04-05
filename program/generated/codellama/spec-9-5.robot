*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    5s

*** Test Cases ***
Check Page And Elements
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Browser Implicit Wait    ${DELAY}
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    orange
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/My Exam Dates
    Click Element    id=stu.myExamDates.table.ParticipantsButton-1
    ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    id=stu.myExamDates.participantsModal.title
    Should Be True    ${element_present}
    Page Should Contain Element    xpath=//td[text()="Benjamin Green"]
    Page Should Contain Element    xpath=//td[text()="Mia Orange"]
    Page Should Contain Element    xpath=//td[text()="Charlotte Purple"]
    Page Should Contain Element    xpath=//td[text()="Isabella Yellow"]
    [Teardown]    Close Browser