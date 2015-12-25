Feature: Courses
  Scenario: User views his or her courses
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name        | Course Name |
      | description | Cool Class  |
    When I sign in as a user
    And I follow "Courses"

    Then I should see "Course Name"
    And I should see "Cool Class"
