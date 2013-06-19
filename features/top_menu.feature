Feature:
  In order to have quick access to user role functionality
  As a library app user
  I want to have a menu with links on every page

  Scenario: Guest user
    Given I am a guest
    When I go to the home page
    Then I should see guest menu

  Scenario: Reader
    Given I am "john@reader.com" reader
    When I go to the home page
    Then I should see "john@reader.com" reader menu