# frozen_string_literal: true

class EnableProductVersion
  attr_reader :product_version

  def initialize(product_version)
    @product_version = product_version
  end

  def perform
    product_version.update(enabled: true)
  end
end
