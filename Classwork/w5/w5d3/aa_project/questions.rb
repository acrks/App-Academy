require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :fname, :lname
    
    def self.all
        user = QuestionsDBConnection.instance.execute("SELECT * FROM users")
        user.map { |person| User.new(person)}
    end


    def self.find_by_id(id)
        user = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE 
            id = ?
        SQL
        if user.length < 1
            return nil
        else
            User.new(user.first)
        end
    end

    def initialize(new_option)
        @id = new_option['id']
        @fname = new_option['fname']
        @lname = new_option['lname']
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? AND lname = ?
        SQL
        if user.length < 1
            return nil
        else
            User.new(user.first)
        end
    end

    def authored_questions
        Questions.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user_id(id)
    end

    def insert
        raise "#{self} is already in the database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.fname, self.lname)
            INSERT INTO
                users(fname, lname)
            VALUES
                (?,?,?)
        SQL
        id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.fname, self.lname)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
    end
end

class Question
    attr_accessor :id, :title, :body, :author_id
    def self.all
        questions = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
        questions.map { |question| Question.new(question)}
    end


    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE 
            id = ?
        SQL
        if question.length < 1
            return nil
        else
            Question.new(question.first)
        end
    end

    def initialize(new_option)
        @id = new_option['id']
        @title = new_option['title']
        @body = new_option['body']
        @author_id = new_option['author_id']
    end

    def self.find_by_author_id(author_id)
        author = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE 
            author_id = ?
        SQL
        author.map {|author_question| Question.new(author_question)}
    end

    def insert
        raise "#{self} is already in the database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.author_id)
            INSERT INTO
                questions(title, body, author_id)
            VALUES
                (?,?,?)
        SQL
        id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.author_id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
        SQL
    end

    def author
        User.find_by_id(author_id)
    end

    def replies
        Reply.find_by_question_id
    end
end

class Reply

    attr_accessor :id, :question_id, :parent_reply_id, :user_id, :body

    def self.all
        reply = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
        reply.map { |each_reply| Reply.new(each_reply)}
    end


    def self.find_by_id(id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE 
            id = ?
        SQL
        if reply.length < 1
            return nil
        else
            Reply.new(reply.first)
        end
    end

    def self.find_by_user_id
        reply = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            replies
        WHERE 
            user_id = ?
        SQL
        reply.map {|author_reply| Reply.new(author_reply)}
    end

    def self.find_by_question_id
        reply = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE 
            question_id = ?
        SQL
        if reply.length < 1
            return nil
        else
            Reply.new(reply)
        end
    end

    def self.find_by_parent_id(parent_reply_id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, parent_reply_id)
        SELECT
            *
        FROM
            replies
        WHERE 
            parent_reply_id = ?
        SQL
        reply.map {|author_reply| Reply.new(author_reply)}
    end

    def initialize(new_option)
        @id = new_option['id']
        @question_id = new_option['question_id']
        @parent_reply_id = new_option['parent_reply_id']
        @user_id = new_option['user_id']
        @body = new_option['body']
    end

    def insert
        raise "#{self} is already in the database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.user_id, self.body)
            INSERT INTO
                replies(question_id, parent_reply_id, user_id, body)
            VALUES
                (?,?,?,?)
        SQL
        id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.user_id, self.body)
            UPDATE
                replies
            SET
                question_id = ?, parent_reply_id = ?, user_id = ?, body = ?
            WHERE
                id = ?
        SQL
    end

    def author
        User.find_by_id(user_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
        Reply.find_by_id(parent_reply_id)
    end

    def child_replies
        Reply.find_by_parent_id(id)    
    end
end


# class QuestionFollow
#     def self.find_by_id
#     end
# end


# class QuestionLike
#     def self.find_by_id
#     end
# end