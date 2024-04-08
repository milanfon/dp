*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Check students names
    Open browser  http://localhost:4680/tbuis/index.jsp  browser=Chrome
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  pedant
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="tea.menu.mySubjects"]
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Click Element  xpath=//*[@id="closeModalButtonCross"]
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    ${students}=  Get Webelements  xpath=//*[@id="tea.mySubjects.table.listOfStudents"]//*[@class="student-name"]
    ${names}=  Get Texts  ${students}
    ${list}=  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
    ${match}=  Evaluate  any(name in $list for name in $names if name in $list)
    Should Be True  ${match}
    Close Browser