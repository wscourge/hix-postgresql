# frozen_string_literal: true

require_relative 'boot'
require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Hixonefourteenzeropg
  class Application < Rails::Application
    config.active_record.observers = %i[]
    config.active_record.schema_format = :sql
    config.load_defaults(6.0)
    config.generators do |generator|
      generator.orm(:active_record, primary_key_type: :uuid, foreign_key_type: :uuid)
      generator.test_framework(
        :rspec,
        fixtures: true,
        controller_specs: true,
        routing_specs: true,
        request_specs: true
      )
      generator.fixture_replacement(:factory_bot, dir: 'spec/factories')
    end
  end
end
