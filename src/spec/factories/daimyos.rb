# frozen_string_literal: true

FactoryBot.define do
  factory :daimyo do
    name { '織田信長' }
    birthed_on { Date.parse('1534-06-23') }
    died_on { Date.parse('1582-06-21') }

    trait :hideyoshi do
      name { '豊臣秀吉' }
      birthed_on { Date.parse('1537-03-17') }
      died_on { Date.parse('1598-09-18') }
    end
  end
end
