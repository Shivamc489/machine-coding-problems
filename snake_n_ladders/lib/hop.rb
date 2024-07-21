# frozen_string_literal: true

class Hop
  attr_accessor :start_pos, :end_pos

  def initialize(start_pos, end_pos)
    @start_pos = start_pos
    @end_pos = end_pos
  end
end
