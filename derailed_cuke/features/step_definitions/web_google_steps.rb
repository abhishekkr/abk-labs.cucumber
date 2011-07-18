When /^I google derailed_cuke$/ do
	fill_in('q',:with => 'abhishekkr github derailed_cuke')      
#        find(:xpath, "//input[@name='btnG']").native.send_keys(:return)
end

Then /^I see required content on page$/ do
	page.should have_xpath('//input[@title="Search"]')
end
