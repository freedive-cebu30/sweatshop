# encoding: utf-8
class Evaluation < ActiveRecord::Base
  AGE = %w(20歳未満 20-25歳 26-30歳 31-35歳 36-40歳 41-45歳 46-50歳 51-60歳 61歳以上).freeze
  JOB_TYPE = %w(社会人 学生).freeze
  POSITION = %w(部下なし 部下1-2人 部下3-5人 部下6-10人 部下11-20人 部下20人以上).freeze
  POST = %w(営業 総務 経理 法務 技術 その他).freeze
  INCOME = %w(200-300万 300-350万 350-400万 400-450万 450-500万 500-600万 600-700万 700万).freeze
  WORKING_HOURS = %w(8時間 9時間 10時間 11時間 12時間 13時間 14時間 15時間).freeze
  HOLIDAY_DAYS = %w(3日以下 4日 6日 8日).freeze
  OVERTIME_PAY = %w(なし 40時間以上であり 常にあり).freeze
  ILLEGALITY = %w(なし 問題にならないレベル あり 危機的水準).freeze
  INTERVIEW_ATTITUDE = %w(悪い 普通 良い).freeze
  RESUME = %w(事前に読んでいない 読んでる よく読んでる).freeze
  STRESS_INTERVIEW = %w(普通の面接 圧迫面接).freeze
  SEXUAL_HARASSMENT = %w(なし あり).freeze
  INTERVIEWER_COUNT = %w(1回 2回 3回 4回 5回).freeze
  PROMISE = %w(守らない 守る).freeze
  ENJOYMENT = %w(楽しい 楽しくない).freeze
  LEARN = %w(学べてる 学べていない).freeze
  
  belongs_to :company
  
  def society_people?
    self.job_type == JOB_TYPE.index("社会人")
  end
end
