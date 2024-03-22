*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_BUTTON_XPATH}    //*[@id="header.link.login"]
${USERNAME_INPUT_XPATH}    //*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT_XPATH}    //*[@id="loginPage.passwordInput"]
${SUBMIT_BUTTON_XPATH}    //*[@id="loginPage.loginFormSubmit"]
${STUDENT_VIEW_TITLE_XPATH}    //*[@id="stu.view.title"]

*** Test Cases ***
Validate Student View Title
    Open Browser    ${URL}    chrome
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    ${LOGIN_BUTTON_XPATH}
    Sleep    2s
    Click Element    ${USERNAME_INPUT_XPATH}
    Input Text    ${USERNAME_INPUT_XPATH}    brown
    Sleep    1s
    Press Key    ${PASSWORD_INPUT_XPATH}    TAB
    Input Text    ${PASSWORD_INPUT_XPATH}    pass
    Sleep    1s
    Click Element    ${SUBMIT_BUTTON_XPATH}
    Sleep    5s
    ${title}=    Get Text    ${STUDENT_VIEW_TITLE_XPATH}
    Should Be Equal    ${title}    Student's View
    Close Browser
