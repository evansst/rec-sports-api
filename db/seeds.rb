# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ParticipatesIn.destroy_all
# PlaysFor.destroy_all
# Season.destroy_all
# TeamGame.destroy_all
# Standing.destroy_all
# Team.destroy_all

# League.destroy_all
# Player.destroy_all

  league = League.create(
    league_name: "Coed Soccer 11v11"
  )

  seasons = [
    Season.create(name: "Fall 2020", league_id: league.id),
    Season.create(name: "Winter 2020", league_id: league.id)
  ]

  8.times do 
    team = Team.create(team_name: Faker::Team.creature.capitalize)

    10.times do
      name = "#{Faker::Name.male_first_name} #{Faker::Name.last_name}"
      player = Player.create(
        name: name,
        username: Faker::Internet.username(specifier: name, separators: %w(. _ -)),
        email_address: Faker::Internet.free_email(name: name),
        password: Faker::Internet.password,
        gender: 'Male'
      )

      PlaysFor.create(
        team_id: team.id,
        player_id: player.id
      )
    end

    5.times do
      name = "#{Faker::Name.female_first_name} #{Faker::Name.last_name}"
      player = Player.create(
        name: name,
        username: Faker::Internet.username(specifier: name, separators: %w(. _ -)),
        email_address: Faker::Internet.free_email(name: name),
        password: Faker::Internet.password,
        gender: 'Female'
      )

      PlaysFor.create(
        team_id: team.id,
        player_id: player.id
      )
    end

    seasons.each do |season|
      Standing.create(
        team_id: team.id,
        season_id: season.id,
        points: 0
      )
    end
  end