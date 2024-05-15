*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}        1s
${URL}          http://localhost:4680
${USERNAME}     strict
${PASSWORD}     pass
${LOGIN}        Login
${USERNAME_FIELD}        #loginPage\userNameInput
${PASSWORD_FIELD}        #loginPage\passwordInput
${LOGIN_BUTTON}        #loginPage\loginFormSubmit

*** Keywords ***
Open browser to page
    Open browser    ${URL}    browser=${BROWSER}
    Maximize browser window
    Set selenium speed    ${DELAY}

*** Test Cases ***
Teacher spec 10
    Open browser to page
    Input text    ${USERNAME_FIELD}    ${USERNAME}
    Input text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click button    ${LOGIN_BUTTON}
    Wait until page contains    ${LOGIN}
    Click link    My Subjects
    Click button    ${USERNAME_FIELD}    ${PASSWORD_FIELD}
    Wait until page contains    My Subjects
    Click button    My Subjects
    Wait until page contains    My Exam Dates
    Click link    My Exam Dates
    Wait until page contains    My Exam Dates
    Click link    New Exam Dates
    Wait until page contains    New Exam Dates
    Click link    Set Evaluation
    Wait until page contains    Set Evaluation
    Click link    Evaluation Table
    Wait until page contains    Evaluation Table
    Click link    Other's Subjects
    Wait until page contains    Other's Subjects
    Click link    List of All Teachers
    Wait until page contains    List of All Teachers
    Close Browser

Student spec 10
    Open browser to page
    Input text    ${USERNAME_FIELD}    orange
    Input text    ${PASSWORD_FIELD}    pass
    Click button    ${LOGIN_BUTTON}
    Wait until page contains    ${LOGIN}
    Click link    Other Subjects
    Wait until page contains    Other Subjects
    Close Browser

*** Test Cases ***
Teacher spec 10
    [Tags]    teacher
    Open browser to page
    Click link    My Subjects
    Wait until page contains    My Subjects
    ${all_remove_buttons}=    Get webelements    //button[@value='Remove']
    ${count}=    Get length    ${all_remove_buttons}
    ${count_enabled}=    Get Matching Xpath Count    //button[@value='Remove'][@disabled='']
    Should Be Equal    ${count}    ${count_enabled}
    Click button    //button[@value='Remove']
    Wait until page contains    tea.mySubjects.successAlert
    Click link    My Exam Dates
    Wait until page contains    My Exam Dates
    Page should not contain    Operating Systems
    Click link    New Exam Dates
    Wait until page contains    New Exam Dates
    Page should not contain    Operating Systems
    Click link    Set Evaluation
    Wait until page contains    Set Evaluation
    Page should not contain    Operating Systems
    Click link    Evaluation Table
    Wait until page contains    Evaluation Table
    Page should not contain    Operating Systems
    Click link    Other's Subjects
    Wait until page contains    Other's Subjects
    Page should contain    Operating Systems
    Click link    List of All Teachers
    Wait until page contains    List of All Teachers
    Page should contain    Operating Systems
    Close Browser

Student spec 10
    [Tags]    student
    Open browser to page
    Click link    Other Subjects
    Wait until page contains    Other Subjects
    Page should contain    Operating Systems
    Close Browser