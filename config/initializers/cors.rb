
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "basketfy.io", "www.basketfy.io", "basketfy.io","localhost:3000", "localhost:8080",  "https://63133dc4d407750884f93c8d--dreamy-swan-af1c13.netlify.app", "63133dc4d407750884f93c8d--dreamy-swan-af1c13.netlify.app", "https://63133dc4d407750884f93c8d--dreamy-swan-af1c13.netlify"
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end


