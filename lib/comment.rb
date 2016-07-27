class Comment

  attr_reader :name, :age, :content

  def initialize(name, age, content)
    @name = name
    @age = age
    @content = content

  end

  def check_inputs(name, age, content)
    raise TypeError, "Name, age, and content must all be strings!" unless name.is_a? String
    raise TypeError, "Name, age, and content must all be strings!" unless age.is_a? String
    raise TypeError, "Name, age, and content must all be strings!" unless content.is_a? String
  end

end