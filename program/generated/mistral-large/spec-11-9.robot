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
    Click Element    xpath://*[@id="header.link.login"]

    # Login
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

    # Navigate to My Subjects
    Click Element    xpath://*[@id="tea.menu.mySubjects"]

    # Click on Students button for the first subject
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

    # Check if names are present on the page
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    # Click on close modal button
    Click Element    id=closeModalButtonCross

    # Click on Students button for the third subject
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2

    # Check if page contains the text "No students"
    Page Should Contain    No students

    Close Browser
