*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2s
${URL}    http://localhost:4680/tbuis/index.jsp
${NAMES}    Benjamin Green    Mia Orange    Charlotte Purple    Isabella Yellow

*** Test Cases ***
Check Names Presence
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    2

    # Navigate to the page
    Navigate To Page

    # Login
    Login

    # Check names presence
    Check Names Presence

    # Click on the close button and check for no students
    Click Element    id=closeModalButtonCross
    Click Element    id=tea.mySubjects.table.listOfStudentsButton-2
    Page Should Contain    No students

    Close All Browsers

*** Keywords ***
Navigate To Page
    Maximize Browser Window
    Wait Until Page Contains    University information system    ${DELAY}

Login
    Click Element    xpath//*[@id="header.link.login"]
    Wait Until Page Contains    Login Page    ${DELAY}

    Input Text    xpath//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View    ${DELAY}

Check Names Presence
    Click Element    xpath//*[@id="tea.menu.mySubjects"]
    Wait Until Page Contains    Teacher's View    ${DELAY}

    Click Element    xpath//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Page Contains    Students    ${DELAY}

    FOR    ${name}    IN    @{NAMES}
        Page Should Contain    ${name}
    END
