*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check Elements
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Page Should Not Contain Element  id=header.link.login
    Element Text Should Be  id=header.title.userHome  Noah Brown
    Page Should Contain Element  id=header.link.logout
    Page Should Contain Element  css=#header.student-view-nav
