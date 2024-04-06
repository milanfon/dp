*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***

Scenario 1
    [Setup]  Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    
    Wait Until Page Contains Element  xpath://*[@id="header.link.login"]
    Page Should Not Contain Element  xpath://*[@id="header.link.login"]
    
    Wait Until Page Contains Element  xpath://*[@id="header.title.userHome"]
    Element Should Contain  xpath://*[@id="header.title.userHome"]  Noah Brown
    
    Wait Until Page Contains Element  xpath://*[@id="header.link.logout"]
    Page Should Contain Element  xpath://*[@id="header.link.logout"]
    
    Wait Until Page Contains Element  xpath://*[@id="header.student-view-nav"]
    Page Should Contain Element  xpath://*[@id="header.student-view-nav"]
    
    Wait Until Page Contains Element  xpath://*[@id="stu.view.title"]
    Element Should Contain  xpath://*[@id="stu.view.title"]  Student's View
    
    Wait Until Page Contains Element  xpath://*[@id="overview.personalInfoForm"]
    Page Should Contain Element  xpath://*[@id="overview.personalInfoForm"]
    
    [Teardown]  Close Browser