Given(/^the price is "£(.+)"$/) do |price|
  price_as_pence = price * 100
  price_collection = $db[:price]
  doc = { pence: price_as_pence }
  price_collection.insert_one(doc)
end

When("I visit the page") do
  visit 'http://localhost:3000'
end

Then("I should see {string} as the {string}") do |price_text, element_mapping|
  element = page.find '.price'
  puts element.inspect
  element.text.should eql(price_text)
end
