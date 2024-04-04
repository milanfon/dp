 Here's a Robot Framework scenario that covers the given requirements. I assumed you're using a library like `SeleniumLibrary` for interacting with the web page.

```python
*** Settings ***
Library SeleniumLibrary

*** Variables ***
URL = http://localhost:4680/tbuis/index.jsp
USER_HOME_NOAH = Noah Brown
USER_HOME_JOHN = John Lazy
LOGIN_ID = header.link.login
LOGOUT_ID = header.link.logout
USER_HOME_NOAH_TITLE = No user home for Noah Brown
USER_HOME_JOHN_TITLE = No user home for John Lazy
STUDENT_VIEW_NAV_QUERY = "#header.student-view-nav"
TEACHER_VIEW_NAV_QUERY = "#header.teacher-view-nav"

*** Test Cases ***
Scenario: Check user home pages for Noah and John
  [Documentation]
  This scenario checks the user home pages for Noah Brown and John Lazy.

  [Tags]
  @smoke

  Set Up:
    Open Browser ${URL}

  Log In As Noah:
    Click Element ${LOGIN_ID}
    Input Text #loginPage.userNameInput Noah Brown
    Input Text #loginPage.passwordInput pass
    Click Element #loginPage.loginFormSubmit
    Title Should Be User Home for Noah ${USER_HOME_NOAH_TITLE}
    Element Should Not Exist ${STUDENT_VIEW_NAV_QUERY}
    Element Should Exist ${LOGOUT_ID}

  Log In As John:
    Click Element ${LOGIN_ID}
    Input Text #loginPage.userNameInput John Lazy
    Input Text #loginPage.passwordInput pass
    Click Element #loginPage.loginFormSubmit
    Title Should Be User Home for John ${USER_HOME_JOHN_TITLE}
    Element Should Exist ${TEACHER_VIEW_NAV_QUERY}
    Element Should Exist ${LOGOUT_ID}

  Log In Fails:
    Click Element ${LOGIN_ID}
    Input Text #loginPage.userNameInput bla
    Input Text #loginPage.passwordInput pass
    Click Element #loginPage.loginFormSubmit
    Element Should Be Visible #loginPage.errorAlert

  Log In Fails:
    Click Element ${LOGIN_ID}
    Input Text #loginPage.userNameInput Lazy
    Input Text #loginPage.passwordInput bla
    Click Element #loginPage.loginFormSubmit
    Element Should Be Visible #loginPage.errorAlert

  Tear Down:
    Close Browser
```

This scenario covers the given requirements by logging in as Noah and John, checking their user home pages, and attempting to log in with invalid credentials.