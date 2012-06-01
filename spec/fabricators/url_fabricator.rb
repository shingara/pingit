Fabricator(:url) do
  link 'http://google.com'
  ping_statuses(:count => 1) { |parent| Fabricate(:ping_status, :url => parent) }
end
