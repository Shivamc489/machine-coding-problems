# frozen_string_literal: true

class User
  attr_accessor :name, :position

  def initialize(name)
    @name = name
    @position = 1
  end
end
