*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_BUTTON_XPATH}    //*[@id="header.link.login"]
${USERNAME_INPUT_XPATH}    //*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT_XPATH}    //*[@id="loginPage.passwordInput"]
${SUBMIT_BUTTON_XPATH}    //*[@id="loginPage.loginFormSubmit"]
${STUDENT_VIEW_TITLE_XPATH}    //*[@id="stu.view.title"]

*** Test Cases ***
Open Page And Validate Title
    Open Browser    ${URL}    ${BROWSER}
    Sleep    2s
    Click Element    ${LOGIN_BUTTON_XPATH}
    Sleep    2s
    Click Element    ${USERNAME_INPUT_XPATH}
    Sleep    1s
    Input Text    ${USERNAME_INPUT_XPATH}    brown
    Sleep    1s
    Press Keys    ${PASSWORD_INPUT_XPATH}    TAB
    Sleep    1s
    Input Text    ${PASSWORD_INPUT_XPATH}    pass
    Sleep    1s
    Click Element    ${SUBMIT_BUTTON_XPATH}
    Sleep    5s
    ${title}=    Get Text    ${STUDENT_VIEW_TITLE_XPATH}
    Should Be Equal As Strings    ${title}    Student's View
    Close Browser
