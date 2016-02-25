# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  module StatusTask
    NOT_STARTED = 0
    STARTED = 1
    COMPLETED = 2
  end


  def not_started?
    self.status == StatusTask::NOT_STARTED
  end

  def started?
    self.status == StatusTask::STARTED
  end

  def completed?
    self.status == StatusTask::COMPLETED
  end
  validates :title, presence: true
end
