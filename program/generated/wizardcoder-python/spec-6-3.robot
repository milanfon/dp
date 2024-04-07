*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680

*** Test Cases ***
Student's View
    Open Browser  ${URL}  browser=chrome
    Input Text  id=loginPage.userNameInput  maroon
    Input Text  id=loginPage.passwordInput  pass
    Click Element  id=loginPage.loginFormSubmit
    Click Element  id=stu.menu.otherSubjects
    Click Element  id=stu.otherSubjects.table.enrollButton-10
    ${result}  Get Element Attribute  id=stu.otherSubjects.successAlert  visible
    Should Be True  ${result}
    Click Element  id=stu.menu.mySubjects
    ${table}  Get Element Attribute  id=stu.mySubjects.table.table  outerHTML
    Should Contain  ${table}  Software Quality Assurance
    Should Contain  ${table}  Peter Strict
    Close Browser

Teacher's View
    Open Browser  ${URL}  browser=chrome
    Input Text  id=loginPage.userNameInput  strict
    Input Text  id=loginPage.passwordInput  pass
    Click Element  id=loginPage.loginFormSubmit
    Click Element  id=tea.menu.mySubjects
    Click Element  id=tea.mySubjects.table.listOfStudentsButton-3
    ${button}  Get Element Attribute  id=tea.mySubjects.table.listOfStudentsButton-3  textContent
    Should Contain  ${button}  Students (2) 
    ${table}  Get Element Attribute  id=tea.mySubjects.table.table  outerHTML
    Should Contain  ${table}  William Maroon
    Close Browser