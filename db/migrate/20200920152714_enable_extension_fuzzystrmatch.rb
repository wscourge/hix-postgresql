# frozen_string_literal: true

class EnableExtensionFuzzystrmatch < ActiveRecord::Migration[6.0]
  def change
    enable_extension('fuzzystrmatch')
  end
end
