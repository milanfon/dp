*** Settings ***
Documentation     Scenario for student interaction followed by teacher verification.
Library           SeleniumLibrary

Suite Setup       Open Browser To LoginPage
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Student Enrolls In Subject And Checks Success
    [Documentation]     Student navigates to a subject and enrolls, then checks for success message.
    Set Browser Viewport Size    1501    1104
    Go To Page    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Wait Until Page Contains    Student's View    ${DELAY}
    Go To Other Subjects And Enroll
    Check Enrollment Success

Go To My Subjects And Check Enrollment
    [Documentation]     Navigates to My Subjects page and checks for specific enrollment details.
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()=" Peter Strict "]

Teacher Checks Student Enrollment
    [Documentation]     Teacher logs in and checks the number of students enrolled in a subject.
    Set Browser Viewport Size    1501    1104
    Go To Page    http://localhost:4680/tbuis/index.jsp
    Login As Teacher
    Check Students Count And Names

*** Keywords ***
Open Browser To LoginPage
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window

Go To Page
    [Arguments]    ${url}
    Go To    ${url}
    Sleep    ${DELAY}

Click Element
    [Arguments]    ${locator}
    Click Element    ${locator}
    Sleep    ${DELAY}

Input Text
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}
    Sleep    ${DELAY}

Press Key
    [Arguments]    ${locator}    ${key}
    Press Key    ${locator}    ${key}
    Sleep    ${DELAY}

Go To Other Subjects And Enroll
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    ${DELAY}

Check Enrollment Success
    Page Should Contain Element    id=stu.otherSubjects.successAlert

Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Check Students Count And Names
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//td[text()="William Maroon"]