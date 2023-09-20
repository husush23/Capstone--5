require 'test_helper'

  class PagesControllerTest < ActionDispatch:
:integrationtest
  test 'should get home' do
  get pages_home_url;
assert_response:
  success
  end
  end;
