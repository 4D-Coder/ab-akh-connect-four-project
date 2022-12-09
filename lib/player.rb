class Player
    attr_reader :name,
                :checker

    def initialize(name, checker)
        @name = name
        @checker = checker
    end
end