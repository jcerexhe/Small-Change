FactoryGirl.define do
  
  factory :charity do
    name                  { FFaker::Company.name }
    bsb                   { "748564" }
    account_number        { "7485647485644758" }
    contact_name          { FFaker::Name.name }
    contact_email         { FFaker::Internet.email }
    url                   { FFaker::Internet.domain_name }
    # logo
    blurb                 { FFaker::Lorem.sentence(4) }
  end

  factory :donation do
    amount                { 5.00 }
    # charity_id
    # user_id
    # submission_id
  end

  factory :user_submission do
  end

  factory :submission do
    url                   { FFaker::Internet.domain_name }
    title                 { FFaker::Lorem.sentence(1) }
    description           { FFaker::Lorem.sentence(4) }
    link_clicks           { "#{rand(0..100)}" }
    slug                  { FFaker::Name.first_name }
  end

  factory :user do
    # first_name          { FFaker::Name.first_name }
    # last_name           { FFaker::Name.last_name }
    email                 { FFaker::Internet.email }
    password              "password"
    password_confirmation "password"
    actions_taken         { "#{rand(0..100)}" }
    admin                 false
  end
end
