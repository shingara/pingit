Fabricator(:ping_status) do
  status 200
  response_time { rand(100) / 100 }
end
