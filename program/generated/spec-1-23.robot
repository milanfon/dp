*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Browser.robot

*** Test Cases ***
Test Case 1
    Open Page
    Check If Element With Id "header.link.login" Is Not Present
    Check If Element With Id "header.title.userHome" Has Inner Value Of "Noah Brown"
    Check If Element With Id "header.link.logout" Is Present
    Check If Element With Query Selector "#header.student-view-nav" Does Exist
