*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${DELAY}      2s
${NAMES}    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow

*** Test Cases ***
Check Names Presence
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

    # Perform steps from JSON recording
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    # Additional steps
    Click Element    id=closeModalButtonCross
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2

    # Check names presence
    FOR    ${NAME}    IN    @{NAMES}
        Page Should Contain    ${NAME}
        Sleep    ${DELAY}
    END

    Close Browser
