*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
URL            http://localhost:4680/tbuis/index.jsp

*** Test Case: Student Enrollment and Teacher Verification ***

*** Set Up ***
Set Viewport       1501    1104    1
Navigate To          ${URL}
Set Teacher Username  strict
Set Teacher Password  pass

*** Student Enrollment ***
Click Element       main        aria/Login
Set Username         username
Set Password         pass
Click Element        main        aria/Username
Input Text          main        ${username}
Click Element        main        aria/Password
Input Text          main        ${password}
Click Element        main        aria/Login[role="button"]

Wait Until Element Is Visible        main        #stu.otherSubjects.table.enrollButton-10
Click Element        main        #stu.otherSubjects.table.enrollButton-10
Click Element        main        #stu.menu.otherSubjects
Click Element        main        #stu.menu.mySubjects

*** Check Enroll Success ***
[Document]        Set Element ID        stu.otherSubjects.successAlert
[Document]        Wait Until Element Is Visible        ${Element ID}
[Document]        Should Be Visible        ${Element ID}

*** Teacher Verification ***
Set Teacher View URL        http://localhost:4680/tbuis/teacher-view/mySubjects
Navigate To              ${Teacher View URL}
Set Teacher View Tab        Teacher's View

*** Check Teacher's My Subjects ***
Click Element        main        #tea.mySubjects.table.listOfStudentsButton-3
Should Contain        main        #tea.mySubjects.table        text=Students (2)

*** Check Student's Subjects ***
Click Element        main        #tea.mySubjects.table.listOfStudentsButton-3
Wait Until Element Is Visible        main        #stu.mySubjects.table
Should Contain        main        #stu.mySubjects.table        text=Software Quality Assurance
Should Contain        main        #stu.mySubjects.table        text=Peter Strict

*** Tear Down ***
Close Browser