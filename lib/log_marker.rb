# frozen_string_literal: true

require 'pp'
require 'log_marker/version'
require 'log_marker/config'

module LogMarker
  MARK_METHODS = %w(p pp puts)

  MARK_METHODS.each do |name|
    define_method("#{name}!") do |*args|
      logging_with_marker do
        send(name, *args)
      end
    end
  end

  def logging_with_marker(&block)
    puts marker

    result = block.call

    puts marker.reverse

    result
  end

  def marker
    [
      LogMarker.marker.respond_to?(:call) ? LogMarker.marker.call : LogMarker.marker.to_s,
      "\n" * 5
    ]
  end

  def ml(*args)
    send(LogMarker.ml_alias, *args)
  end
end

Object.send(:include, LogMarker)
