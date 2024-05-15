*** Settings ***
Library         SeleniumLibrary
Selenium         C:/path/to/chromedriver.exe
Browser          Chrome

*** Variables ***

*** Test Cases ***

Scenario: Check presence of specific names
    [Documentation]         This scenario opens the page with the given URL, checks for presence of specific names
    [Tags]                  regression, functional

    [Preparation]
    Set Up

    [Steps]
    ${json} = ${json} FROM JSON '{"steps": [
                        %{Set Viewport}
                        %{Navigate}    http://localhost:4680/tbuis/index.jsp
                        %{Click}       xpath///*[@id="header.link.login"]
                        %{Click}       xpath///*[@id="loginPage.userNameInput"]
                        %{Input}        username        pedant
                        %{Click}       xpath///*[@id="loginPage.passwordInput"]
                        %{Input}        password        pass
                        %{Click}       xpath///*[@id="loginPage.loginFormSubmit"]
                        %{Click}       xpath///*[@id="tea.menu.mySubjects"]
                        %{Click}       xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
                        %{Click}       xpath///*[@id="closeModalButtonCross"]
                        %{Click}       xpath///*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
                        %{Wait}         5s
                        %{AssertKeyword} Text Present           No students
                    ]}'

    [Steps]
    ${present_benjamin} = ${ElementIsVisible}    xpath///*[@class="name"][contains(text(), 'Benjamin Green')]
    ${present_mia} = ${ElementIsVisible}    xpath///*[@class="name"][contains(text(), 'Mia Orange')]
    ${present_charlotte} = ${ElementIsVisible}    xpath///*[@class="name"][contains(text(), 'Charlotte Purple')]
    ${present_isabella} = ${ElementIsVisible}    xpath///*[@class="name"][contains(text(), 'Isabella Yellow')]

    [Steps]
    ${all_present} = ${And}    ${present_benjamin}    ${present_mia}    ${present_charlotte}    ${present_isabella}

    [Steps]
    ${AssertTrue}    ${all_present}

    [Teardown]
    Tear Down

    [Documentation]         This scenario closes the browser