# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.find_or_create_by(role: :admin)
Role.find_or_create_by(role: :user)

t_name = %w(anxiety
            method
            proposal
            message
            police
            poet
            expression
            baseball
            presence
            newspaper
            penalty
            thanks
            wood
            property
            blood
            emotion
            opportunity
            art
            gene
            presentation
            preparation
            studio).freeze
t_name.each do |name|
  Team.find_or_create_by(team_name: name.capitalize)
end
