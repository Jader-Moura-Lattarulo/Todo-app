require 'csv'
CSV_DIRECTORY = "csv_files"

module Todo
    def self.download_csv(todos)
        if todos.empty?
          puts "No TODOs to export, please add a TODO before download as a CSV"
        else
          current_time = Time.now
          timestamp = current_time.strftime("%Y/%m/%d")
          csv_file = "todos_#{timestamp}.csv"
    
          ::CSV.open(csv_file, 'w') do |csv|
            todos.each { |todo| csv << [todo] }
          end
    
          puts "TODOs successfully exported to #{csv_file}\n"
        end
    end
    
    def self.see_all_todos(todos)
        if todos.empty?
            timestamp = Date.today.strftime("%Y/%m/%d")
            csv_file_name = File.join(File.dirname(__FILE__), CSV_DIRECTORY, "todos_#{timestamp}", "todos_#{timestamp}.csv")
    
            if File.exist?(csv_file_name)
                todos_from_csv = CSV.read(csv_file_name).flatten
                puts "List of all TODOs:\n"
                todos_from_csv.each_with_index { |todo, index| puts "#{index + 1} #{todo}"}
            else
                puts "No TODOs have been added yet."
                puts "Please add a TODO before checking all TODOs."
            end
        else
            timestamp = Date.today.strftime("%Y/%m/%d")
            puts "List of all TODOs:\n"
            todos.each_with_index { |todo, index| puts "#{index + 1} #{todo}"}
        end
        puts
    end
    
    def self.add_todo(todos)
        puts "Enter the TODO description:"
        new_todo = gets.chomp
    
        if new_todo.strip.empty?
            puts "The description cannot be empty.\n"
        elsif todos.include?(new_todo)
            puts "Your already have this on the list.\n"
        else
            todos << new_todo
            puts "TODO successfully added: #{new_todo}\n"
        end
    end
    
    def self.remove_todo(todos)
        if todos.empty?
            puts "No TODOs have been added yet."
            return
        else
            puts "Select the index of the TODO you want to remove:\n"
            todos.each_with_index { |todo, index| puts "#{index + 1}. #{todo}" }
        end
        puts
    
        input = gets.chomp
    
        if input.match?(/\A\d+\z/) && (index = input.to_i - 1).between?(0, todos.length - 1)
            removed_todo = todos.delete_at(index)
            puts "TODO removed: #{removed_todo}\n"
        else
            puts "The given index is not valid.\n"
        end
    end 
end