Feature: Grocer IO - Add New Order

    Background:
        Given I import scenarios from "Grocer IO - Add New Order Steps.feature"
        Then I execute scenario "Stage Test Data"

    After Scenario:
        Then I "logout"
            Then I execute scenario "Logout of Grocer IO"

	Scenario: Add New Order
        Given "the Orders page is displayed"
        When "I click the Add Order button"
        And "I set the basic new order information"
        And "I click the Add button on the Add New Order window"
        Then "the newly added order appears in the order list on the Order page"
		