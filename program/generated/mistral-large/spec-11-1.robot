*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}    2s
${URL}    http://localhost:4680/tbuis/index.jsp
${NAMES}    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow

*** Test Cases ***
Check Names On Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

    # Navigate to the page
    Maximize Browser Window
    Sleep    ${DELAY}

    # Login
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

    # Click My Subjects
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

    # Click Students (4) button
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    ${DELAY}

    # Check if names are present on the page
    FOR    ${NAME}    IN    @{NAMES}
        Page Should Contain    ${NAME}
    END

    # Click the closeModalButtonCross button
    Click Element    id=closeModalButtonCross
    Sleep    ${DELAY}

    # Click on button with id "tea.mySubjects.table.listOfStudentsButton-2"
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Sleep    ${DELAY}

    # Check if page contains the text "No students"
    Page Should Contain    No students

    Close Browser