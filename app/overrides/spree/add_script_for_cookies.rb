Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
                     :name => 'add_script_for_cookies',
                     :insert_bottom => 'body',
                     :text => '<%= yield :script %>')

Deface::Override.new(:virtual_path => 'spree/layouts/spree_application',
                     :name => 'add_partial_for_cookies',
                     :insert_top => 'body',
                     :text => '<% unless cookies_accepted? %>
						            <%= render :partial => "spree/shared/cookies_policy" %>
						       <% end %>')