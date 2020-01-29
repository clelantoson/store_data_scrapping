require 'bundler'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'

# Scrapper.new.perform
scrapper = Scrap.new
# hash_toute_les_infos_des_mairies = scrapper.get_townhall_urls(url_valdoise)
puts hash_toute_les_infos_des_mairies