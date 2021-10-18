Feature: Grocer IO - Add New Order Steps

    @wip
    Scenario: Stage Test Data
        Given I "assign my credentials data"
        	And I assign "dan.guilliams@cycle.io" to variable "username"
        	And I assign "password" to variable "password"
        
        Then I "assign my customer data"
        	Given I assign "Elvis Presley" to variable "customer_name"
        	When I assign 9001 to variable "order_number"
        	Then I assign "$3.50" to variable "price"

	@wip
	Scenario: the Orders page is displayed  
        Given I "have credentials and am ready to login to the site"
            Then I execute scenario "Login to Grocer IO"
	
    @wip
    Scenario: I click the Add Order button    
        Then I "click 'Add Order'"
            Then I click element "text:Add order" in web browser within 10 seconds
            Once I see "Add new order" in web browser
	
    @wip
    Scenario: I set the basic new order information    
        Given I "am on the screen to enter the order information"
            Then I execute scenario "Enter Order Information"
	
    @wip 
    Scenario: I click the Add button on the Add New Order window
        Then I click element "xPath://button[text()='Add']" in web browser within 10 seconds
        Once I do not see element "xPath://button[text()='Add']" in web browser
        
    @wip
    Scenario: the newly added order appears in the order list on the Order page
        Then I assign variable "element_order_number" by combining "xPath://div[@column='0']//div[@aria-rowindex='1' and text()='" $order_number "']"
			Once I see element $element_order_number in web browser
            
		Then I assign variable "element_customer_name" by combining "xPath://div[@column='2']//div[@aria-rowindex='1' and text()='" $customer_name "']"
			Once I see element $element_customer_name in web browser      
      
		Then I assign variable "element_price" by combining "xPath://div[@column='3']//div[@aria-rowindex='1' and text()='" $price "']"
			Once I see element $element_price in web browser
       
    @wip
    Scenario: Login to Grocer IO
        Given I "navigate to the site's login page"
            Given I open "Chrome" web browser
            When I navigate to "https://cyclelabs.io/playground/#!/login" in web browser
            Then I see element "xPath://label[text()='Email']" in web browser within 10 seconds

        Then I "enter my email and login"
            Given I type $username in element "xPath://input[1]" in web browser within 10 seconds
            When I press keys TAB in web browser
            Then I type $password in web browser
            And I click element "text:Login" in web browser
            Once I do not see element "text:Login" in web browser
            And I "have successfully logged in"
    
    @wip
    Scenario: Logout of Grocer IO
        Given I click element "className:user" in web browser within 10 seconds
        When I click element "text:Logout" in web browser within 10 seconds
        Once I see element "text:Email" in web browser
        Then I "have successfully logged out"
		And I close web browser
        
    @wip
    Scenario: Enter Order Information
        Given I "enter the customer name"
            Then I type $customer_name in element "xPath://div[@view_id='order_customer']//input" in web browser within 10 seconds

        When I "enter the order number"
            Then I type $order_number in element "xPath://div[@view_id='order']//input" in web browser within 10 seconds

        Then I "enter the price"
            Then I type $price in element "xPath://div[@view_id='order_price']//input" in web browser within 10 seconds
