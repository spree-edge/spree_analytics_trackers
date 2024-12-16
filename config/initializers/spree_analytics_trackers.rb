Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.add_to_section('integrations',
      ::Spree::Admin::MainMenu::ItemBuilder.new('analytics', ::Spree::Core::Engine.routes.url_helpers.admin_trackers_path).
        with_manage_ability_check(::Spree::Tracker).
        with_match_path('/admin/trackers').
        build
    )
  end
end
