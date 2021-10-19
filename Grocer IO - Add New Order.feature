Feature: Grocer IO - Add New Order

    Background:
        Given I import scenarios from "Grocer IO - Add New Order Steps.feature"
        And "I stage test data to add a new order"

    After Scenario:
        When "I logout of Grocer IO"

	Scenario: Add New Order
        Given "I am logged into the Grocer IO site"
        And "the Orders page is displayed"
        When "I click the Add Order button"
        And "I enter valid new order information"
        And "I click the Add button on the Add New Order window"
        Then "the newly added order appears in the order list on the Order page"