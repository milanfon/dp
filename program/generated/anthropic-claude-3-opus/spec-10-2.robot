*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}      1

*** Test Cases ***
Teacher Removes Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0" and @disabled]
    Click Button    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath:/th[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath:/option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath:/option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath:/option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath:/td[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser
    
Student Checks Removed Subject    
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange  
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY} 
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Page Should Not Contain Element    xpath://tr[td[contains(text(), "Operating Systems")]][td[contains(text(), "Peter Strict")]]
    Close Browser
