dir = File.dirname(__FILE__) + '/'

Dir[dir + 'ext/**/*.rb'].each do |extension|
  require extension[dir.length..-1]
end
