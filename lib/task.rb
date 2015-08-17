class Task

  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id          = attributes.fetch(:id)
  end
end
