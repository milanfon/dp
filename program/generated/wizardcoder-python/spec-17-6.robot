## Solution
### Teacher Scenario

*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***

Open Browser and Maximize
    Open Browser    ${url}    ${browser}    options=${options}
    Maximize Browser Window

Login
    Input Text    ${userName}    ${user}
    Input Text    ${password}    ${pass}
    Click Button    ${login}


Check Text
    [Arguments]    ${locator}    ${text}
    Wait Until Page Contains Element    ${locator}
    Element Text Should Be    ${locator}    ${text}


Check Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}


Check Alert
    Wait Until Page Contains Element    ${alert}
    Element Should Contain    ${alert}    ${text}


*** Test Cases ***

Teacher Test
    ${url}    Set Variable    http://localhost:4680/tbuis/index.jsp
    ${browser}    Set Variable    Chrome
    ${options}    Set Variable    headless=false
    ${user}    Set Variable    pedant
    ${userName}    Set Variable    //*[@id="loginPage.userNameInput"]
    ${password}    Set Variable    //*[@id="loginPage.passwordInput"]
    ${login}    Set Variable    //*[@id="loginPage.loginFormSubmit"]
    ${alert}    Set Variable    //*[@id="tea.otherSubjects.successAlert"]
    ${otherSubjects}    Set Variable    //*[@id="tea.otherSubjects.table.participateButton-3"]
    ${myExamDates}    Set Variable    //*[@id="tea.myExamDates.table.noRecords-2"]
    ${newExamDates}    Set Variable    //*[@id="tea.newExamDates.table.table"]
    ${listOfAllTeachers}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    ${teacherName}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    ${teacherSubject}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]
    ${linearAlgebra}    Set Variable    //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]

    Open Browser and Maximize    ${url}    ${browser}    ${options}
    Login    ${userName}    ${password}    ${user}    ${login}
    Check Text    ${myExamDates}    No exam dates.
    Check Text    ${listOfAllTeachers}    ${linearAlgebra}    Alice Pedant

    Click Element    ${otherSubjects}
    Check Element    ${alert}
    Check Text    ${otherSubjects}    Others' Subjects
    Check Element    ${linearAlgebra}    ${linearAlgebra}
    Check Text    ${linearAlgebra}    Linear Algebra

    ${url}    Set Variable    http://localhost:4680/tbuis/teacher-view/newExamDates
    Go To    ${url}
    Check Element    ${newExamDates}
    ${select}    Set Variable    //select/option[contains(text(), 'Linear Algebra')]
    Check Element    ${select}

    Close Browser


### Student Scenario

*** Test Cases ***

Student Test
    ${url}    Set Variable    http://localhost:4680/tbuis/index.jsp
    ${browser}    Set Variable    Chrome
    ${options}    Set Variable    headless=false
    ${user}    Set Variable    yellow
    ${userName}    Set Variable    //*[@id="loginPage.userNameInput"]
    ${password}    Set Variable    //*[@id="loginPage.passwordInput"]
    ${login}    Set Variable    //*[@id="loginPage.loginFormSubmit"]
    ${subject}    Set Variable    //*[@id="stu.otherSubjects.table.subjectRow-2"]
    ${subjectName}    Set Variable    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    ${teacherName}    Set Variable    //*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]
    ${subjectText}    Set Variable    Linear Algebra
    ${teacherText}    Set Variable    Alice Pedant

    Open Browser and Maximize    ${url}    ${browser}    ${options}
    Login    ${userName}    ${password}    ${user}    ${login}
    Check Text    ${subjectName}    ${subjectText}
    Check Text    ${teacherName}    ${teacherText}
    Close Browser 