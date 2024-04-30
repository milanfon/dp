*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Teacher Page    AND    Open Browser To Student Page
Suite Teardown    Close All Browsers

*** Keywords ***
Open Browser To Teacher Page
    Open Browser    about:blank    Chrome    alias=Teacher
    Set Window Size    1501    1104

Open Browser To Student Page
    Open Browser    about:blank    Chrome    alias=Student
    Set Window Size    1501    1104

*** Test Cases ***
Teacher Validates Subjects And Exam Dates
    [Setup]    Switch Browser    Teacher
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    # Validate My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    ${buttonsDisabled}=    Get Element Attribute    xpath=//button[@id!="tea.mySubjects.table.unregisterSubjectButton-0" and @value="Remove"]@disabled
    Should Be True    '${buttonsDisabled}' == 'true'
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.mySubjects.successAlert"]
    # Validate My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain    Operating Systems
    # Validate New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]
    # Validate Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[contains(text(),"Operating Systems")]
    # Validate Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]
    # Validate Others' Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Page Should Contain    Operating Systems
    # Validate List of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    ${containsOS}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]
    Should Not Contain    ${containsOS}    Operating Systems

Student Checks Other Subjects For Specific Teacher
    [Setup]    Switch Browser    Student
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    ${containsPeterStrict}=    Get Text    xpath=//td[text()="Operating Systems"]/../td[contains(text(), "Peter Strict")]
    Should Be False    '${containsPeterStrict}' != ''