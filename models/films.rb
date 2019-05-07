require 'pg'

class Films

  attr_accessor(:id, :name, :director_id, :logo)

  def self.open_connection

    connection = PG.connect(dbname: 'movie_site')
  end

  def self.hydrate(film_data)

    film = Films.new
    film.id = film_data['id']
    film.name = film_data['name']
    film.director_id = film_data['director_id']
    film.logo = film_data['logo']
    film
  end

  def self.all

    connection = self.open_connection
    sql = 'SELECT * FROM films ORDER BY id;'
    results = connection.exec(sql)

    films = results.map do |film|
      self.hydrate(film)
    end
    films

  end

  def save

    if (self.id)
      connection = Films.open_connection
      sql = "UPDATE films SET name = '#{self.name}', logo = '#{self.logo}' WHERE id = #{self.id};"
      connection.exec(sql)

    else
      connection = Films.open_connection
      sql = "INSERT INTO films (name, logo, director_id) VALUES ('#{self.name}','#{self.logo}', #{self.director_id});"
      connection.exec(sql)

    end
  end

  def self.find_film(id)

    connection = self.open_connection
    sql = "SELECT * FROM films WHERE id = #{id} LIMIT 1"
    result = connection.exec(sql)
    film = self.hydrate(result[0])

  end

  def self.delete(id)

    connection = self.open_connection
    sql = "DELETE FROM films WHERE id = #{id};"
    connection.exec(sql)

  end

  def self.film_name(id)

    connection = self.open_connection
    sql = "SELECT name FROM films WHERE id = #{id}"

  end

end
