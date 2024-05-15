*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***

*** Test Cases ***

# Teacher Scenario
Scenario: Teacher Scenario
    Given    Set Up
    When    Set Viewport
        **{
            "width": 1501,
            "height": 1104,
            "deviceScaleFactor": 1,
            "isMobile": false,
            "hasTouch": false,
            "isLandscape": false
        }**

    When    Navigate To
        **{
            "url": "http://localhost:4680/tbuis/index.jsp"
        }**

    When    Login
        **{
            "username": "pedant",
            "password": "pass"
        }**

    When    Click Other Subjects

    When    Participate In Other Subject

    When    Wait Until Page Contains
        **{
            "finder": "//*[@id='tea.otherSubjects.successAlert']",
            "timeout": 10
        }**

    When    Page Should Contain
        **{
            "finder": "//*[@id='tea.myExamDates.table.noRecords-2']/td[1]",
            "text": "Linear Algebra"
        }**

    When    Page Should Contain
        **{
            "finder": "//*[@id='tea.myExamDates.table.noRecords-2']/td[2]",
            "text": "No exam dates."
        }**

    When    Go To My Exam Dates

    When    Page Should Contain
        **{
            "finder": "//option[text()='Linear Algebra']",
            "count": 1
        }**

    When    Go To List Of All Teachers

    When    Page Should Contain
        **{
            "finder": "//*[@id='tea.listOfAllTeachers.table.teacherRow-3']/td[3]",
            "text": "Linear Algebra"
        }**

    When    Page Should Contain
        **{
            "finder": "//*[@id='tea.listOfAllTeachers.table.teacherRow-3']/td[2]",
            "text": "Alice Pedant"
        }**

    When    Logout
    Then    Teacher Scenario Completed

# Student Scenario
Scenario: Student Scenario
    Given    Set Up
    When    Set Viewport
        **{
            "width": 1501,
            "height": 1104,
            "deviceScaleFactor": 1,
            "isMobile": false,
            "hasTouch": false,
            "isLandscape": false
        }**

    When    Navigate To
        **{
            "url": "http://localhost:4680/tbuis/index.jsp"
        }**

    When    Login
        **{
            "username": "yellow",
            "password": "pass"
        }**

    When    Go To Other Subjects

    When    Page Should Contain
        **{
            "finder": "//*[@id='stu.otherSubjects.table.subjectRow-2']/td[2]",
            "text": "Linear Algebra"
        }**

    When    Page Should Contain
        **{
            "finder": "//*[@id='stu.otherSubjects.table.subjectRow-2']/td[3]",
            "text": "Alice Pedant"
        }**

    When    Logout
    Then    Student Scenario Completed

# Delay
# Add delay between steps as needed
# For example, When Delay 5s

# Close Browser
# After Test
# Close Browser

# Function for Logging In
# Function LogIn
# [Arguments]  {username}  {password}
# [Returns]     Nothing
# {
#     Log To All    Logging In...
#     Click    #header.link.login
#     Input    #loginPage.userNameInput    {username}
#     Input    #loginPage.passwordInput    {password}
#     Click    #loginPage.loginFormSubmit
#     Log To All    Logged In
# }

# Function for Logging Out
# Function LogOut
# [Arguments]
# [Returns]     Nothing
# {
#     Log To All    Logging Out...
#     Click    #header.link.logout
#     Log To All    Logged Out
# }

# Function for Setting Up
# Function Set Up
# [Arguments]
# [Returns]     Nothing
# {
#     Set Browser Implicit Wait    5
#     Log To All    Setting Up...
# }

# Function for Tearing Down
# Function Tear Down
# [Arguments]
# [Returns]     Nothing
# {
#     Close Browser
#     Log To All    Tearing Down...
# }

# Logging In
# Log In    pedant    pass

# Running Teacher Scenario
# Run Teacher Scenario

# Logging Out
# Log Out

# Logging In
# Log In    yellow    pass

# Running Student Scenario
# Run Student Scenario

# Logging Out
# Log Out

# Tearing Down
# Tear Down