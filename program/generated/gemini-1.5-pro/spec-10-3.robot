*** Settings ***
Documentation     Suite description
Library           SeleniumLibrary
Test Timeout        3 minutes
Default Tags        smoke

*** Variables ***
${BROWSER}         chrome
${DELAY}           2s
${EXECUTION_SPEED}  0.5
${URL}             http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Login Teacher
    [Arguments]    ${username}    ${password}
    Go To            ${URL}
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep            ${DELAY}
    Input Text        xpath://*[@id="loginPage.userNameInput"]    ${username}
    Sleep            ${DELAY}
    Input Text        xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep            ${DELAY}
    
Login Student
    [Arguments]    ${username}    ${password}
    Go To            ${URL}
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep            ${DELAY}
    Input Text        xpath://*[@id="loginPage.userNameInput"]    ${username}
    Sleep            ${DELAY}
    Input Text        xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep            ${DELAY}
    
Check Elements My Subjects
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.successAlert"]
    Sleep            ${DELAY}
    ${remove_buttons}=    Get Webelements    xpath://input[@value="Remove"]
    Sleep            ${DELAY}
    FOR    ${remove_button}    IN    @{remove_buttons}
        Run Keyword If    '${remove_button}' != '${remove_buttons}[0]'
        ...    Element Should Be Disabled    ${remove_button} 
    END
    Sleep            ${DELAY}
    
Check Elements Other Pages
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep            ${DELAY}
    Page Should Not Contain Element    xpath://th[text()="Operating Systems"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep            ${DELAY}
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep            ${DELAY}
    Page Should Not Contain Element    xpath://option[contains(text(),"Operating Systems")]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep            ${DELAY}
    Page Should Not Contain Element    xpath://option[text()="Operating Systems"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep            ${DELAY}
    Page Should Contain Element    xpath://td[text()="Operating Systems"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep            ${DELAY}
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),"Operating Systems")]
    Sleep            ${DELAY}

*** Test Cases ***
Teacher Remove Subject
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait    ${DELAY}
    Set Selenium Speed    ${EXECUTION_SPEED}
    Login Teacher    strict    pass
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep            ${DELAY}
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep            ${DELAY}
    Check Elements My Subjects
    Sleep            ${DELAY}
    Check Elements Other Pages
    Sleep            ${DELAY}
    Close Browser
    
Student Check Other Subjects
    Open Browser    ${URL}    ${BROWSER}
    Set Browser Implicit Wait    ${DELAY}
    Set Selenium Speed    ${EXECUTION_SPEED}
    Login Student    orange    pass
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep            ${DELAY}
    Page Should Not Contain Element    xpath://tr[td[contains(text(), "Operating Systems")]]//td[contains(text(), "Peter Strict")]
    Sleep            ${DELAY}
    Close Browser 
