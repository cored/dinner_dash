Given(/^I am an unauthenticated user$/) do
end

Given(/^the following items exist:$/) do |item_info|
  item_info.hashes.each do |item_attrs|
    Items::AddNew.new(
      item_repository: Item
    ).call(item_attrs.symbolize_keys)
  end
end

Given(/^no items exists$/) do
end

When(/^I view all the items$/) do
  @list_of_items = Items::ViewAll.new(
    item_repository: Item
  ).call
end

When(/^I visit the items page$/) do
  visit root_path
end

Then(/^I should see the following items:$/) do |item_information|
  expect(
    item_information.hashes.map(&:symbolize_keys)
  ).to match_array @list_of_items.to_a.map(&:to_h)
end

Then(/^I should see the following message in the page "(.*?)"$/) do |page_message|
  expect(page).to have_content page_message
end

Then(/^I should see the following items in the page:$/) do |items|
  items.hashes.each do |item|
    expect(page).to have_content(item["name"])
  end
end
