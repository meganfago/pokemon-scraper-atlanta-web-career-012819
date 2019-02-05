class Pokemon
  attr_accessor :hp
  attr_reader :id, :name, :type, :db

  def initialize(atts={})
    @id = atts[:id]
    @name = atts[:name]
    @type = atts[:type]
    @db = atts[:db]
    @hp = atts[:hp]
  end

  def self.save(name, type, db)
    db.execute("insert into pokemon (name, type) values ('#{name}','#{type}')")
  end

  def self.find(id, db)
    db.results_as_hash = true
    row = db.execute("select * from pokemon where id=#{id}").first
    Pokemon.new(id: row['id'], name: row['name'], type: row['type'], hp: row['hp'], db: db)
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE pokemon SET hp=#{hp_new} WHERE id=#{id}")
  end

end
