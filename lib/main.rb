#!/bin/env ruby20

require 'nokogiri'
require 'open-uri'

relative_require 'dicts/online_dictionary'
relative_require 'dicts/slovnik_azet_sk'
relative_require 'dicts/slovnik_cz'

if ARGV.size == 1
    ARGV.insert(0, 'default')
end

if ARGV.size == 2
    dict, query = *ARGV
    puts query
    #SlovnikAzet.lookup(dict, query).each do |word|
    SlovnikCZ.lookup(dict, query).each do |word|
        puts "- #{word}"
    end
else
    puts 'usage: script.rb dict query'
end
