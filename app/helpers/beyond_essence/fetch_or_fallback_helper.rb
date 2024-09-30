# frozen_string_literal: true

module BeyondEssence
  module FetchOrFallbackHelper
    InvalidValueError = Class.new(StandardError)

    def fetch_or_fallback(allowed_values, given_value, fallback = nil)
      if allowed_values.include?(given_value)
        given_value
      else
        if Rails.env.local?
          raise InvalidValueError, <<~MSG
            fetch_or_fallback was called with an invalid value.

            Expected one of: #{allowed_values.inspect}
            Got: #{given_value.inspect}

            This will not raise in production, but will instead fallback to: #{fallback.inspect}
          MSG
        end

        fallback
      end
    end

    def fetch_or_fallback_boolean(given_value, fallback: false)
      if [true, false].include?(given_value)
        given_value
      else
        fallback
      end
    end

    def integer_or_fallback(given_value, fallback = nil)
      given_value.is_a?(Integer) ? given_value : fallback
    end
  end
end
