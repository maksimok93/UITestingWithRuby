# frozen_string_literal: true

module EntryPageLocators
  LOGIN = 'input[type="submit"]'
end

module HeaderLocators
  OPENSOURCECMS = 'li[id="wp-admin-bar-site-name"]'
  UPDATE = 'li[id="wp-admin-bar-updates"]'
  EDIT_COMMENTS = 'li[id="wp-admin-bar-comments"]'
  NEW = 'li[id="wp-admin-bar-new-content"]'
end

module LeftMenuLocators
  LEFT_MENU = 'div[id="adminmenuback"]'
end

module DashboardLocators
  SCREEN_OPTIONS = 'button[id="show-settings-link"]'
end

module UsersLocators
  USERS = 'li[id="menu-users"]'
  ADD_NEW_USER = 'input[id="createusersub"]'
  SHOW_PASSWORD = 'button[class="button wp-generate-pw hide-if-no-js"]'
  APPLY = 'input[id="doaction2"]'
  ACTIONS = 'bulk-action-selector-bottom'
  NEW_ROLE = 'new_role'
  CHANGE = 'input[id="changeit"]'
end

module ToolsLocators
  STATUS = 'post-status'
end
