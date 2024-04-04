 Here's a Robot Framework scenario that covers the given requirements:

```ruby
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
URL = http://localhost:4680/tbuis/index.jsp
USER_HOME_NOAH = Noah Brown
USER_HOME_JOHN = John Lazy
LOGIN_SELECTOR = #header.link.login
LOGOUT_SELECTOR = #header.link.logout
USER_HOME_NOAH_TITLE = Student's View
USER_HOME_JOHN_TITLE = Teacher's View
STUDENT_VIEW_NAV_QUERY = "#header.student-view-nav"
TEACHER_VIEW_NAV_QUERY = "#header.teacher-view-nav"

*** Test Cases ***

Scenario: Check user home pages for Noah Brown and John Lazy

  [Documentation]
  This scenario checks the user home pages for Noah Brown and John Lazy.

  [Tags]
  regression

  [Precondition]
  Set Viewport

  [Step]
  Navigate To ${URL}

  [Step]
  ${noah_logged_in} = Login As Noah Brown

  [Step]
  Should Not See Element ${LOGIN_SELECTOR}
  Should See Element Id=header.title.userHome
  Should Element Have Inner Text Id=header.title.userHome ${USER_HOME_NOAH}
  Should See Element ${STUDENT_VIEW_NAV_QUERY}

  [Step]
  Logout

  [Step]
  ${john_logged_in} = Login As John Lazy

  [Step]
  Should Not See Element Id=header.title.userHome
  Should See Element Id=header.title.userHome
  Should Element Have Inner Text Id=header.title.userHome ${USER_HOME_JOHN}
  Should See Element ${TEACHER_VIEW_NAV_QUERY}

  [Step]
  Logout

Scenario: Login with invalid credentials

  [Documentation]
  This scenario tries to login with invalid credentials "bla" and "pass" and then with "lazy" and "bla" and checks if the error alert is visible.

  [Tags]
  regression

  [Precondition]
  Set Viewport

  [Step]
  Navigate To ${URL}

  [Step]
  ${noah_logged_in} = Login As Noah Brown

  [Step]
  Should Not See Element Id=loginPage.errorAlert

  [Step]
  Login With Invalid Credentials bla pass

  [Step]
  Should See Element Id=loginPage.errorAlert

  [Step]
  Login With Invalid Credentials lazy bla

  [Step]
  Should See Element Id=loginPage.errorAlert

  [Step]
  Logout
```

The `Login As` and `Login With Invalid Credentials` are custom keywords that you need to implement using the SeleniumLibrary. These keywords should perform the login process using the provided selectors and credentials.