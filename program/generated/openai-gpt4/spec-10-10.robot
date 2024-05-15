*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Login As Teacher
    Navigate To My Subjects And Verify
    Navigate To My Exam Dates And Verify
    Navigate To New Exam Dates And Verify
    Navigate To Set Evaluation And Verify
    Navigate To Evaluation Table And Verify
    Navigate To Others' Subjects And Verify
    Navigate To List Of All Teachers And Verify
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Login As Student
    Navigate To Other Subjects And Verify
    Close Browser

*** Keywords ***
Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Student
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To My Subjects And Verify
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    ${remove_buttons}=    Get WebElements    xpath=//button[contains(@id, 'unregisterSubjectButton') and not(@id='tea.mySubjects.table.unregisterSubjectButton-0')]
    FOR    ${button}    IN    @{remove_buttons}
        Element Should Be Disabled    ${button}
    END
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.mySubjects.successAlert"]

Navigate To My Exam Dates And Verify
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//th[contains(text(),"Operating Systems")]

Navigate To New Exam Dates And Verify
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[contains(text(),"Operating Systems")]

Navigate To Set Evaluation And Verify
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[contains(text(),"Operating Systems")]

Navigate To Evaluation Table And Verify
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[contains(text(),"Operating Systems")]

Navigate To Others' Subjects And Verify
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Page Should Contain Element    xpath=//td[contains(text(),"Operating Systems")]

Navigate To List Of All Teachers And Verify
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),"Operating Systems")]

Navigate To Other Subjects And Verify
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    ${rows}=    Get WebElements    xpath=//tr[contains(.,'Operating Systems')]
    FOR    ${row}    IN    @{rows}
        Element Should Not Contain    ${row}    Peter Strict
    END
