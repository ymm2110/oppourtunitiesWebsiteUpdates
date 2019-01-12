class NewOpportunities::Opportunities

  attr_accessor :name, :url, :description, :post_date

  def self.today
    # I should return a bunch of instances of Opportunities
    self.scrape_opportunities
  end

  def self.scrape_opportunities
    opportunities = []
    opportunities << self.scrape
    opportunities
  end

  def self.scrape
    html = Nokogiri::HTML(open("http://oppourtunities.com/updates/"))
    binding.pry
  #   html.css("article.post").each.with_object([]) do |post, array|
  # array << {
  #   name:
  #   description:
  #   post_date:
  #   url:
  # }
    end
  end
