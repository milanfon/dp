*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Test Cases ***
Open Page
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Set Window Size  1501  1104
    Wait Until Page Contains  University information system
    Click Element  xpath://*[@id="header.link.login"]
    Wait Until Page Contains  Login Page
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains 
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains 
    Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep  1s
    Page Should Contain Element  xpath://*[@id="stu.myExamDates.participantsModal.title"]
    ${participants}=  Get Webelements  xpath://*[@id="stu.myExamDates.participantsModal"]//td
    ${participants_names}=  Evaluate  [element.text for element in ${participants}]
    Should Contain  ${participants_names}  Benjamin Green
    Should Contain  ${participants_names}  Mia Orange
    Should Contain  ${participants_names}  Charlotte Purple
    Should Contain  ${participants_names}  Isabella Yellow
    Sleep  1s
    Close Browser