Feature: Get Api demo
  Background:
    * url 'https://reqres.in/api'
    * headers Accept = 'application/json'

  Scenario: Get demo1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
#Get with Assertion
    Scenario: Get Demo2
      Given path '/users?'
      When method GET
      Then status 200
      And print response
      And match response.data[0].name !=null
      And match response.data[0].name =='cerulean'
      And assert response.data.length == 10


