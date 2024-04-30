*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Check_Names_On_Page
    Set Selenium Speed    2
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    pedant
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Wait Until Page Contains Element    aria/Login[role="button"]
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/My Subjects
    Click Element    aria/My Subjects
    Wait Until Page Contains Element    aria/Students (4)[role="button"]
    Click Element    aria/Students (4)[role="button"]
    Sleep    ${DELAY}
    Click Element    id=closeModalButtonCross
    Sleep    ${DELAY}
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    ${DELAY}
    Page Should Contain    No students
    Close Browser

*** Keywords ***
Sleep
    [Arguments]    ${time}
    Sleep    ${time}