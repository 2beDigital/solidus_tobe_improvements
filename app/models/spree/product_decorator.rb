Spree::Product.class_eval do
  add_search_scope :in_taxon_no_order do |taxon|
    includes(:classifications).
        where("spree_products_taxons.taxon_id" => taxon.self_and_descendants.pluck(:id))
  end
  add_search_scope :in_taxon do |taxon|
    includes(:classifications).
    where("spree_products_taxons.taxon_id" => taxon.id).order(Spree::Classification.arel_table[:position].asc)
  end
  add_search_scope :in_taxon_and_descendants do |taxon|
    includes(:classifications).
    where("spree_products_taxons.taxon_id" => taxon.self_and_descendants.pluck(:id)).
    order(Spree::Classification.arel_table[:position].asc)
  end


end