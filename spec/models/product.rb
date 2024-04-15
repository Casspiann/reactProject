# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should have_one_attached(:image) }
  end
end
