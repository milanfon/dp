*** Settings ***
Library  SeleniumLibrary  speed=2
Suite Setup  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser

*** Test Cases ***
Scenario 1
    Set Window Size  1501  1104
    Click Element  xpath=//*[@id="header.link.login"]
    Click Element  xpath=//*[@id="loginPage.userNameInput"]
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  pedant
    Click Element  xpath=//*[@id="loginPage.passwordInput"]
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath=//*[@id="tea.menu.mySubjects"]
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Wait Until Element Is Visible  xpath=//*[@id="modalContainer"]
    Sleep  2
    ${names}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
    :FOR  ${name}  IN  @{names}
    \  Element Should Contain  xpath=//*[@id="modalContainer"]  ${name}
    Sleep  2
    Click Element  xpath=//*[@id="closeModalButtonCross"]
    Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Element Should Contain  xpath=//*[@id="modalContainer"]  No students