# frozen_string_literal: true

require_relative '../application_system_test_case'

class DashboardOverridesSystemTest < ApplicationSystemTestCase
  setup do
    Project.find(1).enable_module!(:dashboard)
  end

  def test_redmine_oh_dashboard_override_stylesheet_loads_after_plugin_assets
    with_settings :ui_theme => 'redmine_oh' do
      log_user('admin', 'admin')
      visit '/projects/ecookbook/rdb/taskboard'
      wait_for_ajax

      assert_selector '#rdb-header .rdb-board .rdb-menu-link', :text => 'Task Board'

      hrefs = page.evaluate_script(<<~JS)
        Array.from(document.querySelectorAll('link[rel="stylesheet"]')).map((link) => link.href)
      JS

      dashboard_css = hrefs.find_index {|href| href.include?('/plugin_assets/redmine_dashboard/dashboard-')}
      dashboard_ui_css = hrefs.find_index {|href| href.include?('/plugin_assets/redmine_dashboard/dashboard.ui-')}
      dashboard_issues_css = hrefs.find_index {|href| href.include?('/plugin_assets/redmine_dashboard/dashboard.issues-')}
      dashboard_taskboard_css = hrefs.find_index {|href| href.include?('/plugin_assets/redmine_dashboard/dashboard.taskboard-')}
      dashboard_override_css = hrefs.find_index {|href| href.include?('/themes/redmine_oh/dashboard_overrides-')}

      assert_not_nil dashboard_css
      assert_not_nil dashboard_ui_css
      assert_not_nil dashboard_issues_css
      assert_not_nil dashboard_taskboard_css
      assert_not_nil dashboard_override_css
      assert_operator dashboard_override_css, :>, dashboard_css
      assert_operator dashboard_override_css, :>, dashboard_ui_css
      assert_operator dashboard_override_css, :>, dashboard_issues_css
      assert_operator dashboard_override_css, :>, dashboard_taskboard_css

      metrics = page.evaluate_script(<<~JS)
        (() => {
          const heading = document.querySelector('#rdb-header .rdb-board h2');
          const boardLink = document.querySelector('#rdb-header .rdb-board .rdb-menu a.rdb-menu-link');
          const filterLink = document.querySelector('#rdb-header .rdb-filter .rdb-menu a.rdb-menu-link');
          const headingStyle = window.getComputedStyle(heading);
          const boardLinkStyle = window.getComputedStyle(boardLink);
          const filterLinkStyle = window.getComputedStyle(filterLink);

          return {
            headingLetterSpacing: headingStyle.letterSpacing,
            headingLineHeight: parseFloat(headingStyle.lineHeight),
            boardLinkDisplay: boardLinkStyle.display,
            boardLinkFontSize: parseFloat(boardLinkStyle.fontSize),
            boardLinkPaddingLeft: parseFloat(boardLinkStyle.paddingLeft),
            boardLinkPaddingRight: parseFloat(boardLinkStyle.paddingRight),
            boardLinkLineHeight: parseFloat(boardLinkStyle.lineHeight),
            filterLinkDisplay: filterLinkStyle.display
          };
        })()
      JS

      assert_equal 'normal', metrics['headingLetterSpacing']
      assert_in_delta 25.0, metrics['headingLineHeight'], 0.5
      assert_equal 'inline-block', metrics['boardLinkDisplay']
      assert_in_delta 24.0, metrics['boardLinkFontSize'], 0.5
      assert_in_delta 15.2, metrics['boardLinkPaddingLeft'], 0.5
      assert_in_delta 30.4, metrics['boardLinkPaddingRight'], 0.5
      assert_in_delta 32.4, metrics['boardLinkLineHeight'], 0.75
      assert_equal 'inline-block', metrics['filterLinkDisplay']
    end
  end

  def test_other_themes_do_not_load_dashboard_override_stylesheet
    with_settings :ui_theme => '' do
      log_user('admin', 'admin')
      visit '/projects/ecookbook/rdb/taskboard'

      hrefs = page.evaluate_script(<<~JS)
        Array.from(document.querySelectorAll('link[rel="stylesheet"]')).map((link) => link.href)
      JS

      assert hrefs.none? {|href| href.include?('/dashboard_overrides-')}
    end
  end
end
