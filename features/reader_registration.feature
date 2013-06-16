Feature:
  In order to sign up to use the library application
  As a library user
  I want to register with the application

  Scenario: Reader registers successfully via register form
    Given I am a guest
    When I fill the register form with valid data
    Then I should be registered in the application
    And I should be logged in