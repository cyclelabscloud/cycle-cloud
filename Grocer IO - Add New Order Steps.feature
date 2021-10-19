Feature: Grocer IO - Add New Order Steps

	@wip
	Scenario: I stage test data to add a new order
		When I "assign my credentials data"
			When I assign "dan.guilliams@cycle.io" to variable "username"
			And I assign "password" to variable "password"
		
		When I "assign my customer data"
			When I assign "Elvis Presley" to variable "customer_name"
			And I assign 9001 to variable "order_number"
			And I assign "$3.50" to variable "price"

	@wip
	Scenario: I am logged into the Grocer IO site
		Given I "have navigated to the site's login page"
			When I open "Chrome" web browser
			And I navigate to "https://cyclelabs.io/playground/#!/login" in web browser
			And I see element "xPath://label[text()='Email']" in web browser within 10 seconds

		When I "enter my credentials and login"
			When I type $username in element "xPath://input[1]" in web browser within 10 seconds
			And I press keys TAB in web browser
			And I type $password in web browser
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
		When I type $customer_name in element "xPath://div[@view_id='order_customer']//input" in web browser within 10 seconds
		And I type $order_number in element "xPath://div[@view_id='order']//input" in web browser within 10 seconds
	    And I type $price in element "xPath://div[@view_id='order_price']//input" in web browser within 10 seconds

	@wip 
	Scenario: I click the Add button on the Add New Order window
		When I click element "xPath://button[text()='Add']" in web browser within 10 seconds
		Once I do not see element "xPath://button[text()='Add']" in web browser
		
	@wip
	Scenario: the newly added order appears in the order list on the Order page
        When I "assign the locators to confirm the order information"
    		When I assign variable "element_order_number" by combining "xPath://div[@column='0']//div[@aria-rowindex='1' and text()='" $order_number "']"
            And I assign variable "element_customer_name" by combining "xPath://div[@column='2']//div[@aria-rowindex='1' and text()='" $customer_name "']"
            And I assign variable "element_price" by combining "xPath://div[@column='3']//div[@aria-rowindex='1' and text()='" $price "']"

        Then I "see the expected order information on the screen"
            Then I see element $element_order_number in web browser within 10 seconds
            And I see element $element_customer_name in web browser within 10 seconds
            And I see element $element_price in web browser within 10 seconds

	@wip 
	Scenario: I logout of Grocer IO
		When I click element "className:user" in web browser within 10 seconds
		And I click element "text:Logout" in web browser within 10 seconds
        And I see element "text:Email" in web browser within 10 seconds
		And I close web browser