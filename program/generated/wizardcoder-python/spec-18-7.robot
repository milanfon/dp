*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}    ${0}

*** Test Cases ***

Scenario
    Open Browser    ${URL}    ${BROWSER}
    Input Text    //*[@id="loginPage.userNameInput"]    lazy
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="loginPage.loginFormSubmit"]
    Click Element    //*[@id="tea.menu.listOfAllTeachers"]
    ${names}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[2]
    ${classes}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    ${name1}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[2]
    ${classes1}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    ${name2}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[2]
    ${classes2}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    ${name3}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
    ${classes3}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    ${name4}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[2]
    ${classes4}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    ${name5}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[2]
    ${classes5}=    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Be Equal    ${names}    Julia Easyrider
    Should Be Equal    ${classes}    Numerical Methods
    Should Be Equal    ${name1}    Olivia Keen
    Should Be Equal    ${classes1}    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Should Be Equal    ${name2}    John Lazy
    Should Be Equal    ${classes2}    ${EMPTY}    # Element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3] should not contain text
    Should Be Equal    ${name3}    Alice Pedant
    Should Be Equal    ${classes3}    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Should Be Equal    ${name4}    Thomas Scatterbrained
    Should Be Equal    ${classes4}    Computation Structures
    Should Be Equal    ${name5}    Peter Strict
    Should Be Equal    ${classes5}    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    
    Close All Browsers