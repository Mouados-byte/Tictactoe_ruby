class Board
    def initialize()
        @round = 1
        @iboard = Array.new(9,-1)
        @positions = Array(0..8)
        @player1 = true 
    end

    def start()
        winner = false
        while (@round <= 9) do
            puts "\e[H\e[2J"
            printBoard
            play
            @round += 1
            winner = endgame
            if(winner != false)
                break
            end
        end
        puts "\e[H\e[2J"
        printBoard
        if (winner == 'X') 
            puts "Player 1 wins"
        elsif (winner == 'O') 
            puts "Player 2 wins"
        elsif (winner == false) 
            puts "Draw"
        end
    end

    def play()
        puts "Player #{@player1 ? "1" : "2"}"
        print "Enter position (1..9) : "
        nums = gets.chomp.to_i
        if(@positions.include? nums-1)
            @iboard[nums - 1] = @player1 ? "X" : "O"
            @player1 = !@player1;
            @positions.delete(nums-1)
        else
            puts "Position invalid"
        end 
    end

    def endgame()
        for i in (0..2) do
            if(@iboard[i*3] != -1)
                if [@iboard[i*3] , @iboard[i*3 + 1] , @iboard[i*3 + 2 ]] == [@iboard[i*3]] * 3
                    return @iboard[i*3]
                end
            end
            if(@iboard[i] != -1)
                if [@iboard[i] , @iboard[i+3] , @iboard[i+6]] == [@iboard[i]] * 3
                    return @iboard[i]
                end
            end
            if(@iboard[0] != -1)
                if [@iboard[0] , @iboard[4] , @iboard[8]] == [@iboard[0]] * 3
                    return @iboard[0]
                end
            end
            if(@iboard[2] != -1)
                if [@iboard[2] , @iboard[4] , @iboard[6]] == [@iboard[2]] * 3
                    return @iboard[2]
                end
            end
        end
        return false
    end

    def printBoard()
        for i in (0..@iboard.length - 1) do
            print " #{@iboard[i] == -1 ? ' ' : @iboard[i]} "
            if i%3 == 2
                print "\n"
            else
                print " | "
            end
        end
    end
end

curr_board = Board.new();
curr_board.start