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

  @javascript
  Scenario: User creates new course
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And I sign in as a user
    And I follow "Courses"

    When I fill in "course_name" with "Science"
    And I fill in "Teacher name" with "Woeley"
    And I fill in "Start time" with "01:00 PM"
    And I fill in "End time" with "02:00 PM"
    And I press "Add Course"

    Then I should see "Science"
    And I should see "Woeley"

  @javascript
  Scenario: User delete course
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name        | Science |
    And I sign in as a user
    And I follow "Courses"

    When I press "Delete"
    And I confirm the dialogue

    Then I should not see "Science"

  @javascript
  Scenario: User edits course
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And that user has the following course:
      | name        | Science |
    And I sign in as a user
    And I follow "Courses"

    When I press "Edit"
    And I fill in "edit_course_name" with "English"
    And I press "Save"

    Then I should see "English"
