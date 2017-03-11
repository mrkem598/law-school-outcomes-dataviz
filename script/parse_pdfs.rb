require "open-uri"
require "pdf-reader"
require "pry"

class LineCountError < StandardError ; end

#urls = [
#  #"https://www.law.georgetown.edu/careers/ocs/upload/ABA-Website-Info.pdf",
#  "https://www.law.georgetown.edu/careers/upload/Employment-Summary-for-2015-Graduates.pdf",
#  #"https://www.law.gwu.edu/sites/www.law.gwu.edu/files/downloads/Employement_Data_2014.pdf",
#  "https://www.law.gwu.edu/sites/www.law.gwu.edu/files/downloads/GW-Law-ABA-Employment-Data-for-Class-of-2015.pdf",
#  #"https://www.wcl.american.edu/career/documents/statistics2014.pdf",
#  "https://www.wcl.american.edu/career/documents/statistics2015_000.pdf",
#  #"https://www.fordham.edu/download/downloads/id/1166/class_of_2014_at_10_months.pdf",
#  "https://www.fordham.edu/download/downloads/id/5271/class_of_2015_at_10_months.pdf",
#  #"http://www.uchastings.edu/career-office/docs/2014_ABA_Stats.pdf",
#  "http://www.uchastings.edu/career-office/docs/ABA%20Summary%20for%20website.pdf",
#  #"https://www.law.uconn.edu/sites/default/files/content-page/Graduate%20Employment%20Outcomes%20Class%20of%202014.pdf",
#  "https://www.law.uconn.edu/sites/default/files/content-page/Graduate-Employment-Outcomes-Class-of-2015-2016-04-26.pdf",
#  #"https://www.qu.edu/content/dam/qu/documents/sol/2015ABAEmploymentSummary.pdf",
#  "https://www.qu.edu/content/dam/qu/documents/sol/2014ABAEmploymentSummary.pdf"
#]

urls = ["https://www.fordham.edu/download/downloads/id/5271/class_of_2015_at_10_months.pdf"]

#
# LOOP THROUGH URLS
#

urls.each do |url|
  puts "GETTING PDF FROM #{url}"

  #
  # ACCESS PDF
  #

  io = open(url)
  reader = PDF::Reader.new(io)

  #
  # PARSE PDF
  #

  lines = reader.pages.first.text.split("\n")
  lines.select!{|line| line.size > 0 }
  lines.map!{|line| line.strip }

  puts "#{lines.first} - #{lines.count} lines"

  raise LineCountError unless lines.count == 53









  #   SECTION A - UNIVERSITY IDENTIFICATION
  #   SECTION B - EMPLOYMENT SUMMARY FOR XXXX GRADUATES
  #   SECTION C - EMPLOYMENT TYPE
  #   SECTION D - LAW SCHOOL/UNIVERSITY FUNDED POSITIONS
  #   SECTION E - EMPLOYMENT LOCATION
  #

  # lines.find{|line| line.include?("EMPLOYMENT SUMMARY FOR ") && line.include?(" GRADUATES")}.strip
  # lines.each_with_index.select{|line, i| line.include?("EMPLOYMENT SUMMARY FOR ") && line.include?(" GRADUATES") }
  # lines.find{|line| line.include?("EMPLOYMENT TYPE")}.strip

end