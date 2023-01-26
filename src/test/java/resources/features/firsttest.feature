Feature: Sample Api Test
  Scenario: Test a sample Get Api
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200