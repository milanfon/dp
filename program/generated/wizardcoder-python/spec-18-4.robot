*** Settings ***
Library    SeleniumLibrary    WITH NAME    Selenium


*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${DELAY}    0.5
${BROWSER_WIDTH}    1501
${BROWSER_HEIGHT}    104


*** Keywords ***
Open Browser To Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Window Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}
    Set Selenium Speed    ${DELAY}


*** Test Cases ***
Teacher's View
    Open Browser To Page
    Input Text    id=loginPage.userNameInput    lazy
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.listOfAllTeachers
    Sleep    ${DELAY}

    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-0    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-1    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-2    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-3    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-4    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-5    # Get names of teachers

    ${names_list}    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    ${names_list}    Create List    Numerical Methods    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques    Computation Structures    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance


    FOR    ${i}    IN RANGE    ${4}
        ${name}    Get From List    ${names}    ${i}
        ${expected}    Get From List    ${names_list}    ${i}
        ${xpath}    Evaluate    "//*[@id=\"tea.listOfAllTeachers.table.teacherRow-${i}\"]/td[3]"
        ${actual}    Get Text    ${xpath}
        Should Be Equal    ${actual}    ${expected}
    END

    Close All Browsers

*** Tasks ***
Run Tests
    Test Teacher's View


Run Tests
    Test Teacher's View
    Close All Browsers

*** Tasks ***
Run Tests
    Test Teacher's View

*** Test Cases ***
Teacher's View
    [Tags]    teacher's view
    [Setup]    Open Browser To Page
    [Teardown]    Close All Browsers
    Input Text    id=loginPage.userNameInput    lazy
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.listOfAllTeachers
    Sleep    ${DELAY}

    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-0    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-1    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-2    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-3    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-4    # Get names of teachers
    ${names}    Get Text    id=tea.listOfAllTeachers.table.teacherRow-5    # Get names of teachers

    ${names_list}    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    ${names_list}    Create List    Numerical Methods    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques    Computation Structures    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance


    FOR    ${i}    IN RANGE    ${4}
        ${name}    Get From List    ${names}    ${i}
        ${expected}    Get From List    ${names_list}    ${i}
        ${xpath}    Evaluate    "//*[@id=\"tea.listOfAllTeachers.table.teacherRow-${i}\"]/td[3]"
        ${actual}    Get Text    ${xpath}
        Should Be Equal    ${actual}    ${expected}

    END

    Close All Browsers 