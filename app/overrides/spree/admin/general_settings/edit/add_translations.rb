Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
					 name: 'add_translations_gs',
 					 insert_after: "#preferences",
  					 partial: 'spree/admin/general_settings/edit/add_translations')