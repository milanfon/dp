*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DELAY}  1s

*** Test Cases ***
Check_Names_Present
    Set Selenium Speed  2
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    
    Click Element  xpath///*[@id="header.link.login"]
    Sleep  ${DELAY}
    
    Input Text  xpath///*[@id="loginPage.userNameInput"]  pedant
    Sleep  ${DELAY}
    
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Sleep  ${DELAY}
    
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep  ${DELAY}
    
    Click Element  xpath///*[@id="tea.menu.mySubjects"]
    Sleep  ${DELAY}
    
    Click Element  xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
    Sleep  ${DELAY}
    
    Click Element  id  closeModalButtonCross
    Sleep  ${DELAY}
    
    Click Element  xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
    Sleep  ${DELAY}
    
    Page Should Contain Element  xpath///*[contains(text(),'No students')]
    Sleep  ${DELAY}
    
    Close Browser