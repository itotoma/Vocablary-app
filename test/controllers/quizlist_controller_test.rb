require 'test_helper'

class QuizlistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quizlist_index_url
    assert_response :success
  end

  test "should get destroy" do
    get quizlist_destroy_url
    assert_response :success
  end

end
