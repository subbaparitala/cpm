FactoryBot.define do
  factory :placement do
    id    { 1 }
    name  { "Sports" }
    start { 7.days.ago }
    end_date   { Date.today }
    cpm   { 5 }
  end
end