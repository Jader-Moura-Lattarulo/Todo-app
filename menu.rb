require_relative 'todo.rb'

module Menu
    def self.print_selected_option(selected_option)
        puts "Selected option: #{selected_option}\n"
    end
    
    def self.print_menu
        puts "What do you want to do?\n"
        puts "[S]ee all TODOs"
        puts "[A]dd a TODO"
        puts "[R]emove a TODO"
        puts "[D]ownload TODOs as CSV"
        puts "[E]xit"
    end

    def self.process_user_choice(choice, todos)
        case choice
        when "s"
            print_selected_option("See all TODOs")
            Todo.see_all_todos(todos)
        when "a"
            print_selected_option("Add a TODO")
            Todo.add_todo(todos)
        when "r"
            print_selected_option("Remove a TODO")
            Todo.remove_todo(todos)
        when "d"
            print_selected_option("Download TODOs as CSV")
            Todo.download_csv(todos)
        when "e"
            print_selected_option("Exit")
            puts "Press any key to close."
            gets.chomp
        end
    end
end