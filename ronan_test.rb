require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

require './ronan_app'

class RonanTest < Minitest::Test
  include Rack::Test::Methods

  def app
    RonanApp
  end

  def test_classes_exist
    assert RonanApp
  end


  def test_slash_returns_a_welcome_message
    response = get("/")
    assert_equal "WELCOME!", response.body
  end

  def test_sal_gets_a_custom_welcome_message
    response = get("/Sal")
    assert_equal "Hello, Sal!", response.body
  end

  def test_can_read_batman_ipsum
    response = get("/lorem/:batman")
    assert_includes "Gotham", response.body
  end

end

# A sinatra app with three endpoints (all just rendering text):
# Index: GET "/", returns a welcome message
# Show: GET "/billy", returns a specialized welcome message for whatever name is passed to it as a param
# Lorem: GET "/lorem/standard", returns lorem ipsum of the type requested
