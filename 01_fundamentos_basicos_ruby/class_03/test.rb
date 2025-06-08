module ModuleOne
  def setup
    puts "ModuleOne setup"
  end
end

module ModuleTwo
  def setup
    puts "ModuleTwo setup"
  end
end

class Test
  # include ModuleOne
  # include ModuleTwo

  def initialize()
    ModuleOne.setup
  end
end

test = Test.new()
