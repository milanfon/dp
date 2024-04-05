*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Test Case
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Size    1501    1104
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    orange
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/My Exam Dates
    Click Element    id:stu.myExamDates.table.ParticipantsButton-1
    Page Should Contain Element    id:stu.myExamDates.participantsModal.title
    Page Should Contain Element    xpath://td[text()='Benjamin Green']
    Page Should Contain Element    xpath://td[text()='Mia Orange']
    Page Should Contain Element    xpath://td[text()='Charlotte Purple']
    Page Should Contain Element    xpath://td[text()='Isabella Yellow']
    Close Browser
