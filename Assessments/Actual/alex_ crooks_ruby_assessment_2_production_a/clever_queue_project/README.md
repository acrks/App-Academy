# Ruby Assessment 2 Version A - CleverQueue

In this project, you will build a `CleverQueue`, a variation of a classic `Queue` data structure.

## File Structure

```plaintext
clever_queue_project/
├── Gemfile
├── README.md
├── lib
│   ├── clever_queue.rb
│   └── simple_queue.rb
└── spec
    ├── clever_queue_spec.rb
    └── simple_queue_spec.rb
```

## Scoring

Each passing spec will award one point, for a total of 48 points.
This component of the assessment is estimated to take 35 minutes.

## Objective

There are 48 total specs given in the `spec` directory. Your objective is to
pass as many specs as possible. We recommend that you work through the spec
files in the following order:

1. `spec/simple_queue_spec.rb` (21 specs)
2. `spec/clever_queue_spec.rb` (27 specs)

## Usage

- `cd` into the project's root directory (`clever_queue_project`)
- `bundle install` to install dependencies
- `bundle exec rspec` to run the entire spec suite
- `bundle exec rspec spec/<spec_file_name>` to run all specs in a given spec
  file
  - for example: `bundle exec rspec spec/clever_queue_spec.rb`
- `bundle exec rspec spec/<spec_file_name>:<line_number>` to run the spec(s) in
  the block that contains the given line number of a given spec file
  - for example: `bundle exec rspec spec/clever_queue_spec.rb:117`

## API

Below is the complete list of methods that the classes will support. Note that
some methods may be overridden in the subclass.

### SimpleQueue

- #initialize
- #size
- #vacant?
- #front
- #back
- #first
- #last
- #enqueue
- #dequeue

### CleverQueue

- #capacity
- #soft_limit
- #soft_limit=
- #trim
