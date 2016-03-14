FactoryGirl.define do
  factory :submission do
    url               { FFaker::Internet.domain_name }
    title             { FFaker::Lorem.sentence(1) }
    description       { FFaker::Lorem.sentence(4) }
    link_clicks       { "#{rand(0..100)}" }
  end

  # Examples
  # factory :lesson_category do
  #   before(:create) do |lesson_category|
  #     lesson_category.lesson = create(:lesson)
  #     lesson_category.category = create(:category)
  #   end
  # end

  # factory :category do
  #   name { FFaker::Name.name }
  # end

  # factory :conversation do
  #   before :create do |conversation|
  #     if conversation.creator.nil?
  #       conversation.creator = create(:user)
  #       conversation.participants << build(:participant, user: conversation.creator)
  #     end
  #   end
  # end

  # factory :lesson do
  #   name              { FFaker::Name.name }
  #   country           { FFaker::AddressAU.country }
  #   postcode          { FFaker::AddressAU.postcode }
  #   city              { FFaker::AddressAU.city }
  #   state             { FFaker::AddressAU.state }
  #   lat               { FFaker::Geolocation.lat }
  #   lng               { FFaker::Geolocation.lng }
  #   address           { FFaker::Address.street_address}
  #   description       { FFaker::Lorem.sentence(2) }
  #   price             { "#{rand(5..100)}" }
  #   duration          { "#{rand(5)}" }
  # end

  # factory :message do
  #   content         { FFaker::Lorem.sentence }

  #   before(:create) do |message|
  #     message.conversation = create(:conversation) unless message.conversation_id
  #     message.participant = create(:participant) unless message.participant_id
  #   end
  # end

  # factory :notification do
  #   content "MyText"
  # end

  # factory :participant do
  #   status  "active"
  #   before :create do |participant|
  #     participant.user = create(:user) unless participant.user_id
  #     participant.conversation = create(:conversation) unless participant.conversation_id
  #   end
  # end

  # factory :photo do
  #   file { File.open(File.join(Rails.root, 'spec', 'support', 'sample.png')) }

  #   before :create do |photo|
  #     photo.imageable = create(:lesson) unless photo.imageable_id
  #     photo.user = create(:user)
  #   end
  # end

  # factory :purchase do
  #   user
  #   session_time

  #   trait :with_voucher do
  #     voucher
  #   end
  # end

  # factory :report do
  #   before(:create) do |report|
  #     report.reportable = create(:conversation)
  #     report.reporter = create(:user)
  #   end
  # end

  # factory :review do
  #   body                  { FFaker::Lorem.sentence(2) }
  #   rating                { rand(1..5) }
  # end

  # factory :session_time do
  #   timeslot              { DateTime.now + 5.days}
  #   class_size            { "#{rand(1..20)}" }
  #   lesson
  # end

  # factory :subscription do
  #   user
  #   lesson
  # end

  # factory :user do
  #   first_name            { FFaker::Name.first_name }
  #   last_name             { FFaker::Name.last_name }
  #   email                 { FFaker::Internet.email }
  #   password              "password"
  #   password_confirmation "password"
  #   avatar                { File.open(File.join(Rails.root, 'spec', 'support', 'sample.png')) }
  # end

  # factory :user_notification do
  #   user nil
  #   notification nil
  # end

  # factory :voucher do
  #   code                { FFaker::Lorem.sentence(2) }
  #   discount_percentage { rand(10..50) }
  #   expires_at          { Date.today + rand(1..5).days }
  # end
end
