class Scrap 
  attr_accessor :url

  @@url_valdoise = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  @@hash = {}

  def initialize(url)
    @url = @@url_valdoise
    get_townhall_urls(@@url_valdoise)
  end


  def get_townhall_urls(url_valdoise)
    cities = @@url_valdoise.xpath('//a[contains(@href, "./95")]')
    cities.map do |url_name|
      # puts url_name
      full_url = "https://www.annuaire-des-mairies.com/" + "#{url_name['href'].delete_prefix!("./")}"   #recup
      name = url_name.text  
      # puts full_url
      # puts name
      get_townhall_mail(full_url, name)
    rescue
      puts "#{name} n'a pas d'email"
    end
    print @@hash

  end 

  def get_townhall_mail(full_url, name)
    general_townhall = Nokogiri::HTML(open(full_url))
    townhall_mail = general_townhall.at('td:contains("@")').text.strip
    puts "#{name} ajouté"
    @@hash[name] = townhall_mail
  end

end

# scrap = Scraper.new("https://www.annuaire-des-mairies.com/val-d-oise.html")
# hash_toute_les_infos_des_mairies = scrap.main
# puts hash_toute_les_infos_des_mairies