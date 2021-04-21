class Comment
  attr_reader :id, :body, :author, :post_id, :created_at, :errors

  def initialize(attributes={})
    # set_attributes(attributes)
    @id = attributes['id'] if new_record?
    @body = attributes['body']
    @author = attributes['author']
    @post_id = attributes['post_id']
    @created_at ||= attributes['created_at']
    @errors = {}
  end

  def valid?
    @errors['body']   = "can't be blank" if body.blank?
    @errors['author'] = "can't be blank" if author.blank?
    @errors.empty?
  end

  def set_attributes(attributes)
    @id = attributes['id'] if new_record?
    @body = attributes['body']
    @author = attributes['author']
    @post_id = attributes['post_id']
    @created_at ||= attributes['created_at']
  end

  def save
    return false unless valid?
    if new_record?
      insert
    else
      # Yet to be defined.
    end
  end

  def insert
    insert_comment_query = <<-SQL 
      INSERT INTO comments (body, author, post_id, created_at)
      VALUES (?, ?, ?, ?)
    SQL

    connection.execute(insert_comment_query, @body, @author, @post_id, Time.now.to_s)
  end

  def self.connection
    db_connection = SQLite3::Database.new('db/development.sqlite3')
    db_connection.results_as_hash = true
    db_connection 
  end

  def connection
    self.class.connection
  end

  def new_record?
    @id.nil?
  end
end