require 'csv'

namespace :import do
    desc 'Imports movies from CSV'
    task :movies => :environment do
        # Todo: should be a seperate file. Ran into some issues, first let's make it work
        csv_text = "Movie,Description,Year,Director,Actor,Filming location,Country
    Gone in 60 seconds,A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brother's life.,2000,Dominic Sena,Nicolas Cage,Los Angeles,US
    Gone in 60 seconds,A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brother's life.,2000,Dominic Sena,Leonardo Di Caprio,Los Angeles,US
    Gone in 60 seconds,A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brother's life.,2000,Dominic Sena,Giovani Ribisi,Los Angeles,US
    Gone in 60 seconds,A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brother's life.,2000,Dominic Sena,Nicolas Cage,Lone Pine,US
    Gone in 60 seconds,A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brother's life.,2000,Dominic Sena,Leonardo Di Caprio,Lone Pine,US
    Gone in 60 seconds,A retired master car thief must come back to the industry and steal fifty cars with his crew in one night to save his brother's life.,2000,Dominic Sena,Giovani Ribisi,Lone Pine,US
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Leonardo Di Caprio,Los Angeles,US
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Joseph Gordon Levitt,Los Angeles,US
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Ellen Page,Los Angeles,US
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Giovani Ribisi,Los Angeles,US
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Leonardo Di Caprio,BedfordShire,UK
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Joseph Gordon Levitt,BedfordShire,UK
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Ellen Page,BedfordShire,UK
    Inception,A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.,2010,Christopher Nolan,Giovani Ribisi,BedfordShire,UK"

        csv = CSV.parse(csv_text, :headers => true)

        # Todo: Normalize location

        print csv.length

        csv.each do |row|
            print "***********"
            print row.inspect
            print "***********"
        #     Movie.create!([
        #         :title => row['Movie'].strip,
        #         :description => row['Description'],
        #         :director => row['Director'],
        #         :year => row['Year'],
        #         :actor => row['Actor'],
        #         :location => row['Filming Location'],
        #         :country => row['Country']
        #     ])
        end
    end

    desc 'Imports reviews from CSV'
    task :reviews => :environment do
        # Todo: should be a seperate file. Ran into some issues, first let's make it work
        csv_text = "Movie,User,Stars,Review
                    Gone in 60 seconds,Sam Pedro,4,Really good!
                    Gone in 60 seconds,Peter Troll,3,Ok movie
                    Gone in 60 seconds,Chris Bla,5,The best ever!
                    Gone in 60 seconds,Suzan Something,1,Worst Ever
                    Gone in 60 seconds,Axel Ontheway,5,Really really good
                    Inception,Mack Boe,4,Ok movie
                    Inception,Peter Troll,2,The best ever!
                    Inception,Rik van der Kroon,3,Really good!
                    Inception,Sam Pedro,2,Empty"

        csv = CSV.parse(csv_text, :headers => true)
        
        csv.each do |row|
            user = User.find_or_create_by name: row['User']
            movie = Movie.find_by title: row['Movie'].strip

            Review.create!([
                :stars => row['Stars'],
                :body => row['Review'],
                :user => user,
                :movie => movie
            ])
        end
    end

    task :all => ["import:movies", "import:reviews"]
end