Deface::Override.new(virtual_path: "spree/admin/shared/_header",
                     name: "json_export_button",
                     insert_top: "ul[data-hook='toolbar']",
                     partial: "spree/admin/orders/add_json_order_export_button",
                     disabled: false)
