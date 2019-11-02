class User < ApplicationRecord
  has_many :answers

  def overall_accuracy
    answers.where(correct: true).count * 100 / answers.count
  end

  def range_accuracy(from, to)
    range_answers = answers.where(created_at: (from..to))
    range_answers.where(correct: true).count * 100 / range_answers.count
  end
end
