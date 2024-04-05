*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Spec 10 Teacher
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # Teacher Steps
    [Teardown]    Close Browser

Spec 10 Student
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # Student Steps
    [Teardown]    Close Browser

*** Keywords ***
# Keywords for Spec 10 Teacher

# Keywords for Spec 10 Student