*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Check Elements After Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Click on the login link
    Click Element    css=#header.link.login

    # Enter username and password
    Input Text    css=#loginPage.userNameInput    brown
    Input Text    css=#loginPage.passwordInput    pass

    # Click on the login button
    Click Element    css=#loginPage.loginFormSubmit

    # Perform checks
    Wait Until Page Contains    University information system
    Element Should Not Be Present    css=#header.link.login
    Element Text Should Be    //h1[@id='header.title.userHome']    Noah Brown
    Element Should Be Present    css=#header.student-view-nav
    Element Should Be Present    css=#header.link.logout

    # Close the browser
    Close Browser
