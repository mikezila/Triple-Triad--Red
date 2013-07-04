Triple-Triad--Red
=================

A familiar card game, written in Ruby.

The gameplay logic is mosly finished.  There's no way to select cards to use in your hand at the moment, you just get a random selection of five.  There's also no way to play against a human, just the very dumb bot.  There's also no tracking of what turn it is, how many cards each player controls, and the "game" doesn't end, the board just fills up.  Still, though, it works, and the basic rules are in and as they should be.

Uses ugly white digits instead of pretty sprite numbers, but eh.

Requirements
------------

Ruby 1.9 and the Gosu gem

	gem install gosu

It was developed on OS X 10.8 using Ruby 1.9.3, and uses the Gosu gaming library.  It will work on Mac and Windows so long as Ruby is available and the Gosu gem is installed.  It will presumably work on Ruby 2.0 as well once Gosu is updated to support it, which as of this writing it does not.  It would work on Linux too if I converted the mp3 music to a format Linux didn't throw a hissy about, or if the music were disabled.

Controls
--------

Left and Right - Scroll through the cells on the game board
- **Up** and **Down** - Change the selected card
- **Space** - Place the card on the board, and pass turn to the bot
- **N** - Turn the music on and off
- **M** - Change the music track
- **Escape** - Exit

There are a couple keys left in for debugging as well

- **C** - Clear the board
- **O** and **P** - Draw a new hand of cards for you and the bot respectivly
- **E** - Dump some data to the console about the game board and each player's hand
- **B** - Have the bot place a card
