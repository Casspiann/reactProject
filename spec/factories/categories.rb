FactoryBot.define do
    factory :categorie do
      name { Faker::Commerce.unique.department }
    end
  end