*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    .5s

*** Test Cases ***
Check teachers
    Open browser    ${URL}    ${BROWSER}
    Input text    id:loginPage.userNameInput    lazy
    Input text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Sleep    ${DELAY}
    Click Element    id:tea.menu.listOfAllTeachers
    Sleep    ${DELAY}
    ${teachers}    Get Webelements    xpath://*[contains(@class, 'teacherRow')]
    ${teachers_list}    Get Texts    ${teachers}
    Should Contain    ${teachers_list}    Julia Easyrider
    Should Contain    ${teachers_list}    Olivia Keen
    Should Contain    ${teachers_list}    John Lazy
    Should Contain    ${teachers_list}    Alice Pedant
    Should Contain    ${teachers_list}    Thomas Scatterbrained
    Should Contain    ${teachers_list}    Peter Strict
    ${teachers_subjects}    Get Webelements    xpath://*[contains(@class, 'teacherRow')]//*[contains(@class, 'subjects')]
    ${subjects_list}    Get Texts    ${teachers_subjects}
    ${subjects_list}    Catenate    ${subjects_list}
    Should Contain    ${subjects_list}    Numerical Methods
    Should Contain    ${subjects_list}    Database Systems
    Should Contain    ${subjects_list}    Fundamentals of Computer Networks
    Should Contain    ${subjects_list}    Introduction to Algorithms
    Should Contain    ${subjects_list}    Mobile Applications
    Should Contain    ${subjects_list}    Web Programming
    Should Contain    ${subjects_list}    Computation Structures
    Should Contain    ${subjects_list}    Operating Systems
    Should Contain    ${subjects_list}    Programming Techniques
    Should Contain    ${subjects_list}    Programming in Java
    Should Contain    ${subjects_list}    Software Engineering
    Should Contain    ${subjects_list}    Software Quality Assurance
    Should Not Contain    ${subjects_list}    Computer System Engineering
    Close Browser

    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3] has text matching "Numerical Methods"
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3] has text matching "Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming"
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3] should not contain text
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3] has text matching "Computer System Engineering, Database Systems, Operating Systems, Programming Techniques"
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3] has text matching "Computation Structures"
    # Check if element with path //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3] has text matching "Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance"
    # Close browser after test

*** Keywords ***
Get Texts
    [Arguments]    @{elements}
    ${texts}    Create List
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Append To List    ${texts}    ${text}
    END
    [Return]    ${texts}

Get Webelements
    [Arguments]    ${locator}
    ${elements}    Get Webelements    ${locator}
    [Return]    ${elements}   


Get Text
    [Arguments]    ${locator}
    ${text}    Get Text    ${locator}
    [Return]    ${text}   

Close Browser
    Close Browser 

# Change values if needed
# ${URL}    http://localhost:4680
# ${BROWSER}    Chrome
# ${DELAY}    .5s 