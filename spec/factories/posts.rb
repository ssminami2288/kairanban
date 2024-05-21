
FactoryBot.define do
  factory :post do
    date { Date.today }
    title { "Sample Post" }
    text { "This is a sample post." }
    trait :with_pdfs do
      after :create do |post|
        post.pdfs.attach(io: File.open('path/to/pdf/file.pdf'), filename: 'file.pdf')
      end
    end
  end
end
