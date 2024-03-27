*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}                      Chrome
${URL}                          http://localhost:4680/tbuis/index.jsp
${LOGIN_BUTTON_XPATH}           //*[@id="header.link.login"]
${USERNAME_INPUT_XPATH}         //*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT_XPATH}         //*[@id="loginPage.passwordInput"]
${MY_SUBJECTS_LINK_XPATH}       //*[@id="stu.menu.mySubjects"]
${FIRST_UNENROLL_BUTTON_XPATH}  //*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-0"]
${CONFIRM_UNENROLL_BUTTON_XPATH}  //*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]

*** Test Cases ***
Validate My Subjects Background Color
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized")
    Set Selenium Speed    1s
    Click Element    ${LOGIN_BUTTON_XPATH}
    Click Element    ${USERNAME_INPUT_XPATH}
    Input Text    ${USERNAME_INPUT_XPATH}    maroon
    Press Keys    None    TAB
    Input Text    ${PASSWORD_INPUT_XPATH}    pass
    Press Keys    ${PASSWORD_INPUT_XPATH}    ENTER
    Wait Until Element Is Visible    ${MY_SUBJECTS_LINK_XPATH}    10s
    Click Element    ${MY_SUBJECTS_LINK_XPATH}
    Click Element    ${FIRST_UNENROLL_BUTTON_XPATH}
    Click Element    ${CONFIRM_UNENROLL_BUTTON_XPATH}
    Wait Until Page Contains Element    ${MY_SUBJECTS_LINK_XPATH}    10s
    ${backgroundColor}    Get Element CSS Value    ${MY_SUBJECTS_LINK_XPATH}    background-color
    Convert RGB To Hex    ${backgroundColor}
    Element Should Have CSS Value    ${MY_SUBJECTS_LINK_XPATH}    background-color    #007bff

*** Keywords ***
Convert RGB To Hex
    [Arguments]    ${rgb}
    ${r}    ${g}    ${b}=    Split String    ${rgb}    ,    max_split=2
    ${r}=    Evaluate    int(${r}[4:])
    ${g}=    Evaluate    int(${g})
    ${b}=    Evaluate    int(${b}[:-1])
    ${hex}=    Evaluate    '#%02x%02x%02x' % (${r}, ${g}, ${b})
    [Return]    ${hex}
