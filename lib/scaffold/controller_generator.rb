module Scaffold
  class ControllerGenerator < Scaffold::BaseGenerator

    def generate
      controller_file_path = create_path(@params.controller_file_name)

      puts "Creating #{controller_file_path}"

      filename = File.join(root, templates, 'controller.rb.erb')
      content = File.read(filename)
      # http://www.stuartellis.eu/articles/erb/
      content = ::ERB.new(content, nil, '-').result(@params.instance_eval{ binding })
      # puts content
      IO.write(controller_file_path, content)
    end

    def create_path file_name
      controller_path = File.join(Dir.pwd, 'app', 'controllers', @params.namespaces_array)
      controller_file_path = File.join(controller_path, file_name)
      FileUtils.mkpath(controller_path)
      controller_file_path
    end
  end
end