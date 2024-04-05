*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test Spec 12 Teacher
    [Setup]    Open Browser    ${URL}    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    # Rest of the steps
    # After clicking the "tea.myExamDates.table.cancelButton-0-0" button, alert appears, so accept it.
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    # Check if we are still on the "My Exam Dates" page
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    # Check if element with id "tea.setEvaluation.form.noRecords" is visible
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    # Check if "No exam dates for this subject" text appears
    Page Should Contain    No exam dates for this subject
    # Close Browser
    Close Browser

Test Spec 12 Student
    [Setup]    Open Browser    ${URL}    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    # Rest of the steps
    # Check if text "Computation Structures" is not present
    Page Should Not Contain    Computation Structures
    # Close Browser
    Close Browser