*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Scenario 1
    Open Browser    http://localhost:460/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    xpath://*[@id="header.student-view-nav"]
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 2
    Open Browser    http://localhost:460/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    xpath://*[@id="header.teacher-view-nav"]
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 3
    Open Browser    http://localhost:460/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Scenario 4
    Open Browser    http://localhost:460/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser