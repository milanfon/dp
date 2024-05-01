*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
URL                http://localhost:4680/tbuis/index.jsp

*** Test Case: Teacher Scenario ***

*** Settings ***
Documentation      Teacher Scenario

*** Teardown ***
    Close Browser

*** Scenario: Teacher Scenario ***
    Given    Go To URL    ${URL}
    And      Login         username    scatterbrained
    And      Wait Until Page Contains    Teacher's View
    And      Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    And      Wait Until Page Contains    My Exam Dates
    And      Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    And      Accept Alert
    And      Wait Until Page Contains    My Exam Dates
    And      Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    And      Wait Until Page Contains    Set Evaluation
    And      Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    And      Select From List    id=tea.evalTable.filter.subjectSelect
    With Index    0
    And      Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    And      Wait Until Element Is Visible    xpath=//*[@id="tea.evalTable.noRecords"]
    And      Should Contain    Text    No exam dates for this subject

*** Test Case: Student Scenario ***

*** Settings ***
Documentation      Student Scenario

*** Teardown ***
    Close Browser

*** Scenario: Student Scenario ***
    Given    Go To URL    ${URL}
    And      Login         username    orange
    And      Wait Until Page Contains    Student View
    And      Should Not Contain    Text    Computation Structures