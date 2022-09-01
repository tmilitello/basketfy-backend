
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "basketfy.io", "www.basketfy.io", "basketfy.io","localhost:3000", "localhost:8080",  "limitless-mesa-74394.herokuapp", "limitless-mesa-74394.herokuapp.com", "limitless-mesa-74394.herokuapp.com", "https://limitless-mesa-74394.herokuapp.com"
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end


