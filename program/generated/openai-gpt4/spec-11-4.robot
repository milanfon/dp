*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}    Chrome
${DELAY}     2s
${BEN_NAME}    Benjamin Green
${MIA_NAME}    Mia Orange
${CHAR_NAME}    Charlotte Purple
${ISA_NAME}    Isabella Yellow
${URL}    http://localhost:4680/tbuis/index.jsp
${BUTTON_XPATH}    //*[@id="header.link.login"]
${USER_XPATH}    //*[@id="loginPage.userNameInput"]
${PASS_XPATH}    //*[@id="loginPage.passwordInput"]
${LOGIN_BUTTON_XPATH}    //*[@id="loginPage.loginFormSubmit"]
${MY_SUBJECTS_XPATH}    //*[@id="tea.menu.mySubjects"]
${STUDENTS_BUTTON_XPATH}    //*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
${CLOSE_BUTTON_XPATH}    //*[@id="closeModalButtonCross"]


*** Test Cases ***
Test Page
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains    University information system
    Input Text    ${USER_XPATH}    pedant
    Input Text    ${PASS_XPATH}    pass
    Click Element    ${BUTTON_XPATH}
    Wait Until Page Contains    ${BEN_NAME}
    Wait Until Page Contains    ${MIA_NAME}
    Wait Until Page Contains    ${CHAR_NAME}
    Click Element    ${MY_SUBJECTS_XPATH}
    Click Element    ${STUDENTS_BUTTON_XPATH}
    Wait Until Page Contains    ${BUTTON_XPATH}
    Click Element    ${CLOSE_BUTTON_XPATH}
    Click Element    ${STUDENTS_BUTTON_XPATH}
    Wait Until Page Contains    No students
    [Teardown]    Close Browser