*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary.Keywords

Library    OperatingSystem
Library    String

Suite Setup    Open Browser    http://localhost:4680    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Test Teacher
    Teacher Steps

*** Keywords ***
Teacher Steps
    Set Viewport Size    1501    104
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    # Check if all "Remove" buttons are disabled
    ${elements}    Get Webelements    xpath://*[@id="tea.mySubjects.table"]//button[text()="Remove"]
    ${elements_length}    Get Length    ${elements}
    FOR    ${index}    IN RANGE    ${elements_length}
        ${element_text}    Get Text    ${elements[${index]}
        Should Be Equal    ${element_text}    Remove
        ${element_disabled}    Get Element Attribute    ${elements[${index]}@disabled
        Should Be Equal    ${element_disabled}    true
    END
    # Check if success alert appeared
    Wait Until Element Is Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    # Check if "Operating Systems" is not present on "My Exam Dates"
    Go To    http://localhost:4680/tbuis/teacher-view/myExamDates
    Page Should Not Contain    Operating Systems
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Page Should Not Contain    Operating Systems
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Not Contain    Operating Systems
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Page Should Not Contain    Operating Systems
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.table"]//td[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Page Should Not Contain    Operating Systems    xpath://*[@id="tea.listOfAllTeachers.table"]//td[contains(text(), "Operating Systems"]