# todos_controller.rb

class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain: Todo.all.to_a
    #render plain:Todo.all.map{ |todo| todo.to_pleasent_string }.join("\n")
    render plain:Todo.order(:due_date).map{ |todo| todo.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    #render plain: "The id you wanted was #{id}"
    todo = Todo.find(id)  # Returns None if not present.
    render plain: todo.to_pleasent_string
  end

  def create
    #render plain: "Hey, this is create action!"
    #render plain: "Hey, Our Params are: #{params.to_s} "
    todo_text = params[:todo_text]
    #due_date = params[:due_date]
    due_date = DateTime.parse(params[:due_date])

    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false
    )
    response_text = "Hey new todo is created with id #{new_todo.id}"
    render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed;
    todo.save!
    render plain: "Updates todo completed stutus to #{completed}"
  end

end
