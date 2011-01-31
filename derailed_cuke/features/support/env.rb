begin 
	require 'rspec/expectations'; 
rescue 
	LoadError; 
	require 'spec/expectations';
end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
#require 'capybara/session'
#require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript

# steps to use the XPath syntax.
#Capybara.default_selector = :css
Capybara.default_selector = :xpath
Capybara.default_driver = :selenium
Capybara.current_driver = :selenium
Capybara.javascript_driver = :selenium

#Capybara.app_host = "http://www.google.com"

World(Capybara)


