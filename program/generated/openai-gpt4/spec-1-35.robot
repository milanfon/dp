*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Student View And Verify Conditions
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Sleep    1s    # Ensure the page has loaded
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s    # Wait for login page
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Sleep    1s    # Allow input to register
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s    # Allow input to register
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s    # Wait for navigation to student view

    # Assertions for student view
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Should Contain    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Wait Until Element Is Visible    css=#header.student-view-nav    5s
    
    Close Browser

Open Teacher View And Verify Conditions
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Window Size    1501    1104
    Sleep    1s    # Ensure the page has loaded
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s    # Wait for login page
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    1s    # Allow input to register
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s    # Allow input to register
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s    # Wait for navigation to teacher view

    # Assertions for teacher view
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Should Contain    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Wait Until Element Is Visible    css=#header.teacher-view-nav    5s
