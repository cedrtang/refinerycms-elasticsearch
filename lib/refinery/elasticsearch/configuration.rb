require 'logger'

module Refinery
  module Elasticsearch
    include ActiveSupport::Configurable

    config_accessor :es_host, :es_port, :es_log, :es_logger,
                    :es_custom_analysis,
                    :enable_for, :page_url, :results_per_page

    self.es_host = 'localhost'
    self.es_port = 9200
    self.es_log = false
    self.es_logger = Logger.new(STDOUT)

    self.es_custom_analysis = {}

    self.page_url = '/search'
    self.results_per_page = 10
    self.enable_for = %w( Refinery::Page Refinery::Image Refinery::Resource )

    enable_for << 'Refinery::Blog::Post' if defined?(Refinery::Blog)
  end
end
