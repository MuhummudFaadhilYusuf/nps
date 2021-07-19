require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
    sign_in users(:regular)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "Add New Project"

    fill_in "Title", with: @project.title
    click_on "Create Project"
    assert_selector "h1", text: @project.title

    assert_text "Project was successfully created"
    click_on "All Projects"
  end

  test "updating a Project" do
    visit project_url(@project)
    # click_on "Show", match: :first
    click_on "Edit", match: :first

    fill_in "Title", with: "Hello Test"
    click_on "Update Project"
    assert_selector "h1", text: "Hello Test"

    assert_text "Project was successfully updated"
    click_on "All Projects"
  end

  test "destroying a Project" do
    visit project_url(@project)
    # click_on "Show", match: :first
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    assert_selector "h1", text: "Projects"

    assert_text "Project was successfully destroyed"
  end
end
