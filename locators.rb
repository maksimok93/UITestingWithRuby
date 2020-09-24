module EntryPageLocators
  LOGIN = 'input[type="submit"]'
end

module HeaderLocators
  OPENSOURCECMS = 'li[id="wp-admin-bar-site-name"]'
  UPDATE = 'li[id="wp-admin-bar-updates"]'
  EDIT_COMMENTS = 'li[id="wp-admin-bar-comments"]'
  NEW = 'li[id="wp-admin-bar-new-content"]'
end

module PostsLocators
  PUBLISH = 'input[id="publish"]'
  CONFIRM_PUBLISH = 'button[class="components-button editor-post-publish-button is-button is-default is-primary is-large"]'
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
end

module Links
  ENTRY_PAGE = 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/index.php'
  NEW_POST = 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/post-new.php'
  NEW_USER = 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/user-new.php'
  USERS = 'https://s1.demo.opensourcecms.com/wordpress/wp-admin/users.php'
end
