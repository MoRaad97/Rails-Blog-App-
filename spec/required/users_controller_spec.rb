# require 'rails_helper'

# RSpec.describe UsersController, type: :request do
#   context '#index' do
#     it "assigns all users to @users" do
#       get("/")
#       expect(assigns(:users)).to eq(User.all)
#     end
#     it 'render a template' do
#       get("/")
#       expect(response).to render_template('index')
#     end
#     it 'Response Status To Be 200' do
#       get("/")
#       expect(response).to have_http_status(200)
#     end
#     it 'response body should include' do
#       get('/')
#       expect(response.body).to include('<h1>List of User "Index Page"</h1>')
#     end
#   end

#   context '#show' do
#     it 'render a template' do
#       get("/users/4")
#       expect(response).to render_template('show')
#     end
#     it 'response body should include' do
#       get('/users/4')
#       expect(response.body).to include('<h1>User Detials "Show Page"</h1>')
#     end
#   end
# end
