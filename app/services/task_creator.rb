class TaskCreator
  def initialize(user:, params:)
    @user = user
    @params = params
  end

  def call
    task = @user.tasks.build(@params)
    ActiveRecord::Base.transaction do
      task.save!
    end
    task
  rescue ActiveRecord::RecordInvalid => e
    e.record
  end
end