*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

*** Test Cases ***
Student View
    Open Browser    http://localhost:4680/tbuis/index.jsp    browser=Chrome
    Sleep    2s
    Page Should Not Contain Element    //*[@id="header.link.login"]
    Element Should Contain    //*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    //*[@id="header.link.logout"]
    Page Should Contain Element    //*[@id="header.student-view-nav"]
    Page Should Contain Element    //*[@id="stu.view.title"]
    Element Should Contain    //*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    //*[@id="overview.personalInfoForm"]
    Close Browser

    Teacher View
    Open Browser    http://localhost:4680/tbuis/index.jsp    browser=Chrome
    Sleep    2s
    Page Should Not Contain Element    //*[@id="header.link.login"]
    Element Should Contain    //*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    //*[@id="header.link.logout"]
    Page Should Contain Element    //*[@id="header.teacher-view-nav"]
    Page Should Contain Element    //*[@id="tea.view.title"]
    Element Should Contain    //*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    //*[@id="overview.personalInfoForm"]
    Close Browser