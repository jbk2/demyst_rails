class ApplicationController < ActionController::Base

	def hello_world
		name = params['name'] || 'world'
		render 'application/hello_world', locals: {name: name}
		# binding.pry
	end

	def new_post
		post = Post.new
		render 'application/new_post', locals: { post: post }
	end

	def create_post
		post = Post.new(	'title' 			=>	params['title'],
											'body'				=>	params['body'],
											'author'			=>	params['author'],
											'created_at'	=>	params['created_at'])
		if post.save
			redirect_to '/list_posts'
		else
			render 'application/new', locals: { post: post }
		end
	end

	def list_posts
 		posts = Post.all
 		render 'application/list_posts', locals: { posts: posts }
	end

	def show_post
 		post = Post.find(params['id'])
 		render 'application/show_post', locals: { post: post }
	end

	def edit_post
		post = Post.find(params['id'])
		render 'application/edit_post', locals: { post: post }
	end

	def update_post
		post = Post.find(params['id'])
		post.set_attributes('title' => params['title'], 'body' => params['body'], 'author' => params['author'])
		if post.save
			redirect_to '/list_posts'
		else
			render '/application/edit_post', locals: { post: post }
		end
	end

	def find_post_by_id(id)
		post = connection.execute("SELECT * FROM posts WHERE posts.id = ? LIMIT 1", id).first
	end

	def delete_post
		post = Post.find(params['id'])
		post.destroy

		redirect_to '/list_posts'
	end

	private

	def connection
		db_connection = SQLite3::Database.new('db/development.sqlite3')
 		db_connection.results_as_hash = true
 		db_connection
	end

end