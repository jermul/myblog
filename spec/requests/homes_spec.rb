require 'spec_helper'

describe "Home" do

let (:base_title) { "Jer1000 Blog" }

  describe "Index" do

    it "should have the h1 'Blog'" do
      visit 'root'
      page.should have_selector('h1', :text => 'Blog')
    end

    it "should have the title 'Home'" do 
      visit 'root'
      page.should have_selector('title',
      					:text => "#{base_title} | Home")
    end
  end

  describe "About" do 

  	it "should have the h1 'About'" do 
  	  visit '/home/about'
  	  page.should have_selector('h1', :text => 'About')
  	end

  	it "should have the title 'About'" do 
      visit '/home/about'
      page.should have_selector('title',
      					:text => "#{base_title} | About")
    end
  end
end
