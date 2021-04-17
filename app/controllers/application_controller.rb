class ApplicationController < ActionController::Base

	def hello_world
		name = params['name'] || 'world'
		render 'application/hello_world', locals: {name: name}
		# binding.pry
	end
end
