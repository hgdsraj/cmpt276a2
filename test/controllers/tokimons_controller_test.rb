require 'test_helper'

class TokimonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tokimon = tokimons(:one)
  end

  test "should get index" do
    get tokimons_url
    assert_response :success
  end

  test "should get new" do
    get new_tokimon_url
    assert_response :success
  end

  test "should create tokimon" do
    assert_difference('Tokimon.count') do
      post tokimons_url, params: { tokimon: { defense: @tokimon.defense, electric: @tokimon.electric, fight: @tokimon.fight, fire: @tokimon.fire, fly: @tokimon.fly, freeze: @tokimon.freeze, health: @tokimon.health, height: @tokimon.height, name: @tokimon.name, psychic: @tokimon.psychic, total: @tokimon.total, water: @tokimon.water, weight: @tokimon.weight } }
    end

    assert_redirected_to tokimon_url(Tokimon.last)
  end

  test "should show tokimon" do
    get tokimon_url(@tokimon)
    assert_response :success
  end

  test "should get edit" do
    get edit_tokimon_url(@tokimon)
    assert_response :success
  end

  test "should update tokimon" do
    patch tokimon_url(@tokimon), params: { tokimon: { defense: @tokimon.defense, electric: @tokimon.electric, fight: @tokimon.fight, fire: @tokimon.fire, fly: @tokimon.fly, freeze: @tokimon.freeze, health: @tokimon.health, height: @tokimon.height, name: @tokimon.name, psychic: @tokimon.psychic, total: @tokimon.total, water: @tokimon.water, weight: @tokimon.weight } }
    assert_redirected_to tokimon_url(@tokimon)
  end

  test "should destroy tokimon" do
    assert_difference('Tokimon.count', -1) do
      delete tokimon_url(@tokimon)
    end

    assert_redirected_to tokimons_url
  end
end
