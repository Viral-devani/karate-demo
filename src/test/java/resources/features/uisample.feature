Feature: To demostrate the UI Automation using karate
  Background: Configure Driver
    Given driver "https://demo.nopcommerce.com/"
Scenario: Verify the title of the page
  Then match driver.title=='nopCommerce demo store'
  Scenario: Verify user navigate to login page
    When click("//a[contains(text(),'Log in')]")
    * def actualText = text("//h1[contains(text(),'Welcome, Please Sign In!')]")
    Then match actualText == "Welcome, Please Sign In!"

    Scenario: Verify the error message when entering wrong credentials
      When click("//a[contains(text(),'Log in')]")
      And input("#Email","prime123@gmail.com")
      * delay(1000)
      And input("#Password","Prime123")
      And click("//button[contains(text(),'Log in')]")
      * def actualErrorMessage = text ("/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[1]")
      * delay(1000).screenshot()
      Then match actualErrorMessage == "Login was unsuccessful. Please correct the errors and try again.No customer account found\n"


