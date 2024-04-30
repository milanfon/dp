*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open and Verify Student Page
    Open Browser  ${URL}  chrome
    Set Viewport  width=1501  height=1104  deviceScaleFactor=1  isMobile=false  hasTouch=false  isLandscape=false
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  maroon
    Press Keys  xpath///*[@id="loginPage.userNameInput"]  TAB
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Press Keys  xpath///*[@id="loginPage.passwordInput"]  ENTER
    Click Element  xpath///*[@id="stu.menu.otherSubjects"]
    Click Element  xpath///*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep  2s
    Click Element  xpath///*[@id="stu.menu.mySubjects"]
    Sleep  2s
    Close Browser

Open and Verify Teacher Page
    Open Browser  ${URL}  chrome
    Set Viewport  width=1501  height=1104  deviceScaleFactor=1  isMobile=false  hasTouch=false  isLandscape=false
    Click Element  xpath///*[@id="header.link.login"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath///*[@id="tea.menu.mySubjects"]
    Click Element  xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep  2s
    Close Browser