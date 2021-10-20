Feature: Grocer IO - Add New Order Steps

	@wip
	Scenario: I stage test data to add a new order
		When I "assign my credentials data"
			When I assign "courtney.montgomery@cyclelabs.io" to variable "username"
			And I assign "hunter13" to variable "password"
		
		When I "assign my customer data"
			When I assign "Elvis Presley" to variable "customer_name"
			And I assign 9001 to variable "order_number"
			And I assign "$350.00" to variable "price"

	@wip
	Scenario: I am logged into the Grocer IO site
		Given I "have navigated to the site's login page"
			When I open "Chrome" web browser
			And I navigate to "https://cyclelabs.io/playground" in web browser
			And I see element "text:Email" in web browser within 10 seconds

		When I "enter my credentials and login"
			When I type $username in element "name:email_login" in web browser within 10 seconds
            And I type $password in element "xPath://input[@type='password']" in web browser within 10 seconds
			And I click element "text:Login" in web browser
			Once I do not see element "text:Login" in web browser

	@wip
	Scenario: the Orders page is displayed  
		Then I see element "text:Orders" in web browser within 10 seconds
	
	@wip
	Scenario: I click the Add Order button
		When I click element "text:Add order" in web browser within 10 seconds
		Once I see "Add new order" in web browser
	
	@wip
	Scenario: I enter valid new order information
		When I type $customer_name in element "name:order_customer" in web browser within 10 seconds
		And I type $order_number in element "name:order_number" in web browser within 10 seconds
	    And I type $price in element "name:order_price" in web browser within 10 seconds

	@wip 
	Scenario: I click the Add button on the Add New Order window
		When I click element "xPath://button[text()='Add']" in web browser within 10 seconds
		Once I do not see element "xPath://button[text()='Add']" in web browser
		
	@wip
	Scenario: the newly added order appears in the order list on the Order page
        Then I see $order_number in web browser within 10 seconds
        And I see $customer_name in web browser within 10 seconds
        And I see $price in web browser within 10 seconds

	@wip 
	Scenario: I logout of Grocer IO
		When I click element "className:user" in web browser within 10 seconds
		And I click element "text:Logout" in web browser within 10 seconds
        And I see element "text:Email" in web browser within 10 seconds
		And I close web browser        