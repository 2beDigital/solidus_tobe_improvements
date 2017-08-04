Spree::Taxon.class_eval do
    has_attached_file :icon,
      styles: { mini: '32x32>', normal: '380x420>' },
      default_style: :mini,
      url: '/taxons/:id/:style/:basename.:extension',
      path: '/taxons/:id/:style/:basename.:extension',
      default_url: '/assets/default_taxon.png'
end