require 'json'

class UsingJson
  
  def initialize
    @data = {
      name: "Carlos",
      age: 30,
      hobbies: ["futebol", "leitura", "programação"]
    }
  end

  def to_json
    JSON.pretty_generate(@data)
  end

  def from_json(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end
end

usingJson = UsingJson.new

puts usingJson.to_json