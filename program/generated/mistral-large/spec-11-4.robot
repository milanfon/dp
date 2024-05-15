*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}    2s
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Check Names Presence
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

    # Navigate to the page
    Maximize Browser Window
    Set Window Size    1501    1104
    Wait Until Page Contains    University information system    ${DELAY}

    # Login
    Click Element    xpath:///*[@id="header.link.login"]
    Wait Until Page Contains    Login Page    ${DELAY}
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View    ${DELAY}

    # Navigate to My Subjects
    Click Element    xpath:///*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains    Teacher's View    ${DELAY}

    # Click on Students (4) button
    Click Element    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Page Contains    Students    ${DELAY}

    # Check if names are present on the page
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    # Click on the close modal button
    Click Element    id=closeModalButtonCross
    Wait Until Page Contains    Teacher's View    ${DELAY}

    # Click on another Students button
    Click Element    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Wait Until Page Contains    No students    ${DELAY}

    # Close the browser
    Close All Browsers
