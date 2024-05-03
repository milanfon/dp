*** Settings ***
Library  SeleniumLibrary
Suite Speed  2

*** Test Cases ***
Spec 11
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Set Window Size  1501  1104
    Click Element  xpath=//*[@id="header.link.login"]
    Click Element  xpath=//*[@id="loginPage.userNameInput"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  pedant
    Click Element  xpath=//*[@id="loginPage.passwordInput"]
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="tea.menu.mySubjects"]
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    ${names}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
    :FOR  ${name}  IN  ${names}
    \  Page Should Contain  ${name}
    Sleep  2
    Click Element  xpath=//*[@id="closeModalButtonCross"]
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Page Should Contain  No students
    Sleep  2
    Close Browser