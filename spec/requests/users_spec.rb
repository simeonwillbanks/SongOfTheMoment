require 'spec_helper'

describe "Users" do
  
  describe "join" do
    
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit join_path
          fill_in "Name",     :with => ""
          fill_in "Email",    :with => ""
          fill_in "Password", :with => ""
          fill_in "Confirm",  :with => ""
          click_button
          response.should render_template('users/new')
          # Once you figure out the error message layout, 
          # write the appropriate responses
          #response.should have_selector("span").should == "Can't be blank"
          #response.should have_selector("span").should == "Is too short (minimum is 6 characters)"
          response.body.should include "Is too short (minimum is 6 characters)"
        end.should_not change(User, :count)
      end
    end
    describe "success" do
      it "should make a new user" do
        lambda do
          visit join_path
          #  Use the CSS id of the text box instead of the label
          fill_in :user_name,                   :with => "Example User"
          fill_in :user_email,                  :with => "user@example.com"
          fill_in :user_password,               :with => "foobar"
          fill_in :user_password_confirmation,  :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
    
  end
    
end
