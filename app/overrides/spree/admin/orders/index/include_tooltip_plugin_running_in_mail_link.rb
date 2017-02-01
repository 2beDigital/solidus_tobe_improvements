Deface::Override.new(virtual_path: "spree/layouts/admin",
                     name: "include_tooltip_plugin_init_js",
                     insert_bottom: "[data-hook='admin_footer_scripts']",
                     text: "<script>$('.tooltips').tooltip();</script>",
                     original: '68e5f39ceb9d6983f84d1736560783b983644bb8')