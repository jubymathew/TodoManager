class Todo <ActiveRecord::Base
  def index
    render plain: Todo.all.to_a
  end

  def to_pleasent_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text}, #{due_date}"
  end
end
