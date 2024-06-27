if Gem.loaded_specs['spree_core'].version >= Gem::Version.create('3.5.0.alpha')
  Deface::Override.new(
    virtual_path: 'spree/shared/_head',
    name: 'add_google_analytics_initializer_to_spree_application',
    insert_after: 'title',
    original: '2b529599b6a4e9fcc21a295121c7b520e856e1fb',
    text: <<-HTML
      <%= render partial: 'spree/shared/trackers/google_analytics/initializer', formats: :js %>
    HTML
  )
end
