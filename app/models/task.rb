# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  content     :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  articles_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_tasks_on_articles_id  (articles_id)
#  index_tasks_on_user_id      (user_id)
#
class Task < ApplicationRecord
end
