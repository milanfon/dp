*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_BUTTON_XPATH}    //*[@id="header.link.login"]
${USERNAME_INPUT_XPATH}    //*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT_XPATH}    //*[@id="loginPage.passwordInput"]
${MY_SUBJECTS_LINK_XPATH}    //*[@id="stu.menu.mySubjects"]
${UNENROLL_BUTTON_XPATH}    //*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-0"]
${CONFIRM_UNENROLL_BUTTON_XPATH}    //*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]

*** Test Cases ***
Open University Information System And Unenroll Subject
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    ${LOGIN_BUTTON_XPATH}
    Sleep    2s
    Click Element    ${USERNAME_INPUT_XPATH}
    Sleep    1s
    Input Text    ${USERNAME_INPUT_XPATH}    maroon
    Press Key    ${USERNAME_INPUT_XPATH}    \\09
    Sleep    1s
    Input Text    ${PASSWORD_INPUT_XPATH}    pass
    Press Key    ${PASSWORD_INPUT_XPATH}    \\13
    Sleep    2s
    Click Element    ${MY_SUBJECTS_LINK_XPATH}
    Sleep    2s
    Click Element    ${UNENROLL_BUTTON_XPATH}
    Sleep    2s
    Click Element    ${CONFIRM_UNENROLL_BUTTON_XPATH}
    Sleep    2s
    Check If Element Has Background Color

*** Keywords ***
Check If Element Has Background Color
    ${color}    Execute Javascript    return window.getComputedStyle(document.querySelector('a[id="stu.menu.mySubjects"]')).backgroundColor;
    Should Be Equal As Strings    ${color}    rgb(0, 123, 255)
