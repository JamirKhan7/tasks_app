class TaskQuery
  def initialize(relation = Task.all)
    @relation = relation
  end

  def filter(status: nil, user: nil, q: nil)
    @relation.where(status: status) if status.present?
    @relation.where(user: user) if user.present?
    @relation.where("title LIKE ?", "%#{q}%")
    @relation
  end
end
