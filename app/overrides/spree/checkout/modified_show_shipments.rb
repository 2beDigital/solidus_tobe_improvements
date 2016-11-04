Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'remove_h5',
                     :sequence => 1,
                     :remove => 'h5.stock-shipping-method-title')

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'remove_shipping_rates',
                     :sequence => 2,
                     :remove => 'erb[silent]:contains("ship_form.object.shipping_rates.each do |rate|")',
                     :closing_selector => 'erb[silent]:contains("end")')

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'remove_ul',
                     :sequence => 3,
                     :remove => 'ul.field.radios.shipping-methods')

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'insert_new_method_shipping',
                     :sequence => 4,
                     :insert_bottom => 'div.shipment',
                     :partial => 'spree/checkout/modified_shipping_method' )

Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => 'insert_new_info',
                     :sequence => 5,
                     :insert_after => 'h3.stock-location',
                     :text => '<% if (ship_form.object.backordered? && backorder_charge) || ship_form.object.cost == 0 %>
                                  <h5 class="alert alert-info"><%= t(:free_delivery) %></h5>
                               <% end %>' )