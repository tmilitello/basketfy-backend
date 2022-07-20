
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://basketfy-2022.herokuapp.com"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

