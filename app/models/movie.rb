class Movie < ApplicationRecord
    #here we are going to validate the data
    validates  :title, :year, :director, :genre, :duration, presence: true
    validates :year, length:{is: 4}
    validates :genre, inclusion: {in: ['Sci-fi'.downcase, 'Fantasy'], message: 'Genre must contain sci-fi or Fantasy'}
    validates :director, exclusion: ['Me']
end
