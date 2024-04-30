*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Test Cases ***
Teacher My Subjects And Exam Date Checks
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    # Login Steps
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    # My Subjects
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Wait Until Element Is Not Visible    xpath=//button[@id!="tea.mySubjects.table.unregisterSubjectButton-0" and @value="Remove"]    10s
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s
    Page Should Contain Element    id=tea.mySubjects.successAlert
    # My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//th[contains(., "Operating Systems")]
    # New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[contains(., "Operating Systems")]
    # Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[contains(., "Operating Systems")]
    # Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//option[contains(., "Operating Systems")]
    # Other's Subjects
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(., "Operating Systems")]
    # List of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Not Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    "Operating Systems"
    Close Browser

Student Other Subjects Check
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    # Login Steps
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    # Other Subjects
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    ${is_present}=    Run Keyword And Return Status    Element Should Not Contain    xpath=//tr[contains(., "Operating Systems")]    "Peter Strict"
    Should Be True    ${is_present}
    Close Browser