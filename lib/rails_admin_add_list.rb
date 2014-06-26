require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminAddList
end

module RailsAdmin
  module Config
    module Actions
      class AddList < RailsAdmin::Config::Actions::Base

        RailsAdmin::Config::Actions.register(self)


        register_instance_option :collection do
          true
        end

        register_instance_option :pjax? do
          false
        end


        register_instance_option :controller do
          proc do
            redirect_to main_app.new_list_path
          end
        end



        register_instance_option :link_icon do
          'icon-download'
        end

        #register_instance_option :visible? do
        #  bindings[:abstract_model].to_s == "Renewal"
        #end

        #register_instance_option :http_methods do
        #  [:get, :post]
        #end



        # register_instance_option :controller do
        #   Proc.new do
        #     if params.has_key?(:import_file)
        #       doc = SimpleXlsxReader.open(params[:import_file].tempfile)
        #       main_sheet = doc.sheets.first
        #       count = 0
        #       main_sheet.rows[1..main_sheet.rows.length].each do |row|
        #         count += 1
        #       end
        #       redirect_to back_or_index, notice: "#{count} Rows imported"
        #     end
        #   end
        # end





        # View partial name (called in default :controller block)
        #register_instance_option :template_name do
        #  :List
        #end

        #         register_instance_option :link_icon do
        #           'icon-check'
        #         end
        #


        #register_instance_option :http_methods do
        #  [:get, :post]
        #end





        # register_instance_option :controller do
        #   Proc.new do
        #     @response = {}
        #     #require 'csv'
        #
        #     #csvfile = params[:file]
        #     #@list = List.new(list_params)
        #     #if(params[:training])
        #     #  @list.training=true
        #     #else
        #     #  @list.training = false
        #     #end
        #
        #     #@list.active = true
        #     #@order = Order.import(params[:file])
        #     #f = SmarterCSV.process(file.tempfile)
        #     #f.each do |r|
        #     #
        #     #combine date and time fields
        #     #    r[:date_time] = [r[:date],r[:time]].join(' ')
        #
        #     #     Order.create("date" => r[:date_time])
        #   end
        # end



        #register_instance_option :controller do
        #  Proc.new do
        #    @object.update_attribute(:active, true)
        #    flash[:notice] = "You have approved the review titled: #{@object.title}."
        #
        #    redirect_to back_or_index
        #  end
      end
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
=begin
  def list_params
    params.permit(:filename, :training, :active)
  end
=end

end
