*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
${URL}         http://localhost:4680/tbuis/index.jsp

*** Test Case ***
Verify Teacher Page
    [Document]         Set Document      ${URL}
    [Document]         Go To Page

    ${names}         Get Elements      //*[@id="tea.listOfAllTeachers.table"]/tr/td[1]
    [Document]         Set List         ${names}

    ${names}         Filter From List  ${names}  Julia Easyrider  Olivia Keen  John Lazy  Alice Pedant  Thomas Scatterbrained  Peter Strict
    [Document]         Should Be True    ${names}

    ${teacher_1}      Get Element      //*[@id="tea.listOfAllTeachers.table.teacherRow-0"]/td[3]
    [Document]         Should Contain    ${teacher_1}         Numerical Methods

    ${teacher_2}      Get Element      //*[@id="tea.listOfAllTeachers.table.teacherRow-1"]/td[3]
    [Document]         Should Contain    ${teacher_2}         Database Systems, Fundamentals of Computer Networks, Introduction to Algorithms, Mobile Applications, Web Programming

    ${teacher_3}      Get Element      //*[@id="tea.listOfAllTeachers.table.teacherRow-2"]/td[3]
    [Document]         Should Not Contain ${teacher_3}

    ${teacher_4}      Get Element      //*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    [Document]         Should Contain    ${teacher_4}         Computer System Engineering, Database Systems, Operating Systems, Programming Techniques

    ${teacher_5}      Get Element      //*[@id="tea.listOfAllTeachers.table.teacherRow-4"]/td[3]
    [Document]         Should Contain    ${teacher_5}         Computation Structures

    ${teacher_6}      Get Element      //*[@id="tea.listOfAllTeachers.table.teacherRow-5"]/td[3]
    [Document]         Should Contain    ${teacher_6}         Operating Systems, Programming in Java, Software Engineering, Software Quality Assurance

    [Document]         Close Browser