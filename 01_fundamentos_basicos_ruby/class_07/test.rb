class MiniActiveRecord
  def self.belongs_to(association_name)
    define_method(association_name) do
      instance_variable_get("@#{association_name}")
    end

    define_method("#{association_name}=") do |value|
      instance_variable_set("@#{association_name}", value)
    end

    define_method("#{association_name}_id") do
      instance_variable_get("@#{association_name}").id
    end
  end
end

class User < MiniActiveRecord
  attr_accessor :name
  attr_reader :id

  def initialize(name)
    @name = name
    @id = rand(1..100)
  end
end

class Post < MiniActiveRecord
  belongs_to :user
end

user = User.new("John Doe")
post = Post.new
post.user = user

puts "Hello, #{post.user.name} (#{post.user_id})" 