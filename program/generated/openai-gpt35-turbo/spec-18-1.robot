*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Check_Teacher_Information
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//*[contains(text(),'Julia Easyrider')]
    Page Should Contain Element    xpath=//*[contains(text(),'Olivia Keen')]
    Page Should Contain Element    xpath=//*[contains(text(),'John Lazy')]
    Page Should Contain Element    xpath=//*[contains(text(),'Alice Pedant')]
    Page Should Contain Element    xpath=//*[contains(text(),'Thomas Scatterbrained')]
    Page Should Contain Element    xpath=//*[contains(text(),'Peter Strict')]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser