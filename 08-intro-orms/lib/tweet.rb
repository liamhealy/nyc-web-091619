class Tweet
  attr_accessor :message, :username
  # @@all = []

  def initialize(username, message)
    @message = message
    @username = username

    # @@all << self
  end

  def save
    sql = <<-SQL
    INSERT INTO tweets (username, message)
    VALUES (?, ?);
    SQL

    result = DB[:conn].execute(sql, self.username, self.message)

    self
  end
  
  def self.all
    # @@all
    sql = <<-SQL
    SELECT *
    FROM tweets;
    SQL

    results = DB[:conn].execute(sql) # array of hashes
    
    results.map do |row|
      # row is a hash from the db table
      username = row['username']
      message = row['message']

      self.new(username, message)
    end
  end

end
