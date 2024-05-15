*** Settings ***
Documentation     Verify specific page elements for both teacher and student views after performing recorded actions.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                Chrome
${INITIAL_URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}              http://localhost:4680/tbuis/login
${TEACHER_OVERVIEW_URL}   http://localhost:4680/tbuis/teacher-view/overview
${TEACHER_USERNAME}       strict
${STUDENT_USERNAME}       orange
${PASSWORD}               pass

*** Test Cases ***
Teacher View Checks
    Open Browser    ${INITIAL_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Wait Until Page Contains    Login Page    10s    url=${LOGIN_URL}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Wait Until Page Contains    Teacher Overview    10s    url=${TEACHER_OVERVIEW_URL}
    # My Subjects Checks
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Be Disabled    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-1"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    # Checks on Other Pages as required...
    Close Browser

Student View Checks
    Open Browser    ${INITIAL_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Wait Until Page Contains    Login Page    10s    url=${LOGIN_URL}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Wait Until Page Contains    Student Overview    10s    url=${TEACHER_OVERVIEW_URL}
    # Other Subjects Check
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${elements}=    Get Webelements    xpath=//tr[td[contains(., 'Operating Systems')]]/td
    FOR    ${element}    IN    @{elements}
        Element Text Should Not Contain    ${element}    Peter Strict
    END
    Close Browser