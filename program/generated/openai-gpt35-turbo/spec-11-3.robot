*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}    2s

*** Test Cases ***
Run JSON Recording
    Open Browser    url=http://localhost:4680/tbuis/index.jsp    browser=chrome
    Set Viewport    1501    1104
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Sleep    ${DELAY}
    Wait Until Page Contains Element    aria/Username
    Click Element    aria/Username
    Sleep    ${DELAY}
    Input Text    aria/Username    pedant
    Sleep    ${DELAY}
    Click Element    aria/Password
    Sleep    ${DELAY}
    Input Text    aria/Password    pass
    Sleep    ${DELAY}
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains    http://localhost:4680/tbuis/teacher-view/overview
    Sleep    ${DELAY}
    Click Element    aria/My Subjects
    Wait Until Page Contains    http://localhost:4680/tbuis/teacher-view/mySubjects
    Sleep    ${DELAY}
    Click Element    aria/Students (4)[role="button"]
    Sleep    ${DELAY}
    Click Element    id=closeModalButtonCross
    Sleep    ${DELAY}
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    ${DELAY}
    Page Should Contain    No students
    Sleep    ${DELAY}
    Close Browser