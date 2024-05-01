*** Settings ***
Library                SeleniumLibrary
Browser                Chrome

*** Test Case ***
My Subjects Checks
    [Document]                        set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]                        Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Element]                          Login                  Login Locator
    [Element]                          Username               Username Locator
    [Element]                          Password               Password Locator
    [Element]                          Login Button          Login Button Locator

    [Element]                          My Subjects Button    My Subjects Button Locator
    [Document]                        Go To                   url=http://localhost:4680/tbuis/student-view/mySubjects
    [Element]                          Wait Until Element Is Visible             id=stu.mySubjects.successAlert
    [Element]                          Wait Until Element Is Visible             id=stu.mySubjects.enrolledTable.Title
    [Element]                          Wait Until Element Is Not Visible          xpath=//td[.='Database Systems']

    [Element]                          Students Button         Students Button Locator
    [Document]                        Go To                   url=http://localhost:4680/tbuis/teacher-view/mySubjects
    [Element]                          Wait Until Element Is Visible             id=tea.mySubjects.table.listOfStudentsButton-1
    [Element]                          Wait Until Element Is Visible             id=tea.mySubjects.table.listOfStudentsButton-1
    [Element]                          Wait Until Element Is Visible             id=tea.mySubjects.table.participantsButton-1-0
    [Element]                          Wait Until Element Is Visible             id=tea.mySubjects.table.participantsButton-1-0
    [Element]                          Wait Until Element Is Visible             id=tea.setEvaluation.form.noOneStudent
    [Element]                          Wait Until Element Is Visible             xpath=//td[.='No students on this exam date']

My Exam Dates Checks
    [Document]                        Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Element]                          Login                  Login Locator
    [Element]                          Username               Username Locator
    [Element]                          Password               Password Locator
    [Element]                          Login Button          Login Button Locator

    [Element]                          My Exam Dates Button  My Exam Dates Button Locator
    [Document]                        Go To                   url=http://localhost:4680/tbuis/teacher-view/myExamDates
    [Element]                          Wait Until Element Is Visible             id=tea.myExamDates.table.participantsButton-1-0
    [Element]                          Wait Until Element Is Visible             id=tea.myExamDates.table.participantsButton-1-0

Set Evaluation Checks
    [Document]                        Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Element]                          Login                  Login Locator
    [Element]                          Username               Username Locator
    [Element]                          Password               Password Locator
    [Element]                          Login Button          Login Button Locator

    [Element]                          My Subjects Button    My Subjects Button Locator
    [Document]                        Go To                   url=http://localhost:4680/tbuis/student-view/mySubjects
    [Element]                          Wait Until Element Is Visible             id=stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    [Element]                          Wait Until Element Is Visible             id=stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    [Document]                        Go To                   url=http://localhost:4680/tbuis/teacher-view/setEvaluation
    [Element]                          Wait Until Element Is Visible             id=tea.setEvaluation.form.subjectSelect
    [Element]                          Wait Until Element Is Visible             id=tea.setEvaluation.form.noOneStudent

Evaluation Table Checks
    [Document]                        Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Element]                          Login                  Login Locator
    [Element]                          Username               Username Locator
    [Element]                          Password               Password Locator
    [Element]                          Login Button          Login Button Locator

    [Element]                          My Subjects Button    My Subjects Button Locator
    [Document]                        Go To                   url=http://localhost:4680/tbuis/student-view/mySubjects
    [Element]                          Wait Until Element Is Visible             id=stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    [Element]                          Wait Until Element Is Visible             id=stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    [Document]                        Go To                   url=http://localhost:4680/tbuis/teacher-view/evaluationTable
    [Element]                          Wait Until Element Is Visible             id=tea.evalTable.filter.subjectSelect
    [Element]                          Wait Until Element Is Visible             xpath=//td[.='No students on this exam date']

*** Keywords ***
Login Locator
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//input[contains(@id,'userNameInput')]

Username Locator
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//input[contains(@id,'userNameInput')]

Password Locator
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//input[contains(@id,'passwordInput')]

Login Button
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'Login')]

My Subjects Button Locator
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'My Subjects')]

My Subjects Button Locator for Teacher
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'My Subjects')]

My Exam Dates Button Locator
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'My Exam Dates')]

My Exam Dates Button Locator for Teacher
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'My Exam Dates')]

Students Button
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'Students')]

Set Evaluation Button
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'Set Evaluation')]

Set Evaluation Button for Teacher
    [Arguments]    {}
    [Returns]      Element
    [Document]     xpath=//button[contains(@id,'Set Evaluation')]

*** Variables ***
Login
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Username Locator
    [Document]     Password Locator
    [Document]     Login Button
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            Login Button

Teacher Login
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Username Locator
    [Document]     Password Locator
    [Document]     Login Button
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            Login Button
    [Document]     Change Value            Username     pierce
    [Document]     Key Down                Tab
    [Document]     Key Up                   Tab
    [Document]     Change Value            Password     pass
    [Document]     Key Down                Enter

My Subjects
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            My Subjects Button

My Subjects for Teacher
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            My Subjects Button

My Exam Dates
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            My Exam Dates Button

My Exam Dates for Teacher
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            My Exam Dates Button

Evaluation Table
    [Document]     [Arguments]    {}
    [Document]     [Returns]      Element
    [Document]     Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Document]     Go To                   url=http://localhost:4680/tbuis/index.jsp
    [Document]     Click Element            My Subjects Button
    [Document]     Click Element            My Subjects Button
    [Document]     Click Element            Set Evaluation Button
    [Document]     Click Element            Subject Select
    [Document]     Click Element            Filter Button

*** Teardown ***
Close Browser