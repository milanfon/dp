 ```ruby
*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Test Cases ***

Scenario1
    [Documentation]        Test scenario for student other subjects enrollment

    Set Viewport        1501        1104
    Set User Agent       Chrome/101.0.4951.41

    *** Set Up ***
    Navigate To        http://localhost:4680/tbuis/index.jsp
    Login             username=maroon       password=pass

    *** Test ***
    Click             #stu.menu.otherSubjects
    Click             #stu.otherSubjects.table.enrollButton-10
    Sleep            2s
    Element Should Be Visible             id=stu.otherSubjects.successAlert

    *** Tear Down ***
    Click             #stu.menu.mySubjects

    *** Set Up ***
    Set Viewport        1501        1104
    Set User Agent       Chrome/101.0.4951.41

    *** Test ***
    Click             #tea.menu.mySubjects
    Click             #tea.mySubjects.table.listOfStudentsButton-3
    Sleep            2s
    Element Should Contain             id=tea.mySubjects.table.listOfStudentsButton-3        text=Students (2)
    Click             #tea.mySubjects.table.listOfStudentsButton-3
    Sleep            2s
    Element Should Contain             text=William Maroon

    *** Tear Down ***
    Close Browser

Scenario2
    [Documentation]        Test scenario for teacher other subjects list

    Set Viewport        1501        1104
    Set User Agent       Chrome/101.0.4951.41

    *** Set Up ***
    Navigate To        http://localhost:4680/tbuis/index.jsp
    Login             username=strict       password=pass

    *** Test ***
    Click             #tea.menu.mySubjects
    Click             #tea.mySubjects.table.listOfStudentsButton-3
    Sleep            2s
    Element Should Contain             id=tea.mySubjects.table.listOfStudentsButton-3        text=Students (2)

    *** Tear Down ***
    Click             #tea.menu.mySubjects
    Click             #tea.menu.logout
    Close Browser

*** Keywords ***

Login
    [Arguments]        username        password
    [Documentation]        Logs in as a student with given username and password
    [Returns]        None
    [Tags]        @Login

    [Teardown]
    Log Out

Log Out
    [Documentation]        Logs out the user
    [Returns]        None
    [Tags]        @LogOut

    Click             #header.link.logout
    Sleep            1s
    Click             #header.link.login

[Documentation]        Logs out the user

[Documentation]        Waits for the specified time

[Documentation]        Waits for the specified element to be visible

[Documentation]        Waits for the specified element to be clickable

[Documentation]        Waits for the specified element to be present

[Documentation]        Waits for the specified element to be not present

[Documentation]        Waits for the specified element to be selected

[Documentation]        Waits for the specified element to be enabled

[Documentation]        Waits for the specified element to be disabled

[Documentation]        Waits for the specified element to have the specified text

[Documentation]        Waits for the specified element to have the specified CSS property

[Documentation]        Waits for the specified element to have the specified XPath expression

[Documentation]        Waits for the specified element to have the specified attribute

[Documentation]        Waits for the specified element to have the specified value for the specified attribute

[Documentation]        Waits for the specified element to have the specified class

[Documentation]        Waits for the specified element to have the specified title

[Documentation]        Waits for the specified element to have the specified text

[Documentation]        Waits for the specified element to have the specified href

[Documentation]        Waits for the specified element to have the specified inner text

[Documentation]        Waits for the specified element to have the specified alt text

[Documentation]        Waits for the specified element to have the specified source

[Documentation]        Waits for the specified element to have the specified display property

[Documentation]        Waits for the specified element to have the specified height

[Documentation]        Waits for the specified element to have the specified width

[Documentation]        Waits for the specified element to have the specified background color

[Documentation]        Waits for the specified element to have the specified color

[Documentation]        Waits for the specified element to have the specified font-size

[Documentation]        Waits for the specified element to have the specified font-family

[Documentation]        Waits for the specified element to have the specified border

[Documentation]        Waits for the specified element to have the specified padding

[Documentation]        Waits for the specified element to have the specified margin

[Documentation]        Waits for the specified element to have the specified scroll position

[Documentation]        Waits for the specified element to have the specified scrollable position

[Documentation]        Waits for the specified element to have the specified scrollable size

[Documentation]        Waits for the specified element to have the specified scrollable height

[Documentation]        Waits for the specified element to have the specified scrollable width

[Documentation]        Waits for the specified element to have the specified scrollable left

[Documentation]        Waits for the specified element to have the specified scrollable top

[Documentation]        Waits for the specified element to have the specified scrollable right

[Documentation]        Waits for the specified element to have the specified scrollable bottom

[Documentation]        Waits for the specified element to have the specified scrollable x

[Documentation]        Waits for the specified element to have the specified scrollable y

[Documentation]        Waits for the specified element to have the specified scrollable x offset

[Documentation]        Waits for the specified element to have the specified scrollable y offset

[Documentation]        Waits for the specified element to have the specified scrollable x position

[Documentation]        Waits for the specified element to have the specified scrollable y position

[Documentation]        Waits for the specified element to have the specified scroll position x

[Documentation]        Waits for the specified element to have the specified scroll position y

[Documentation]        Waits for the specified element to have the specified scrollable x percentage

[Documentation]        Waits for the specified element to have the specified scrollable y percentage

[Documentation]        Waits for the specified element to have the specified scrollable x offset percentage

[Documentation]        Waits for the specified element to have the specified scrollable y offset percentage

[Documentation]        Waits for the specified element to have the specified scrollable x percentage position

[Documentation]        Waits for the specified element to have the specified scrollable y percentage position

[Documentation]        Waits for the specified element to have the specified scrollable x position percentage

[Documentation]        Waits for the specified element to have the specified scrollable y position percentage

[Documentation]        Waits for the specified element to have the specified scrollable x percentage position percentage

[Documentation]        Waits for the specified element to have the specified scrollable y percentage position percentage

[Documentation]        Waits for the specified element to have the specified scrollable x percentage position percentage percentage

[Documentation]        Waits for the specified element to have the specified scrollable y percentage position percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage

[Documentation]        Waits for the specified element to have the specified scrollable percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x

[Documentation]        Waits for the specified element to have the specified scroll position percentage y

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage x percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage

[Documentation]        Waits for the specified element to have the specified scroll position percentage y percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage percentage