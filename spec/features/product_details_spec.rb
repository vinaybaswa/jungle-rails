require 'rails_helper'

RSpec.feature "Visitor navigates to product page from home page", type: :feature, js: true do
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

  scenario "and sees product details" do
    # ACT
    visit root_path

    visit '/products/9'
    # DEBUG
    # puts page.html
    save_screenshot
    # VERIFY
    expect(page).to have_content('Apparel')
  end
end
