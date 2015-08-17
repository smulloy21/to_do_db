require('spec_helper')

describe(Task) do


  describe('#description') do
    it('should return the description of the task') do
      test_task = Task.new({:description => "A Task to Complete", :list_id => 1})
      expect(test_task.description()).to(eq("A Task to Complete"))
    end
  end

  describe('#list_id') do
    it('should return the id of the list it belongs to') do
      test_task = Task.new({:description => "A Task to Complete", :list_id => 1})
      test_task.save
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#save') do
    it('should store the task in the database') do
      test_task = Task.new({:description => "A Task to Complete", :list_id => 1})
      test_task.save
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe(':==') do
    it('returns true if the descriptions and the ids are the same') do
      test_task = Task.new({:description => "A Task to Complete", :list_id => 1})
      test_task2 = Task.new({:description => "A Task to Complete", :list_id => 1})
      expect(test_task).to(eq(test_task2))
    end
  end
end
