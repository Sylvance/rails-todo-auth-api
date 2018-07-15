# rails-todo-auth-api
A rails todo application with authentication.

## How to recreate this project
You can go (here)[https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api] to recreate it.
If you are lazy below is a summarized version.

- Create a new app, make it api-only
	`rails new rails-todo-auth-api --api`

- Create a new User Model
	`rails g scaffold User name email password_digest`

- Run migrations
	`rails db:migrate`

- Add Bcrypt to the Gemfile by uncommenting line 20
	`gem 'bcrypt', '~> 3.1.7'`

- Then install it
	`bundle install`

- Modify your `app/models.user.rb` to look like this
	`class User < ApplicationRecord
		has_secure_password
	end`

- Add jwt to the Gemfile
	`gem 'jwt'`

- Then install it
	`bundle install`

- In `lib` add this class and name the file `json_web_token.rb`
	```
	class JsonWebToken
	 class << self
	   def encode(payload, exp = 24.hours.from_now)
	     payload[:exp] = exp.to_i
	     JWT.encode(payload, Rails.application.secrets.secret_key_base)
	   end
	   def decode(token)
	     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
	     HashWithIndifferentAccess.new body
	   rescue
	     nil
	   end
	 end
	end
	```

- In `config/application.rb` add this line
	`config.autoload_paths << Rails.root.join('lib')`

- Add simple command to your Gemfile
	`gem 'simple_command'`

- Then install it
	`bundle install`
