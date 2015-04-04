# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items.
  # Defaults to 'selected' navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that
  # will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name, item| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false
  
  # If this option is set to true, all item names will be considered as safe (passed through html_safe). Defaults to false.
  # navigation.consider_item_names_as_safe = false

  # Define the primary navigation
  navigation.items do |user|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>if: -> { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>unless: -> { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>.
    #
    #primary.item :user, '1. Login', 'log_in' do |user|
      user.item :user_3_1_1, '1. Housing option' do |sub_nav1|
        sub_nav1.item :user_3A_1, '1. View invoices', invoices_url do |sub_nav2|
          sub_nav2.item :user_3A_1_1, '1. View current invoice'
          sub_nav2.item :user_3A_1_2, '2. View past invoices'
          sub_nav2.item :user_3A_1_3, '3. Back'
        end

        sub_nav1.item :user_3A_2, '2. View leases' do |sub_nav2|
          sub_nav2.item :user_3A_2_1, '1. View current lease'
          sub_nav2.item :user_3A_2_2, '2. View past leases'
          sub_nav2.item :user_3A_2_3, '3. Back'
        end

        sub_nav1.item :user_3A_3, '3. New request' do |sub_nav2|
          sub_nav2.item :user_3A_3_1, '1. New lease request', new_housing_request_url
          sub_nav2.item :user_3A_3_2, '2. Terminate lease request', new_termination_request_url
          sub_nav2.item :user_3A_3_3, '3. Back'
        end
        sub_nav1.item :user_3A_4, '4. View/Cancel requests' do |sub_nav2|
          sub_nav2.item :user_3A_4_1, '1. View request', housing_request_url(session[:pid])
          sub_nav2.item :user_3A_4_2, '2. Cancel request'
          sub_nav2.item :user_3A_4_3, '3. Back'
        end

        sub_nav1.item :user_3A_5, '5. View vacancy', menu_housing_vacancy_url
        sub_nav1.item :user_3A_6, '6. Back'
      end

      user.item :user_3_1_2, '2. Parking option' do |parking|
        parking.item :user_3B_1, '1. Request parking', new_parking_request_url
        parking.item :user_3B_2, '2. View parking lot info', parking_lots_url
        parking.item :user_3B_3, '3. View current parking spot'
        parking.item :user_3B_4, '4. Renew parking spot'
        parking.item :user_3B_5, '5. Cancel parking spot'
        parking.item :user_3B_6, '6. View request status', parking_request_url(session[:pid])
        parking.item :user_3B_7, '7. Back'
      end

      user.item :user_3_1_3, '3. Maintenance' do |sub_nav|
        sub_nav.item :user_3C_1, '1. New ticket', new_maintenance_request_url
        sub_nav.item :user_3C_2, '2. View ticket status', maintenance_request_url(session[:pid])
        sub_nav.item :user_3C_3, '3. Back'
      end

      user.item :user_3_1_4, '4. Profile' do |sub_nav|
        sub_nav.item :user_3D_1, '1. View profile', student_url(session[:pid])
        sub_nav.item :user_3D_2, '2. Edit profile', edit_student_url(session[:pid])
        sub_nav.item :user_3D_3, '3. Back'
      end

      user.item :user_3_1_5, '5. Logout', 'log_out'
    #end

    #primary.item :guest, '2. Guest Login'
    #primary.item :exit, '3. Exit'

    #primary.item :admin, 'Main Menu'  do |sub_nav|
    #  sub_nav.item :adm_4A_1, '1. View new lease requests'
    #  sub_nav.item :adm_4A_2, '2. View termination requests'
    #  sub_nav.item :adm_4A_3, '3. View maintenance tickets'
    #  sub_nav.item :adm_4A_4, '4. View parking requests'
    #  sub_nav.item :adm_4A_5, '5. View profiles'
    #  sub_nav.item :adm_4A_6, '6. Back'
    #end



    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    #primary.item :key_3, 'Admin', url, class: 'special', if: -> { current_user.admin? }
    #primary.item :key_4, 'Account', url, unless: -> { logged_in? }

    # you can also specify html attributes to attach to this particular level
    # works for all levels of the menu
    # primary.dom_attributes = {id: 'menu-id', class: 'menu-class'}

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false
  end
end
