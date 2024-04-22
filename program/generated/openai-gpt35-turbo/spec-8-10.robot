*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/

*** Test Cases ***
Open Page and Check Elements
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Pause Execution  2s
    
    Click Element  xpath///*[@id="header.link.login"]
    Pause Execution  2s
    
    Input Text  xpath///*[@id="loginPage.userNameInput"]  green
    Pause Execution  2s
    
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Pause Execution  2s
    
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Pause Execution  2s
    
    Click Element  xpath///*[@id="stu.menu.otherExamDates"]
    Pause Execution  2s
    
    Click Element  xpath///*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Pause Execution  2s
    
    Click Element  xpath///*[@id="stu.menu.myExamDates"]
    Pause Execution  2s
    
    Check Element Present  xpath//td[contains(text(),"Programming in Java")]
    
    Close Browser

Login as Teacher and Check Element
    Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
    Maximize Browser Window
    Pause Execution  2s
    
    Click Element  xpath///*[@id="header.link.login"]
    Pause Execution  2s
    
    Input Text  xpath///*[@id="loginPage.userNameInput"]  strict
    Pause Execution  2s
    
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Pause Execution  2s
    
    Click Element  xpath///*[@id="loginPage.loginFormSubmit"]
    Pause Execution  2s
    
    Click Element  xpath///*[@id="tea.menu.myExamDates"]
    Pause Execution  2s
    
    Click Element  xpath///*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Pause Execution  2s
    
    Check Element Present  xpath//td[contains(text(),"Mia Orange")]
    
    Close Browser