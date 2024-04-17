*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Enrollment
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  1s

    Input Text  xpath=//*[@id="loginPage.userNameInput"]  maroon
    Input Password  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]

    Click Element  xpath=//*[@id="stu.menu.otherSubjects"]
    Click Element  xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]

    Wait Until Page Contains Element  xpath=//*[@id="stu.otherSubjects.successAlert"]  10s

    Click Element  xpath=//*[@id="stu.menu.mySubjects"]

    ${enrolledSubject}=  Get Text  xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]
    Should Be Equal As Strings  ${enrolledSubject}  Software Quality Assurance

    ${enrolledTeacher}=  Get Text  xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]
    Should Be Equal As Strings  ${enrolledTeacher}  Peter Strict

    Close Browser

Teacher Check
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  1s

    Input Text  xpath=//*[@id="loginPage.userNameInput"]  strict
    Input Password  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]

    Click Element  xpath=//*[@id="tea.menu.mySubjects"]

    ${buttonText}=  Get Text  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Should Be Equal As Strings  ${buttonText}  Students (2)

    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]

    Wait Until Page Contains Element  xpath=//td[text()="William Maroon"]  10s

    Close Browser
