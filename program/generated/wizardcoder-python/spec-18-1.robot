*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${DELAY}    ${0}    # You can change it if needed
${BROWSER_WIDTH}    ${1024}
${BROWSER_HEIGHT}    ${768}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}    browser_width=${BROWSER_WIDTH}    browser_height=${BROWSER_HEIGHT}
    Maximize Browser Window
    Set Window Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}
    Set Selenium Speed    ${DELAY}

*** Test Cases ***
Test Teacher's View
    Open Browser To Login Page
    Input Text    id=loginPage.userNameInput    lazy
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.listOfAllTeachers
    Wait Until Page Contains    Julia Easyrider
    Wait Until Page Contains    Olivia Keen
    Wait Until Page Contains    John Lazy
    Wait Until Page Contains    Alice Pedant
    Wait Until Page Contains    Thomas Scatterbrained
    Wait Until Page Contains    Peter Strict
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Should Contain    ${text}    Numerical Methods
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Should Contain    ${text}    Database Systems
    Should Contain    ${text}    Fundamentals of Computer Networks
    Should Contain    ${text}    Introduction to Algorithms
    Should Contain    ${text}    Mobile Applications
    Should Contain    ${text}    Web Programming
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Should Be Empty    ${text}
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Contain    ${text}    Computer System Engineering
    Should Contain    ${text}    Database Systems
    Should Contain    ${text}    Operating Systems
    Should Contain    ${text}    Programming Techniques
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Should Contain    ${text}    Computation Structures
    ${text}    Get Text    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Contain    ${text}    Operating Systems
    Should Contain    ${text}    Programming in Java
    Should Contain    ${text}    Software Engineering
    Should Contain    ${text}    Software Quality Assurance
    [Teardown]    Close Browser 
 
 