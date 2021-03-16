# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  department :integer
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  enum department: { sales: 0, marketing: 1, production: 2}
  belongs_to :user
  has_one_attached :avatar
end
