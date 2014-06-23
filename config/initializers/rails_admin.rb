#require 'i18n'
#I18n.default_locale = :fi
RailsAdmin.config do |config|

  require Rails.root.join('lib', 'rails_admin_add_list.rb')


  #ADMIN_EMAILS= ['marko.haanranta@helsinki.fi']
=begin
  config.authorize_with do
    authenticate_or_request_with_http_basic do |username, password|
      username == 'foo' && password == 'bar'
    end
  end
=end
=begin
  config.current_user_method { current_admin } # auto-generated
  config.authenticate_with {} # leave it to authorize
  config.authorize_with do
    is_admin= ADMIN_EMAILS.include?(current_admin.email)
    if current_admin
      redirect_to main_app.new_admin_session_url unless is_admin
    end
  end
=end

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
