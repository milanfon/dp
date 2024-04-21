*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis/
${BROWSER}        chrome
${DELAY}          500ms

*** Test Cases ***
Student View
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Sleep    ${DELAY}
    
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    ${DELAY}
    
    Element Should Be Visible    xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    
    Page Should Contain Element    xpath://td[text()="Programming in Java"]
    Sleep    ${DELAY}

    Close Browser

Teacher View
    Open Browser    ${BASE URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    ${DELAY}
    
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Sleep    ${DELAY}

    Close Browser
