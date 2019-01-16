class NewOpportunities::Opportunities

  attr_accessor :name, :url, :description, :post_date, :deadline

  @opportunities = []

  def self.all
    @opportunities
  end


  def self.scrape
    html = Nokogiri::HTML(open("http://oppourtunities.com/updates/"))

    html.css("article.post").each do |post|
      opportunity = NewOpportunities::Opportunities.new
      opportunity.name = post.css("h4 a").text.strip
      opportunity.url = post.css("h4 a").attr("href").value
      opportunity.description = post.css("p.eltdf-post-excerpt").text.strip.gsub("\r\n", " ")
      opportunity.post_date = post.css(".entry-date a").text.strip
      opportunity.deadline = post.css("p.eltdf-post-excerpt").text.strip.gsub("\r\n", " ").split(" ")[0..3].join(" ")
      self.all << opportunity
    end
  end
end
