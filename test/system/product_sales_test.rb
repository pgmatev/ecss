require "application_system_test_case"

class ProductSalesTest < ApplicationSystemTestCase
  setup do
    @product_sale = product_sales(:one)
  end

  test "visiting the index" do
    visit product_sales_url
    assert_selector "h1", text: "Product Sales"
  end

  test "creating a Product sale" do
    visit product_sales_url
    click_on "New Product Sale"

    click_on "Create Product sale"

    assert_text "Product sale was successfully created"
    click_on "Back"
  end

  test "updating a Product sale" do
    visit product_sales_url
    click_on "Edit", match: :first

    click_on "Update Product sale"

    assert_text "Product sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Product sale" do
    visit product_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product sale was successfully destroyed"
  end
end
