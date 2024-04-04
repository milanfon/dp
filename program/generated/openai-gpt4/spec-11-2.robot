*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_PAGE_URL}    http://localhost:4680/tbuis/login
${TEACHER_VIEW_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${TEACHER_VIEW_MY_SUBJECTS_URL}    http://localhost:4680/tbuis/teacher-view/mySubjects
${USERNAME}    pedant
${PASSWORD}    pass

*** Test Cases ***
Open University Information System And Perform Actions
    Open Browser And Navigate To Login Page
    Login As User
    Navigate To My Subjects
    Open List Of Students
    Verify Names On Page
    Click Close Modal Button
    Open Second List Of Students
    Verify No Students Text
    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Navigate To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Location Should Be    ${LOGIN_PAGE_URL}

Login As User
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Location Should Be    ${TEACHER_VIEW_OVERVIEW_URL}

Navigate To My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Location Should Be    ${TEACHER_VIEW_MY_SUBJECTS_URL}

Open List Of Students
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    1s

Verify Names On Page
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

Click Close Modal Button
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Sleep    1s

Open Second List Of Students
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    1s

Verify No Students Text
    Page Should Contain    No students
