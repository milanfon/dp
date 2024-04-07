*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${DELAY}    0
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Spec 1
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Page Should Not Contain Element    id=header.link.login
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Page Should Contain Element    css=#header.student-view-nav
