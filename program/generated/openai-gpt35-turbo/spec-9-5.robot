*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Example Test Case
    Open Browser  ${URL}  chrome
    Set Viewport  1501  1104
    Sleep  2s
    Click Element  xpath  //*[@id="header.link.login"]
    Sleep  2s
    Input Text  xpath  //*[@id="loginPage.userNameInput"]  orange
    Sleep  2s
    Input Text  xpath  //*[@id="loginPage.passwordInput"]  pass
    Sleep  2s
    Click Element  xpath  //*[@id="loginPage.loginFormSubmit"]
    Sleep  2s
    Click Element  xpath  //*[@id="stu.menu.myExamDates"]
    Sleep  2s
    Click Element  xpath  //*[@id="stu.myExamDates.table.ParticipantsButton-1]
    Sleep  5s
    Element Should Be Visible  id  stu.myExamDates.participantsModal.title
    Sleep  2s
    Page Should Contain Element  xpath  //td[contains(text(), "Benjamin Green")]
    Page Should Contain Element  xpath  //td[contains(text(), "Mia Orange")]
    Page Should Contain Element  xpath  //td[contains(text(), "Charlotte Purple")]
    Page Should Contain Element  xpath  //td[contains(text(), "Isabella Yellow")]
    Close Browser