def example_authors()
  [
   {"First name" => ["Alan"],
    "Last name" => ["Turing"],
    "Homepage" => ["http://en.wikipedia.org/wiki/Alan_turing"]},

   {"First name" => ["Alonzo"],
    "Last name" => ["Church"],
    "Homepage" => ["http://en.wikipedia.org/wiki/Alonzo_Church"]}
  ]
end

def example_papers()
  [
   {"Title" => ["Computing Machinery and Intelligence"],
    "Venue" => ["Mind, 59, 433-460"],
    "Year" => [1950],
    "Author 1" => ["Alan Turing", :select]},

   {"Title" => ["A Note on the Entscheidungsproblem"],
    "Venue" => ["The Journal of Symbolic Logic, Vol. 1"],
    "Year" => [1936],
    "Author 1" => ["Alonzo Church", :select]}
  ]
end

Given /^there is the example author$/ do
  create_model_with_fixture("author", example_authors()[0])
end

Given /^there are the example authors$/ do
  example_authors().each do |fixture|
    create_model_with_fixture("author", fixture)
  end
end

Given /^there is the example paper$/ do
  create_model_with_fixture("paper", example_papers()[0])
end

Given /^there are the example papers$/ do
  example_papers().each do |fixture|
    create_model_with_fixture("paper", fixture)
  end
end

When /^I fill in the example author$/ do
  fill_in_fixture example_authors()[0]
end

When /^I fill in the example paper$/ do
  fill_in_fixture example_papers()[0]
end

Then /^I should see the example author$/ do
  Then %{I should see "#{get_name("author", example_authors()[0])}"}
end

Then /^I should see the example authors$/ do
  example_authors().each do |fixture|
    Then %{I should see "#{get_name("author", fixture)}"}
  end
end

Then /^I should see the example author's details$/ do
  see_fixture? example_authors()[0]
end

Then /^there should be the example author$/ do
  check_for_model_with_fixture("author", example_authors()[0])
end

Then /^I should see the example paper$/ do
  Then %{I should see "#{get_name("paper", example_papers()[0])}"}
end

Then /^I should see the example papers$/ do
  example_papers().each do |fixture|
    Then %{I should see "#{get_name("paper", fixture)}"}
  end
end

Then /^I should see the example paper's details$/ do
  see_fixture? example_papers()[0]
end

Then /^there should be the example paper$/ do
  check_for_model_with_fixture("paper", example_papers()[0])
end


Given /^there is a(?:n)? "([^"]*)" with the following:$/ do |model, table|
  create_model_with_fixture(model, table_to_fixture(table))
end

Then /^there should be a(?:n)? "([^"]*)" with the following:$/ do |model, table|
  check_for_model_with_fixture(model, table_to_fixture(table))
end


def table_to_fixture(table)
  hsh = {}
  table.rows_hash.each do |k,v|
    hsh[k] = [v]
  end
  return hsh
end

def fill_in_fixture(hsh)
  hsh.each do |k,v|
    if v[1] == :select
      When %{I select "#{v[0]}" from "#{k}"}
    else
      When %{I fill in "#{k}" with "#{v[0]}"}
    end
  end
end

def see_fixture?(hsh)
  hsh.each do |k,v|
    Then %{I should see "#{v[0]}"}
  end
end

def create_model_with_fixture(model, fixture)
  old_path = current_path || "/"
  visit path_to("the #{model.pluralize} page")
  click_link("Add #{model}")
  fill_in_fixture fixture
  click_button("Save")
  visit old_path
end

def check_for_model_with_fixture(model, fixture)
  old_path = current_path || "/"
  Given %{I am on the #{model.pluralize} page}
  When %{I follow "#{get_name(model, fixture)}"}
  see_fixture? fixture
  visit old_path
end

def get_name(model, fixture)
  if model == "author"
    "#{fixture["First name"][0]} #{fixture["Last name"][0]}"
  else
    fixture["Title"][0]
  end
end
