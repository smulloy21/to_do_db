require('spec_helper')

describe(Task) do

  before { @test_task = Task.new({:description => "A Task to Complete", :list_id => 1, :due_date => '2015-10-30 00:00:00'}) }

  describe('#description') do
    it('should return the description of the task') do
      expect(@test_task.description()).to(eq("A Task to Complete"))
    end
  end

  describe('#list_id') do
    it('should return the id of the list it belongs to') do
      @test_task.save
      expect(@test_task.list_id()).to(eq(1))
    end
  end

  describe('#save') do
    it('should store the task in the database') do
      @test_task.save
      expect(Task.all()).to(eq([@test_task]))
    end
  end

  describe(':==') do
    it('returns true if the descriptions and the ids are the same') do
      @test_task2 = Task.new({:description => "A Task to Complete", :list_id => 1, :due_date => '2015-10-30 00:00:00'})
      expect(@test_task).to(eq(@test_task2))
    end
  end

  describe('#all') do
    it('returns the items sorted by the most recent') do
      @test_task.save()
      test_task2 = Task.new({:description => "A Task to Complete", :list_id => 1, :due_date => '2015-10-30 01:00:00'})
      test_task2.save()
      test_task3 = Task.new({:description => "A Task to Complete", :list_id => 1, :due_date => '2015-10-30 02:00:00'})
      test_task3.save()
      expect(Task.all()).to(eq([@test_task, test_task2, test_task3]))
    end
  end
end
