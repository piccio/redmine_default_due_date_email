module RedmineDefaultDueDateEmail
  module MailHandlerPatch

    private

    def receive_issue
      issue = super

      issue.update_attribute(:due_date, Redmine::Plugins::DefaultDueDateListener.default_due_date)

      issue
    end

  end
end