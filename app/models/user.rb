class User < ApplicationRecord
  has_many :answers

  def overall_accuracy
    answers.where(correct: true).count * 100 / answers.count
  end

  def range_accuracy(from, to)
    range_answers = answers.where(created_at: (from..to))
    return 0 if range_answers.count.zero?

    range_answers.where(correct: true).count * 100 / range_answers.count
  end

  def self.weekly_rankings(start)
    start_date = Date.parse(start)
    end_date = start_date + 7.days
    my_hash = {}
    User.all.each do |user|
      my_hash[user.id] = user.range_accuracy(start_date, end_date)
    end
    sorted_array = my_hash.sort_by { |_k, v| -v }
    final_array = []
    sorted_array[0..99].each do |value|
      final_array << User.find(value[0])
    end
    final_array
  end

  def weekly_rankings(user, start)
    start_date = Date.parse(start)
    end_date = start_date + 7.days
    user.range_accuracy(start_date, end_date)
  end

  def previous_week_array(start)
    start_date = Date.parse(start) - 7.days
    end_date = start_date + 7.days
    my_hash = {}
    User.all.each do |user|
      my_hash[user.id] = user.range_accuracy(start_date, end_date)
    end
    sorted_array = my_hash.sort_by { |_k, v| -v }
    final_array = []
    sorted_array.each do |value|
      final_array << User.find(value[0])
    end
    final_array
  end

  def this_week_array(start)
    start_date = Date.parse(start)
    end_date = start_date + 7.days
    my_hash = {}
    User.all.each do |user|
      my_hash[user.id] = user.range_accuracy(start_date, end_date)
    end
    sorted_array = my_hash.sort_by { |_k, v| -v }
    final_array = []
    sorted_array.each do |value|
      final_array << User.find(value[0])
    end
    final_array
  end

  def change_rankings(user, start)
    previous_week_rankings = previous_week_array(start)
    this_week_rankings = this_week_array(start)
    difference = previous_week_rankings.index(user) - this_week_rankings.index(user)

    if previous_week_rankings.index(user) > this_week_rankings.index(user)
      "+#{difference}"
    else
      difference
    end
  end
end
