class List

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id   = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch('name')
      id = list.fetch('id').to_i()
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_list|
    if self.id   == another_list.id &&
       self.name == another_list.name
       true
    else
       false
    end
  end

  define_singleton_method(:find) do |id_number|
    id_number.to_i()
    found_item = nil
    returned_list = DB.exec("SELECT * FROM lists WHERE id = '#{id_number}'")
    returned_list.each() do |list|
      name = list.fetch('name')
      id = list.fetch('id')
      found_item = List.new({:name => name, :id => id})
    end
    found_item
  end

  define_method(:tasks) do
    @id = self.id
    returned_tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{@id};")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      due_date = task.fetch('due_date')
      list_id = task.fetch('list_id')
      tasks.push(Task.new(:description => description, :due_date => due_date, :list_id => list_id))
    end
    tasks
  end
end
