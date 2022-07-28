
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "basketfy.io", "localhost:3000", "localhost:8080", "basketfy.io", "https://fierce-coast-33664.herokuapp.com/", "fierce-coast-33664.herokuapp.com/", "fierce-coast-33664.herokuapp.com", "https://fierce-coast-33664.herokuapp.com"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

