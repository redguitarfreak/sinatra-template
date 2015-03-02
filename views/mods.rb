#!/usr/bin/env ruby


#https://www.youtube.com/watch?v=BmxzCBEQ6OI

mods = {
	wheels: "volk gts",
	exhaust: "Tomei",
	intake: "Stillen"
}

puts "What would you like to do? Options: (add) (update) (delete) (list)"
	choice = gets.chomp

	case choice 

	when "add"
		puts "What type of mod would you like to add to your list?"
		type = gets.chomp
	if mods[type.to_sym] .nil?
		puts "What brand of mod is this?"
		brand = gets.chomp
		mods[type.to_sym] = brand.to_sym
		puts "#{brand} #{type} has been added to your list of mods"
	else puts "That mod already exists in your list!"
	end

#need to suss this out a little bit better
#potentially #update_mod #update_brand
	when "update"
		puts "What type of mod would you like to change?"
		type = gets.chomp
	if mods[type.to_sym] .nil?
		puts "Error! Mod not found!"
	else puts "Please enter a new name for your mod:"
		brand = gets.chomp
		mods[type.to_sym] = brand.to_sym
		puts "Thanks for updating. Your change to #{type} has been updated."
	end

	when "delete"
		puts "What mod would you like to delete?"
		type = gets.chomp.to_sym
	if mods[type.to_sym] .nil?
		puts "Cannot delete a mod that doesn't exist."
	else mods.delete(type)
		puts "#{type} has been deleted!"
	end

	when "list"
		mods.each do |type, brand|
			puts "#{type}: #{brand}"
		end
	
	else
		puts "Erro. Something is broken!"
	end

puts mods