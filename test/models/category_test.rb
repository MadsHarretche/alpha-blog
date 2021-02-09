require 'test_helper'

class CategoryTest < ActiveSupport:: TestCase
  
  def setup # is just an example of a name for method that runs before each test.
    @category = Category.new(name: "Sports")# we are trying to make a category object with the name "sports"
    
  end
  
  
  test "category should be valid" do # Everything in between each test will not be available in other test
    assert @category.valid? # "assert" test for true, while "assert_not" test for false
  end 
  
  test "name should be present" do
     @category.name = " "
     assert_not @category.valid? # "assert" test for true, while "assert_not" test for false
  end
  
  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Sports") # Here we try to make a new category with the same name so the test fails if its true
    assert_not @category2.valid? # if @category2's name is the same as @category, the statement is true. And since we are checking for a false, an error will occur
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end

#to run test files, open terminal $ rails test

#read more https://guides.rubyonrails.org/testing.html