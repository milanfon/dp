*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN_PAGE_URL}        http://localhost:4680/tbuis/login
${USER_NAME}          pedant
${PASSWORD}           pass
${BROWSER}           Chrome
${DELAY}            0

*** Test Cases ***
Check names
    Open Browser    ${LOGIN_PAGE_URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    ${USER_NAME}
    Input Text    id=loginPage.passwordInput    ${PASSWORD}
    Click Button    id=loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Link    My Subjects
    Sleep    ${DELAY}
    Click Button    id=tea.menu.mySubjects
    Sleep    ${DELAY}
    Click Button    id=tea.mySubjects.table.listOfStudentsButton-0
    Sleep    ${DELAY}
    ${list} =    Get WebElements    xpath=//a[contains(@href, 'teacher-view/student/view/')]
    ${list_length} =    Get Length    ${list}
    ${names_list} =    Create List    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow
    ${names_length} =    Get Length    ${names_list}
    : FOR    ${i}    IN RANGE    ${list_length}
    \    ${name} =    Get Text    xpath=//a[contains(@href, 'teacher-view/student/view/'][${i+1}]
    \    ${name} =    Strip String    ${name}
    \    ${name_exists} =    Evaluate    '${name}' in ${names_list}
    \    Run Keyword If    '${name_exists}' == '${False}'    FAIL    ${name} not found in the list
    Click Button    id=closeModalButtonCross
    Sleep    ${DELAY}
    Click Button    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    ${DELAY}
    ${text} =    Get Text    id=listOfStudentsModal.table.noStudents
    Should Be Equal    ${text}    No students
    Close Browser



*** Keywords ***
Sleep
    [Arguments]    ${time}
    Sleep    ${time}

*** Keywords ***
FAIL
    [Arguments]    ${text}
    Fail    ${text}
    Close Browser   

*** Keywords ***
Get Length
    [Arguments]    ${list}
    ${length} =    Get Length    ${list}
    [Return]    ${length}


*** Keywords ***
Get Text
    [Arguments]    ${selector}
    ${text} =    Get Text    ${selector}
    [Return]    ${text}


*** Keywords ***
Evaluate
    [Arguments]    ${expression}
    ${result} =    Evaluate    ${expression}
    [Return]    ${result}


*** Keywords ***
Strip String
    [Arguments]    ${text}
    ${text} =    Strip String    ${text}
    [Return]    ${text}   