*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Teacher Role Test
    [Setup]    Open Browser And Setup
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    5s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    3s
    
    # Check if other Remove buttons are disabled
    ${is_disabled}=    Get Element Attribute    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-1"]    disabled
    Should Be True    '${is_disabled}' == 'true'
    Sleep    2s
    
    # Click on the first Remove button
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    3s
    
    # Check if success alert appears
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    Sleep    2s
    
    # Check on My Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    3s
    Element Should Not Contain    xpath=//th    Operating Systems
    Sleep    2s
    
    # Check on New Exam Dates page
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    3s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    2s
    
    # Check on Set Evaluation page
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    3s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    2s
    
    # Check on Evaluation Table page
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    3s
    Element Should Not Contain    xpath=//option    Operating Systems
    Sleep    2s
    
    # Check on Other's Subjects page
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    3s
    Element Should Contain    xpath=//td    Operating Systems
    Sleep    2s
    
    # Check on List of All Teachers page
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    3s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td    Operating Systems
    Sleep    2s

    [Teardown]    Close Browser

Student Role Test
    [Setup]    Open Browser And Setup
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    5s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    3s
    Element Should Not Contain    xpath=//tr[contains(., 'Operating Systems')]    Peter Strict
    Sleep    2s

    [Teardown]    Close Browser

*** Keywords ***
Open Browser And Setup
    Open Browser    about:blank    ${BROWSER}
    Set Window Size    1501    1104