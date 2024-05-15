*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Case ***
Open Page
    [Document]        http://localhost:4680/tbuis/index.jsp
    [Actions]         Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Actions]         Go To                ${URL}
    [Assert]         Title Is               University information system

Login As Student
    [Actions]         Click Element               selector=//*[@id="header.link.login"]
    [Actions]         Input Text                target=//*[@id="loginPage.userNameInput"]    ${username}
    [Actions]         Input Text                target=//*[@id="loginPage.passwordInput"]    ${password}
    [Actions]         Key Down                target=//*[@id="loginPage.loginFormSubmit"]    Tab
    [Actions]         Key Up                target=//*[@id="loginPage.loginFormSubmit"]    Tab
    [Actions]         Click Element               selector=//*[@id="loginPage.loginFormSubmit"]
    [Assert]         Title Is               Student's View

Check Other Subjects Enrollment
    [Actions]         Click Element               selector=//*[@id="stu.menu.otherSubjects"]
    [Actions]         Click Element               selector=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    [Actions]         Sleep                   1s
    [Assert]         Element Should Exist         selector=//*[@id="stu.otherSubjects.successAlert"]

Go To My Subjects
    [Actions]         Click Element               selector=//*[@id="stu.menu.mySubjects"]
    [Assert]         Title Is               Student's View

Check My Subjects Table
    [Actions]         Sleep                   2s
    [Actions]         Click Element               selector=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    [Assert]         Element Should Contain         text=Students (2)
    [Actions]         Sleep                   2s
    [Assert]         Element Should Exist         selector=//*[.="Software Quality Assurance"]/ancestor::tr[1]/descendant::td[2][.="Peter Strict"]

*** Test Case ***
Open Page
    [Document]        http://localhost:4680/tbuis/index.jsp
    [Actions]         Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    [Actions]         Go To                ${URL}
    [Assert]         Title Is               University information system

Login As Teacher
    [Actions]         Click Element               selector=//*[@id="header.link.login"]
    [Actions]         Input Text                target=//*[@id="loginPage.userNameInput"]    ${username}
    [Actions]         Input Text                target=//*[@id="loginPage.passwordInput"]    ${password}
    [Actions]         Key Down                target=//*[@id="loginPage.loginFormSubmit"]    Tab
    [Actions]         Key Up                target=//*[@id="loginPage.loginFormSubmit"]    Tab
    [Actions]         Click Element               selector=//*[@id="loginPage.loginFormSubmit"]
    [Assert]         Title Is               Teacher's View

Check My Subjects Students
    [Actions]         Click Element               selector=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    [Assert]         Element Should Contain         text=Students (2)
    [Actions]         Sleep                   2s
    [Actions]         Click Element               selector=//*[.="Students (2)"]
    [Actions]         Sleep                   2s
    [Assert]         Element Should Exist         selector=//*[.="William Maroon"]

*** Teardown ***
[Document]         Close Browser