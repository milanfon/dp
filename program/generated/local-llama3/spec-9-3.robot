*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${BROWSER}  ${BROWSER}  http://localhost:4680
Suite Teardown  Close Browser
*** Variables ***
${BROWSER}  Chrome
*** Test Cases ***
Spec 9
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
    Element Should Be Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]
    Sleep  1
    ${table_elements}=  Get Webelements  xpath://*[@id="stu.myExamDates.participantsModal.body"]/table/tbody/tr/td
    ${table_values}=  Evaluate  [element.text for element in ${table_elements}]
    Sleep  1
    Should Contain  ${table_values}  Benjamin Green
    Should Contain  ${table_values}  Mia Orange
    Should Contain  ${table_values}  Charlotte Purple
    Should Contain  ${table_values}  Isabella Yellow
    Sleep  1
    Close Browser