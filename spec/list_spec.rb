require('spec_helper')

describe(List) do

  describe('#name') do
    it('should return the name of the list') do
      test_list = List.new({:name => "My List", :id => nil})
      expect(test_list.name()).to(eq("My List"))
    end
  end
end
