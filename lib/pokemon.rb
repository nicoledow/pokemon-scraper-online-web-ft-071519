class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
          SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE pokemon.id = id"
    db.execute(sql, id).map {|row| self.new(row)}
    binding.pry
  end



end
