require "application_system_test_case"

class ContatosTest < ApplicationSystemTestCase
  setup do
    @contato = contatos(:one)
  end

  test "visiting the index" do
    visit contatos_url
    assert_selector "h1", text: "Contatos"
  end

  test "creating a contact" do
    visit contatos_url
    click_on "New Contato"

    fill_in "Birthday", with: @contato.birthday
    fill_in "Email", with: @contato.email
    fill_in "Phone number", with: @contato.phone_number
    fill_in "Weight", with: @contato.weight
    click_on "Create Contato"

    assert_text "Contato was successfully created"
    click_on "Back"
  end

  test "updating a contact" do
    visit contatos_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @contato.birthday
    fill_in "Email", with: @contato.email
    fill_in "Phone number", with: @contato.phone_number
    fill_in "Weight", with: @contato.weight
    click_on "Update Contato"

    assert_text "Contato was successfully updated"
    click_on "Back"
  end

  test "destroying a contact" do
    visit contatos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contato was successfully destroyed"
  end
end
