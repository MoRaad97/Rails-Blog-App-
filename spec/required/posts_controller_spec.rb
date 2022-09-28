require 'rails_helper'

RSpec.describe PostsController, type: :request do
  context '#index' do
    it "assigns all posts to @posts" do
           get('/users/4/posts')
      expect(assigns(:posts)).to eq(Post.all)
    end
    it 'render a template' do
      get('/users/4/posts')
      expect(response).to render_template('index')
    end
    it 'Response Status To Be 200' do
      get('/users/4/posts')
      expect(response).to have_http_status(200)
      end
      it 'response body should include' do
        get('/users/4/posts')
        expect(response.body).to include('<h1>Post Index Page</h1>')
      end
    end
    
    context '#show' do
      it 'render a template' do
        get('/users/4/posts/15')
        expect(response).to render_template('show')
    end
    it 'response body should include' do
      get('/users/4/posts/15')
      expect(response.body).to include('<h1>Post details Page</h1>')
    end
  end
end
