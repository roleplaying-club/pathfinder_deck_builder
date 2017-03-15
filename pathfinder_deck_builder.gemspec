Gem::Specification.new do |s|
  s.name        = 'pathfinder_deck_builder'
  s.version     = '0.0.4'
  s.date        = '2017-02-23'
  s.summary     = 'Turn your Herolab custom output into a deck of cards'
  s.description = 'A simple gem to turn XML into JSON'
  s.authors     = ["Kyle Sponheim"]
  s.email       = 'kyle.sponheim@gmail.com'
  s.files       = ['lib/pathfinder_deck_builder.rb',
                   'lib/card.rb', 
                   'lib/character_card.rb',
                   'lib/melee_weapon_card.rb',
                   'lib/ranged_weapon_card.rb',
                   'lib/armor_card.rb',
                   'lib/tracked_resource_card.rb',
                   'lib/spell_card.rb',
                   'lib/skill_card.rb',
                   'lib/defensive_ability_card.rb',
                   'lib/feat_card.rb',
                   'lib/trait_card.rb',
                   'lib/special_ability_card.rb',
                   'lib/special_attack_card.rb',
                   'lib/deck.rb',
                   'lib/compiler.rb']
  s.license     = 'MIT'
end