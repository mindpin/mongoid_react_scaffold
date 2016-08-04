# encoding: utf-8
#require 'rails/generators/resource_helpers'
#require 'rails/generators/rails/model/model_generator'
require 'rails/generators/rails/resource/resource_generator'

class MongoidReactScaffold::ScaffoldGenerator < Rails::Generators::ResourceGenerator
  remove_hook_for :resource_controller
  remove_class_option :actions

  class_option :stylesheets, type: :boolean, desc: "Generate Stylesheets"
  class_option :stylesheet_engine, desc: "Engine for Stylesheets"
  class_option :assets, type: :boolean
  class_option :resource_route, type: :boolean
  class_option :scaffold_stylesheet, type: :boolean

  def handle_skip
    @options = @options.merge(stylesheets: false) unless options[:assets]
    @options = @options.merge(stylesheet_engine: false) unless options[:stylesheets] && options[:scaffold_stylesheet]
  end

  hook_for :scaffold_controller, required: true

  hook_for :assets do |assets|
    invoke assets, [controller_name]
  end

  hook_for :stylesheet_engine do |stylesheet_engine|
    if behavior == :invoke
      invoke stylesheet_engine, [controller_name]
    end
  end
end