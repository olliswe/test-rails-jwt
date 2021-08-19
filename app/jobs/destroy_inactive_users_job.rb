class DestroyInactiveUsersJob < ApplicationJob
  queue_as :default

  def perform(days_ago)
    sleep 10
    old_users = User.where("created_at < ?", days_ago)
    puts old_users.pluck(:id)
  end
end
