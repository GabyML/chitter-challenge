module App
	module Routes
		class Sessions_Controller < Base

			get '/sessions/new' do
				erb :'/sessions/new'
			end

			post '/sessions' do
				user = User.authenticate(params[:email], params[:password])
				if user
					session[:user_id] = user.id
					redirect to('/welcome')
				else
					flash.now[:errors] = ['The email or password is incorrect']
					erb :'/sessions/new'
				end
			end

			delete '/sessions' do
				sessions[:user_id] = nil
				redirect to('/')
			end

		end
	end
end