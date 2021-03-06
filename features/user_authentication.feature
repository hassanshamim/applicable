Feature: student authentication

  Scenario: Signed out students see appropriate links
    Given I am on the homepage
    Then I should see "Sign In"
    And I should see "Sign Up"
    And I should not see "Sign Out"

  Scenario: Signed in students see appropriate links
    Given I am signed in
    And I am on the homepage
    Then I should see "Sign Out"
    And I should not see "Sign In"
    And I should not see "Sign Up"

  Scenario: Signing up
    Given I am on the homepage
    When I click "Sign Up"
    And I fill in "eliza@example.com" for "Email"
    And I fill in "foobar" for "Password"
    And I fill in "foobar" for "Password confirmation"
    And I click "Sign up"
    Then I should see "Welcome! You have signed up successfully."

  Scenario: Signing up with non-matching passwords
    Given I am on the homepage
    When I click "Sign Up"
    And I fill in "eliza@example.com" for "Email"
    And I fill in "foobar" for "Password"
    And I fill in "notfoobar" for "Password confirmation"
    And I click "Sign up"
    Then I should see "doesn't match confirmation"

  Scenario: Logging in
    Given there is a student "eliza@example.com" with password "foobar"
    When I go to the homepage
    And I click "Sign In"
    And I fill in "eliza@example.com" for "Email"
    And I fill in "foobar" for "Password"
    And I click "Sign in"
    Then I should see "Signed in successfully."

  Scenario: Logging in with incorrect password
    Given there is a student "eliza@example.com" with password "notfoobar"
    When I go to the homepage
    And I click "Sign In"
    And I fill in "eliza@example.com" for "Email"
    And I fill in "foobar" for "Password"
    And I click "Sign in"
    Then I should see "Invalid email or password."
    And the "Email" field should contain "eliza@example.com"

  Scenario: Logging out
    Given I am signed in
    And I am on the homepage
    When I click "Sign Out"
    Then I should see "Signed out successfully."

