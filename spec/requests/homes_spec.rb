require 'spec_helper'

describe "Root" do
  subject { page }
  before { visit root_path }

  it { should have_selector('h1',    text: 'Jerm Disorder') }
  it { should have_selector('title', text: full_title('')) }
  it { should_not have_selector 'title', text: '| Home' }

end

describe "About" do
  subject { page }
  before { visit about_path }

  it { should have_selector('h1',    text: 'About Me') }
  it { should have_selector('title', text: full_title('About Me')) }
end

