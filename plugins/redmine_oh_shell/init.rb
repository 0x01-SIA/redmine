# frozen_string_literal: true

require 'redmine'

Redmine::Plugin.register :redmine_oh_shell do
  name 'RedmineOH Shell'
  author 'RedmineOH contributors'
  description 'Provides the consolidated RedmineOH application shell.'
  version '0.1.0'
end

plugin_view_path = File.expand_path('app/views', __dir__)

unless ActionController::Base.view_paths.any? { |path| path.to_path == plugin_view_path }
  ActionController::Base.prepend_view_path(plugin_view_path)
end

Redmine::MenuManager.map(:top_menu) do |menu|
  menu.delete(:help)
end

Rails.configuration.to_prepare do
  Redmine::MenuManager.map(:top_menu) do |menu|
    menu.delete(:help)
  end
end
