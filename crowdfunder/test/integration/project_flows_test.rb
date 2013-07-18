require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test "browsing projects" do 
    # Create three projects
    project1 = FactoryGirl.create(:project, :title => "Project 1")
    project2 = FactoryGirl.create(:project, :title => "Project 2")
    project3 = FactoryGirl.create(:project, :title => "Project 3")

    # Go to the page with the projects
    visit "/projects"
    # Assert the page we're on is the page with the projects
    assert_equal projects_path, current_path

    # Assert this page has the words 'Listing Projects'
    assert page.has_content?('Listing projects')

    # Assert this page has these words as well
    assert page.has_content?('Project 1')
    assert page.has_content?('Project 2')
    assert page.has_content?('Project 3')

    click_link 'Project 1'
    # Assert we're on project1's show page
    assert_equal project_path(project1), current_path
    # Assert on this page the first h1 has the text project1's title
    assert find('h1:first').has_content? project1.title

  end

  test "navigation" do
    # Visit the root URL
    visit "/"
    # Assert the page we're on is root
    assert_equal root_path, current_path
    # Assert the home nav element is active
    assert_equal "Home", find('.navbar ul li.active a').text

    # Click on the link to Projects
    find('.navbar ul').click_link('Projects')
    # Assert the page we're on is the projects page
    assert_equal projects_path, current_path
    # Assert the projects nav element is active
    assert_equal "Projects", find('.navbar ul li.active a').text
  end
end