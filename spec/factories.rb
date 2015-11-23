FactoryGirl.define do
  factory :user do
    name 'test1234'
    email 'test@example.com'
    password 'f4k3p455w0rd'

    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save
    # if needed
    # is_active true
  end
end

