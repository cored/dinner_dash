Given(/^the following categories exist:$/) do |categories_info|
  categories_info.hashes.each do |category_info|
    Categories::AddNew.new(
      category_repository: Category
    ).call(category_info)
  end
end

When(/^I view items grouped by category "(.*?)"$/) do |category_name|
  @list_of_items = Items::ViewAllGroupedByCategory.new(
    item_repository: Item
  ).call(category_name)
end
