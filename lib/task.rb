class Task

  attr_reader(:description, :list_id, :due_date)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id     = attributes.fetch(:list_id)
    @due_date    = attributes.fetch(:due_date)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description, due_date, list_id) VALUES ('#{@description}', '#{@due_date}', #{list_id});")
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      due_date = task.fetch('due_date')
      list_id = task.fetch('list_id').to_i()
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    tasks
  end

  define_method(:==) do |another_task|
    self.description == another_task.description &&
    self.list_id     == another_task.list_id &&
    self.due_date    == another_task.due_date
  end
end
