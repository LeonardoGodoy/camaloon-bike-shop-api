# frozen_string_literal: true

class DisableProductVersion
  attr_reader :product_version

  def initialize(product_version)
    @product_version = product_version
  end

  def perform
    product_version.update(enabled: false)
  end
end
