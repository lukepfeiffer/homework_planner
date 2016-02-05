Feature: Courses
  Scenario: User views his or her courses
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name        | Course Name |
    And I sign in as a user
    And I follow "Courses"

    Then I should see "Course Name"

  Scenario: User creates new course
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And I sign in as a user
    And I follow "Courses"

    When I fill in "course_name" with "Course"
    And I fill in "Teacher name" with "Teacher"
    And I fill in "Start time" with "1:00 PM"
    And I fill in "End time" with "2:00 PM"
    And I press "Add Course"

    Then I should see "Course"
    And I should see "Teacher"

  # Scenario: User delete course
  #   Given the following user:
  #     | email    | email@example.com |
  #     | password | password          |
  #   And that user has the following course:
  #     | name        | Course Name |
  #   And I sign in as a user
  #   And I follow "Courses"

  #   When I press "Delete"

  #   Then I should not see "Course Name"
