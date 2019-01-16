# CLI Controller

class NewOpportunities::CLI

  def call
    NewOpportunities::Opportunities.scrape
    puts "Scholarship and fellowship opportunities from http://oppourtunities.com"
    list_opportunities
    menu
    goodbye
  end

  def list_opportunities
    @opportunities = NewOpportunities::Opportunities.all
    @opportunities.each.with_index(1) do |opportunity, i|
      puts "#{i}. #{opportunity.name}"
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of the opportunity you'd like more info on, or type list, or type exit "
      input = gets.strip.downcase

      if input.to_i >0
        the_opportunity = @opportunities[input.to_i - 1]
        puts "#{the_opportunity.name} \nDeadline: #{the_opportunity.deadline} \nPosted on: #{the_opportunity.post_date}"
        puts "type more to see the description or type url to find the link"
        input_2 = gets.strip.downcase
        if input_2 == "more"
          puts "#{the_opportunity.description}"
        elsif input_2 == "url"
          puts "#{the_opportunity.url}"
          puts ""
        end
      elsif input == "list"
        list_opportunities
      else
        puts "not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "see you soon for more opportunities."
  end
end
