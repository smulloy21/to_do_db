require('spec_helper')

describe(List) do

  describe('#name') do
    it('should return the name of the list') do
      test_list = List.new({:name => "My List", :id => nil})
      expect(test_list.name()).to(eq("My List"))
    end
  end
  describe('.all') do
    it('should be empty') do
      expect(List.all()).to(eq([]))
    end
  end
  describe('#id') do
    it('should return the id of a list') do
      test_list = List.new({:name => "My List", :id => nil})
      test_list.save()
      expect(test_list.id()).to(be_an_instance_of(Fixnum))
    end
  end
  describe('#save') do
    it('should save a list to the database') do
      test_list = List.new({:name => "My List", :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end
  describe('#==') do
    it('should return true if the ids and names are the same') do
      test_list  = List.new({:name => "My List", :id => nil})
      test_list2 = List.new({:name => "My List", :id => nil})
      expect(test_list).to(eq(test_list2))
    end
  end
end
