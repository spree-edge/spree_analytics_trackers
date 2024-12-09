module Spree
  module Admin
    module MainMenu
      module DefaultConfigurationBuilderDecorator
        def add_integrations_section(root)
          super

          section = root.items.find { |s| s.key == 'integrations' }
          return unless section

          section.items << ItemBuilder.new('analytics', admin_trackers_path).
            with_manage_ability_check(Spree::Tracker).
            with_match_path('/analytics').
            build
        end
      end
    end
  end
end

Spree::Admin::MainMenu::DefaultConfigurationBuilder.prepend(
  Spree::Admin::MainMenu::DefaultConfigurationBuilderDecorator
)
