*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close Browser

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    lazy
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:tea.menu.listOfAllTeachers
    
    # Check names
    Page Should Contain    Julia Easyrider
    Page Should Contain    Olivia Keen
    Page Should Contain    John Lazy
    Page Should Contain    Alice Pedant
    Page Should Contain    Thomas Scatterbrained
    Page Should Contain    Peter Strict
    
    # Check courses
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]    Numerical Methods
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]    text
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]    Computation Structures
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    
    Close Browser    
    
    
    
    
    
    
    
    
    
*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    
    
Input Text
    [Arguments]    ${selector}    ${text}
    Input Text    ${selector}    ${text}
    
Click Link
    [Arguments]    ${selector}
    Click Link    ${selector}    
    
Click Button
    [Arguments]    ${selector}
    Click Button    ${selector}    
    
Page Should Contain
    [Arguments]    ${text}
    Page Should Contain    ${text}
    
Element Should Contain
    [Arguments]    ${selector}    ${text}
    Page Should Contain Element    ${selector}
    Element Should Contain    ${selector}    ${text}    
    
Element Should Not Contain
    [Arguments]    ${selector}
    Page Should Contain Element    ${selector}
    Element Should Not Contain    ${selector}    text    
    
Close Browser
    Close Browser    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
