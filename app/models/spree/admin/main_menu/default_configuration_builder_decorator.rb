module Spree
  module Admin
    module MainMenu
      module DefaultConfigurationBuilderDecorator
        def add_settings_section(root)
          super

          section = root.items.find { |s| s.key == 'settings' }
          return unless section

          section.items << ItemBuilder.new(Spree.t(:analytics), admin_trackers_path).
            with_manage_ability_check(Spree::Config).
            with_match_path(admin_trackers_path).
            build
        end
      end
    end
  end
end

Spree::Admin::MainMenu::DefaultConfigurationBuilder.prepend(
  Spree::Admin::MainMenu::DefaultConfigurationBuilderDecorator
)
