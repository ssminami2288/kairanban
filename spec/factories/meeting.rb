FactoryBot.define do
  factory :meeting do
    date { Date.today } # 今日の日付をデフォルト値として設定
  end
end