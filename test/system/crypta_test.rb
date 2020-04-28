require "application_system_test_case"

class CryptaTest < ApplicationSystemTestCase
  setup do
    @cryptum = crypta(:one)
  end

  test "visiting the index" do
    visit crypta_url
    assert_selector "h1", text: "Crypta"
  end

  test "creating a Cryptum" do
    visit crypta_url
    click_on "New Cryptum"

    fill_in "Amount owned", with: @cryptum.amount_owned
    fill_in "Cost per", with: @cryptum.cost_per
    fill_in "Symbol", with: @cryptum.symbol
    fill_in "User", with: @cryptum.user_id
    click_on "Create Cryptum"

    assert_text "Cryptum was successfully created"
    click_on "Back"
  end

  test "updating a Cryptum" do
    visit crypta_url
    click_on "Edit", match: :first

    fill_in "Amount owned", with: @cryptum.amount_owned
    fill_in "Cost per", with: @cryptum.cost_per
    fill_in "Symbol", with: @cryptum.symbol
    fill_in "User", with: @cryptum.user_id
    click_on "Update Cryptum"

    assert_text "Cryptum was successfully updated"
    click_on "Back"
  end

  test "destroying a Cryptum" do
    visit crypta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cryptum was successfully destroyed"
  end
end
