require('spec_helper')

describe(Task) do


  describe('#description') do
    it('should return the description of the task') do
      test_task = Task.new({:description => "A Task to Complete", :id => nil})
      expect(test_task.description()).to(eq("A Task to Complete"))
    end
  end
end
