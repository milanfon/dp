*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
URL            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***

Test Student
    [Documentation] Test student scenario

    [Tags] student

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate To             ${URL}

    [Actions]
    Set Title             University information system

    Click                main
    [Find]
    Name                Login
    [Options]
    offset_y=22
    offset_x=33.671875
    [End]

    Set Title             Login Page

    Click                main
    [Find]
    Name                Username
    [Options]
    offset_y=24
    offset_x=239.5
    [End]

    Input                main
    [Find]
    Name                Username
    [End]
    Value                maroon

    KeyDown             main
    Key                Tab

    KeyUp               main
    Key                Tab

    Click                main
    [Find]
    Name                Password
    [Options]
    offset_y=14
    offset_x=201.5
    [End]

    Input                main
    [Find]
    Name                Password
    [End]
    Value                pass

    KeyDown             main
    Key                Enter

    KeyUp               main
    Key                Enter

    Click                main
    [Find]
    Name                Other Subjects
    [Options]
    offset_y=20
    offset_x=84.5
    [End]

    Click                main
    [Find]
    Name                Enroll button
    [Options]
    offset_y=20.40625
    offset_x=26.8125
    [End]

    Click                main
    [Find]
    Name                My Subjects
    [Options]
    offset_y=22
    offset_x=55.5
    [End]

    [Conditions]
    Title               My Subjects

    [Actions]
    Click                main
    [Find]
    Name                My Subjects table list of students button
    [Options]
    offset_y=12.40625
    offset_x=40.109375
    [End]

    [Conditions]
    Element Should Exist    //td[.='William Maroon']

Test Teacher
    [Documentation] Test teacher scenario

    [Tags] teacher

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False
    Navigate To             ${URL}

    [Actions]
    Set Title             University information system

    Click                main
    [Find]
    Name                Login
    [Options]
    offset_y=27
    offset_x=39.671875
    [End]

    Set Title             Login Page

    Click                main
    [Find]
    Name                Username
    [Options]
    offset_y=24
    offset_x=239.5
    [End]

    Input                main
    [Find]
    Name                Username
    [End]
    Value                strict

    Click                main
    [Find]
    Name                Password
    [Options]
    offset_y=14
    offset_x=201.5
    [End]

    Input                main
    [Find]
    Name                Password
    [End]
    Value                pass

    KeyDown             main
    Key                Enter

    KeyUp               main
    Key                Enter

    Click                main
    [Find]
    Name                My Subjects
    [Options]
    offset_y=26
    offset_x=75.5
    [End]

    [Conditions]
    Title               Teacher's View

    [Actions]
    Click                main
    [Find]
    Name                List of students button
    [Options]
    offset_y=12.40625
    offset_x=40.109375
    [End]

    [Conditions]
    Element Should Exist    //td[.='Students (2) ']

    [Actions]
    Click                main
    [Find]
    Name                Students button
    [End]

    [Conditions]
    Element Should Exist    //td[.='William Maroon']

Test Student_Teacher
    [Documentation] Test student and teacher scenarios

    [Tags] student_teacher

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False

    Navigate To             ${URL}

    [Actions]
    Set Title             University information system

    Click                main
    [Find]
    Name                Login
    [Options]
    offset_y=22
    offset_x=33.671875
    [End]

    Set Title             Login Page

    Click                main
    [Find]
    Name                Username
    [Options]
    offset_y=24
    offset_x=239.5
    [End]

    Input                main
    [Find]
    Name                Username
    [End]
    Value                maroon

    KeyDown             main
    Key                Tab

    KeyUp               main
    Key                Tab

    Click                main
    [Find]
    Name                Password
    [Options]
    offset_y=14
    offset_x=201.5
    [End]

    Input                main
    [Find]
    Name                Password
    [End]
    Value                pass

    KeyDown             main
    Key                Enter

    KeyUp               main
    Key                Enter

    Click                main
    [Find]
    Name                Other Subjects
    [Options]
    offset_y=20
    offset_x=84.5
    [End]

    Click                main
    [Find]
    Name                Enroll button
    [Options]
    offset_y=20.40625
    offset_x=26.8125
    [End]

    Click                main
    [Find]
    Name                My Subjects
    [Options]
    offset_y=22
    offset_x=55.5
    [End]

    [Conditions]
    Title               My Subjects

    [Actions]
    Click                main
    [Find]
    Name                My Subjects table list of students button
    [Options]
    offset_y=12.40625
    offset_x=40.109375
    [End]

    [Conditions]
    Element Should Exist    //td[.='William Maroon']

    Set Viewport            width=1501    height=1104    deviceScaleFactor=1    isMobile=False    hasTouch=False    isLandscape=False

    Navigate To             ${URL}

    [Actions]
    Set Title             University information system

    Click                main
    [Find]
    Name                Login
    [Options]
    offset_y=27
    offset_x=39.671875
    [End]

    Set Title             Login Page

    Click                main
    [Find]
    Name                Username
    [Options]
    offset_y=24
    offset_x=239.5
    [End]

    Input                main
    [Find]
    Name                Username
    [End]
    Value                strict

    Click                main
    [Find]
    Name                Password
    [Options]
    offset_y=14
    offset_x=201.5
    [End]

    Input                main
    [Find]
    Name                Password
    [End]
    Value                pass

    KeyDown             main
    Key                Enter

    KeyUp               main
    Key                Enter

    Click                main
    [Find]
    Name                My Subjects
    [Options]
    offset_y=26
    offset_x=75.5
    [End]

    [Conditions]
    Title               Teacher's View

    [Conditions]
    Element Should Exist    //td[.='Students (2) ']

    [Actions]
    Click                main
    [Find]
    Name                Students button
    [End]

    [Conditions]
    Element Should Exist    //td[.='William Maroon']

    [Teardown]
    Close Browser

*** Test Suite ***
Test Student_Teacher