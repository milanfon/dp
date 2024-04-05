*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 10 Teacher
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # Teacher's steps go here
    [Teardown]    Close Browser

Spec 10 Student
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    # Student's steps go here
    [Teardown]    Close Browser

*** Keywords ***
# Keywords for Teacher's steps go here

# Keywords for Student's steps go here