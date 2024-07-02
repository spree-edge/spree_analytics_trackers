spree_version = Gem.loaded_specs['spree_core'].version
unless spree_version >= Gem::Version.create('3.4.0') && spree_version < Gem::Version.create('3.5.0')
  Deface::Override.new(
    virtual_path: 'spree/products/index',
    name: 'add_products_searched_to_products_list',
    insert_before: '[data-hook="search_results"]',
    original: 'e8f86d544d04f4cd9431ee37871d9b4e47c70434',
    text: <<-HTML
      <%= render partial: 'spree/shared/trackers/segment/products_searched', formats: :js %>
    HTML
  )
end
