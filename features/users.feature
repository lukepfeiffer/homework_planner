Feature: User
  Scenario: User signs up
    Given I am on the home page
    And I fill in "user_email" with "email@example.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Sign Up"

    Then I should be on the "/homeworks" page

  Scenario: User signs in
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And I am on the home page
    When I fill in "email" with "email@example.com"
    And I fill in "password" with "password"
    And I press "Sign In"

    Then I should be on the "/homeworks" page
