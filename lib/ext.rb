Dir['ext/**/*.rb'].each do |extension|
  require extension
end
