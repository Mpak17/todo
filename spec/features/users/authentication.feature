@javascript

Feature: User Authentication
  Background:
    Given I'm open home page
    And User with email 'mpak111@gmail.com' and password '111111' exists

  Scenario: User login into application
    When I click 'Login' link
    Then I fill 'Email' field with 'mpak111@gmail.com'
    And I fill 'Password' field with '111111'
    Then I click 'Log in' button
    And I should see 'Notice' flash message 'Signed in successfully.'
    And I should see email 'mpak111@gmail.com'

  Scenario: User see error message
    When I click 'Login' link
    Then I fill 'Email' field with 'mpak111@gmail.com'
    And I fill 'Password' field with '12'
    Then I click "Log in" button
    And I should see 'Alert' flash message 'Invalid Email or password.'

  Scenario: User registration
    When I click 'Sign up' link
    Then I fill 'Email' field with 'mpak777@gmail.com'
    And I fill 'Password' field with '777777'
    And I fill 'Password_confirmation' field with '777777'
    Then I click 'Sign up' button
    And I should see 'Notice' flash message 'Welcome! You have signed up successfully.'
    And I should see email 'mpak777@gmail.com'

  Scenario: User logout
    When User with email 'mpak111@gmail.com' and password '111111' logged in
    Then I click 'Logout' link
    And I should see 'Notice' flash message 'Signed out successfully.'

  Scenario: User recovery password
    When I click 'Login' link
    Then I click 'Forgot your password?' link
    And I fill 'Email' field with 'mpak111@gmail.com'
    Then I click 'Send me reset password instructions' button
    And I click reset password link for 'mpak111@gmail.com'
    Then I fill 'Password' field with '11111111'
    And I fill 'Password_confirmation' field with '11111111'
    Then I click 'Change my password' button
    And I should see 'Notice' flash message 'Your password has been changed successfully. You are now signed in.'
    And I should see email 'mpak111@gmail.com'
