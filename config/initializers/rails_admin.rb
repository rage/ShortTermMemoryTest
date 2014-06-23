#require 'i18n'
#I18n.default_locale = :fi
RailsAdmin.config do |config|

  require Rails.root.join('lib', 'rails_admin_add_list.rb')

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    # Set the custom action here
    add_list do
      visible do
        bindings[:abstract_model].model.to_s == "List"
      end
    end


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
