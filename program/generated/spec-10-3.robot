*** Settings ***
Documentation     Scenario Covering Teacher and Student View Verifications
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Teacher Scenario Verifications
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    
    # Execute steps based on teacher's JSON recording here
    
    # Login as teacher
    # Perform actions based on teacher's scenario
    # My Subjects - Before clicking "Remove", check other buttons are disabled
    # After clicking "Remove", check for success alert
    # My Exam Dates - Check "Operating Systems" not present
    # New Exam Dates - Check "Operating Systems" not present in options
    # Set Evaluation - Check "Operating Systems" not present in options
    # Evaluation Table - Check "Operating Systems" not present in options
    # Other's Subjects - Check "Operating Systems" is present
    # List of All Teachers - Check "Operating Systems" not present under specific teacher row
    
    Close Browser

    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    
    # Execute steps based on student's JSON recording here
    
    # Login as student
    # Navigate to "Other Subjects"
    # Verify "Peter Strict" not in the same row as "Operating Systems"
    
    Close Browser

*** Keywords ***
Teacher Login and Navigate
    # Login steps for teacher
    # Navigate to desired page

Student Login and Verify Other Subjects
    # Login steps for student
    # Verification steps on "Other Subjects" page
