*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2s
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Names Presence
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

    # Navigate to the page
    Maximize Browser Window
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}

    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}

    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}

    # Check if names are present on the page
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    # Click at the button with id "closeModalButtonCross"
    Click Element    id=closeModalButtonCross
    Sleep    ${DELAY}

    # Click on button with id "tea.mySubjects.table.listOfStudentsButton-2"
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    ${DELAY}

    # Check if page contains the text "No students"
    Page Should Contain    No students

    Close Browser