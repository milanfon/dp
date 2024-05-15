*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104
    ...    1    0    false    false    false
    Navigate    ${url}
    ...    http://localhost:4680/tbuis/index.jsp
    ...    University information system
    Click    main
    ...    xpath=//*[@id="header.link.login"]
    ...    27    44.671875
    Click    main
    ...    xpath=//*[@id="loginPage.userNameInput"]
    ...    5    221.5
    Change    lazy
    ...    xpath=//*[@id="loginPage.userNameInput"]
    Click    main
    ...    xpath=//*[@id="loginPage.passwordInput"]
    ...    25    127.5
    Change    pass
    ...    xpath=//*[@id="loginPage.passwordInput"]
    Click    main
    ...    xpath=//*[@id="loginPage.loginFormSubmit"]
    ...    26    52.5
    ...    http://localhost:4680/tbuis/teacher-view/overview
    Click    main
    ...    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    ...    17    137.5
    ...    http://localhost:4680/tbuis/teacher-view/listOfAllTeachers
    ...    Teacher's View

    Close Browser

*** Keywords ***
Set Viewport
    [Arguments]    ${width}    ${height}    ${deviceScaleFactor}    ${isMobile}    ${hasTouch}    ${isLandscape}
    Set Window Size    ${width}    ${height}    Set Window Position    0    0    Maximize Window

Change
    [Arguments]    ${value}    ${xpath}
    Click Element    ${xpath}
    Input Text    ${xpath}    ${value}