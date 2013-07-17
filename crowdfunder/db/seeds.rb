
User.destroy_all
Project.destroy_all

user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password")

project1 = user.projects.create!(
	title: "Project 1", 
	teaser: "Teaser text 1",
  	description: "Description 1", 
  	goal: 13000)

project2 = user.projects.create!(
	title: "Project 2", 
	teaser: "Teaser text 2",
	description: "Description 2", 
	goal: 210000)

project2 = user.projects.create!(
	title: "Project 3", 
	teaser: "Teaser text 3",
    description: "Description 3", 
    goal: 30000)