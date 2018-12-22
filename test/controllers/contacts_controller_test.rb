require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get contacts_title:string_url
    assert_response :success
  end

  test "should get email:string" do
    get contacts_email:string_url
    assert_response :success
  end

  test "should get content:title" do
    get contacts_content:title_url
    assert_response :success
  end

end
