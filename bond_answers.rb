# requiring a local file
require './bond_data.rb'

all_da_bond_hashes = Bond::MOVIE_DATA

# accessing the array inside the module
# puts Bond::MOVIE_DATA

# targets title "Skyfall"
# puts Bond::MOVIE_DATA[0][:title]

#============================
#         MISSION 1
#============================

def get_gross_for(title, movies)
  movie = movies.find{|movie| movie[:title] == title}
  movie = movie[:gross].gsub(/[$,]/, '').to_i
end

# puts get_gross_for('Skyfall', Bond::MOVIE_DATA)

#============================
#         MISSION 2
#============================

movies_grosses = Bond::MOVIE_DATA.map{|movie_hash| movie_hash[:gross]}
movies_grosses.map!{|one_gross| one_gross.gsub('$', '').split(',').join('').to_i}
# puts movies_grosses.reduce(:+)

#============================
#         MISSION 3
#============================

all_da_men = all_da_bond_hashes.map{|movie_hash| movie_hash[:actor]}.uniq
# puts all_da_men

#============================
#         MISSION 4
#============================

all_da_titles = all_da_bond_hashes.map{|movie_hash| movie_hash[:title]}
# puts all_da_titles

#============================
#         MISSION 5
#============================

the_odd_years = all_da_bond_hashes.select{|movie_hash| movie_hash[:year].odd?}
# puts the_odd_years

#============================
#         MISSION 6
#============================

worst_grossing_bond = movies_grosses.min
worst_grossing_bond = all_da_bond_hashes.select{|movie_hash| movie_hash[:gross].gsub(/[$,]/, '').to_i == worst_grossing_bond}
# puts worst_grossing_bond


# TEACHER SOLUTION
# def parse_gross(movie)
#   movie[:gross].gsub(/[$,]/, '').to_i
# end

# movies.min { |a, b| parse_gross(a[:gross]) <=> parse_gross(b[:gross])}


#============================
#         MISSION 7
#============================

highest_grossing_bond = movies_grosses.max
highest_grossing_bond = all_da_bond_hashes.select{|movie_hash| movie_hash[:gross].gsub(/[$,]/, '').to_i == highest_grossing_bond}
# puts highest_grossing_bond

#============================
#         MISSION 8
#============================

movies_per_actor = all_da_bond_hashes.group_by {|movies| movies[:actor]}
movies_per_actor.each {|key, value| movies_per_actor[key] = value.count}

# puts movies_per_actor

#============================
#         MISSION 9
#============================

sorted_by_release = all_da_bond_hashes.sort_by{|movie| movie[:year]}
puts sorted_by_release


# TEACHER'S SOLUTION
# def movies_sorted(movies)
#   movies.sort {|a, b| parse_gross(a[:gross]) <=> parse_gross(b[:gross]) }
# end




