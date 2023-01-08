class Attendee
  attr_reader :name,
              :budget

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget]
  end
end