class Goal < ActiveRecord::Base
  enum goal_types: ["Calories Burned", "Calories Consumed"]
  belongs_to :user
  validates :goal_type, inclusion: { in: Goal.goal_types }
  validates :goal_type, :end_date, :user, :target_amount, presence: true
  validate :end_date_is_in_the_future
  before_validation :parse_end_date

  def parse_end_date
    unless end_date.is_a? DateTime
      self.end_date = Chronic.parse(end_date_before_type_cast).to_date
    end
  end

  def end_date_is_in_the_future
    unless end_date > Date.today
      self.end_date = end_date.to_date
      errors.add(:end_date, "must be in the future")
    end
  end

  def percent_complete
    user.calories_burned(created_at, end_date.end_of_day)
  end
end
