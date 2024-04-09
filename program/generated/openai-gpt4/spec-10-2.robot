*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Teacher My Subjects Page Verification
    # Login as Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

    # My Subjects Page Before Removing Subject
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    ${isDisabled}=    Get Element Attribute    xpath=//button[@value="Remove" and not(@id="tea.mySubjects.table.unregisterSubjectButton-0")]    disabled
    Should Be Equal As Strings    ${isDisabled}    true

    # Remove Subject and Verify Success Alert
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    2s  # Assume it takes time for the action to complete and alert to show
    Page Should Contain Element    xpath=//*[@id="tea.mySubjects.successAlert"]

    # My Exam Dates Page Verification
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain    Operating Systems

    # New Exam Dates Page Verification
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]

    # Set Evaluation Page Verification
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]

    # Evaluation Table Page Verification
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Page Should Not Contain Element    xpath=//option[text()="Operating Systems"]

    # Other's Subjects Page Verification
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Page Should Contain    Operating Systems

    # List of All Teachers Page Verification
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    ${osText}=    Get Text    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]
    Should Not Contain    ${osText}    Operating Systems

Student Other Subjects Page Verification
    # Switch to Student Browser
    Switch Browser    ${Student}
    # Login as Student
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

    # Other Subjects Page Verification
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    ${subjects}=    Get Text    xpath=//tr/td[text()="Operating Systems"]/following-sibling::td
    Should Not Contain    ${subjects}    Peter Strict