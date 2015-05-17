opts= {}
if ARGV[0] == "apiify:controller"
  Rake.application.instance_variable_set(:@top_level_tasks, ["apiify:controller"])
  opts[:model] = ARGV[1]
  opts[:camel_name] = ARGV[1].camelize
  opts[:routes] = ARGV[2].split('')
  opts[:safe_params] = ARGV[3].split(',').map{|param| ":#{param}"}.join(',')
end


namespace :apiify do |args|
  desc "rock a controller that does api calls"
  task :controller => :environment do
    filename   = opts[:model].pluralize.underscore + '_controller.rb'
    path       = Rails.root.join('app', 'controllers', 'api', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    methods = ""

    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class Api::#{opts[:camel_name]}Controller < ApplicationController
          # Prevent CSRF attacks by raising an exception.
          # For APIs, you may want to use :null_session instead.
          # protect_from_forgery with: :exception

        #{if opts[:routes].include?('i')
          <<-eos

          def index
            render json: #{opts[:camel_name]}.all, status: 200
          end
          eos
          end
        }
        #{if opts[:routes].include?('s')
          <<-eos

          def show
            render json: #{opts[:camel_name]}.find(params['id'], status: 200
          end
          eos
          end
        }
        #{if opts[:routes].include?('c')
          <<-eos

          def create
            #{opts[:model]} = #{opts[:camel_name]}.create(safe_params)
            render json: #{opts[:model]}, status: 201
          end
          eos
          end
        }
        #{if opts[:routes].include?('u')
          <<-eos

          def update
            #{opts[:model]} = #{opts[:camel_name]}.find(params['id'])
            #{opts[:model]}.update_attributes(safe_params)
            render nothing: true, status: 204
          end
          eos
          end
        }
        #{if opts[:routes].include?('d')
          <<-eos

          def destroy
            #{opts[:model]} = #{opts[:camel_name]}.find(params['id'])
            #{opts[:model]}.destroy
            render nothing: true, status: 204
          end
          eos
          end
        }

          def safe_params
            params.require(:#{opts[:model]}).permit(#{opts[:safe_params]})
          end
        end
    EOF

      # CHECK FOR ROUTES

      model_filename   = opts[:model] + '.rb'
      model_path       = Rails.root.join('app', 'models', model_filename)

      unless File.exist?(model_path)
        File.open(model_path, 'w+') do |f|
          f.write(<<-EOF.strip_heredoc)
            class #{opts[:camel_name]} < ActiveRecord::Base
              # has_many
              # belongs_to
            end
          EOF
        end
      end

      require 'find'

      migration_exist = false
      Find.find("#{Rails.root.join('db', 'migrate')}/") do |filer|
        migration_exist = true if filer.include?(opts[:model].pluralize)
      end

      unless migration_exist
        filename     = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), opts[:camel_name].underscore]
        mig_path     = Rails.root.join('db', 'migrate', filename)

        File.open(mig_path, 'w+') do |f|
          f.write(<<-EOF.strip_heredoc)
            class Create#{opts[:camel_name]} < ActiveRecord::Migration
              def change
                create_table :#{opts[:camel_name].underscore.pluralize} do |t|
                  t.timestamps
                end
              end
            end
          EOF
        end
      end
    end
  end
end
