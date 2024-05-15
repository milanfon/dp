*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Check Specific Names on the Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Selenium Speed    2 seconds
    Set Window Size    1501    1104

    # Navigate to login page
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s

    # Enter username
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Sleep    2s

    # Enter password
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s

    # Submit login form
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

    # Click on My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s

    # Click on Students button
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep    2s

    # Check for names
    Page Should Contain    Benjamin Green
    Page Should Contain    Mia Orange
    Page Should Contain    Charlotte Purple
    Page Should Contain    Isabella Yellow

    # Click Close Modal Button
    Click Element    xpath=//*[@id="closeModalButtonCross"]
    Sleep    2s

    # Click on another Students button
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep    2s

    # Check for "No students" text
    Page Should Contain    No students

    Close Browser