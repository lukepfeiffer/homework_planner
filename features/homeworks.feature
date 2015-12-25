Feature: Homework
  Scenario: User view his or her own homework
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following homework:
      | name        | Cool Name        |
      | description | Some Description |
    And I sign in as a user

    Then I should see "Cool Name"
    And I should see "Some Description"
