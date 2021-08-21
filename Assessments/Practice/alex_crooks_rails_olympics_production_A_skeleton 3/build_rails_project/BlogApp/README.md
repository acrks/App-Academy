# Rails Olympics Part 2 - Building a Rails Project

You have _45 minutes_ for this portion evaluation.

This evaluation will focus on the creation of a simple CRUD Blogging
application. For this part of the evaluation you will be creating models and
controllers for users, blogs and comments.

## File Structure

You will start with a standard Rails file structure that including pre-written
HTML views and specs. **Do not alter any of the spec files.**

## Scoring & Objective

Each passing spec will award one point, for a total of 25 points. This component
of the evaluation is estimated to take **45 minutes**. Your objective is to pass
as many specs as possible.

## Getting Started

Before you begin running the specs, make sure that you create your database:

```sh
bundle exec rails db:create
```

#### Database Configuration

Every time you run `bundle exec rails db:migrate`, also run
`bundle exec rails db:test:load`. `db:migrate` only updates the development
database; `db:test:load` updates the test DB schema to mirror the development
DB.

You can combine both commands into one:

```sh
bundle exec rails db:migrate db:test:load
```

### Data Types

You will create migration, models and controllers for the following data types:

1. `Users` will have a email which is a string.
   - a User's email will be unique
2. `Blogs` will have a `title` which is a string, a `body` which is text, and
   will belong to a `User` (name this column `author_id`).
   - A User has many blogs, but those blogs must all have unique names in
     regards to that User.
   - If a Blog is destroyed then all Comments associated with that blog will
     also be destroyed
3. `Comments` will have a `body` which is a string, and will belong to both a
   `User` (name this column `author_id`). and a `Blog` (name this column
   `blog_id`).

A User has many Blogs. A User can comment on both their own blog and other
User's blogs (a comment can only be made onto a Blog).

You will only be writing and tested on the migrations, models, and controllers.
When writing the strong parameters for your controllers, you can assume all
incoming parameters will be passed in though the body of incoming requests
(including `foreign_keys`).

## Specs

As you progress though this Evaluation we recommend completing and running all
the Models specs before attempting the Controller specs.

If a failing spec confuses you, look at the spec file to see if you can discern
what it is asking of you.

As ever, please ask your TAs any questions. If you get stuck or don't know why
something is failing; ask. TAs will let you know whether they can answer your
question, so ask anything.

### Running Specs

- `cd` into the project's root directory (`build_rails_project_pt2/BlogApp`)
- `bundle install` to install dependencies
- `bundle exec rspec` to run the entire spec suite
- `bundle exec rspec spec/<spec_file_name>` to run all specs in a given spec
  file
  - for example: `bundle exec rspec spec/models/user_spec.rb`
- `bundle exec rspec spec/<spec_file_name>:<line_number>` to run the spec(s) in
  the block that contains the given line number of a given spec file
  - for example: `bundle exec rspec spec/models/user_spec.rb:1`
