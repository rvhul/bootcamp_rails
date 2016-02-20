class Task < ActiveRecord::Base
  module StatusTask
    NOT_STARTED = 0
    STARTED = 1
    COMPLETED = 2
  end
end
