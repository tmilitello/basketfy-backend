
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://basketfy-2022.herokuapp.com", "basketfy.io", "localhost:3000", "localhost:8080", "basketfy.io", "https://ancient-thicket-68427.herokuapp.com/baskets"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

