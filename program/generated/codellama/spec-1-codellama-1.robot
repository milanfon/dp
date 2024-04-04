*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

First scenario
    Open Browser    ${URL}    Chrome
    Sleep    2s
    ${exists}=    Run Keyword And Return Status    Get WebElement    xpath://[@id="header.link.login"]
    Run Keyword If    '${exists}'==False    Page Should Contain Element    xpath://[text()="Login"]    #check if Login button is present
    Click Element    xpath://*[text()="Login"]   #click on Login button
    Sleep    2s
    Input Text    id:loginPage.userNameInput    brown    #input username
    Input Password    id:loginPage.passwordInput    pass    #input password
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]   #submit form
    Sleep    2s
    Page Should Contain Element    id:header.title.userHome    #check if user name is displayed in header
    ${userName}=    Get Text    id:header.title.userHome
    Should Be Equal As Strings    ${userName}    Noah Brown   #check if username is correct
    Page Should Not Contain Element    id:header.link.login    #check if login button is gone
    Page Should Contain Element    xpath://*[@id="header.link.logout"]    #check if logout button is present
    ${exists}=    Run Keyword And Return Status    Get WebElement    css:#header.student-view-nav
    Run Keyword If    '${exists}'==True    Page Should Contain Element    css:#header.student-view-nav   #check if student view navbar is present
    Close Browser

Second scenario
    Open Browser    ${URL}    Chrome
    Sleep    2s
    ${exists}=    Run Keyword And Return Status    Get WebElement    xpath://[@id="header.link.login"]
    Run Keyword If    '${exists}'==False    Page Should Contain Element    xpath://[text()="Login" and @aria-label="Login"]    #check if Login button is present
    Click Element    xpath://*[text()="Login"]   #click on Login button
    Sleep    2s
    Input Text    id:loginPage.userNameInput    lazy    #input username
    Input Password    id:loginPage.passwordInput    pass    #input password
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]   #submit form
    Sleep    2s
    Page Should Contain Element    id:header.title.userHome    #check if user name is displayed in header
    ${userName}=    Get Text    id:header.title.userHome
    Should Be Equal As Strings    ${userName}    John Lazy   #check if username is correct
    Page Should Not Contain Element    id:header.link.login    #check if login button is gone
    Page Should Contain Element    xpath://*[@id="header.link.logout"]    #check if logout button is present
    ${exists}=    Run Keyword And Return Status    Get WebElement    css:#header.teacher-view-nav
    Run Keyword If    '${exists}'==True    Page Should Contain Element    css:#header.teacher-view-nav   #check if teacher view navbar is present
    Close Browser 
