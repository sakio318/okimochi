FactoryBot.define do
  factory :post_image do
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/logo.jpg"), 'image/jpg') }
  end
end