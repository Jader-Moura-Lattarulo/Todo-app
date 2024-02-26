require_relative 'menu.rb'
require_relative 'todo.rb'

def run_todo_app
    todos = []

    puts "Hello!"

    loop do
        Menu.print_menu
        user_choice = gets.chomp.downcase
        system("clear") || system("cls")

        valid_choices = ["s", "a", "r", "d", "e"]

        if valid_choices.include?(user_choice)
            Menu.process_user_choice(user_choice, todos)
        else
            puts "Invalid choice! Please input a valid choice:\n"
        end

        break if user_choice == "e"
    end
end
