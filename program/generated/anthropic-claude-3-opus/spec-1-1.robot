*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1s

*** Test Cases ***
Student Login and Checks
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Element Text Should Match    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser
    
Teacher Login and Checks
    Open Browser    http:/localhost:4680/tbuis/index.jsp    ${BROWSER}  
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}  
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Element Text Should Match    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser
    
Invalid Login Attempts
    Open Browser    http:/localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104  
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser
    
    Open Browser    http:/localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}  
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy 
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser
