Feature: User
  Scenario: User signs up with courses
    Given I am on the home page
    And I fill in "user_email" with "email@example.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Sign Up"

    Then I should be on the "/assignments" page

  Scenario: User signs in with some courses
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name         | course name  |
      | teacher_name | teacher name |
    And I am on the home page
    When I fill in "email" with "email@example.com"
    And I fill in "password" with "password"
    And I press "Sign In"

    Then I should be on the "/assignments" page

  Scenario: User signs in without any courses
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And I am on the home page
    When I fill in "email" with "email@example.com"
    And I fill in "password" with "password"
    And I press "Sign In"

    Then I should be on the "/courses" page
