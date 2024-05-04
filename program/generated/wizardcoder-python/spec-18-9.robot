Here's a sample Robot Framework scenario:


*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}   0s

*** Test Cases ***
Verify Teachers
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Input Text    id=loginPage.userNameInput    lazy
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.loginFormSubmit
    Click Element    id=tea.menu.listOfAllTeachers

    Verify Teacher    Julia Easyrider    Numerical Methods
    Verify Teacher    Olivia Keen    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming
    Verify Teacher    John Lazy    ${EMPTY}
    Verify Teacher    Alice Pedant    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques
    Verify Teacher    Thomas Scatterbrained    Computation Structures
    Verify Teacher    Peter Strict    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance
    Close Browser

*** Keywords ***
Verify Teacher
    [Arguments]    ${teacher}    ${courses}
    ${teacher_xpath}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-${teacher_index}"]/td[1]
    ${courses_xpath}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-${teacher_index}"]/td[3]
    ${teacher_index}    Set Variable    ${teacher.index("${teacher}")}
    ${teacher_index}    Evaluate    ${teacher_index} + 1
    ${teacher_name}    Get Text    ${teacher_xpath}
    Should Be Equal    ${teacher_name}    ${teacher}
    ${teacher_courses}    Get Text    ${courses_xpath}
    Should Be Equal    ${teacher_courses}    ${courses}

*** Keywords ***
Close Browser
    Close Browser

*** Keywords ***
Close Browser
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

*** Keywords ***
Set Selenium Speed
    [Arguments]    ${delay}
    Set Selenium Speed    ${delay}


*** Keywords ***
Input Text
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}


*** Keywords ***
Click Element
    [Arguments]    ${locator}
    Click Element    ${locator}


*** Keywords ***
Get Text
    [Arguments]    ${locator}
    ${text}    Get Text    ${locator}
    [Return]    ${text}


*** Keywords ***
Should Be Equal
    [Arguments]    ${actual}    ${expected}
    Should Be Equal    ${actual}    ${expected}


*** Keywords ***
Evaluate
    [Arguments]    ${expression}
    ${result}    Evaluate    ${expression}
    [Return]    ${result}


*** Keywords ***
Set Variable
    [Arguments]    ${expression}
    ${result}    Evaluate    ${expression}
    [Return]    ${result}


*** Keywords ***
Verify Teacher
    [Arguments]    ${teacher}    ${courses}
    ${teacher_xpath}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-${teacher_index}"]/td[1]
    ${courses_xpath}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-${teacher_index}"]/td[3]
    ${teacher_index}    Set Variable    ${teacher.index("${teacher}")}
    ${teacher_index}    Evaluate    ${teacher_index} + 1
    ${teacher_name}    Get Text    ${teacher_xpath}
    Should Be Equal    ${teacher_name}    ${teacher}
    ${teacher_courses}    Get Text    ${courses_xpath}
    Should Be Equal    ${teacher_courses}    ${courses}


*** Keywords ***
Close Browser
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window


*** Keywords ***
Set Selenium Speed
    [Arguments]    ${delay}
    Set Selenium Speed    ${delay}


*** Keywords ***
Input Text
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}


*** Keywords ***
Click Element
    [Arguments]    ${locator}
    Click Element    ${locator}


*** Keywords ***
Get Text
    [Arguments]    ${locator}
    ${text}    Get Text    ${locator}
    [Return]    ${text}

*** Keywords ***
Should Be Equal
    [Arguments]    ${actual}    ${expected}
    Should Be Equal    ${actual}    ${expected}


*** Keywords ***
Evaluate
    [Arguments]    ${expression}
    ${result}    Evaluate    ${expression}
    [Return]    ${result}


*** Keywords ***
Set Variable
    [Arguments]    ${expression}
    ${result}    Evaluate    ${expression}
    [Return]    ${result} 