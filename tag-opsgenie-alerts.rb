require 'httparty'
require 'dotenv/load'

class TagAlert

  def self.list_all_alerts(date)
    parse_date = Date.parse(date)
    format_date = parse_date.strftime("%d-%m-%Y")

    results = HTTParty.get("https://api.opsgenie.com/v2/alerts?query=createdAt%3A#{format_date}&sort=createdAt&order=desc", :headers => {
      "Content-Type" => "application/json",
      "Authorization" => "GenieKey #{ENV['API_KEY']}"
    })

    puts results["data"]
  end

list_all_alerts("2021-08-22")

end
