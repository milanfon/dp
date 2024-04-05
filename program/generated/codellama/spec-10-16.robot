*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/    Chrome
    # Teacher steps here
    # Check if all "Remove" buttons except the last one are disabled
    # Check if the "tea.mySubjects.successAlert" element appears
    # Check if "Operating Systems" is not present in various places
    # Check if "Operating Systems" is present in "Other's Subjects"
    # Check if "Operating Systems" is not present in "List of All Teachers"
    [Teardown]    Close Browser

Student Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/    Chrome
    # Student steps here
    # Check if "Operating Systems" is not present in "Other Subjects"
    [Teardown]    Close Browser

*** Keywords ***
# Keywords for the steps above go here
# e.g.
# Check if "Operating Systems" is not present in "Other Subjects"
#    Page Should Not Contain    Operating Systems    # This is a simple check that the text is not present anywhere in the page
#    # If you need to check that the text is not present in a specific table row, you need to use a more specific selector, e.g.
#    Page Should Not Contain Element    xpath://tr[contains(., 'Operating Systems')]//td[contains(., 'Peter Strict')]    # This checks that there is no table row containing 'Operating Systems' that also contains 'Peter Strict'