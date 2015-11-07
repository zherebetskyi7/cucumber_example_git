#name 'sweater' search field
When(/^I open likebylook\.com$/) do
  visit 'http://likebylook.com'
end
When(/^enter 'sweater' in search field$/) do
	fill_in('q', :with => 'sweater')
end
When(/^click on button 'search'$/) do
	click_button('Пошук')
end
Then(/^I show result search content$/) do
	expect(page).to have_content('Результати пошуку')
end


#random name search field
When(/^enter random name in search field$/) do
  fill_in('q', :with => Faker::Lorem.word)
end


#sub-menu women => clothes => dresses
When(/^choose main menu women$/) do
	find(:xpath, '//a[@href="http://likebylook.com/ua/zhinkam.html"]').hover
end
When(/^choose sub\-menu clothes$/) do
	find(:xpath, ('//a[@href="http://likebylook.com/ua/zhinkam/odyag.html"]')).hover
end
When(/^choose sub\-menu dresses$/) do
	find(:xpath, '//a[@href="http://likebylook.com/ua/zhinkam/odyag/sukni.html"]').click
end
Then(/^I show all women dresses$/) do
	expect(page).to have_content('Сукні')
end


#login the site scenario 1
When(/^I click on 'enter' button$/) do
  find(:xpath, '//a[@href="http://likebylook.com/ua/customer/account/login/"]').click
end
Then(/^I redirect to registration page$/) do
  expect(page).to have_content('Увійдіть в систему або Зареєструйтесь')
end
Then(/^push my registered mail and password$/) do
  fill_in('login[username]', :with => Faker::Internet.email)
  fill_in('login[password]', :with => Faker::Internet.password(8))
end
Then(/^click on 'enter' button$/) do
  click_button('Вхід')
  expect(page).to have_content('Invalid login or password')
end


#login the site scenario 2 
Then(/^click on 'reqistration' button$/) do
  find(:xpath, '//button[@type="button"][@title="Реєстрація"][@class="button"]').click
end
Then(/^fill all text fields$/) do
  fill_in('firstname', :with => Faker::Name.first_name) #enter name
  fill_in('lastname', :with => Faker::Name.last_name) #enter sur-name
  fill_in('email', :with => Faker::Internet.email) #enter email
  fill_in('telephone', :with => Faker::PhoneNumber.cell_phone) #enter number of cell-phone
  if check('is_subscribed') == false #verify if checkbox is to check
  	check('is_subscribed')
  end
  fill_in('city', :with => Faker::Address.city) #enter city
  select('Австралія', :from => "country_id") #change country
  fill_in('postcode', :with => Faker::Address.postcode) #enter adress postcode
  fill_in('password', :with => 'I_like_to_automate_program') #enter password
  fill_in('confirmation', :with => 'I_like_to_automate_program') #confirm password
end

