# Add seed data in this file
puts "Seeding spells..."

spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |spell|
    res = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

    spell_hash=JSON.parse(res)
    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0]
    )
end

puts 'Done seeding!'