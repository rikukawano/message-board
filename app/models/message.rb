class Message < ActiveRecord::Base
    validates :name, length: { maximum: 20 }, presence: true
    validates :body, length: { minimum: 2, maximum: 30 }, presence: true
    validates :age, inclusion: { in: 0..100 }, presence: true
end
