*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680
${BROWSER}  headlesschrome
${DELAY}  0.5

*** Test Cases ***
Teacher
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    [Teardown]  Close Browser
    Login Teacher
    Teacher Test

Student
    [Setup]  Open Browser  ${URL}  ${BROWSER}
    [Teardown]  Close Browser
    Login Student
    Student Test

*** Keywords ***
Login Teacher
    Input Text  aria/Username  strict
    Input Text  aria/Password  pass
    Click Element  aria/Login[role="button"]
    Sleep  ${DELAY}

Login Student
    Input Text  aria/Username  orange
    Input Text  aria/Password  pass
    Click Element  aria/Login[role="button"]
    Sleep  ${DELAY}

Teacher Test
    Click Element  aria/My Subjects
    Click Element  aria/My Exam Dates
    Click Element  aria/New Exam Dates
    Click Element  aria/Set Evaluation
    Click Element  aria/Evaluation Table
    Click Element  aria/Others' Subjects
    Click Element  aria/List of All Teachers
    Teacher Subjects Check
    Teacher Exam Dates Check
    Teacher Set Evaluation Check
    Teacher Evaluation Table Check
    Teacher Others Subjects Check
    Teacher List of All Teachers Check

Student Test
    Click Element  aria/Other Subjects
    Student Others Subjects Check

Teacher Subjects Check
    Click Element  aria/My Subjects
    Click Element  aria/Remove
    Sleep  ${DELAY}
    ${alert}  Get Element Attribute  id:tea.mySubjects.successAlert  aria-hidden
    Should Be Equal  ${alert}  false
    ${remove_buttons_disabled}  Get Element Attribute  aria/Remove  aria-disabled
    Should Be Equal  ${remove_buttons_disabled}  true

Teacher Exam Dates Check
    Click Element  aria/My Exam Dates
    ${os_not_present}  Get Element Attribute  xpath=//th[contains(text(), "Operating Systems")]  aria-disabled
    Should Be Equal  ${os_not_present}  true

Teacher Set Evaluation Check
    Click Element  aria/Set Evaluation
    ${os_not_present}  Get Element Attribute  xpath=//option[contains(text(), "Operating Systems")]  aria-hidden
    Should Be Equal  ${os_not_present}  true

Teacher Evaluation Table Check
    Click Element  aria/Evaluation Table
    ${os_not_present}  Get Element Attribute  xpath=//option[contains(text(), "Operating Systems")]  aria-hidden
    Should Be Equal  ${os_not_present}  true

Teacher Others Subjects Check
    Click Element  aria/Others' Subjects
    ${os_present}  Get Element Attribute  xpath=//td[contains(text(), "Operating Systems")]  aria-hidden
    Should Be Equal  ${os_present}  false
    ${os_not_present}  Get Element Attribute  xpath=//tr[contains(@id, "tea.listOfAllTeachers.table.teacherRow-5")]//td[contains(text(), "Operating Systems")]  aria-hidden
    Should Be Equal  ${os_not_present}  true

Teacher List of All Teachers Check
    Click Element  aria/List of All Teachers
    ${os_present}  Get Element Attribute  xpath=//td[contains(text(), "Operating Systems")]  aria-hidden
    Should Be Equal  ${os_present}  true

Student Others Subjects Check
    Click Element  aria/Other Subjects
    ${os_present}  Get Element Attribute  xpath=//tr//td[contains(text(), "Operating Systems"]/..//td[contains(text(), "Peter Strict")]  aria-hidden
    Should Be Equal  ${os_present}  true