Deface::Override.new(virtual_path: 'spree/admin/users/index',
					 name: 'add_csv_to_users_index',
					 insert_after: "erb[silent]:contains('content_for :page_actions')",
					 partial: 'spree/admin/users/csv_users_index',
					 original: 'adebf7733615743e41a7959a4796a8da39fc5afe')
