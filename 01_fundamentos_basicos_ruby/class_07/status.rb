class Status
  STATUSES = ["pending", "in_progress", "completed"]

  def initialize(status)
    @status = status
  end

  def create_methods
    STATUSES.each do |s|
      self.class.define_method("#{s}?") do
        @status == s
      end
    end
  end

end

s = Status.new("pending")

s.create_methods

puts s.completed?