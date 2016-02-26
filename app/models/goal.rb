class Goal < ActiveRecord::Base
  enum goal_types: ["Calories Burned", "Calories Consumed"]
  belongs_to :user
  validates :goal_type, inclusion: { in: Goal.goal_types , message: 'Nice try, YOU SNEAKY SNEAK!'}
  validates :goal_type, :end_date, :user, :target_amount, presence: true
  validates :target_amount, numericality: { greater_than: 99 , message: 'must be greater than 99. PAIN IS WEAKNESS LEAVING THE BODY' }
  validates :target_amount, numericality: { less_than: 999999 , message: 'must be less that 999,999. WHY DO YOU WISH TO BECOME NOTHING? ' }
  validate :end_date_is_in_the_future
  scope :available, -> { where('end_date >= ?', Date.today) }
  scope :unavailable, -> { where('end_date < ?', Date.today) }

  def self.active
  end

  def available?
    end_date > Date.today
  end

  def unavailable?
    !available?
  end

  def end_date_is_in_the_future
    unless end_date && end_date > Date.today
      errors.add(:end_date, "must be in the future")
    end
  end

  def goal_amount
    case goal_type
    when "Calories Burned"
      user.calories_burned(created_at, end_date.end_of_day)
    when "Calories Consumed"
      user.calories_consumed(created_at, end_date.end_of_day)
    end
  end

  def percent_complete
    goal_amount / target_amount.to_f * 100
  end

  def failed?
    unavailable? && incomplete?
  end

  def complete?
    percent_complete >= 100
  end

  def incomplete?
    !complete?
  end

end
