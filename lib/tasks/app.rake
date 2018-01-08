namespace :app do
  namespace :dev do
    task reset: %i( db:drop db:create db:migrate db:seed app:dev:sample)
    task sample: :environment do
      FactoryBot.create(:engineer)
      FactoryBot.create(:company, :with_companies_demand)
    end
  end
end
