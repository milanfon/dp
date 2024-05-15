*** Settings ***
Documentation     Verify conditions in "My Subjects" and related pages after performing actions specified in a JSON recording for Spec 10 teacher and Spec 10 student.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                  Chrome
${URL}                      http://localhost:4680/tbuis/index.jsp
${LOGIN_PAGE}               http://localhost:4680/tbuis/login
${TEACHER_USERNAME}         strict
${STUDENT_USERNAME}         orange
${PASSWORD}                 pass
${LOGIN_BUTTON_XPATH}       xpath=//*[@id="header.link.login"]
${USERNAME_INPUT_XPATH}     xpath=//*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT_XPATH}     xpath=//*[@id="loginPage.passwordInput"]
${LOGIN_SUBMIT_XPATH}       xpath=//*[@id="loginPage.loginFormSubmit"]
${MY_SUBJECTS_XPATH}        xpath=//*[@id="tea.menu.mySubjects"]
${REMOVE_BUTTON_XPATH}      xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
${SUCCESS_ALERT_ID}         id=tea.mySubjects.successAlert
${MY_EXAM_DATES_XPATH}      xpath=//*[@id="tea.menu.myExamDates"]
${NEW_EXAM_DATES_XPATH}     xpath=//*[@id="tea.menu.newExamDates"]
${SET_EVALUATION_XPATH}     xpath=//*[@id="tea.menu.setEvaluation"]
${EVALUATION_TABLE_XPATH}   xpath=//*[@id="tea.menu.evaluationTable"]
${OTHERS_SUBJECTS_XPATH}    xpath=//*[@id="tea.menu.otherSubjects"]
${ALL_TEACHERS_XPATH}       xpath=//*[@id="tea.menu.listOfAllTeachers"]
${DELAY}                    2s

*** Test Cases ***
Verify My Subjects Before And After Removal
    [Documentation]    Verifies removal functionality and related conditions on "My Subjects" page.
    Open And Login    ${TEACHER_USERNAME}
    Go To My Subjects And Verify Removal

Verify Other Pages For "Operating Systems" Availability
    [Documentation]    Verifies the absence or presence of "Operating Systems" subject across various pages.
    Verify Operating Systems Across Pages

*** Keywords ***
Open And Login
    [Arguments]    ${username}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Window
    Click Element    ${LOGIN_BUTTON_XPATH}
    Wait Until Page Contains Element    ${USERNAME_INPUT_XPATH}    timeout=10s
    Input Text    ${USERNAME_INPUT_XPATH}    ${username}
    Input Text    ${PASSWORD_INPUT_XPATH}    ${PASSWORD}
    Click Element    ${LOGIN_SUBMIT_XPATH}
    Sleep    ${DELAY}

Go To My Subjects And Verify Removal
    Click Element    ${MY_SUBJECTS_XPATH}
    Wait Until Page Contains    My Subjects    timeout=10s
    ${remove_buttons}=    Get WebElements    xpath=//button[contains(@id,'unregisterSubjectButton') and not(@disabled)]
    List Should Contain Value    ${remove_buttons}    ${REMOVE_BUTTON_XPATH}
    Click Element    ${REMOVE_BUTTON_XPATH}
    Wait Until Element Is Visible    ${SUCCESS_ALERT_ID}    timeout=10s

Verify Operating Systems Across Pages
    ${pages}=    Create List    ${MY_EXAM_DATES_XPATH}    ${NEW_EXAM_DATES_XPATH}    ${SET_EVALUATION_XPATH}    ${EVALUATION_TABLE_XPATH}
    :FOR    ${page}    IN    @{pages}
    \    Click Element    ${page}
    \    Sleep    ${DELAY}
    \    ${is_present}=    Run Keyword And Return Status    Page Should Not Contain    Operating Systems
    \    Should Be True    ${is_present}
    Click Element    ${OTHERS_SUBJECTS_XPATH}
    Sleep    ${DELAY}
    Page Should Contain    Operating Systems
    Click Element    ${ALL_TEACHERS_XPATH}
    Sleep    ${DELAY}
    ${is_not_present_in_teacher_row}=    Run Keyword And Return Status    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems
    Should Be True    ${is_not_present_in_teacher_row}

Close Browser
    [Teardown]    Close All Browsers