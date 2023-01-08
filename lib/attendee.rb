class Attendee
  attr_reader :name,
              :budget

  def initialize(name, budget)
    @name = name
    @budget = budget
  end
end