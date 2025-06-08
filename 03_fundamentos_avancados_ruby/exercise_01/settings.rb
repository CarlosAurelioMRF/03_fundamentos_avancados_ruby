class Settings
  def initialize
    @configs = {}
  end

  def add(key, value)
    @configs[key] = value
    self.class.send(:define_method, key) do
      @configs[key]
    end
  end

  def method_missing(method, *args, &block)
    if @configs.key?(method)
      send(method)
    else
      "Configuração '#{method}' não existe."
    end
  end

  def respond_to_missing?(method, include_private = false)
    @configs.key?(method) || super
  end

  def all
    @configs.dup
  end
end

# Exemplo de uso:
settings = Settings.new
# Definindo configurações dinamicamente
settings.add(:timeout, 30)
settings.add(:mode, "production")
# Acessando configurações via método
puts settings.timeout # => 30
puts settings.mode # => "production"
# Tentando acessar configuração inexistente
puts settings.retry # => "Configuração 'retry' não existe."
# Checando se um método está disponível
puts settings.respond_to?(:timeout) # => true
puts settings.respond_to?(:retry) # => false

puts settings.all
