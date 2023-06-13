namespace :slurp do
  
  desc "TODO"
  task seekers: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - seekers.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      s = Seeker.new
      s.email = row["email"]
      s.password = row["password"]
      s.save

      puts "#{s.email}, #{s.password} saved"
    end
    puts "There are now #{Seeker.count} rows in the seekers table"
  end


  task courses: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - courses.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      c = Course.new
      c.spiritual_type = row["spiritual_type"]
      c.title = row["title"]
      c.short_description = row["short_description"]
      c.save

      puts "#{c.title}, #{c.short_description} saved"
    end
    puts "There are now #{Course.count} rows in the Courses table"
  end


  task assessment_questions: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - assessment_questions.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      q = AssessmentQuestion.new
      q.name = row["name"]
      q.question = row["question"]
      q.spiritual_type = row["spiritual_type"]
      q.number = row["number"]
      q.assessment = row["assessment"]
      q.save

      puts "#{q.name}, #{q.assessment} saved"
    end
    puts "There are now #{AssessmentQuestion.count} rows in the Assessment Questions table"
  end

  task lessons: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - lessons.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      l = Lesson.new
      l.course_id = row["course_id"]
      l.practice_id = row["practice_id"]
      l.day = row["day"]
      l.title = row["title"]
      l.description = row["description"]
      l.spiritual_type = row["spiritual_type"]
      l.learning_session_id = row["learning_session_id"]
      l.practice_session_id = row["practice_session_id"]
      l.save

      puts "#{l.title}, #{l.description} saved"
    end
    puts "There are now #{Lesson.count} rows in the Lessons table."
  end

  task lesson_events: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "App Dev Project Data Examples - lesson_events.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|

      e = LessonEvent.new
      e.seeker_id = row["seeker_id"]
      e.lesson_id = row["lesson_id"]
      e.status = row["status"]
      e.save

      puts "#{e.seeker_id}, #{e.status} saved"
    end
    puts "There are now #{LessonEvent.count} rows in the Lesson Events table."
  end


end
