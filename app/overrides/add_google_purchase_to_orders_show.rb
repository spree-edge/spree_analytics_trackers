if Gem.loaded_specs['spree_core'].version >= Gem::Version.create('3.5.0')
  Deface::Override.new(
    virtual_path: 'spree/orders/show',
    name: 'add_google_purchase_to_orders_show',
    insert_before: "#order_summary",
    original: '91777d086e3b2f337e2761f702f1711da6975a6b',
    text: <<-HTML
      <%= render partial: 'spree/shared/trackers/google_analytics/purchase', formats: :js %>
    HTML
  )
end
