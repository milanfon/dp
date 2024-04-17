*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2s
${URL}       http://localhost:4680/tbuis/index.jsp
${NAMES}    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow

*** Test Cases ***
Verify Names Presence
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

    # Check if names are present on the page
    FOR    ${NAME}    IN    @{NAMES}
        Page Should Contain    ${NAME}
    END

    # Click at the button with id "closeModalButtonCross"
    Click Element    id=closeModalButtonCross

    # Click on button with id "tea.mySubjects.table.listOfStudentsButton-2"
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2

    # Check if page contains the text "No students"
    Page Should Contain    No students

    Close Browser
