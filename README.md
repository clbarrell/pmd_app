Welcome to the PMD App
==================

This App is going to be a simple CRUD application where consulting projects can be tracked, edited and analysed.

## Live Preview

This App (most recent master push) can be previewed at https://pmd-app.herokuapp.com/. This is of course not completely up to date, but hopefully provides a useful perspective. You can signup with no problem.

## App Overview / Purpose

This app will act as a database to record, monitor and manage consulting projects.

The workflow within a consulting firm would be to:
1. Create a new project as soon as you have something on the cards (can be proposal, guaranteed work, etc.)
2. **Enter project details:** associatied client and contact, project status, total $, probabiltiy win, service line, if the project would be a suitable reference
3. **Enter project splits:** this assigns users to the project with different roles (coordinator, sales, involved)
4. *Complete*. Now you go on to maintenance mode.

Once projects are created, there will be multiple ways to *monitor projects / users / clients & contacts*:
- All projects list `/projects` (index)
  - List of all projects. Can be filtered by active & inactive.
- Individual projects `/projects/1` (show)
  - Shows the details of a specific project and includes all related project_splits: showing the roles of each user
- User overview & dashboard `/admin/users/1` (show)
  - At the moment only shows basic details.
  - Will turn into individual dashboard showing user's active projects, quaretly sales splits, reminders, etc.
- List of clients `/clients` (index)
- Specific client page `/clients/1` (show)
  - Will show all assoc. contacts and projects
- List of contacts `/contacts` (index)
- Specific contact page `/contacts/1` (show)
  - Not sure of specific use of this page yet...?

## Feature List

That takes us to the planned feature list:
- Project (& all other resources) entry
- Project searching, listing and editing
- Dashboard of user's projects & those needing updating
- Calculating of sales splits & project activity
- Email reminders
- Allocation of project revenue accross months & subsequent reporting


## Completed

- All resources can now be created
  - Not all can be edited yet. Still doing this.
- Pages
  - `index` pages created for all required resources
- Forms
  - New / edit forms completed for all resources
  - JS dynamic forms for project_split & project
    - Auto filter contacts for client on new_project
    - Auto enable/disable sales input depending on role
- Database & Model Structure
  - Database is up to date with all models, etc.
  - Model
- Devise (GEM) successfully installed to allow for user registration, etc.
- Formtastic & formtastic-bootstrap (GEMs) successfully installed to allow for easier forms

## TO DO

- `Show` pages
  - For projects (#1 prioritity)
    - Include a link / partial of all relevant splits & user's associatied
  - For clients
    - Include associatied contacts & list of projects
- Clients - make it obvious / requried to have at least 1 contact. Redirect to `new_contact(client_id : @client.id)` once client created?
- Project_split creation
  - On the `new` page, show all existing splits for reference
  - Have links to 'add' anther split to a form so 2 can be submitted at once? See (here)[http://www.carlos-roque.com/2014/11/18/adding-and-removing-children-from-a-form-in-rails-4/]. I now know enough jquery to do this & render more partials
- Larger modules still to do
  - Better filtering with **Filterrific** (#2 prioritity)
  - Monitoring of projects and their time since update
  - Email reminders
  - Allocation of total project $ accross months & then report on timeframes
  - Manage whether a proper amount of project splits have been created

# Resource Explanation

**Projects**
- Status: Whether the project is current or not (Active, Delayed, Complete, Inactive)
- Job_number: Job number associated with project
- Total: Total $ amount expected from project
- Service_line: the service line the project belongs to
- Project_type: What kind of project it is (Proposal, Guarenteed)
- Probability: Likelihood of winning the project / getting the money
- Suitable_reference: Whether the project is a good example and would be a potential reference
- Client: the organisation and contact attached to the client.

**Project Splits**
- Project: associated project
- User: Associated user
- Role: The role of the attached user in relation to the project (Sales, Involved, Coordinator)
- Percentage: only required for sales, it's the percentage split of the sale

*Note*: Project-splits are 'nested' resources, meaning that the route is setup `projects/:project_id/project_splits` will produce all the project-splits for that specific `:project_id`. There is no way to access project splits without using a specific project. Paths become: `new_project_project_split_path`.

Projects & splits are the main resources, so will probably leave it at that.