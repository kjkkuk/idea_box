# frozen_string_literal: true

module ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
