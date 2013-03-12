require 'spec_helper'

describe "Home" do

  describe "Index" do

    it "should have the h1 'Blog'" do
      visit 'root'
      page.should have_selector('h1', :text => 'Blog')
    end

    it "should have the base title" do 
      visit 'root'
      page.should have_selector('title',
      					:text => "Jer1000 Blog")
    end

    it "should not have a custom page title" do
      visit 'root'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "About" do 

  	it "should have the h1 'About'" do 
  	  visit '/home/about'
  	  page.should have_selector('h1', :text => 'About')
  	end

  	it "should have the title 'About'" do 
      visit '/home/about'
      page.should have_selector('title', :text => "About Me")
    end
  end
end
