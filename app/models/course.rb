class Course < ApplicationRecord
    validates :title, :short_description, :language, :price, :level,  presence: true
    validates :description, presence: true, length: { :minimum => 5} 

    

    belongs_to :user
    has_many :lessons, dependent: :destroy
    has_many :enrollments
    def to_s
        title
    end

    extend FriendlyId
    friendly_id :title, use: :slugged
    LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
    def self.languages
        LANGUAGES.map { |language| [language, language] }
    end

    LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
    def self.levels
        LEVELS.map { |level| [level, level] }
    end
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  def bought(user)
    self.enrollments.where(user_id: [user.id], course_id: [self.id]).empty?
  end
end



