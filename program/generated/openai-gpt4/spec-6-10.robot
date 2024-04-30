*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       http://localhost:4680/tbuis

*** Test Cases ***
Student Enrollment Process
    Open University Information System
    Login As Student
    Navigate To Other Subjects
    Enroll In Subject
    Verify Enrollment Success Alert
    Navigate To My Subjects
    Verify Enrollment In My Subjects
    Close Browser

Teacher Verification Of Enrollment
    Open University Information System As Teacher
    Login As Teacher
    Verify Students In My Subjects
    Close Browser

*** Keywords ***
Open University Information System
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    2s

Login As Student
    Click Login
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s

Enroll In Subject
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s

Verify Enrollment Success Alert
    Wait Until Element Is Visible    id=stu.otherSubjects.successAlert    10s

Navigate To My Subjects
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s

Verify Enrollment In My Subjects
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(),"Software Quality Assurance")]
    Page Should Contain Element    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[contains(text(),"Peter Strict")]

Open University Information System As Teacher
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    2s

Login As Teacher
    Click Login
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Students In My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(text(),"William Maroon")]

Click Login
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s

Close Browser
    Close All Browsers
