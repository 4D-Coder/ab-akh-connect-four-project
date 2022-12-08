class Game
    attr_reader :board

    def initialize
        @board = {}
    end

    def start
        puts welcome_user
    end

    def welcome_user
       "Welcome to CONNECT FOUR"
    end
end