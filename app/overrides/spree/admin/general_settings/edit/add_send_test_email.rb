Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
					 name: 'add_send_test_email',
 					 insert_after: "#preferences",
  					 text: "<% content_for :page_actions do %> <%= link_to_with_icon 'envelope', Spree.t('mail_methods.send_testmail'), testmail_admin_general_settings_path,
    method: :post, class: 'send_mail button' %><% end %>")