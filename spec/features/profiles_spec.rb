 require 'rails_helper'

 describe "Visiting profiles" do
    include Warden::Test::Helpers
    Warden.test_mode!

   include TestFactories

   before do
     @user = create(:user)
     @post = create(:post, user: @user)
     @comment = create(:comment, post: @post, user: @user)
     #@user = authenticated_user
     #@post = associated_post(user: @user)
     #@comment = Comment.new(user: @user, post: @post, body: "A Comment")
     allow(@comment).to receive(:send_favorite_emails)
     @comment.save!
   end

   describe "not signed in" do

     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))
       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end

   end

   describe "signed in" do

    before do


      before { login_as create(:user, role: 'admin'), scope: :user }

    end

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
  end
 end
