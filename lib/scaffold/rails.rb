require_relative 'services/controller'
require_relative 'services/path'
require_relative 'services/resource'
require_relative 'services/nested_in_resources'
require_relative 'services/route'
require_relative 'services/view'

module Scaffold
  class Rails
    attr :controller, false
    attr :path, false
    attr :choice, false
    attr :resource, false
    attr :nested_in_resources, false
    attr :route, false
    attr :view, false

    def initialize choice
      @choice = choice

      @resource = Services::Resource.new(self)
      @nested_in_resources = Services::NestedInResources.new(self)
      @controller = Services::Controller.new(self)
      @route = Services::Route.new(self)
      @path = Services::Path.new(self)
      @view = Services::View.new(self)

      debug_info if choice[:debug]
    end

    def debug_info
      puts "\n"
      puts "Debug:"
      puts "resource_class_name: #{@resource.class_name}, resource_name: #{@resource.name}, collection_name: #{@resource.collection_name}"
      puts "class_name_with_modules: #{@resource.class_name_with_modules}"

      puts "\ncontroller:"
      puts "class: #{@controller.class_name}"

      puts "\nroutes:"
      puts "route_resource_name: #{@route.resource_name}"
      puts "controller_namespaces: #{@controller.namespaces_as_path} (for urls helpers)"
      puts "resource_paths"
      puts "   new_resource_path: #{@path.new_resource}"
      puts "   resource_path: #{@path.resource}"
      puts "   edit_resource_path: #{@path.edit_resource}"
      puts "   instance_resource_path: #{@path.instance_resource}"
      puts "   edit_instance_resource: #{@path.edit_instance_resource}"
      puts "   collection_path: #{@path.collection}"
      puts "\n\n"
    end

  end
end