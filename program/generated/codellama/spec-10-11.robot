*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 10 Teacher
    [Setup]    Open Browser    about:blank    Chrome
    # Teacher steps here
    [Teardown]    Close Browser

Spec 10 Student
    [Setup]    Open Browser    about:blank    Chrome
    # Student steps here
    [Teardown]    Close Browser

*** Keywords ***
# Teacher steps here
# Student steps here
# Locators here
# Asserts here