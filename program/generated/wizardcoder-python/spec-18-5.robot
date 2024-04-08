*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    0.5

*** Test Cases ***
Test Teacher List
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[1]
    Should Contain    ${teacher_list}    Julia Easyrider
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[1]
    Should Contain    ${teacher_list}    Olivia Keen
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[1]
    Should Contain    ${teacher_list}    John Lazy
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[1]
    Should Contain    ${teacher_list}    Alice Pedant
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[1]
    Should Contain    ${teacher_list}    Thomas Scatterbrained
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[1]
    Should Contain    ${teacher_list}    Peter Strict
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Should Contain    ${teacher_list}    Numerical Methods
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Should Contain    ${teacher_list}    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Should Not Contain    ${teacher_list}    Text
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Contain    ${teacher_list}    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Should Contain    ${teacher_list}    Computation Structures
    ${teacher_list}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Contain    ${teacher_list}    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser