# frozen_string_literal: true

module LogMarker
  class << self
    attr_accessor :ml_alias, :marker

    def config
      yield self
    end
  end

  @ml_alias = :p!
  @marker   = -> { (['=' * 150] * 5).join("\n") }
end
