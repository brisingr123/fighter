This app can be deployed on heroku directly. 

Once Deployed, run the following commands: 

heroku rake db:migrate db:seed

heroku rake import_cities_csv:create 

You can import a csv of companies and investors by looking at format of the files "Landscape - Company Details.csv" and "investors.csv"
