require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click on a add to cart on a product and see 1 item in the cart" do
    # ACT
    visit root_path
    within('.product', :match => :first) do
      click_link_or_button('Add')
    end
    # DEBUG
    # puts page.html
    
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
    save_screenshot
  end
end