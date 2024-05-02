*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  executable_path=/usr/local/bin/chromedriver
Suite Teardown  Close Browser

*** Test Cases ***
Scenario 9
    Set Window Size  1501  1104
    Go To  http://localhost:4680/tbuis/index.jsp
    Sleep  1
    Click Element  xpath://*[@id="header.link.login"]
    Sleep  1
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Sleep  1
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Sleep  1
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Sleep  1
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Sleep  1
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep  1
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Sleep  1
    Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep  1
    Wait Until Element Is Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Sleep  1
    ${elements}=  Get Webelements  xpath://*[@id="stu.myExamDates.participantsModal.table"]//td
    ${values}=  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
    : FOR  ${element}  IN  @{elements}
    \  ${text}=  Get Text  ${element}
    \  Should Contain  ${text}  ${values}
    \  Sleep  1