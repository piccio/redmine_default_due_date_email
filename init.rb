require 'redmine_default_due_date_email/mail_handler_patch'

Rails.configuration.to_prepare do
  # plugin does its actions only if 'default due date' plugin is present
  if Redmine::Plugin.registered_plugins[:redmine_default_due_date].present?
    unless MailHandler.included_modules.include? RedmineDefaultDueDateEmail::MailHandlerPatch
      MailHandler.prepend(RedmineDefaultDueDateEmail::MailHandlerPatch)
    end
  end
end

Redmine::Plugin.register :redmine_default_due_date_email do
  name 'Redmine Default Due Date Email plugin'
  author 'Roberto Piccini'
  description 'set default due date to issue created via email'
  version '1.0.0'
  url 'https://github.com/piccio/redmine_default_due_date_email'
  author_url 'https://github.com/piccio'
end
