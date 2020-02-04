class Owner
  
  attr_reader :name, :species

  @@owners = []
  @@cats = []
  @@dogs = []

  def initialize (name, species = "human")
    @name = name
    @species = species
    @@owners << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners.clear
  end

  def cats
    Cat.all.select {|x| x.owner === self}
  end

  def dogs
    Dog.all.select {|x| x.owner === self}
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
    @@cats << new_cat
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
    @@dogs << new_dog
  end

  def walk_dogs
    self.dogs.map {|x| x.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|x| x.mood = "happy"}
  end

  def sell_pets
    self.dogs.map {|x| x.mood = "nervous"}
    self.cats.map {|x| x.mood = "nervous"}
    self.dogs.map {|x| x.owner = nil}
    self.cats.map {|x| x.owner = nil}
  end

  def list_pets
    my_dogs = @@dogs.select {|x| x.owner == self}
    my_cats = @@cats.select {|x| x.owner == self}
    "I have #{my_dogs.length} dog(s), and #{my_cats.length} cat(s)."
  end

end