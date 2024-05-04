*** Settings ***
Library    SeleniumLibrary    run_on_failure    Close Browser


*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${DELAY}    0.5

*** Test Cases ***
Check teachers
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Input Text    //*[@id="loginPage.userNameInput"]    lazy
    Input Text    //*[@id="loginPage.passwordInput"]    pass
    Click Element    //*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    //*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}

    ${teachers}    Get WebElements    //*[starts-with(@id, "tea.listOfAllTeachers.teacher-")]
    ${teacher_names}    Get Texts    ${teachers}
    ${names}    Create List    Julia Easyrider    Olivia Keen    John Lazy    Alice Pedant    Thomas Scatterbrained    Peter Strict
    ${teacher_names_list}    Get Length    ${teacher_names}
    ${names_list}    Get Length    ${names}

    : FOR    ${index}    IN RANGE    ${teacher_names_list}
    \    ${teacher_name}    Get From List    ${teacher_names}    ${index}
    \    ${name}    Get From List    ${names}    ${index}
    \    Run Keyword If    '${teacher_name}' == '${name}'    Continue For Loop
    \    ${teacher_name}    ${name}    Run Keyword And Continue On Failure    Should Contain    ${teacher_name}    ${name}

    ${teacher_1_courses}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Should Contain    ${teacher_1_courses}    Numerical Methods
    ${teacher_2_courses}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Should Contain    ${teacher_2_courses}    Database Systems    Fundamentals of Computer Networks    Introduction to Algorithms    Mobile Applications    Web Programming
    ${teacher_3_courses}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Should Not Contain    ${teacher_3_courses}    *
    ${teacher_4_courses}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Should Contain    ${teacher_4_courses}    Computer System Engineering    Database Systems    Operating Systems    Programming Techniques
    ${teacher_5_courses}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Should Contain    ${teacher_5_courses}    Computation Structures
    ${teacher_6_courses}    Get Text    //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Should Contain    ${teacher_6_courses}    Operating Systems    Programming in Java    Software Engineering    Software Quality Assurance

    Close Browser

Check teachers
    [Arguments]    ${teacher_name}
    ${teacher_name_element}    Get WebElement    //*[contains(text(), "${teacher_name}")]
    ${teacher_name_text}    Get Text    ${teacher_name_element}
    Should Be Equal    ${teacher_name_text}    ${teacher_name}    ${teacher_name} is not present on the page

    [Return]    ${teacher_name}    ${name}


*** Keywords ***
Get Length
    [Arguments]    ${list}
    ${length}    Get Length    ${list}
    [Return]    ${length}

Get Texts
    [Arguments]    ${elements}
    ${length}    Get Length    ${elements}
    ${teacher_names}    Create List
    : FOR    ${index}    IN RANGE    ${length}
    \    ${teacher_name}    Get Text    ${elements}[${index}
    \    Append To List    ${teacher_names}    ${teacher_name}
    [Return]    ${teacher_names}

Run Keyword And Continue On Failure
    [Arguments]    @{args}
    ${status}    ${error}    Run Keyword And Ignore Error    @{args}
    Run Keyword If    ${status} == ${FAIL}    Fail    ${error}
    [Return]    ${status}    ${error}

Close Browser
    Close Browser


*** Keywords ***
Get WebElements
    [Arguments]    ${xpath}
    ${elements}    Get WebElements    ${xpath}
    [Return]    ${elements} 