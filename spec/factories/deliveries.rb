FactoryBot.define do
  factory :delivery do
    placement_id    { 1 }
    date { Date.today }
    impressions   { 369 }
  end
end