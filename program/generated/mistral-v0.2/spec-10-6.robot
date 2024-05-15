 ```ruby
*** Settings ***
Library            SeleniumLibrary
Browser            Chrome

*** Variables ***
${URL}             http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

Test Case         Test Teacher Scenario
    [Documentation]         Test the teacher scenario
    [Tags]         teacher

    [Preparation]         Open the URL
    Open Browser          ${URL}

    ${teacher_login}          Login Teacher
    [Step]         ${teacher_login}
    *** Keywords ***
    Login Teacher
    [Documentation]         Login as teacher
    [Actions]         ${LOGIN_TEACHER_SCRIPT}
    *** Keywords ***
    Logout
    [Documentation]         Logout teacher
    [Actions]         Logout

    ${student_login}          Login Student
    [Step]         ${student_login}
    *** Keywords ***
    Login Student
    [Documentation]         Login as student
    [Actions]         ${LOGIN_STUDENT_SCRIPT}

    [Teardown]         Close Browser

Test Case         Check Operating Systems
    [Documentation]         Check if Operating Systems is not present for teacher
    [Tags]         teacher

    [Preparation]         Open My Subjects page
    [Step]         Open My Subjects
    Click Element          id=tea.menu.mySubjects

    [Step]         Check if "Remove" buttons are disabled before clicking "Remove"
    [Step]         Wait Until Element Is Not Visible
    Element Should Not Be Visible          id=tea.mySubjects.table.unregisterSubjectButton-0
    [Step]         Wait Until Element Is Visible
    Element Should Be Visible          id=tea.mySubjects.table.unregisterSubjectButton-0
    [Step]         Wait
    Sleep         1s

    [Step]         Check if "Remove" button is disabled
    Element Should Be Disabled          id=tea.mySubjects.table.unregisterSubjectButton-0

    [Step]         Click "Remove"
    Click Element          id=tea.mySubjects.table.unregisterSubjectButton-0

    [Step]         Wait for success alert
    [Step]         Wait Until Element Is Visible
    Element Should Be Visible          id=tea.mySubjects.successAlert

    [Step]         Close My Subjects tab
    [Step]         Close Current Tab

    [Step]         Open Other Subjects page
    [Step]         Wait Until Element Is Visible
    Element Should Be Visible          id=tea.menu.otherSubjects
    [Step]         Click Element          id=tea.menu.otherSubjects

    [Step]         Check if "Peter Strict" is not present in the same row as "Operating Systems"
    [Step]         Element Should Not Contain          id=tea.otherSubjects.table.teacherName-1    text=Peter Strict
    [Step]         Element Should Contain          id=tea.otherSubjects.table.subjectName-1    text=Operating Systems

Test Case         Check Operating Systems for Student
    [Documentation]         Check if Operating Systems is not present for student
    [Tags]         student

    [Preparation]         Open Other Subjects page
    [Step]         Open Other Subjects
    Click Element          id=stu.menu.otherSubjects

    [Step]         Check if "Operating Systems" is not present in "Subjects" dropdown
    Element Should Not Be Visible          name=stu.otherSubjects.subjectsDropdown option=Operating Systems

    [Step]         Check if "Operating Systems" is not present in "Evaluation Table" dropdown
    Element Should Not Be Visible          name=stu.otherSubjects.evaluationTableDropdown option=Operating Systems

    [Step]         Check if "Operating Systems" is not present in "List of All Teachers" table
    [Step]         Table Should Not Contain          id=stu.otherSubjects.listOfAllTeachersTable tr          text=Operating Systems

[**] Log
[**] Log Created: 2023/03/22 22:25:53
[**] Log Level: INFO
[**] Log Message: Logging to: /home/user/Desktop/output.xml
[**] Log Level: INFO
[**] Log Message: Running test: Test Teacher Scenario
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport >> Viewport settings: width=1501, height=1104, deviceScaleFactor=1, isMobile=False, hasTouch=False, isLandscape=False
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport >> Viewport settings: width=1501, height=1104, deviceScaleFactor=1, isMobile=False, hasTouch=False, isLandscape=False >> Navigate
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport >> Viewport settings: width=1501, height=1104, deviceScaleFactor=1, isMobile=False, hasTouch=False, isLandscape=False >> Navigate >> Navigate to: http://localhost:4680/tbuis/index.jsp
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport >> Viewport settings: width=1501, height=1104, deviceScaleFactor=1, isMobile=False, hasTouch=False, isLandscape=False >> Navigate >> Navigate >> Title: University information system
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport >> Viewport settings: width=1501, height=1104, deviceScaleFactor=1, isMobile=False, hasTouch=False, isLandscape=False >> Navigate >> Navigate >> URL: http://localhost:4680/tbuis/index.jsp
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Set Viewport >> Viewport settings: width=1501, height=1104, deviceScaleFactor=1, isMobile=False, hasTouch=False, isLandscape=False >> Navigate >> Navigate >> Done: True
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Click: id=tea.menu.mySubjects
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Text: My Subjects
[**] Log Level: INFO
[**] Log Message: Test Teacher Scenario: Test Case: Test Teacher Scenario >> Open My Subjects >> Open My Subjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Text: My Subjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click Element: id=tea.menu.mySubjects >> Element: id=tea.menu.mySubjects >> Click: id=tea.menu.mySubjects >> Click