require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  
  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com", password: "1234", admin: true)
    sign_in_as(@admin_user)
  end
  
   test "get new category form and create new category" do
     get "/categories/new"
     assert_response :success # we want to make sure that we are able to get category/new
     assert_difference 'Category.count', 1 do 
       post categories_path, params: { category: { name: "Sports"} }
       assert_response :redirect 
     end
     follow_redirect! #When a new category are created then we wanna now if the redirect happened
     assert_response :success
     assert_match "Sports", response.body #After redirect, we want to know that the atleast the body of the category showpage is viewed
   end

  test "get new category form and reject invalid category submission" do
     get "/categories/new"
     assert_response :success # we want to make sure that we are able to get category/new
     assert_no_difference 'Category.count' do # There should not be a difference in count when there is an invalid category submission
       post categories_path, params: { category: { name: " "} } # A category name cannot be empty
     end
     assert_match "errors", response.body # We look for the word errors
     assert_select 'div.alert' 
     assert_select 'h4.alert-heading' # a combination of these to means that the error messages are showing up.
   end

end
