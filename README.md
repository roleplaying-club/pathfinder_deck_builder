# pathfinder_deck_builder

This Ruby program translates a Pathfinder character sheet in an xml format from the Hero Lab 
character management software into a JSON format for upload to crobi's rpg-cards tool. 

### Install Dependencies 

`gem install crack`

`gem install json`

### cd to the bin directory of pathfinder_deck_builder

`cd path_to/pathfinder_deck_builder/bin`

### Run the program

`ruby deck_builder.rb`

The deck builder will ask for your the path to your file. Store your xml file in 
pathfinder_deck_builder/bin for easy access. The deck builder will compile your
deck and output a JSON file in pathfinder_deck_builder/bin. Upload this file to
crobi's rpg-cards tool. 
