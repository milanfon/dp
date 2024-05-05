*** Settings ***
Library            SeleniumLibrary
Library            Selenium2Library
Browser            Chrome

*** Variables ***
URL = http://localhost:4680/tbuis/

*** Test Case: Test student other exam dates and my exam dates ***

*** Setup ***
Set Viewport 1501 1104
Set Browser Implicit Wait 10

*** Teardown ***
Close Browser

*** Test Cases ***

Test student other exam dates and my exam dates
    [Documentation]    Test student other exam dates and my exam dates
    [Tags]    student exam dates

    [Preparation]    Navigate To ${URL}
    [Preparation]    Login To Application

    [Test]    Other Exam Dates
        [Documentation]        Check if element with id "stu.otherExamDates.successAlert" appears
        Click Element    id=stu.otherExamDates.table.registerButton-2-0
        [Documentation]        Wait for element with id "stu.otherExamDates.successAlert" to appear
        [Assert]    Element Should Be Visible    id=stu.otherExamDates.successAlert

        [Documentation]        Navigate to My Exam Dates
        Click Element    id=stu.menu.myExamDates
        [Documentation]        Wait for page to load

    [Test]    My Exam Dates
        [Documentation]        Check if element <td> with text "Programming in Java" is present
        [Assert]    Element Should Contain    text=Programming in Java    tag=td

    [Teardown]    Logout From Application

*** Test Case: Test teacher my exam dates ***

*** Setup ***
    Navigate To ${URL}
    [Preparation]    Login To Application As Teacher

*** Test ***
    [Test]    Teacher My Exam Dates
        [Documentation]        Check if element <td> with text "Mia Orange" is present
        [Assert]    Element Should Contain    text=Mia Orange    tag=td

*** Teardown ***
    [Teardown]    Logout From Application

*** Test Suite ***
Test student other exam dates and my exam dates
Test teacher my exam dates