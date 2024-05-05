*** Settings ***
Library         SeleniumLibrary
Browser         Chrome

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Verify Teacher List
    [Documentation]         Verify presence of names and course on the teacher list page

    [Tags]         teacher list

    [Preparation]         Open browser
    Open Browser            ${URL}

    [Step]         Wait until page is loaded
    Sleep              5

    [Step]         Check presence of names
    For               ${name}         In         [ "Julia Easyrider"  "Olivia Keen"  "John Lazy"  "Alice Pedant"  "Thomas Scatterbrained"  "Peter Strict" ]
    ${found}               =    Get Element    //td[contains(text(),${name})]
    Assert        ${found}            Is Not Empty

    [Step]         Check course names
    Get Element            course-name-0            //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    Assert            Text Matches            Numerical Methods            ${course-name-0}

    Get Element            course-name-1            //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    Assert            Text Matches            Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming            ${course-name-1}

    Get Element            course-name-2            //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    Assert            Is Empty               ${course-name-2}

    Get Element            course-name-3            //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Assert            Text Matches            Computer System Engineering, Database Systems, Operating Systems, Programming Techniques            ${course-name-3}

    Get Element            course-name-4            //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    Assert            Text Matches            Computation Structures            ${course-name-4}

    Get Element            course-name-5            //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    Assert            Text Matches            Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance            ${course-name-5}

    [Step]         Close browser
    Close Browser