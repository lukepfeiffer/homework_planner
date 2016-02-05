Feature: Assignment
  Scenario: User view his or her own assignment
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name        | Course Name |
    And that course has the following assignment:
      | name        | Cool Name        |
      | description | Some Description |
    And I sign in as a user

    Then I should see "Cool Name"
    And I should see "Some Description"

  Scenario: User creates new assignment
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name        | Course Name |
    And I sign in as a user

    When I fill in "assignment_name" with "Foo"
    And I fill in "assignment_time_approximation" with "1.25"
    And I fill in "Due date" with "09/22/1997"
    And I press "Add Assignment"

    # Then I should see "Foo"
    # And I should see "1.25"

  # Scenario: User deletes assignment
    # Given the following user:
    #   | email    | email@example.com |
    #   | password | password          |
    # And that user has the following course:
    #   | name        | Course Name |
    # And that course has the following assignment:
    #   | name        | Cool Name        |
    #   | description | Some Description |
    # And I sign in as a user

    # When I press "Delete"
    # Then I should not see "Cool Name"
