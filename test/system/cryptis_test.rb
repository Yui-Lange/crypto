require "application_system_test_case"

class CryptisTest < ApplicationSystemTestCase
  setup do
    @crypti = cryptis(:one)
  end

  test "visiting the index" do
    visit cryptis_url
    assert_selector "h1", text: "Cryptis"
  end

  test "creating a Crypti" do
    visit cryptis_url
    click_on "New Crypti"

    fill_in "Amount owned", with: @crypti.amount_owned
    fill_in "Cost per", with: @crypti.cost_per
    fill_in "Symbol", with: @crypti.symbol
    fill_in "User", with: @crypti.user_id
    click_on "Create Crypti"

    assert_text "Crypti was successfully created"
    click_on "Back"
  end

  test "updating a Crypti" do
    visit cryptis_url
    click_on "Edit", match: :first

    fill_in "Amount owned", with: @crypti.amount_owned
    fill_in "Cost per", with: @crypti.cost_per
    fill_in "Symbol", with: @crypti.symbol
    fill_in "User", with: @crypti.user_id
    click_on "Update Crypti"

    assert_text "Crypti was successfully updated"
    click_on "Back"
  end

  test "destroying a Crypti" do
    visit cryptis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crypti was successfully destroyed"
  end
end
