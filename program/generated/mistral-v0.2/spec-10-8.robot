*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

Scenario1
    [Documentation]        This scenario checks the behavior of the 'Remove' button on the 'My Subjects' page for a teacher account

    [Preparation]
    OpenBrowser

    [Step]
    Go To             http://localhost:4680/tbuis/index.jsp
    Login             username=admin       password=admin

    [Step]
    Go To             My Subjects

    [Step]
    ${remove_buttons_disabled} =    Get Elements Count    //button[contains(.,'Remove')]
    ${remove_buttons_disabled} =    Evaluate    ${remove_buttons_disabled} < 1
    [Condition]       ${remove_buttons_disabled}
    Log               Remove buttons are disabled
    [Else]
    Log               Remove buttons are not disabled

    [Step]
    Click Button       //button[contains(.,'Remove')]

    [Step]
    [Documentation]    Wait for success alert to appear

    [Step]
    Wait Until Page Contains    tea.mySubjects.successAlert

    [Step]
    [Documentation]    Go to My Exam Dates page and check for absence of "Operating Systems" in <th>

    Go To             My Exam Dates
    [Step]
    ${th_present} =    Element Should Not Exist    xpath=//th[contains(.,'Operating Systems')]
    [Condition]       ${th_present}
    Log               "Operating Systems" not present in <th> on My Exam Dates page

    [Step]
    [Documentation]    Go to New Exam Dates page and check for absence of "Operating Systems" in <option>

    Go To             New Exam Dates
    [Step]
    ${option_present} =    Element Should Not Exist    xpath=//option[contains(.,'Operating Systems')]
    [Condition]       ${option_present}
    Log               "Operating Systems" not present in <option> on New Exam Dates page

    [Step]
    [Documentation]    Go to Set Evaluation page and check for absence of "Operating Systems" in <option>

    Go To             Set Evaluation
    [Step]
    ${option_present} =    Element Should Not Exist    xpath=//option[contains(.,'Operating Systems')]
    [Condition]       ${option_present}
    Log               "Operating Systems" not present in <option> on Set Evaluation page

    [Step]
    [Documentation]    Go to Evaluation Table page and check for absence of "Operating Systems" in <option>

    Go To             Evaluation Table
    [Step]
    ${option_present} =    Element Should Not Exist    xpath=//option[contains(.,'Operating Systems')]
    [Condition]       ${option_present}
    Log               "Operating Systems" not present in <option> on Evaluation Table page

    [Step]
    [Documentation]    Go to Others' Subjects page and check for presence of "Operating Systems" in <td>

    Go To             Others' Subjects
    [Step]
    ${td_present} =    Element Should Exist    xpath=//td[contains(.,'Operating Systems')]
    [Condition]       ${td_present}
    [Else]
    Log               "Operating Systems" not present in <td> on Others' Subjects page

    [Step]
    [Documentation]    Go to List of All Teachers page and check for absence of "Operating Systems" in <td> in the row with id "tea.listOfAllTeachers.table.teacherRow-5"

    Go To             List of All Teachers
    [Step]
    ${td_present} =    Element Should Not Exist    xpath=//tr[@id='tea.listOfAllTeachers.table.teacherRow-5']//td[contains(.,'Operating Systems')]
    [Condition]       ${td_present}
    Log               "Operating Systems" not present in <td> in the row with id "tea.listOfAllTeachers.table.teacherRow-5" on List of All Teachers page

    [Teardown]
    Close Browser

Scenario2
    [Documentation]        This scenario checks the behavior of the page for a student account

    [Preparation]
    OpenBrowser

    [Step]
    Go To             http://localhost:4680/tbuis/index.jsp
    Login             username=student       password=student

    [Step]
    Go To             Other Subjects

    [Step]
    [Documentation]    Check for absence of "Peter Strict" in the same <tr> as "Operating Systems"

    [Step]
    ${tr_present} =    Element Should Contain    xpath=//tr//td[contains(.,'Operating Systems')]//following-sibling::td[contains(.,'Peter Strict')]    False
    [Condition]       ${tr_present}
    [Else]
    Log               "Peter Strict" found in the same <tr> as "Operating Systems"
    [End]

    [Teardown]
    Close Browser