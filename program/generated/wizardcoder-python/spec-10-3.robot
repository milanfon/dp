*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close All Browsers

*** Test Cases ***
spec 10 teacher
    Open Browser    http://localhost:4680    browser=chrome
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    # check if element all the other button with value "Remove" are disabled
    ${elements_list}=    Get Webelements    xpath=//*[@value="Remove"]
    :FOR    ${element}    IN    @{elements_list}
    \    ${is_disabled}=    Get Element Attribute    ${element}@disabled
    \    Should Be True    ${is_disabled}
    Click Element    xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    # check if element with id "tea.mySubjects.successAlert" has appeared
    Wait Until Element Is Visible    xpath=//*[@id="tea.mySubjects.successAlert"]
    # check if element <th> with text "Operating Systems" is not present
    Page Should Not Contain Element    xpath=//th[.="Operating Systems"]
    # check if element <option> with text "Operating Systems" is not present
    Page Should Not Contain Element    xpath=//option[.="Operating Systems"]
    # check if element <option> with text containing string "Operating Systems" is not present
    Page Should Not Contain Element    xpath=//option[contains(text(), "Operating Systems")]
    # check if element <td> with text "Operating Systems" is present
    Page Should Contain Element    xpath=//td[.="Operating Systems"]
    # check if inside element <tr> with id "tea.listOfAllTeachers.table.teacherRow-5" there is not <td> element containig string "Operating Systems"
    Element Should Not Contain    xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems

spec 10 student
    Open Browser    http://localhost:4680    browser=chrome
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    # check if there is not text value containing string "Peter Strict" in the same <tr> as text string "Operating Systems"
    Element Should Not Contain    xpath=//tr[.//td[.="Operating Systems"]]    Peter Strict
    Close All Browsers