class Comment < ActiveRecord::Base
  validates_presence_of :body, :author

  belongs_to :post
  # attr_reader :id, :body, :author, :post_id, :created_at, :errors

  # def initialize(attributes={})
  #   set_attributes(attributes)
  #   # @id = attributes['id'] if new_record?
  #   # @body = attributes['body']
  #   # @author = attributes['author']
  #   # @post_id = attributes['post_id']
  #   # @created_at ||= attributes['created_at']
  #   @errors = {}
  # end

  # def set_attributes(attributes)
  #   @id = attributes['id'] if new_record?
  #   @body = attributes['body']
  #   @author = attributes['author']
  #   @post_id = attributes['post_id']
  #   @created_at ||= attributes['created_at']
  # end
  
  # def valid?
  #   @errors['body']   = "can't be blank" if body.blank?
  #   @errors['author'] = "can't be blank" if author.blank?
  #   @errors.empty?
  # end

  # def insert
  #   insert_comment_query = <<-SQL 
  #     INSERT INTO comments (body, author, post_id, created_at)
  #     VALUES (?, ?, ?, ?)
  #   SQL

  #   connection.execute(insert_comment_query, @body, @author, @post_id, Time.now.to_s)
  # end

  # def post
  #   Post.find(post_id)
  # end

  # def self.connection
  #   db_connection = SQLite3::Database.new('db/development.sqlite3')
  #   db_connection.results_as_hash = true
  #   db_connection 
  # end

  # def connection
  #   self.class.connection
  # end

  # def new_record?
  #   @id.nil?
  # end

  # def self.find(id)
  #   comment_hash = connection.execute("SELECT * FROM comments WHERE comments.id = ? LIMIT 1", id).first
  #   Comment.new(comment_hash)
  # end

  # def self.all
  #   comment_row_hashes = connection.execute("SELECT * FROM comments")
  #   comment_row_hashes.map do |comment_row_hash|
  #     Comment.new(comment_row_hash)
  #   end
  # end
 
  # def save
  #   return false unless valid?
  #   if new_record?
  #     insert
  #   else
  #     # Yet to be defined.
  #   end
  # end

  # def destroy
  #   connection.execute "DELETE FROM comments WHERE id = ?", id
  # end

end