*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Case ***
My Exam Dates (Teacher)
    [Documentation] Test case for teacher to check My Exam Dates page

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate        http://localhost:4680/tbuis/index.jsp
    Login           username=scatterbrained    password=pass
    Click           main           xpath=//*[@id="tea.menu.myExamDates"]

    [Step]
    Click           main           xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep          3
    AlertTextEquals alert=//*[@id="tea.myExamDates.alert"]    Accept
    TitleEquals     My Exam Dates
    ElementShouldBeVisible     main           xpath=//*[@id="tea.myExamDates.successAlert"]

    [Step]
    Click           main           xpath=//*[@id="tea.menu.setEvaluation"]
    Click           main           xpath=//*[@id="tea.setEvaluation.form.noRecords"]

    [Step]
    Click           main           xpath=//*[@id="tea.menu.evaluationTable"]
    SelectFromList    main           id=tea.evalTable.filter.subjectSelect    label=-1
    Click           main           xpath=//*[@id="tea.evalTable.filter.submitButton"]
    TextShouldContain    main           id=tea.evalTable.filter.subjectSelect    No exam dates for this subject

My Exam Dates (Student)
    [Documentation] Test case for student to check My Exam Dates page

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate        http://localhost:4680/tbuis/index.jsp
    Login           username=orange    password=pass
    Click           main           xpath=//*[@id="stu.menu.myExamDates"]

    [Step]
    TitleShouldNotContain    Computation Structures

*** Test Case ***
Set Evaluation (Teacher)
    [Documentation] Test case for teacher to check Set Evaluation page

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate        http://localhost:4680/tbuis/index.jsp
    Login           username=scatterbrained    password=pass
    Click           main           xpath=//*[@id="tea.menu.setEvaluation"]

    [Step]
    Click           main           xpath=//*[@id="tea.setEvaluation.form.noRecords"]

Evaluation Table (Teacher)
    [Documentation] Test case for teacher to check Evaluation Table page

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate        http://localhost:4680/tbuis/index.jsp
    Login           username=scatterbrained    password=pass
    Click           main           xpath=//*[@id="tea.menu.evaluationTable"]

    [Step]
    Click           main           xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    SelectFromList    main           id=tea.evalTable.filter.subjectSelect    label=-1
    Click           main           xpath=//*[@id="tea.evalTable.filter.submitButton"]
    TextShouldContain    main           id=tea.evalTable.filter.subjectSelect    No exam dates for this subject

*** Test Case ***
Set Evaluation (Student)
    [Documentation] Test case for student to check Set Evaluation page

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate        http://localhost:4680/tbuis/index.jsp
    Login           username=orange    password=pass
    Click           main           xpath=//*[@id="tea.menu.setEvaluation"]

    [Teardown]
    Close Browser

*** Test Case ***
Evaluation Table (Student)
    [Documentation] Test case for student to check Evaluation Table page

    [Preparation]
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate        http://localhost:4680/tbuis/index.jsp
    Login           username=orange    password=pass
    Click           main           xpath=//*[@id="tea.menu.evaluationTable"]

    [Teardown]
    Close Browser