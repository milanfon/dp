*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.unregisterSubjectButton-0
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.menu.newExamDates
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.menu.otherSubjects
    Click Element    id:tea.menu.listOfAllTeachers
    # Add delays between steps
    Sleep    1s
    # On page "My Subjects" before clicking the "Remove" button check if element all the other button with value "Remove" are disabled
    Elements Should Be Disabled    xpath://button[contains(., "Remove")]
    # On page "My Subjects" after clicking the "Remove" button check if element with id "tea.mySubjects.successAlert" has appeared
    Wait Until Element Is Visible    id:tea.mySubjects.successAlert
    # On page "My Exam Dates" check if element <th> with text "Operating Systems" is not present
    Page Should Not Contain Element    xpath://th[contains(., "Operating Systems")]
    # On page "New Exam Dates" check if element <option> with text "Operating Systems" is not present
    Page Should Not Contain Element    xpath://option[contains(., "Operating Systems")]
    # On page "Set Evaluation" check if element <option> with text containing string "Operating Systems" is not present
    Page Should Not Contain Element    xpath://option[contains(., "Operating Systems")]
    # On page "Evaluation Table" check if element <option> with text "Operating Systems" is not present
    Page Should Not Contain Element    xpath://option[contains(., "Operating Systems")]
    # On page "Other's Subjects" check if element <td> with text "Operating Systems" is present
    Page Should Contain Element    xpath://td[contains(., "Operating Systems")]
    # On page "List of All Teachers" check if inside element <tr> with id "tea.listOfAllTeachers.table.teacherRow-5" there is not <td> element containig string "Operating Systems"
    Page Should Not Contain Element    xpath://tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(., "Operating Systems")]
    Close All Browsers

*** Keywords ***
Elements Should Be Disabled
    [Arguments]    ${locator}
    ${elements}    Get Webelements    ${locator}
    FOR    ${element}    IN    @{elements}
        Should Be True    ${element.get_attribute('disabled')}
    END

Login
    [Arguments]    ${username}    ${password}
    Input Text    id:loginPage.userNameInput    ${username}
    Input Text    id:loginPage.passwordInput    ${password}
    Click Element    id:loginPage.loginFormSubmit