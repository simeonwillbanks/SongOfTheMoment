require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Song of the Moment | "
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content =>  @base_title + "Home")
    end
    
    it "should have the tagline" do
      get 'home'
      response.should have_selector("p", :content => "There's a song, and it's awesome.")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => @base_title + "Contact")
    end

    it "should have a contact person" do
      get 'contact'
      response.should have_selector("p", :content => "Simeon F. Willbanks")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'help'
      response.should have_selector("title", :content => @base_title + "Help")
    end
    
    it "should have the question and answer" do
      get 'help'
      response.should have_selector("dt", :content => "Where can I see all songs at this moment?")
      response.should have_selector("dd", :content => "Checkout a stream of everybody's songs.")
    end
  end

end
