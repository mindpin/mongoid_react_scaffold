class KcCourses::Course
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :views, type: Integer
end
