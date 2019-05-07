require 'pg'

class Directors

  attr_accessor(:director_id, :name)

  def self.open_connection

    connection = PG.connect(dbname: 'movie_site')
  end

  def self.hydrate(data)

    director = Directors.new
    director.director_id = data['director_id']
    director.name = data['name']
    director
  end

  def self.all

    connection = self.open_connection
    sql = "SELECT * FROM directors ORDER BY director_id;"
    results = connection.exec(sql)

    directors = results.map do |director|
      self.hydrate(director)
    end
  end

  def save

    if (self.director_id)
      connection = Directors.open_connection
      sql = "UPDATE directors SET name = '#{self.name}' WHERE director_id = #{self.director_id}; "
      connection.exec(sql)
    else
      connection = Directors.open_connection
      sql = "INSERT INTO directors (name) VALUES ('#{self.name}');"
      connection.exec(sql)
    end


  end

  def self.find_director(id)

    connection = self.open_connection
    sql = "SELECT * FROM directors WHERE director_id = #{id} LIMIT 1;"
    result = connection.exec(sql)
    self.hydrate(result[0])

  end

  def self.delete(id)

    connection = self.open_connection
    sql = "DELETE FROM directors WHERE director_id = #{id}"
    connection.exec(sql)

  end

  def self.get_director_id(name)
    connection = self.open_connection
    directors = self.all
    directors.each do |director|
      if (name = director.name)
        sql = "SELECT director_id FROM directors WHERE name = '#{name}' LIMIT 1;"
        result = connection.exec(sql)
        self.hydrate(result[0])
      else
        false
      end
    end

  end
end
