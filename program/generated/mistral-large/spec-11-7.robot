*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${DELAY}      2s

*** Test Cases ***
Check Names Presence
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

    # Set viewport
    Set Window Size    1501    1104

    # Navigate to page
    Go To    ${URL}

    # Click on Login button
    Click Element    xpath:///*[@id="header.link.login"]

    # Input username
    Click Element    xpath:///*[@id="loginPage.userNameInput"]
    Input Text    xpath:///*[@id="loginPage.userNameInput"]    pedant

    # Input password
    Click Element    xpath:///*[@id="loginPage.passwordInput"]
    Input Text    xpath:///*[@id="loginPage.passwordInput"]    pass

    # Click on Login button
    Click Element    xpath:///*[@id="loginPage.loginFormSubmit"]

    # Click on My Subjects button
    Click Element    xpath:///*[@id="tea.menu.mySubjects"]

    # Click on Students (4) button
    Click Element    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    # Check if names are present on the page
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    # Click on closeModalButtonCross button
    Click Element    id=closeModalButtonCross

    # Click on Students (4) button for the third subject
    Click Element    xpath:///*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

    # Check if page contains the text "No students"
    Page Should Contain    No students

    Close Browser