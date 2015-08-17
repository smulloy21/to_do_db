class Task

  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id          = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}') RETURNING id;")
    @id    = result.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      id = task.fetch('id').to_i()
      tasks.push(Task.new({:description => description, :id => id}))
    end
    tasks
  end


  define_method(:==) do |another_task|
    if self.description == another_task.description &&
       self.id          == another_task.id
      true
    else
      false
    end
  end
end
