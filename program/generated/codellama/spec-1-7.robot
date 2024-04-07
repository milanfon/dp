*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test 1
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    aria/Login
    Input Text    aria/Username    brown
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Element Should Not Be Visible    header.link.login
    Element Text Should Be    header.title.userHome    Noah Brown
    Element Should Be Visible    header.link.logout
    Element Should Be Visible    #header.student-view-nav

Test 2
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    aria/Login
    Input Text    aria/Username    lazy
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Element Should Not Be Visible    header.link.login
    Element Text Should Be    header.title.userHome    John Lazy
    Element Should Be Visible    header.link.logout
    Element Should Be Visible    #header.teacher-view-nav

Test 3
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    aria/Login
    Input Text    aria/Username    bla
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Element Should Be Visible    loginPage.errorAlert

Test 4
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    aria/Login
    Input Text    aria/Username    lazy
    Input Text    aria/Password    bla
    Click Element    aria/Login[role="button"]
    Element Should Be Visible    loginPage.errorAlert
