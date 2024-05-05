*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
${URL}          http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Test Check Teachers
    [Documentation]          Check if the names and course are present on the page

    Set Viewport            1501, 1104, 1, False, False, False
    Go To                    ${URL}

    [Teardown]               Close Browser

    ${names}                 Create List
    ${names}[0]              Set To             Julia Easyrider
    ${names}[1]              Set To             Olivia Keen
    ${names}[2]              Set To             John Lazy
    ${names}[3]              Set To             Alice Pedant
    ${names}[4]              Set To             Thomas Scatterbrained
    ${names}[5]              Set To             Peter Strict

    ${i}                     Set To             0

    *** For *** ${names}
    ***     Step ***
    ***         Check Title
    ***             Title Should Be Equal To     University information system

    ***         Element Should Be Visible
    ***             Name                       Element checking names
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-${i}"]/td[1]

    ***         Text Should Be In Element
    ***             Name                       Element checking names
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-${i}"]/td[0]
    ***             Text                       ${names}[${i}]

    ***         Set Variable
    ***             Name                       course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-${i}"]/td[3]

    ***         If
    ***             Text Should Not Be Empty    course
    ***             Then
    ***         Else
    ***             Log                Skipped checking course for ${names[${i}]}
    ***         End

    ***         Should Contain
    ***             Text                       ${course}
    ***             Text                       Numerical Methods

    ***         If
    ***             ${i}                       Should Be Less Than        6
    ***         Else
    ***             Exit For
    ***         End

    ***         ${i}                         Set To                 ${i} + 1
    *** End

    *** Step ***
    ***         Element Should Be Visible
    ***             Name                       Element checking course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]

    ***         Text Should Be Equal To    Numerical Methods

    *** Step ***
    ***         Element Should Be Visible
    ***             Name                       Element checking course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]

    ***         Text Should Be Equal To    Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming

    *** Step ***
    ***         Element Should Be Visible
    ***             Name                       Element checking empty course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]

    ***         Text Should Be Empty

    *** Step ***
    ***         Element Should Be Visible
    ***             Name                       Element checking course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]

    ***         Text Should Be Equal To    Computer System Engineering, Database Systems, Operating Systems, Programming Techniques

    *** Step ***
    ***         Element Should Be Visible
    ***             Name                       Element checking course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]

    ***         Text Should Be Equal To    Computation Structures

    *** Step ***
    ***         Element Should Be Visible
    ***             Name                       Element checking course
    ***             Location                    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]

    ***         Text Should Be Equal To    Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance