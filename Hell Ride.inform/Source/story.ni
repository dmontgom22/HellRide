Part 1 - World Model

Chapter 1 - Inform Settings, Biblio Card, and Includes

Use maximum things understood at once of at least 200.
Use dynamic memory allocation of at least 65536.
Use maximum text length of at least 4096.
Use DICT_WORD_SIZE of 15.

The story title is "Hell Ride".
The story author is "No Shoes".
The story headline is "The ride of a lifetime...".
The story genre is "Horror".
The release number is 101.
The story description is "You've decided to stay and enjoy the carnival anyway."
The story creation year is 2024.

Release along with cover art.

Include Locksmith by Emily Short.

Include Basic Help Menu by Emily Short.

Include Rideable Vehicles by Graham Nelson.

Include Swearing Reloaded by Shin

Include Singing Reloaded by Shin

Use scoring.
Use American Dialect.
Use serial comma.
The maximum score is 100.
The block giving rule is not listed in the check giving it to rules.

Chapter 2 - New Mechanics, Actions, Phrases

Section 1- Money Mechanics

Price is a kind of value. $10.99 specifies a price. A thing has a price. The price of a thing is usually $0.00. After examining something for sale, say "It can be yours for [the price of the noun]."

Definition: a thing is free if the price of it is $0.00.
Definition: a thing is for sale if it is not free.

Instead of taking something for sale:
	say "You'll have to pay for that."

Before buying something for sale when the money is not in the wallet:
	say "You're broke." instead.

Before buying something for sale when the money is free:
	say "You're broke." instead.

Before buying something for sale when the price of the money is less than the price of the noun:
	say "You don't have enough money to cover the price of [the noun]." instead.

Instead of buying something:
	decrease the price of the money by the price of the noun;
	say "You fork over [the price of the noun] for [the noun], leaving yourself with [the price of the money].";
	if the money is free:
		now the money is nowhere;
	now the price of the noun is $0.00;
	now the player is carrying the noun.
	
The player carries a wallet. The wallet contains money. The printed name of the money is "[price of the money] in cash". Understand "cash" as the money.

Instead of taking the money:
	say "Best to leave it alone until you need to buy something."

Instead of buying something free:
	say "[The noun] is yours already."

Instead of buying the money:
	say "The money belongs to you; you buy things with it."
	
Section 2- Drink Mechanics

A volume is a kind of value. 15.9 fl oz specifies a volume with parts ounces and tenths (optional, preamble optional).

A fluid container is a kind of container. A fluid container has a volume called a fluid capacity. A fluid container has a volume called current volume.

The fluid capacity of a fluid container is usually 12.0 fl oz. The current volume of a fluid container is usually 0.0 fl oz.

Liquid is a kind of value. The liquids are water, Cola, milk, lemonade, and iced tea. A fluid container has a liquid.

Instead of examining a fluid container:
	if the noun is empty,
		say "You catch just a hint of [the liquid of the noun] at the bottom.";
	otherwise
		say "[The noun] contains [current volume of the noun in rough terms] of [liquid of the noun]."

To say (amount - a volume) in rough terms:
	if the amount is less than 0.5 fl oz:
		say "a swallow or two";
	otherwise if tenths part of amount is greater than 3 and tenths part of amount is less than 7:
		let estimate be ounces part of amount;
		say "[estimate in words] or [estimate plus 1 in words] fluid ounces";
	otherwise:
		if tenths part of amount is greater than 6, increase amount by 1.0 fl oz;
		say "about [ounces part of amount in words] fluid ounce[s]".

Before printing the name of a fluid container (called the target) while not drinking:
	if the target is empty:
		say "empty ";
	otherwise:
		do nothing.

After printing the name of a fluid container (called the target) while not examining:
	unless the target is empty:
		say " of [liquid of the target]";
		omit contents in listing.

Instead of inserting something into a fluid container:
	say "[The second noun] has too narrow a mouth to accept anything but liquids."

Definition: a fluid container is empty if the current volume of it is 0.0 fl oz. Definition: a fluid container is full if the current volume of it is the fluid capacity of it.

Understand "drink from [fluid container]" as drinking.

Instead of drinking a fluid container:
	if the noun is empty:
		say "There is no more [liquid of the noun] within." instead;
	otherwise:
		decrease the current volume of the noun by 0.2 fl oz;
		if the current volume of the noun is less than 0.0 fl oz, now the current volume of the noun is 0.0 fl oz;
		say "You take a sip of [the liquid of the noun][if the noun is empty], leaving [the noun] empty[end if]."

Understand the command "fill" as something new.

Understand "pour [fluid container] in/into/on/onto [fluid container]" as pouring it into. Understand "empty [fluid container] into [fluid container]" as pouring it into. Understand "fill [fluid container] with/from [fluid container]" as pouring it into (with nouns reversed).

Understand "pour [something] in/into/on/onto [something]" as pouring it into. Understand "empty [something] into [something]" as pouring it into. Understand "fill [something] with/from [something]" as pouring it into (with nouns reversed).

Pouring it into is an action applying to two things.

Check pouring it into:
	if the noun is not a fluid container, say "You can't pour [the noun]." instead;
	if the second noun is not a fluid container, say "You can't pour liquids into [the second noun]." instead;
	if the noun is the second noun, say "You can hardly pour [the noun] into itself." instead;
	if the liquid of the noun is not the liquid of the second noun:
		if the second noun is empty, now the liquid of the second noun is the liquid of the noun;
		otherwise say "Mixing [the liquid of the noun] with [the liquid of the second noun] would give unsavory results." instead;
	if the noun is empty, say "No more [liquid of the noun] remains in [the noun]." instead;
	if the second noun is full, say "[The second noun] cannot contain any more than it already holds." instead.

Carry out pouring it into:
	let available capacity be the fluid capacity of the second noun minus the current volume of the second noun;
	if the available capacity is greater than the current volume of the noun, now the available capacity is the current volume of the noun;
	increase the current volume of the second noun by available capacity;
	decrease the current volume of the noun by available capacity.

Report pouring it into:
	say "[if the noun is empty][The noun] is now empty;[otherwise][The noun] now contains [current volume of the noun in rough terms] of [liquid of the noun]; [end if]";
	say "[the second noun] contains [current volume of the second noun in rough terms] of [liquid of the second noun][if the second noun is full], and is now full[end if]."
	
Understand the liquid property as describing a fluid container. Understand "of" as a fluid container.

Section 3 - Underlying Mechanics

Underlying relates various things to one thing. The verb to underlie means the underlying relation. The verb to be under means the underlying relation. The verb to be beneath means the underlying relation.
	
[This must be duplicated for each fuse in order to work properly]
[Instead of looking under a thing which is underlaid by something (called the lost object):
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun.]
	
Hiding it under is an action applying to one carried thing and one thing. Understand "put [something preferably held] under [something]" as hiding it under. Understand "hide [something preferably held] under [something]" as hiding it under. Understand the commands "shove" and "conceal" and "stick" as "hide".

Check hiding it under:
	if the second noun is not fixed in place, say "[The second noun] wouldn't be a very effective place of concealment." instead.

Carry out hiding it under:
	now the noun is nowhere;
	now the noun underlies the second noun.

Report hiding it under:
	say "You shove [the noun] out of sight beneath [the second noun]."
	
Section 4 - Flashlight Mechanics

Showing action of something is an activity.

Rule for showing action of something (called item):
	if the item is switched on, say "[The item] is switched on.";
	otherwise say "[The item] is switched off."

The new described devices rule is listed instead of the examine devices rule in the carry out examining rules.

This is the new described devices rule:
	if the noun is a device:
		carry out the showing action activity with the noun;
		now examine text printed is true.

Report switching on something:
	say "You flip a switch. ";
	carry out the showing action activity with the noun instead;
	continue the action.

An electric lamp is a kind of device.

Rule for showing action of an electric lamp (called item):
	if the item is switched on, say "[The item] is lit[if the number of visible lit things is greater than 1], competing with [the list of visible lit things which are not the item][end if].";
	otherwise say "[The item] is dark."
	
Carry out switching on an electric lamp: now the noun is lit. Carry out switching off an electric lamp: now the noun is unlit.

The flashlight is an electric lamp. understand "light" as flashlight. The description of the flashlight is "This is a flashlight. It[']s a nice one."

Rule for showing action of the flashlight:
	if the flashlight is switched on, say "A strong, narrow beam of light shines from the flashlight.";
	otherwise say "It is currently switched off."
		
Before printing the name of a lit electric lamp, say "lit ".
Before printing the name of an unlit lit electric lamp, say "extinguished ".

Section 5 - Grues

Test grues with "s / buy ticket / s / give ticket to ride attendant / s / e / s / s"

The lurking grue is a backdrop. The lurking grue is everywhere. The description of the lurking grue is "The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is humans, but its insatiable appetite is tempered by its fear of light. No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale."

Rule for printing the description of a dark room: say "It is pitch black.  You are likely to be eaten by a grue." instead. 
Rule for printing a refusal to act in the dark: say "It is too dark in here to see." instead.

The going action has a number called the dark terminus count. 
Setting action variables for going: 
	now the dark terminus count is 0; 
	if in darkness, increase the dark terminus count by 1. 
The last carry out going rule: 
	if in darkness, increase the dark terminus count by 1.
	
After going:
	if the dark terminus count is 2:
		say "Oh no! You walked directly into the slavering fangs of a lurking grue!";
		end the story finally saying "You have died!";
	if the dark terminus count is not 2:
		continue the action.
	
Section 6 - Miscellaneous

Test Misc with "brief / get blueberries / xyzzy / hello sailor / please get the dime / i / score".

[for adaptive text]
A thing can be broken or unbroken. A thing is usually unbroken.

A thing can be seen or unseen. A thing is usually unseen.

Carry out examining a thing:
	now the noun is seen.
	
[scored rooms]
A room can be scored or unscored.

Carry out going to a unvisited scored room:
	play the sound of Strongman Bell;
	increase the score by 5.
	
[heaven and earth]
A room can be indoors or outdoors. A room is usually indoors. 

The sky is a backdrop. The sky is everywhere.

The description of the sky is "[if the location is outdoors]It[']s a beautiful evening. Not a cloud in the sky. The moon is out and there are so many stars to see. A shooting star streaks across the sky.[otherwise]You[']re indoors. You can't see the sky here."

The ground is a backdrop. The ground is everywhere. Understand "floor" as the ground.

[new things]
A switch is kind of a device. A switch can be switched on or switched off. The printed name of a switch is "the switch". A switch is usually switched off. A switch is fixed in place.

A socket is a kind of open container. A socket is fixed in place. A socket can be filled or unfilled. A socket is usually unfilled. The printed name of a socket is "the socket".  

A colored fuse is a kind of thing. A colored fuse can be lost or found. A colored fuse is usually lost. 

Section 7 - Hello Sailor

Hi-speaking is an action applying to one visible thing. Understand "hello [something]" and "hi [something]" as hi-speaking.
Check hi-speaking:
if the noun is the sailor, say "Nothing happens here." instead;
if the noun is not a person, say "I think that only schizophrenics say 'Hello' to [a noun]." instead.
Carry out hi-speaking:
say "[The noun] bows his head to you in greeting."

The Sailor is a backdrop. The sailor is everywhere. The sailor is scenery.

Check hi-speaking the sailor for the tenth time:
say "I think that phrase is getting a bit worn out." instead.
Check hi-speaking the sailor for the 20th time:
say "You seem to be repeating yourself." instead.

Section 8 - xyzzy

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy.

Casting xyzzy is an action applying to nothing.

Carry out casting xyzzy:
	say "A voice nearby says 'Plugh'."
	
Chapter 3- The Player

The description of the player is "You are despondent given that you and your date just had a huge fight and they stormed off. Maybe visiting the attractions at the carnival will make you feel better." 

Instead of examining the player:
	say "Oh, stop fussing. You look fine."
	
After reading a command:
	if the player's command includes "please":
		say "Please do not say please.";
		reject the player's command.


Chapter 4- Figures and Sounds

Figure of Hell Ride is the file "HellRide.png".

Figure of Midway is the file "Midway.png".

Figure of TicketBooth is the file "TicketBooth.png".

Figure of ConcessionStand is the file "ConcessionStand.png".

Figure of LittleEgyptFacade is the file "LittleEgyptFacade.png".

Figure of LittleEgyptShow is the file "LittleEgyptShow.png".

Figure of HighStriker is the file "HighStriker.png".

Figure of HellRideEntrance is the file "RideEntrance.png".

Figure of ControlPanel is the file "ControlPanel.png".

Figure of ControlPanelStocks is the file "ControlPanelStocks.png".

Figure of ControlPanelGallows is the file "ControlPanelGallows.png".

Figure of ControlPanelStake is the file "ControlPanelStake.png".

Figure of ControlPanelDungeon is the file "ControlPanelDungeon.png".

Figure of ControlPanelGuillotine is the file "ControlPanelGuillotine.png".

Figure of ControlPanelExit is the file "ControlPanelExit.png".

Sound of Strongman Bell is the file "StrongmanBell.ogg".

Chapter 5 - Testing For Empty Descriptions - Not for release

[When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."]
			
When play begins:
	seed the random-number generator with 1234.
	
The price of the money is $15.00. 
			
Chapter 6 - Randomized Rooms, etc - For Release Only

When play begins:
	seed the random-number generator with 0.

Instead of going from the Electrical Room:
	move the player to a random adjacent room.
	
The price of the money is $10.00. 
	
Part 2 - The Game

Chapter 1 - The Midway

Section 1 - Parking Lot

Test Live with "brief / Test Egypt / Test Concession / Test Striker / Test Misc / Test Backstage".

Test Die with "brief / Test Egypt / Test Concession / Test Striker / Test Misc / Test Ride".

When play begins:
	display the figure of Hell Ride;
	say "The carnival is in town and you and your sweetie had a date to visit it. After dinner and just as you arrive at the carnival, you and your date have a terrible fight. They storm off leaving you alone at the carnival. You decide to stay at the carnival anyway."

The Parking Lot is a room. The parking lot is north of the Kiosk. The parking lot is outdoors. "The carnival parking lot sprawls across an open field, its uneven gravel surface crunching under the tires of arriving cars. The lot is lit by a mix of temporary floodlights mounted on poles and the colorful glow of the carnival itself, which spills across the area in flashes of red, blue, and gold. The distant sounds of laughter, music, and the mechanical whir of rides drift across the lot, creating an air of excitement even before reaching the main grounds.

Rows of vehicles, from dusty sedans to pickup trucks with weathered paint, are parked haphazardly, guided by makeshift wooden signs and strings of flags fluttering in the breeze. Some families unload children, strollers, and blankets from their cars, their voices mingling with the distant carnival noise. Others sit in their vehicles, adjusting their jackets and preparing for the chilly evening ahead.

The edges of the lot are lined with trees and bushes, their shadows stretching across the ground, creating pockets of darkness. The occasional glow of a phone screen or flashlight pierces the dim corners as latecomers search for empty spots. Near the entrance, a weathered booth manned by a lone attendant collects parking fees, the cash box jingling with loose change.

Puddles from a recent rain reflect the flashing carnival lights, creating a surreal, shimmering effect on the ground. The smell of damp earth mixes with the distant aroma of popcorn and funnel cakes wafting from the midway. In some areas, patches of mud threaten to swallow unwary shoes, marked by the faint tread of earlier visitors.

At the far end of the lot, a handful of RVs and trailers are parked, their occupants relaxing in folding chairs, watching the lights of the Ferris wheel spin lazily against the night sky. Generators hum softly, providing power to the trailers, a subtle background noise beneath the larger symphony of the carnival.

The parking lot, while utilitarian, is alive with anticipation, serving as the gateway to the magic of the carnival. It’s a place of transition, where the mundane gives way to the extraordinary, and the humdrum rhythms of daily life are momentarily forgotten.

The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush.[otherwise]The bush has been picked clean.[end if] [if the dime is in the Parking Lot] You see something shiny on the ground.[end if]"

Cars is here. The cars are scenery. Understand "car", "vehicle", and "vehicles" as cars. The description of cars is "There are all kinds of vehicles in the parking lot."

The blueberry bush is here. the blueberry bush is scenery. the blueberry bush is a container. the blueberry bush is not portable. the blueberry bush contains blueberries. The description of the blueberries is "The blueberries are ripe, juicy, and a deep blue color.".

The dime is here. Understand "shiny" as dime. The description of the dime is "It[']s a dime. Ten cents. One tenth of a dollar. It['] very shiny"

After taking blueberries:
	play the sound of Strongman Bell;
	increase score by 5;
	say "Good Job!".

Section 2 - Kiosk

Before going south when the location is the Parking Lot and the Kiosk is unvisited:
	display Figure of TicketBooth.
	
Before looking when the location is the Kiosk:
	display Figure of TicketBooth.

The kiosk is a room. The kiosk is north of Head of the Line. The kiosk is east of the Show Facade. The kiosk is outdoors. The kiosk is west of High Striker. The kiosk is northeast of the Concession Stand. The kiosk is south of the Parking Lot. "The ticket kiosk stands at the entrance to the carnival, a small but colorful booth designed to catch the eye and set the tone for the excitement ahead. Its exterior is painted in bright red and yellow stripes, with bold, blocky letters above the window that read 'Tickets Here!' Strings of twinkling lights outline the edges, blinking in rhythmic patterns to draw attention.

The kiosk is compact, with a single window where a smiling attendant greets visitors. Behind the glass, rows of ticket rolls in vibrant colors — blue, red, and yellow — are neatly arranged in dispensers. A small cash drawer sits open beside them, jingling softly as the attendant counts out change. To the side of the window, a digital payment system is set up for those who prefer modern convenience, its screen glowing faintly in the dim light.

A colorful signboard is propped up next to the kiosk, listing ticket prices for rides, games, and attractions. At the top, in bold letters, it reads: 'Step Right Up! Your Adventure Awaits!' Below, the list of options is accompanied by playful illustrations of roller coasters, Ferris wheels, and cotton candy.

The kiosk roof juts out slightly, providing shelter to visitors during rain or shine. Bright pennant flags are strung from the corners of the roof to nearby poles, fluttering in the breeze and adding to the festive atmosphere. The smell of popcorn and fried dough wafts through the air, carried over from nearby food stalls.

The ground around the kiosk is well-trodden, with patches of worn grass and compacted dirt revealing the heavy foot traffic of eager carnival-goers. A line of families, couples, and groups of friends forms in front of the kiosk, buzzing with excitement as they wait their turn to purchase tickets.

The ticket kiosk is more than just a point of entry—it’s the first step into the carnival’s magic, where anticipation builds and the promise of thrills and wonders begins to take shape.

The midway continues east and west from here. There is a concession stand to the south west. There is a cashier here. [if cashier has the hell ride ticket]The Cashier has a Hell Ride ticket.[end if]."

The Hell Ride ticket is a thing. The price of the Hell Ride ticket is $2.50. The description of the Hell Ride ticket is "This Hell Ride ticket will 'Admit One' to the Hell Ride.[line break]It[']s a real 'E' ticket, baby!"

The Cashier is a man in the kiosk. The cashier carries the Hell Ride ticket. The description of cashier is "This is a bored teenager hired to sell ride tickets all week at this carnival. He's thinking about having a brewski with his bros after work.". 

After buying the hell ride ticket:
	play the sound of Strongman Bell;
	increase score by 5;
	say "Well done!";
	

Section 3 - Concession Stand

Test Concession with "brief / get blueberries / s / sw / l at treats / read menu / buy cola / buy popcorn / buy candy apple / buy cotton candy / buy pretzel / inventory / drink soda / g / g / g / g / i / ne / n / i / score".

Before going southwest when the location is the kiosk and the Concession Stand is unvisited:
	display Figure of ConcessionStand.
	
Before looking when the location is the Concession Stand:
	display Figure of ConcessionStand.

The Concession Stand is a room. The concession stand is outdoors. "The concession stand is a vibrant, bustling hub of activity, perched along the midway with its enticing smells and bright signage luring carnival-goers. The booth is painted in cheerful, primary colors—reds, blues, and yellows—with bold lettering across the top that proclaims: 'SODA! POPCORN! CANDY APPLES! COTTON CANDY! PRETZELS!' Strings of tiny, twinkling lights frame the stand, casting a warm glow that makes it stand out even in the carnival’s dazzling atmosphere.

Behind the counter, the scene is a whirlwind of movement. A large popcorn machine sits to one side, its glass case fogged up with heat as golden kernels tumble and pop inside, filling the air with their buttery aroma. Nearby, a spinning rack of candy apples gleams under the lights, their glossy red coatings catching every glimmer. Cotton candy machines whirl on the opposite side, their sugary strands forming fluffy clouds of pink and blue, ready to be twirled onto paper cones.

Stacks of soft pretzels sit under a heat lamp, their golden-brown surfaces glistening with melted butter and coarse salt. Warm, doughy scents mingle with the sugary sweetness of the candy apples and cotton candy, creating an irresistible combination. Ice-cold sodas are arranged in a cooler behind the counter, their colorful labels visible through the condensation on the glass door.

The counter top is a cheerful chaos of activity. Paper bags and napkins are stacked neatly in one corner, alongside small cups of nacho cheese for pretzels and sugar sprinkles for cotton candy. A handwritten menu board leans against the front of the stand, listing prices in playful chalk lettering.

The workers, wearing brightly colored aprons and matching hats, move quickly and efficiently, handing out snacks to eager customers. Behind them, shelves are stocked with supplies: bags of popcorn kernels, bottles of soda syrup, and tubs of pretzel dough, ready to keep the stand running all night.

In front of the stand, the crowd is lively and animated. Children tug at their parents’ sleeves, pointing at the spinning cotton candy or the shiny candy apples. Teens laugh and chat as they sip sodas and share buttery pretzels. The stand is not just a place to grab a quick snack—it’s a sensory experience that enhances the carnival’s magic, offering a delicious pause amid the excitement. 

There is a menu to the right of the window. You can see the treats inside the stand."

treats is here. Treats is scenery. Understand "treat" as treats. The description of treats is "There are a variety of things to eat here."

a menu is here.  Menu is fixed in place. The description of the menu is 
"[line break]$1.00 Cola
[line break]$2.50 Popcorn
[line break]$1.50 Candy Apple
[line break]$1.50 Cotton Candy
[line break]$1.50 Soft Pretzel"

a can is here. The price of can is $1.00. The description of the can is "The soda is ice cold."

The can is a fluid container. The liquid of the can is Cola. understand "soda" as cola. The current volume of the can is 8.0 fl oz. Understand "Coke" as the can.

Instead of player drinking a fluid container:
	if can is empty:
		say "[The person asked] tip the can again only to find it empty.";
	otherwise:
		decrease the current volume of the noun by 2.0 fl oz;
		if the current volume of the noun is less than 0.0 fl oz, now the current volume of the noun is 0.0 fl oz;
		say "[The person asked] gulp down some [liquid of the noun]."

A bucket of popcorn is here. The bucket of popcorn is edible. The price of popcorn is $2.50. The description of the popcorn is "The bucket of popcorn looks enormous!"

A candy apple is here. The candy apple is edible. The price of a candy apple is $1.50. The description of the candy apple is "The candy apple is your typical caramel covered apple. It looks like it would get stuck in your teeth."

cotton candy is here. Cotton candy is edible. The price of cotton candy is $1.50. The description of cotton candy is "The cotton candy is a mixture of pink and blue floss."

A soft pretzel is here. The soft pretzel is edible. The price of the soft pretzel is $1.50. The description of the soft pretzel is "The soft pretzel is sprinkled generously with salt."

Section 4 - High Striker

Test Striker with "brief / get blueberries / s / e / buy mallet / hit lever with mallet / g / g / g / g / 2 / w / n / i / score".

Before going east when the location is the kiosk and the High Striker is unvisited:
	display Figure of HighStriker.
	
Before looking when the location is the High Striker:
	display Figure of HighStriker.

The High Striker is a room. The High Striker is outdoors. "This area features a tall, eye-catching machine adorned with bright, colorful lights, typically red, yellow, and blue. A large sign at the top reads 'Test Your Strength!' in bold, playful lettering. The machine’s base is made of polished wood, with a polished, vintage appearance. At the center is a sturdy metal pole, with a large bell hanging at the top, signaling when a successful attempt has been made. Along the length of the pole are markings indicating how strong you are.  A nearby sign says, 'Buy a mallet, strike the bell, win a prize.'[if the strongman attendant contains the mallet] You can see an over-sized mallet here.[end if]

Spectators gather around, cheering on participants and offering lighthearted jabs and encouragement, creating a lively, competitive atmosphere. The sound of the mallet hitting the target is followed by the resonant clang of the bell (if struck), alongside the buzz of carnival music in the background."

The markings are here. The markings are scenery. Understand "marking" and "sign" and "signs" as markings. The description of markings is "There are five levels marked on the pole: Weakling, Getting There, Average, Almost There, and Muscle Man."

The Strongman Attendant is here. The description of the Strongman Attendant is "An Attendant is standing here [if strongman attendant is carrying the mallet]holding a mallet[end if]." 

The Strongman Attendant carries the teddy bear, a Swiss army knife, and a poster of Taylor Swift, the magenta fuse, and the mallet. 

The description of the teddy bear is "This is a teddy bear like you had when you were a kid. Right down to the red bow around its neck." 

The Swiss Army knife is an open container. The screwdriver, awl, fingernail clippers, can opener, and corkscrew are in the Swiss Army knife. The description of the Swiss army knife is "This is the standard issue Swiss Army knife with a screwdriver, an awl, a pair fingernail clippers, a can opener, and a corkscrew." 

instead of taking when the noun is in the swiss army knife, say "That's part of the Swiss Army knife. You can[']t take that!" instead.
	
The description of the poster of Taylor Swift is "This is a poster of America's sweetheart, Taylor Swift."

The description of the magenta fuse is "This is an exlectrical fuse. It is magenta colored."

The lever is here. The lever is fixed in place. Understand "bullseye" and "target" as lever. The description of the lever is "There is a bullseye on the base. I guess this is where you have to aim the mallet."

The mallet is carried by the Strongman Attendant.  The Price of the mallet is $2.00. Understand "hammer" as mallet. The description of the mallet is "The mallet is over sized, perhaps to give you an advantage in the Strong Man game."

A strength pattern is a kind of value. The strength patterns are Weakling, Getting Stronger, Average, Almost There, Muscle Man.

Hitting is an action applying to two visible things. Understand "hit [something]" as hitting. Understand "hit [something] with [something preferably held]" as hitting.

Check hitting:
	if noun is not lever, say "Nothing happens." instead;
	if the second noun is not mallet, say "You can[']t hit [the noun] with that!" instead;
	if the player is not carrying the mallet, say "You[']re not holding the mallet." instead.

Carry out hitting when the player is carrying the mallet:
	say "You lift the mallet high and bring it down on the lever with all your might! The striker rises towards the bell stopping at '[a random strength pattern between weakling and almost there]'.  C[']mon! You can do better than that!";
	
After hitting the lever when second noun is the mallet 5 times :
	play the sound of Strongman Bell;
	say "You swing the mallet one more time. The bell rings as the striker reaches the top of the pole. The attendant says, 'You[']re a Muscle Man. Here's a prize for you.'";
	say "Which prize would you like? 1) a teddy bear, 2) a Swiss Army knife, 3) a poster of Taylor Swift, or 4) a magenta fuse?".
	
after Reading a command :
	if the player's command matches "1" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		play the sound of Strongman Bell;
		increase score by 5;
		say "You are now holding a cute little teddy bear.";
		now the player carries the teddy bear;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "2" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		say "You are now holding a Swiss Army knife.";
		play the sound of Strongman Bell;
		increase score by 5;
		now the player carries the Swiss army knife;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "3" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		say "You are now holding a poster of Taylor Swift.";
		play the sound of Strongman Bell;
		increase score by 5;
		now the player carries the poster of taylor swift;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "4" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		say "You are now holding a magenta colored fuse.";
		play the sound of Strongman Bell;
		increase score by 5;
		now the player carries the magenta fuse;
		reject the player's command.

Section 5 - Show Facade

Before going west when the location is the kiosk and the Show Facade is unvisited:
	display Figure of LittleEgyptFacade.
	
Before looking when the location is the Show Facade:
	display Figure of LittleEgyptFacade.

Show Facade is a room. Show Facade is east of Show Tent. Show Facade is outdoors. "[if location is unvisited]You head west through the midway, the bright lights of the carnival fading behind you as you approach a wooden booth. A sign above the entrance reads 'Little Egypt Show – A Journey Into the Mysterious and Exotic!' A rotund attendant, wearing a fez and a dazzling smile, gestures to a small sign beside him that says 'Dime Admission.'[end if] 

You are standing in front of a dark and mysterious tent filled with illusions and exotic performers. Perhaps there’s a fortune teller inside, offering cryptic clues about the player's journey or a hidden artifact that can be collected. There is a stage in front of the tent. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show.[if location is unvisited]The barker cries: 

Ladies and gentlemen, boys and girls, gather 'round! [line break]Step right up and witness the spectacle that’s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await![end if]"

The Barker is a person in Show Facade. The description of the barker is "Here is a man dressed in black pants, a white shirt,a striped vest, a fez, and a dazzling smile. The barker cries:

Ladies and gentlemen, boys and girls, gather 'round! [line break]Step right up and witness the spectacle that’s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await!"

Check going west when the location is the Show Facade and the barker is not carrying the dime:
	say "It'll cost you a dime to go that way.";
	stop the action.
	
Check going west when the location is the Show Facade and the barker is carrying the dime:
	Continue the action.

After giving when the noun is dime and the second noun is barker:
	say "You hand over a dime, and the attendant nods, waving you through. As you step past the entrance, the air feels thicker, almost humid, and the sounds of the carnival fade away. You’ve entered an entirely different world now—one filled with the scents of incense and exotic spices, and the low, hypnotic music of a faraway land. Before you, a series of dimly lit tents stretch out, their flaps slightly swaying in the breeze. Intrigued, you take your first step into the Little Egypt Show. You can now head west into the show."

Section 6 - Show Tent	

Test Egypt with "brief / get blueberries / get dime / s / w / l at barker / give dime to barker / w / z / z / n / z / z / z / e / e / n / i / score".

Before going west when the location is the Show Facade and the Show Tent is unvisited and barker is carrying the dime:
	display Figure of LittleEgyptShow.	
	
Before looking when the location is the the Show Tent:
	display Figure of LittleEgyptShow.		

The Show Tent is a room. The Show Tent is west of Show Facade. "You are inside the Little Egypt Show. The attraction facade is to the east. There is a folding chair should you want to sit down and wait for the show to start."

Little Egypt is a woman. Little Egypt is in the Show Tent. Little Egypt is scenery. The description of Little Egypt is "Little Egypt is an exotic looking, beautiful woman who is draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."

The sheer veil is a thing. The description of the SHeer Veil is "This is a sheer gold veil that Little Egypt wore (and removed) during her show. You head swims as you smell the scent of her perfume: patchouli."

The Stage is here. The Stage is scenery. The description of the Stage is "The stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'."

The Folding Chair is in Show Tent. The Folding Chair is a enterable scenery supporter. The description of the Folding Chair is "This is one of many folding chairs in the tent tonight."

LittleEgyptAuto is a scene. LittleEgyptAuto begins when the player is in the Show Tent for the second turn.

When LittleEgyptAuto ends:
	say "You applaud until your hands are sore. Did she just wink at me?[paragraph break]As she leaves the stage, Little Egypt tosses one of her veils to you!";
	play the sound of Strongman Bell;
	increase score by 5;
	now the player carries the Sheer Veil.
	
Every turn during LittleEgyptAuto:
	repeat through Table of LittleEgypt Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		rule succeeds.

Instead of doing something other than waiting, looking, listening or examining during LittleEgyptAuto:
	say "You're much too entranced to do anything other than watch the show. You are riveted[if the player is in the folding chair] to your seat[end if]!".

Table of LittleEgypt Events
event
"As you enter the dimly lit tent, you see that the stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'. "
"Little Egypt emerges draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."
"The performance begins with slow, undulating movements, drawing the you into the rhythm of exotic live music played on traditional instruments like the oud, darbuka, or zurna. As the tempo builds, her hips, torso, and hands move in intricate, mesmerizing patterns, demonstrating remarkable control and fluidity. She incorporates dramatic spins, drops, and shimmies, often accentuating the beat of the music with a quick jingle of her coin belt."
"Little Egypt makes eye contact with you and smiles enigmatically. During her performance she balances a sword on her head and accents her dance with finger cymbals."
"The music alternates between hauntingly slow melodies and rapid, energetic drum beats, creating an emotional arc that keeps the you entranced. Little Egypt relies on the music's dynamic changes to tell a story with movements reflecting joy, sorrow, seduction, and celebration."
"The performance concludes with a dramatic flourish of a fast-paced shimmy, a bold spin, and Little Egypt dramatically casts off her veils. The dancer takes a bow to enthusiastic applause, leaving you spellbound by the sensual yet artful display."

LittleEgyptAuto ends when the number of filled rows in the Table of LittleEgypt Events is 0.

Section 7 - Head of the Line

Head of the Line is a room. Head of the Line is south of Kiosk. Head of the Line is north of Ride Entrance. The Head of the Line is outdoors. "You are standing in front of a ticket taker with his hand open waiting for your ticket. The entrance to the ride is south of here. The ride attendant tells you that you[']re lucky you showed up when you did because this will be the last trip through Hell Ride. You notice that all the other cars are empty."

The Ride Attendant is a man in Head of the Line. The description of the Ride Attendant is "This is another bored teenager. His thoughts are entirely focused on a cheeseburger for lunch.";

Check going south when the location is Head of the Line and the Ride Attendant does not have the hell ride ticket:
	say "You[']ll need a ticket to go that way.";
	stop the action.

Chapter 2 - Hell Ride

Section 1 - Ride Entrance

Before going south when the location is the kiosk and the Head of the Line is unvisited:
	display Figure of HellRideEntrance.
	
Before looking when the location is the Head of the Line:
	display Figure of HellRideEntrance.

Test Ride with "brief / get blueberries / s / buy hell ride ticket / s / give ticket to attendant / s / enter car / wait / z / z / z / z / z / z / z".

HellRideAuto is a scene. HellRideAuto begins when the player is in the car for 3 turns.

When HellRideAuto begins:
	say "The car moves forward and the safety bar begins to lower."
	
Every turn during HellRideAuto:
	repeat through Table of HellRide Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		rule succeeds.
		
Table of HellRide Events
event
"[bold type]Entrance[roman type][line break]The car has begun to move toward the entrance of the ride and the safety bar has been lowered. The entrance to Hell Ride is a chilling spectacle designed to draw both thrill-seekers and the morbidly curious. The facade looms before you, a grotesque masterpiece of twisted metal and carved wood, illuminated by flickering, blood-red lights that cast eerie shadows across the ground. The air smells faintly of sulfur, mingling with the sweet scent of carnival popcorn from nearby stalls.

A towering archway frames the entrance, its design a chaotic blend of flames, jagged spikes, and sinister, grinning skulls. The words 'HELL RIDE' are emblazoned above in glowing, flickering letters that seem to pulse like a heartbeat. Beneath the sign, two sculpted demons crouch, their clawed hands extending outward as though inviting—or daring—you to enter.

Dark curtains, frayed and stained, hang over the entrance, swaying faintly in a breeze that seems to carry whispers and low, menacing chuckles. As you approach, the faint sound of distorted organ music grows louder, interspersed with sudden shrieks and the grinding of unseen machinery. A crooked sign at the side reads: 'One Ticket Admission: Enter If You Dare!'

Nearby, a carnival barker with a waxen smile stands under a sputtering gaslight, his voice raspy and theatrical: 'Step right up, brave souls! Take the ride of your life—or your afterlife! The gates of hell are open, and the darkness beckons!'

Through the entrance, the interior is shrouded in near-total darkness, save for flashes of sickly green light that illuminate the suggestion of twisting paths and grotesque shapes. The only certainty is that once you step inside, there’s no turning back from the horrors that await."
"[bold type]Hallway[roman type][line break]The doors open and your car passes through into the darkness.

Mist fills the area as you move to the next room."
"[bold type]The Stocks[roman type][line break]The public square is an open expanse of cobblestones, surrounded by the weathered facades of timber-framed buildings. The air is heavy with the mingling scents of smoke from distant chimneys, damp earth, and the faint metallic tang of the nearby smithy. At the square's center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures. 

The punished individuals, heads bowed in shame, are caught in an agonizing tableau of disgrace. Their expressions, a mix of resignation and despair, reflect the full weight of their predicaments. Their clothing hangs in tatters, furthering their exposure to the biting wind and the sharp tongues of the gathered crowd.

Around the stocks, the townsfolk revel in their collective cruelty. A wiry man leans in close, spitting insults with glee, his laughter cutting through the air. A stout woman clutching a basket of overripe vegetables hurls a squashed tomato, which splatters across one captive’s cheek, drawing a chorus of jeers. Nearby, children mimic their elders, pointing and shrieking in mockery, their faces alight with mischief.

The square is alive with noise: the raucous laughter of the crowd, the occasional sharp crack of a thrown object against the wood, and the soft, pained murmurs of the punished. A passing bell tolls faintly in the distance, but here it is drowned out by the cruel symphony of the jeering mob.

Above it all, the gray sky looms, heavy with the promise of rain, as if nature itself disapproves of the spectacle. Yet the crowd pays no mind, delighting in their collective judgment, each jeer a reminder that today’s entertainment is another's living nightmare.

Mist fills the area as you move to the next room."
"[bold type]The Gallows[roman type][line break]The public square lies under a brooding, overcast sky, its cobblestones slick with the morning's drizzle. A grim silence has settled over the gathered crowd, broken only by the occasional murmur or the restless shuffling of feet. At the center of the square, rising like a grim monument to mortality, stands the gallows—a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike.

Atop the gallows, a hooded executioner looms, his imposing frame draped in a black cloak that billows faintly in the wind. His face is obscured by the deep cowl, but his presence radiates cold, methodical purpose. In his gloved hands, he adjusts the noose, its coarse fibers frayed from repeated use, ensuring it is ready for the task at hand.

Standing beside him is the condemned man, his hands bound tightly behind his back. His face is pale, drawn, and haunted, beads of sweat mingling with the light rain. His eyes dart to the crowd, seeking pity, perhaps, but finding only a sea of indifferent faces. His breath comes in shallow bursts, each exhalation visible in the chilly air, a stark reminder of the life still in him—for now.

The crowd gathers in a semicircle around the platform, a mixture of somber onlookers, opportunistic vendors hawking bread and cider, and children craning their necks for a better view. An old man mutters a prayer under his breath, clutching a rosary, while a group of rough-looking men smirk and exchange bets on how long the drop will take.

Above it all, the bell tower tolls, its mournful chime echoing through the square, a countdown to the inevitable. The condemned man flinches with each clang, his shoulders tensing as the final moments draw near. A raven perches on the gallows’ beam, its black eyes unblinking, as if waiting for the end with morbid curiosity.

The executioner steps forward, adjusting the noose around the man’s neck with a practiced efficiency. The crowd falls silent, the weight of the moment hanging heavier than the rope itself. Somewhere in the distance, thunder rumbles faintly, as though the heavens themselves are bracing for what is to come.

Mist fills the area as you move to the next room."
"[bold type]The Stake[roman type][line break]The public square is a grim tableau, the usual bustle of commerce and chatter replaced with an oppressive silence broken only by the crackling of the flames. At the center, three wooden stakes rise ominously from a circular pyre of logs and kindling, their rough surfaces darkened by smoke from countless such scenes before. Bound tightly to these stakes are three women, their wrists and ankles secured with coarse, heavy ropes. Their faces tell different stories—one of defiance, another of resignation, and the third of pure terror.

A crowd encircles the pyre, their expressions a mix of morbid fascination, righteous fury, and hesitant pity. Children cling to their mothers' skirts, staring wide-eyed, while town elders nod solemnly as though approving the grim spectacle. Some townsfolk jeer loudly, throwing small stones or rotten vegetables at the condemned. Others murmur prayers or make the sign of the cross, their eyes averted.

The executioner, clad in a soot-streaked hood and leather apron, steps forward, his torch a blazing beacon in the dreary scene. The flames dance and writhe as he lowers the torch to the base of the pyre, igniting the dry wood with a sudden, hungry roar. A cheer erupts from a faction of the crowd, while others fall into an uneasy silence, watching the fire climb higher.

Thick, acrid smoke begins to rise, curling around the stakes like a living thing. The women cry out—some in curses, others in prayers—and their voices echo across the square, mingling with the crackle of the flames. The heat radiates outward, and even those in the crowd begin to feel its oppressive warmth.

Above, the gray clouds hang low, as if nature itself mourns the scene unfolding below. A raven caws from its perch atop the town's bell tower, its black form stark against the ashen sky. The church bells toll in slow, deliberate cadence, each strike a grim punctuation to the scene.

As the flames consume the pyre, the crowd remains rooted, some transfixed by the spectacle, others quietly slipping away, their faces pale and drawn. The square, once a place of gatherings and life, is now a stage for death, its air heavy with smoke, ash, and the lingering cries of the condemned.

Mist fills the area as you move to the next room."
"[bold type]The Dungeon[roman type][line break]The dungeon is a dim, oppressive chamber carved deep into the earth, its stone walls slick with moisture and coated in a thin layer of grime. The air is heavy with the stench of sweat, blood, and mildew, punctuated by the faint, acrid tang of burning oil from flickering torches mounted on rusty iron sconces. Shadows dance on the walls, creating grotesque shapes that seem almost alive in the unsteady light.

Chains hang from the walls and ceilings, their metallic clinking faintly audible as prisoners shift or shudder in their restraints. The room is filled with the soft, pitiful moans of the tormented, their cries occasionally rising to sharp, desperate screams that echo through the corridors beyond. The sound of dripping water from a cracked stone ceiling adds an eerie rhythm to the unsettling cacophony.

Scattered throughout the dungeon are various instruments of pain and suffering, their designs brutal and unyielding. A rack sits in the center of the room, its wooden frame splintered from years of use. Nearby, a brazier glows a dull red, its coals smoldering beneath a collection of iron tools—branding irons, pincers, and knives, their edges darkened with dried blood. A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light.

Prisoners are scattered across the room, each trapped in their own nightmare. A man lies stretched on the rack, his face contorted in agony as the torturer methodically turns the wheel, the creaking of wood and rope echoing in the chamber. Another prisoner hangs limply from manacles affixed to the wall, their body bruised and battered, barely able to lift their head. A third, seated in the spiked chair, breathes in shallow gasps, their movements restricted by the cruel embrace of the iron seat.

The torturer moves about the chamber with practiced efficiency, their face obscured by a hood, their leather apron stained with the evidence of countless victims. They work silently, their movements methodical and devoid of emotion, as if the suffering around them were merely a task to be completed.

Above it all, the dungeon's ceiling is low and oppressive, the occasional scuttling of rats in the shadows serving as a reminder of the filth and decay that permeates the space. The only exit—a heavy, iron-bound door reinforced with rivets—seems more a barrier to hope than a passage to freedom, its small viewing slit barred and shadowed.

This is a place of despair and cruelty, where the line between life and death is blurred, and the only certainty is the inevitability of suffering.

Mist fills the area as you move to the next room."
"[bold type]The Guillotine[roman type][line break]The public square is a charged space, bustling with a crowd eager to witness the grim spectacle. The sky overhead is a patchwork of gray clouds, casting the cobblestone ground in a somber light. At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out.

A lone figure stands on the scaffold, their posture slumped under the weight of their fate. Their hands are bound tightly behind their back with coarse ropes, and their head hangs low, avoiding the stares of the gathered crowd. Their clothing, once fine, is now tattered and muddied, a visible testament to the fall from grace that has led to this moment.

The crowd presses closer, encircling the platform with a mix of emotions etched onto their faces. Some jeer, shouting curses and insults, their voices rising in a cacophony of condemnation. Others watch in heavy silence, their expressions grim and reflective. A few hold children on their shoulders, their young faces filled with curious fascination, unaware of the gravity of what they are about to witness.

At the edge of the platform, a town crier stands with a long scroll in hand, his voice carrying over the murmurs of the crowd:'his man has been found guilty of high treason against the crown. Let his punishment serve as a warning to all who would seek to defy the will of the realm!'

The condemned flinches at the words but remains silent, their face pale and eyes darting nervously. The executioner, a large figure clad in a hooded black robe, stands nearby with arms crossed, their demeanor cold and methodical. A few feet away, the guillotine looms, its blade gleaming dully in the filtered light, ready to deliver the final judgment.

The tension in the square is palpable as the crier steps aside and the executioner signals for the crowd to quiet. The murmurs fade, replaced by an oppressive silence that hangs over the scene like a shroud. The only sounds now are the rustle of the wind and the faint creak of the wooden scaffold.

As the condemned is led toward the guillotine, a crow caws from a nearby rooftop, its harsh cry echoing through the square like a dark omen. The crowd leans forward, holding its collective breath, as the weight of justice and mortality descends upon the scene. 

There is just one problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated.

Looks like your goose is cooked. Say 'Goodnight, Gracie! 

You are stupefied as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable."

HellRideAuto ends when the number of filled rows in the Table of HellRide Events is 0.

Instead of doing something other than waiting, looking, listening or examining during HellRideAuto:
	say "You are enjoying the ride too much to do anything but wait and enjoy the ride."
	
When HellRideAuto ends:
	end the story finally saying "You have died.".
	
Ride Entrance is a room. Ride Entrance is south of Head of the Line. "The cars that will take you into the fearsome Hell Ride stop here for you to board.  To the south is the track that will take you into the ride. The safety bar is raised allowing you to enter the car. The darkness looks just a little bit darker."

The car is a vehicle in the Ride Entrance. The description of the car is "A car waits to take you through the horror that is Hell Ride."

Before going south when the player is in the Ride Entrance:
	say "You can't go that way." instead;
	continue the action.

Section 2 - Stocks Room

The Stocks Room is south of the Ride Entrance. "The public square is an open expanse of cobblestones, surrounded by the weathered facades of timber-framed buildings. The air is heavy with the mingling scents of smoke from distant chimneys, damp earth, and the faint metallic tang of the nearby smithy. At the square's center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures.

The punished individuals, heads bowed in shame, are caught in an agonizing tableau of disgrace. Their expressions, a mix of resignation and despair, reflect the full weight of their predicaments. Their clothing hangs in tatters, furthering their exposure to the biting wind and the sharp tongues of the gathered crowd.

Around the stocks, the townsfolk revel in their collective cruelty. A wiry man leans in close, spitting insults with glee, his laughter cutting through the air. A stout woman clutching a basket of overripe vegetables hurls a squashed tomato, which splatters across one captive’s cheek, drawing a chorus of jeers. Nearby, children mimic their elders, pointing and shrieking in mockery, their faces alight with mischief.

The square is alive with noise: the raucous laughter of the crowd, the occasional sharp crack of a thrown object against the wood, and the soft, pained murmurs of the punished. A passing bell tolls faintly in the distance, but here it is drowned out by the cruel symphony of the jeering mob.

Above it all, the gray sky looms, heavy with the promise of rain, as if nature itself disapproves of the spectacle. Yet the crowd pays no mind, delighting in their collective judgment, each jeer a reminder that today’s entertainment is another's living nightmare." 

The wooden stocks are here. The wooden stocks are a supporter. The wooden stocks are fixed in place. The description of the wooden stocks is "At the square's center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures." 

The aqua fuse is a colored fuse. The aqua fuse underlies the wooden stocks. The description of the aqua fuse is "This is an electrical fuse. It is aqua colored. The same color as the door where you found it."

Instead of looking under a thing which is underlaid by the aqua fuse when the aqua fuse is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;
	now the aqua fuse is found.
	
Section 3 - Gallows Room

The Gallows Room is south of the Stocks Room.  "The public square lies under a brooding, overcast sky, its cobblestones slick with the morning's drizzle. A grim silence has settled over the gathered crowd, broken only by the occasional murmur or the restless shuffling of feet. At the center of the square, rising like a grim monument to mortality, stands the gallows—a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike.

Atop the gallows, a hooded executioner looms, his imposing frame draped in a black cloak that billows faintly in the wind. His face is obscured by the deep cowl, but his presence radiates cold, methodical purpose. In his gloved hands, he adjusts the noose, its coarse fibers frayed from repeated use, ensuring it is ready for the task at hand.

Standing beside him is the condemned man, his hands bound tightly behind his back. His face is pale, drawn, and haunted, beads of sweat mingling with the light rain. His eyes dart to the crowd, seeking pity, perhaps, but finding only a sea of indifferent faces. His breath comes in shallow bursts, each exhalation visible in the chilly air, a stark reminder of the life still in him—for now.

The crowd gathers in a semicircle around the platform, a mixture of somber onlookers, opportunistic vendors hawking bread and cider, and children craning their necks for a better view. An old man mutters a prayer under his breath, clutching a rosary, while a group of rough-looking men smirk and exchange bets on how long the drop will take.

Above it all, the bell tower tolls, its mournful chime echoing through the square, a countdown to the inevitable. The condemned man flinches with each clang, his shoulders tensing as the final moments draw near. A raven perches on the gallows’ beam, its black eyes unblinking, as if waiting for the end with morbid curiosity.

The executioner steps forward, adjusting the noose around the man’s neck with a practiced efficiency. The crowd falls silent, the weight of the moment hanging heavier than the rope itself. Somewhere in the distance, thunder rumbles faintly, as though the heavens themselves are bracing for what is to come."

The gallows platform is here. The gallows platform is a supporter. The gallows platform is fixed in place. Understand "gallows" as gallows platform. The description of the gallows platform is "At the center of the square, rising like a grim monument to mortality, stands the gallows—a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike." 

The crimson fuse is a colored fuse. The crimson fuse underlies the gallows platform. The description of the crimson fuse is "This is an electrical fuse. It is crimson colored. The same color as the door where you found it."

Instead of looking under a thing which is underlaid by the crimson fuse when the crimson fuse is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;
	now the crimson fuse is found.

Section 4 - Stake Room

The Stake Room is south of the Gallows Room. "The public square is a grim tableau, the usual bustle of commerce and chatter replaced with an oppressive silence broken only by the crackling of the flames. At the center, three wooden stakes rise ominously from a circular pyre of logs and kindling, their rough surfaces darkened by smoke from countless such scenes before. Bound tightly to these stakes are three women, their wrists and ankles secured with coarse, heavy ropes. Their faces tell different stories—one of defiance, another of resignation, and the third of pure terror.

A crowd encircles the pyre, their expressions a mix of morbid fascination, righteous fury, and hesitant pity. Children cling to their mothers' skirts, staring wide-eyed, while town elders nod solemnly as though approving the grim spectacle. Some townsfolk jeer loudly, throwing small stones or rotten vegetables at the condemned. Others murmur prayers or make the sign of the cross, their eyes averted.

The executioner, clad in a soot-streaked hood and leather apron, steps forward, his torch a blazing beacon in the dreary scene. The flames dance and writhe as he lowers the torch to the base of the pyre, igniting the dry wood with a sudden, hungry roar. A cheer erupts from a faction of the crowd, while others fall into an uneasy silence, watching the fire climb higher.

Thick, acrid smoke begins to rise, curling around the stakes like a living thing. The women cry out—some in curses, others in prayers—and their voices echo across the square, mingling with the crackle of the flames. The heat radiates outward, and even those in the crowd begin to feel its oppressive warmth.

Above, the gray clouds hang low, as if nature itself mourns the scene unfolding below. A raven caws from its perch atop the town's bell tower, its black form stark against the ashen sky. The church bells toll in slow, deliberate cadence, each strike a grim punctuation to the scene.

As the flames consume the pyre, the crowd remains rooted, some transfixed by the spectacle, others quietly slipping away, their faces pale and drawn. The square, once a place of gatherings and life, is now a stage for death, its air heavy with smoke, ash, and the lingering cries of the condemned."

The pyre is scenery in the Stake Room. The pyre is a container. understand "bonfire", "fire", "stake", "stakes", "flame", and "flames" as the pyre. The description of the pyre is "At the center, three wooden stakes rise ominously from a circular pyre of logs and kindling, their rough surfaces darkened by smoke from countless such scenes before. Bound tightly to these stakes are three women, their wrists and ankles secured with coarse, heavy ropes. Their faces tell different stories—one of defiance, another of resignation, and the third of pure terror." 

The emerald fuse is a colored fuse. The emerald fuse is in the pyre. The description of the emerald fuse is "This is an electrical fuse. It is emerald colored. The same color as the door where you found it."

Instead of taking the emerald fuse when the emerald fuse is lost:
	say "You find [the list of things which contain the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;
	now the emerald fuse is found;
	now the emerald fuse is in the player.

Section 5 - Dungeon

The Dungeon is south of the Stake Room. "The dungeon is a dim, oppressive chamber carved deep into the earth, its stone walls slick with moisture and coated in a thin layer of grime. The air is heavy with the stench of sweat, blood, and mildew, punctuated by the faint, acrid tang of burning oil from flickering torches mounted on rusty iron sconces. Shadows dance on the walls, creating grotesque shapes that seem almost alive in the unsteady light.

Chains hang from the walls and ceilings, their metallic clinking faintly audible as prisoners shift or shudder in their restraints. The room is filled with the soft, pitiful moans of the tormented, their cries occasionally rising to sharp, desperate screams that echo through the corridors beyond. The sound of dripping water from a cracked stone ceiling adds an eerie rhythm to the unsettling cacophony.

Scattered throughout the dungeon are various instruments of pain and suffering, their designs brutal and unyielding. A rack sits in the center of the room, its wooden frame splintered from years of use. Nearby, a brazier glows a dull red, its coals smoldering beneath a collection of iron tools—branding irons, pincers, and knives, their edges darkened with dried blood. A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light.

Prisoners are scattered across the room, each trapped in their own nightmare. A man lies stretched on the rack, his face contorted in agony as the torturer methodically turns the wheel, the creaking of wood and rope echoing in the chamber. Another prisoner hangs limply from manacles affixed to the wall, their body bruised and battered, barely able to lift their head. A third, seated in the spiked chair, breathes in shallow gasps, their movements restricted by the cruel embrace of the iron seat.

The torturer moves about the chamber with practiced efficiency, their face obscured by a hood, their leather apron stained with the evidence of countless victims. They work silently, their movements methodical and devoid of emotion, as if the suffering around them were merely a task to be completed.

Above it all, the dungeon's ceiling is low and oppressive, the occasional scuttling of rats in the shadows serving as a reminder of the filth and decay that permeates the space. The only exit—a heavy, iron-bound door reinforced with rivets—seems more a barrier to hope than a passage to freedom, its small viewing slit barred and shadowed.

This is a place of despair and cruelty, where the line between life and death is blurred, and the only certainty is the inevitability of suffering."

The iron seat is scenery in the Dungeon. The iron seat is a supporter. understand "spiked chair" as iron seat. The description of the iron seat is "A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light." 

The gray fuse is a colored fuse. The gray fuse underlies the iron seat. The description of the gray fuse is "This is an electrical fuse. It is gray colored. The same color as the door where you found it."

Instead of looking under a thing which is underlaid by the gray fuse when the gray fuse is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;
	now the gray fuse is found.
	
Section 6 - Guillotine Room

The Guillotine Room is south of the Dungeon. "The public square is a charged space, bustling with a crowd eager to witness the grim spectacle. The sky overhead is a patchwork of gray clouds, casting the cobblestone ground in a somber light. At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out.

A lone figure stands on the scaffold, their posture slumped under the weight of their fate. Their hands are bound tightly behind their back with coarse ropes, and their head hangs low, avoiding the stares of the gathered crowd. Their clothing, once fine, is now tattered and muddied, a visible testament to the fall from grace that has led to this moment.

The crowd presses closer, encircling the platform with a mix of emotions etched onto their faces. Some jeer, shouting curses and insults, their voices rising in a cacophony of condemnation. Others watch in heavy silence, their expressions grim and reflective. A few hold children on their shoulders, their young faces filled with curious fascination, unaware of the gravity of what they are about to witness.

At the edge of the platform, a town crier stands with a long scroll in hand, his voice carrying over the murmurs of the crowd:'This man has been found guilty of high treason against the crown. Let his punishment serve as a warning to all who would seek to defy the will of the realm!'

The condemned flinches at the words but remains silent, their face pale and eyes darting nervously. The executioner, a large figure clad in a hooded black robe, stands nearby with arms crossed, their demeanor cold and methodical. A few feet away, the guillotine looms, its blade gleaming dully in the filtered light, ready to deliver the final judgment.

The tension in the square is palpable as the crier steps aside and the executioner signals for the crowd to quiet. The murmurs fade, replaced by an oppressive silence that hangs over the scene like a shroud. The only sounds now are the rustle of the wind and the faint creak of the wooden scaffold.

As the condemned is led toward the guillotine, a crow caws from a nearby rooftop, its harsh cry echoing through the square like a dark omen. The crowd leans forward, holding its collective breath, as the weight of justice and mortality descends upon the scene. 

There is just lone problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated."

The guillotine platform is here. The guillotine platform is a supporter. Understand "scaffold" as guillotine platform. The description of the guillotine platform is "At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out." 

The indigo fuse is a colored fuse. The indigo fuse underlies the guillotine platform. The description of the indigo fuse is "This is an electrical fuse. It is indigo colored. The same color as the door where you found it."

Instead of looking under a thing which is underlaid by the indigo fuse when the indigo fuse is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;
	now the indigo fuse is found.
	
Section 7 - Ride Exit

The Ride Exit is south of the Guillotine Room. "The exit of Hell Ride is as unsettling as the ride itself, designed to leave riders with a lingering sense of unease. The pathway emerges from a dark, narrow corridor, its walls painted in peeling black with streaks of red that resemble dripping blood. Dim, flickering lights cast erratic shadows across the uneven floor, creating an oppressive atmosphere that follows riders even after they’ve left the ride.

The air is cooler here, with a faint metallic tang and the unmistakable scent of dampness, as though the exit leads not back to the carnival but somewhere deeper underground. Sound effects of faint whispers and distant screams play softly in the background, barely audible over the creak of the exit door swinging open and the occasional burst of laughter or screams from the ride’s next passengers.

Riders step out into a small courtyard, enclosed by jagged, rusted metal fencing adorned with fake cobwebs and plastic bones. A weathered sign swings overhead, painted in bold, Gothic letters: 'You[’]ve Survived… For Now.'

Nearby, a few carnival workers in tattered costumes linger, their expressions disturbingly neutral as they watch riders leave. One might mumble cryptic phrases like, 'Not everyone makes it out…' before breaking into a crooked grin.

The exit path leads past a small merchandise stand selling ride-themed merchandise—'Hell Ride Survivor' t-shirts, devil horns, and glow-in-the-dark trinkets shaped like skulls. The stand is bathed in red light, adding to the ominous mood.

Just beyond the fencing, the cheerful sounds and colorful lights of the carnival midway feel jarringly out of place, a sharp contrast to the oppressive darkness of the ride. Riders often pause to gather themselves, exchanging nervous laughter or adjusting their belongings, before stepping back into the lively world of the carnival.

The Hell Ride exit leaves riders not just thrilled, but marked by the eerie experience, a reminder of the fine line between fun and fear that defines the carnival’s darkest attraction."

The merchandise stand is scenery in the Ride Exit. The merchandise stand is a container. Understand "stand" as merchandise. The description of the merchandise is "The stand is bathed in red light, adding to the ominous mood." 

The khaki fuse is a colored fuse. The khaki fuse is in the merchandise stand. The Khaki Fuse underlies the merchandise stand. The description of the khaki fuse is "This is an electrical fuse. It is khaki colored. The same color as the door where you found it."

Instead of taking the khaki fuse when the khaki fuse is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;
	now the khaki fuse is found;
	now the khaki fuse is in the player
	
Chapter 3 - Backstage

Section 1 - Dark Passage

[get the key]
Test b1 with "brief. get	blueberries / s / buy ticket / s / give ticket to attendant / s / e / l at piles / get flashlight / turn it on / s / turn on radio / l at desk / open drawer / get all from the drawer / s / s / open toolbox / get all from toolbox / s / s / s / ne / get silver key / l at panel / open panel / l at socket / sw / n / n / n / n / n"

[get the fuses]
Test b2 with "w / l under stocks / e / s / w / l under platform / e / s / w / l in pyre / get fuse from pyre / e / s / w / l under seat / e / s / w / l under platform / e / s / s / w / l in stand / get khaki fuse from merchandise stand / e / n"

[fill the sockets]
Test b3 with "ne / open panel / put aqua in socket  / push switch / sw / e / open panel / put crimson in socket / push switch / w / se / open panel / put emerald in socket / push switch / nw / sw / open panel / put gray in socket / push switch / ne / w / open panel / put indigo in socket / push switch / e / nw / l at panel / unlock panel with knife / l at panel / open  panel / l at panel / l at switch. / l at indicator / l at socket / put khaki in socket / push switch / l at socket / se"

[turn the dials]
test b4 with "n / n / n / n / n / climb ladder / w / l at control panel / turn aqua dial to 1 / turn crimson dial to three / turn emerald dial to 5 / turn gray dial to seven / turn indigo dial to 9 / turn khaki dial to eleven / push aqua button / l at panel / push crimson button / l at panel  / push emerald button / l at panel / push gray button / l at panel / push khaki button"

test b5 with "n / n / n / n / n / w / n / n / n / i / score"

Test Backstage with "test b1 / test b2 / test b3 / test b4"

Dark Passage is a room. Dark Passage is east of the Ride Entrance. The dark passage is scored. "This room is backstage at the Hell Ride attraction. The room is littered with bags of trash, piles of junk, and dust bunnies so large they should be paying rent. West is back the way you came from. There an exit to the south."

The dust bunnies are scenery. The dust bunnies are here. Understand "bunnies" as dust bunnies.

The bags of trash are scenery. The bags of trash are here. Understand "bags" and "trash" as bags of trash.

instead of looking under when the noun is the pile of junk:
	try examining the junk instead. 

The pile of junk is a scenery container. The pile of junk is in the dark passage. The pile of junk contains the flashlight. Understand "piles" and "junk" as pile of junk. The description of the pile of junk is "In the corner is a pile of junk."

after examining when the noun is pile of junk:
	say "You find a flashlight here.".
	
after taking the flashlight for the first time:
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5.

Section 2 - Maintenance Office

The Maintenance Office is a dark room. The maintenance office is south of the dark passage. "The maintenance office is a chaotic and dimly lit space tucked away behind the glitz and glamour of the carnival. It smells of grease, sweat, and faintly of popcorn from the midway outside. The air is heavy and warm, thick with the lingering scent of oil and dust stirred up by constant work.

The walls are lined with cluttered shelves holding an assortment of tools and parts—rusty wrenches, screwdrivers, hammers, bolts, and screws organized (or not) in mismatched containers. Tattered labels, some scrawled in fading marker, hint at what lies inside. Cans of paint, grease, and lubricant sit precariously on the edges of workbenches, their lids half-open or missing entirely.

The center of the room is dominated by a large desk scarred with years of use. A vise clamp holds a bent piece of metal in place, while a spread of loose wires, gears, and springs litter the surface. A single, broken fluorescent light hangs from the ceiling.

In one corner, a disassembled ride mechanism sits, its inner workings exposed like the guts of a machine. Chains and pulleys dangle from hooks overhead, their metallic clink echoing faintly as they sway slightly with the vibration of the rides outside. A half-drained mug of coffee sits forgotten on a stool nearby, next to a grease-stained manual lying open to a random page.

The walls bear evidence of the room’s purpose: faded safety posters warning of hazards, a cork board pinned with ride maintenance schedules and hastily scribbled notes, and a faded photograph of the carnival in its prime. A clock ticks faintly in the background, though its hands don’t seem to match the current time.

The floor is uneven and gritty, coated in a fine layer of dust and littered with stray nails and scraps of metal. In one corner, a toolbox sits half-open, its contents spilling out as though abandoned mid-task. Nearby, a rickety fan struggles to spin, offering little relief from the oppressive heat.

Despite the disarray, the room hums with purpose. This is the beating heart of the carnival’s machinery, a hidden realm where the magic of the attractions is kept alive by grease-stained hands and sheer determination." 

The desk is in the maintenance office. The desk is a supporter. The desk is fixed in place. A drawer is part of the desk. The drawer is a closed openable container. The drawer is scenery. The description of the desk is "It[']s a desk. There are coffee stains and cigarette burns from years of abuse. The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

The radio is a device on the desk. The radio is switched off and fixed in place. "[if switched on]The radio burbles on[otherwise]The radio is off[end if]." 

Every turn when the radio is switched on and the location is Maintenance Office:
	say "[one of]'The radio plays 'Stairway to Heaven by Led Zeppelin.'[or]'The DJ just cued up Pink Floyd[']s 'Comfortably Numb'.[or]Pharell[']s 'Happy' is playing now.[or]'Folsom Prison Blues' by Johnny Cash is on the air.'[or]'Peace Train' by Cat Stevens can be heard playing on the radio.'[cycling]"
	
Rule for showing action of the radio:
	if the radio is switched on, say "Through the static, you pick up hear bits of the latest Taylor Swift song.";
	otherwise say "The radio is silent. You're saving the batteries."

Instead of listening in the presence of the switched on radio:
	carry out the showing action activity with the radio instead.

The scissors are in the drawer. The description is "This is a sharp pair of office scissors." The stapler is in the drawer. The description is "This is a red stapler." The ballpoint pen is in the drawer. The description is "Your standard ballpoint pen. It says Bic on the side." The pad of paper is in the drawer. The description is "This is a pad of lined paper."

The aqua door is west of the Maintenance Office and east of the Stocks Room. The Aqua Door is a closed locked door. The description of the Aqua door is "It[']s an aqua colored door with the word 'Stocks' written on it." The silver key unlocks it.

The cans of paint, grease, and lubricant are here.

The ladder is up from the Maintenance Office and down from the Dark Hallway. The ladder is an open door. The description of the Ladder is "It[']s a typical 10 foot ladder."

Instead of climbing a ladder:
	try entering the noun.


Section 3 - Crawl Space

The Crawl Space is a dark room. The Crawl Space is south of Maintenance Office. "The crawl space beneath the carnival ride is a tight, claustrophobic tunnel shrouded in darkness and filled with the hum of machinery above. The air is stale and heavy, carrying the sharp metallic scent of oil and the faint tang of rust. Every sound is amplified in the confined space—the groaning of steel beams, the clanking of chains, and the rhythmic thrum of motors driving the ride above.

The ground is uneven, a mix of packed dirt and loose gravel scattered with forgotten tools, scraps of metal, and tangled wires. Overhead, a network of pipes and cables crisscross the space, some wrapped in fraying insulation that crackles faintly as you crawl past. Small puddles of murky water collect in dips on the floor, their surfaces rippling with vibrations from the ride’s movement."

The crimson door is west of the Crawl Space and east of the Gallows Room. The Crimson Door is a closed locked door. The description of the Crimson door is "It[']s a crimson colored door with the word 'Gallows' written on it." The silver key unlocks it.

Section 4 - Mechanical Room North

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "The north mechanical room is smaller and more focused, housing the auxiliary systems that support the ride’s operation. It’s quieter than the south room, though the hum of capacitors and relays creates a constant, low background noise. Rows of electrical panels line the walls, each labeled with functions such as 'Lighting Controls,' 'Brake Systems', and 'Emergency Shutdown'. Smaller cables and conduits run along the walls, connecting these systems to the main hub in the south room.

In one corner, a hydraulic pump and reservoir control specific mechanisms of the ride, such as lifting arms or rotating platforms. Pressure gauges flicker intermittently, and the occasional hiss of fluid escaping creates a sharp contrast to the otherwise subdued atmosphere. A small generator sits nearby, its housing slightly dented but functional, ready to activate in case of a power failure.

A compact workbench is tucked against the eastern wall, strewn with tools and coiled wires. Above it, shelves are stacked with neatly labeled replacement parts: fuses, cables, and hydraulic tubing. A faded diagram of the ride’s layout is pinned to the wall nearby, marked with annotations in red ink from previous maintenance efforts.

The lighting is dimmer here, provided by a single hanging bulb that casts soft shadows across the room. The air feels cooler and slightly damp, with a faint smell of mildew mixing with the metallic tang of the machinery.

The north mechanical room functions as a support system, ensuring that auxiliary processes run smoothly and that emergency backups are ready to deploy if needed. Though quieter and less imposing than its southern counterpart, it is just as critical to the ride’s overall operation." 

The toolbox is a closed openable container in the Mechanical Room North. The toolbox contains a monkey wrench, a channel locks, pliers, and a hammer.

The emerald door is west of the Mechanical Room North and east of the Stake Room. The Emerald Door is a closed locked door. The description of the Emerald door is "It[']s an emerald colored door with the word 'Stake' written on it." The silver key unlocks it.

Section 5 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "The south mechanical room is the heart of the carnival ride, a large, noisy space where the primary systems are housed. The room is dominated by a massive motor, its rhythmic hum filling the air as it drives the ride’s main mechanics. Thick belts and pulleys extend from the motor to a series of gears and drive shafts, each component working in seamless coordination to power the ride.

The walls are lined with heavy-duty electrical panels, their surfaces marked with warning labels like 'High Voltage' and 'Do Not Open While Powered'. Bright indicator lights blink in greens and reds, providing a visual heartbeat to the room’s constant activity. Overhead, insulated wires and steel conduits run along the ceiling, their routes clearly labeled but seemingly endless.

A workbench along one wall is cluttered with tools—wrenches, screwdrivers, and pliers—neatly arranged next to containers of spare parts like bolts, washers, and lubricants. Manuals and maintenance logs sit open, their pages marked with grease-stained fingerprints. The faint smell of oil and metal pervades the air, along with a hint of ozone from the electrical systems.

A cooling fan whirs in the corner, its blades spinning in a futile attempt to temper the room’s warmth. The sound of chains clinking occasionally breaks through the hum, accompanied by the sharp hiss of hydraulic fluid releasing pressure. The floor is a patchwork of metal grates and concrete, worn smooth in some areas by years of use.

The south mechanical room is brightly lit, with overhead fluorescent lights encased in protective wire cages. This is the main operations hub, where the power of the ride is generated and controlled, ensuring its thrilling movements stay in sync." 

The gray door is west of the Mechanical Room South and east of the Dungeon. The gray door is a closed locked door. Understand "grey" as gray. The description of the gray door is "It[']s a gray colored door with the word 'Dungeon' written on it." The silver key unlocks it.

Section 6 - Generator Room

The Generator Room is a dark room. The Generator Room is south of the Mechanical Room South. "The generator room is a compact, industrial space tucked away from the vibrant chaos of the carnival, where the hum and flicker of electricity are birthed to power the attractions. The walls are constructed of reinforced concrete, their surfaces marked with grime, oil streaks, and the faint outlines of graffiti left by past workers. The room smells of diesel fuel, hot metal, and the faint tang of ozone, mingled with the earthy scent of dampness from the surrounding ground.

At the center of the room sits the main generator, a hulking, metallic beast of machinery. Its steel casing is scuffed and dented from years of use, though it still functions with a steady, low rumble that resonates through the floor. Thick cables, black and rubberized, extend like veins from the generator to the room’s walls, where they feed into an array of junction boxes and circuit breakers.

The generator’s control panel is mounted to one side, cluttered with buttons, switches, and gauges. Labels, many peeling or faded, identify each component: 'Fuel Intake', 'Voltage Control', 'Emergency Shutoff'. A small display screen flickers with real-time readouts, showing power levels and load distribution to the various carnival attractions.

The floor is made of rough, uneven concrete, with small puddles of spilled fuel or condensation pooling in its crevices. Along the walls, shelves are stacked with spare parts—fuel filters, spark plugs, and coils of insulated wire. Tools are scattered on a nearby workbench, alongside a canister of grease and a well-worn maintenance manual.

The air is thick and warm, vibrating faintly with the generator’s operation. A vent in the corner struggles to extract the heat, its fan spinning with a faint, rhythmic whir. The dim lighting in the room comes from a single industrial bulb encased in a protective cage, casting harsh shadows across the machinery and walls.

In one corner, a row of diesel fuel canisters stands neatly arranged, their metallic surfaces gleaming under the light. A faded safety poster hangs above them, its message barely legible: 'Fuel Safely—No Open Flames!'

Despite its utilitarian design, the room carries an air of importance. The generator room is the heartbeat of the carnival, its steady output ensuring that the lights flash, the rides whirl, and the sounds of joy and terror continue uninterrupted. Yet, in its stark isolation, it feels oddly disconnected from the lively world it powers, a quiet reminder of the machinery behind the magic." 

The indigo door is west of the Generator Room and east of the Guillotine Room. The Indigo Door is a closed locked door. The description of the Indigo door is "It[']s an indigo colored door with the word 'Guillotine' written on it." The silver key unlocks it.

Section 7 - Electrical Room

The Electrical Room is a dark room. The Electrical Room is south of the Generator Room. "The electrical room is a compact but vital space, tucked away behind the scenes of the carnival’s bustling attractions. The room hums with a steady, electric energy, the air thick with the scent of overheated wires, metal, and a faint tang of ozone. The walls are lined with metal panels, some polished and sleek, others weathered and streaked with grease from years of operation.

A central breaker panel dominates one wall, its surface covered in a grid of switches and levers, each labeled with destinations like 'Ferris Wheel Lights', 'Carousel Motors', and 'Midway Games'. Bright indicator lights blink sporadically, casting green, yellow, and red glows that reflect off the polished steel surfaces. Overhead, conduits and thick bundles of cables snake across the ceiling, bound together with zip ties and disappearing into the walls to distribute power throughout the carnival.

In one corner of the room, a junction box sits open, its wires spilling out like the veins of the carnival. A maintenance worker’s touch lingers here, with tools scattered on a small workbench nearby: wire cutters, screwdrivers, and spools of electrical tape. A laminated wiring diagram is pinned to the wall above the bench, its corners dog-eared and smudged with greasy fingerprints.

The floor is dirt, its surface marked with scratches, oil stains, and scattered bits of wire clippings. A faint vibration runs through the room, a pulse from the generator in the adjacent space or the distant hum of the carnival rides.

Mounted along another wall is an emergency shutdown panel, painted bright red with a prominent lever labeled 'Master Power Off.' A fire extinguisher hangs nearby, accompanied by a faded safety poster warning about the dangers of electrical fires. Below it, a collection of replacement fuses and circuit boards are neatly arranged on a shelf, ready for use when something inevitably malfunctions.

A small fan sits on the workbench, oscillating weakly to counter the oppressive heat radiating from the machinery. The light in the room comes from bare fluorescent tubes overhead, their cold glow flickering slightly, casting sharp shadows that shift with every movement.

Despite its functionality, the electrical room carries a certain unease. The constant hum of electricity, the flicker of lights, and the sharpness of exposed wires hint at the delicate balance of power keeping the carnival alive. It’s a space where the magic of the midway is stripped bare, revealing the raw energy coursing through its veins.

This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous! There are exits in all directions."

Section 8 - Electrical Closet Eleven

The Electrical Closet Eleven is a dark room. The Electrical Closet Eleven is northwest of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the south east." 

Electrical Panel Eleven is a locked closed openable container in Electrical Closet Eleven. The swiss army knife unlocks it. Electrical Panel Eleven is scenery. The printed name of Electrical Panel Eleven is "the electrical panel". The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Eleven is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed[end if]. [if Electrical Panel Eleven is locked]There are screws holding it shut.[end if]" 

Socket Eleven is in Electrical Panel Eleven. Socket Eleven is a socket. The description is "This is a socket. A fuse probably goes in here."

Switch Eleven is a switched off device. Switch Eleven is part of Electrical Panel Eleven. The printed name of Switch Eleven is "the switch". The description is "This is a big switch. You could probably turn it [if switch Eleven is switched off]on[otherwise]off[end if] if you wanted to."

Indicator Light Eleven is a switched off device. Indicator Light Eleven is part of Electrical Panel Eleven. The printed name of Indicator Light Eleven is "the indicator". The description of Indicator Light Eleven is "The indicator is currently [if Indicator Light Eleven is switched on]indicating something[otherwise]indicating nothing[end if]."

Points Awarded Eleven is a truth state that varies. Points Awarded Eleven is false.
Instead of switching on or pushing Switch Eleven:
	if Switch Eleven is switched off and the Khaki Fuse is not in Socket Eleven:
		say "You push the switch.";
		say "Nothing obvious happens." instead;
	if Switch Eleven is switched off and the Khaki Fuse is in Socket Eleven and Points Awarded Eleven is false:
		say "The indicator light goes on.";
		now Switch Eleven is switched on;
		now Indicator Light Eleven is switched on;
		play the sound of Strongman Bell;
		increase score by 5;
		now Points Awarded Eleven is true;
		stop the action;
	if Switch Eleven is switched off and the Khaki Fuse is in Socket Eleven and Points Awarded Eleven is true:
		say "The indicator light goes on.";
		now Switch Eleven is switched on;
		now Indicator Light Eleven is switched on;
		stop the action;
	if Switch Eleven is switched off and the Khaki Fuse is in Socket Nine:
		say "The indicator light goes on.";
		now Switch Eleven is switched on;
		now Indicator Light Eleven is switched on;
		stop the action;
	if Switch Eleven is switched on:
		say "The indicator light goes off.";
		now Switch Eleven is switched off;
		now Indicator Light Eleven is switched off;
		stop the action.

Instead of switching on Indicator Light Eleven, say "You can['] turn that on." instead.

instead of inserting when the noun is not a colored fuse, say "That won[']t fit in the socket." instead.

instead of inserting when Socket Eleven is filled, say "The socket is already filled.".

before taking:
	if Socket Eleven is filled and the noun is a colored fuse:
		say "Taken.";
		now the noun is in the player;
		now Indicator Light Eleven is switched off;
		now Switch Eleven is switched off;
		now Socket Eleven is unfilled;
		stop the action.
	
instead of inserting when the noun is the Khaki Fuse and the second noun is Socket Eleven and Socket Eleven is unfilled and panel eleven is open:
	say "You hear a satisfying snick as the fuse slides into place.";
	now Socket Eleven is filled;
	now the Khaki Fuse is in Socket Eleven.

instead of inserting when the noun is a colored fuse and the second noun is Socket Eleven and Socket Eleven is unfilled:
	say "You put the fuse in the socket.";
	now the noun is in Socket Eleven;
	now Socket Eleven is filled;
	stop the action.
	
instead of unlocking when the location is Electrical Closet Eleven:
	say "Using the screwdriver on the Swiss Army knife, you remove the cover to the electrical panel.";
	now Electrical Panel Eleven is unlocked.

instead of locking when the location is Electrical Closet Eleven, say "you can['] lock that!" instead.

Section 9 - Electrical Closet Nine

The Electrical Closet Nine is a dark room. The Electrical Closet Nine is west of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the east." 

Electrical Panel Nine is a locked closed openable container in Electrical Closet Nine. The swiss army knife unlocks it. Electrical Panel Nine is scenery. The printed name of Electrical Panel Nine is "the electrical panel". The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Nine is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed[end if]. [if Electrical Panel Nine is locked]There are screws holding it shut.[end if]" 

Socket Nine is in Electrical Panel Nine. Socket Nine is an open container. Socket Nine is fixed in place. Socket Nine can be filled or unfilled. Socket Nine is unfilled. The printed name of a socket Nine is "the socket". The description is "This is a socket. A fuse probably goes in here."

Switch Nine is a switched off device. Switch Nine is part of Electrical Panel Nine. The printed name of Switch Nine is "the switch". The description is "This is a big switch. You could probably turn it [if switch Nine is switched off]on[otherwise]off[end if] if you wanted to."

Indicator Light Nine is a switched off device. Indicator Light Nine is part of Electrical Panel Nine. The printed name of Indicator Light Nine is "the indicator". The description of Indicator Light Nine is "The indicator is currently [if Indicator Light Nine is switched on]indicating something[otherwise]indicating nothing[end if]."

Points Awarded Nine is a truth state that varies. Points Awarded Nine is false.
Instead of switching on or pushing Switch Nine:
	if Switch Nine is switched off and the Indigo Fuse is not in Socket Nine:
		say "You push the switch.";
		say "Nothing obvious happens." instead;
	if Switch Nine is switched off and the Indigo Fuse is in Socket Nine and Points Awarded Nine is false:
		say "The indicator light goes on.";
		now Switch Nine is switched on;
		now Indicator Light Nine is switched on;
		play the sound of Strongman Bell;
		increase score by 5;
		now Points Awarded Nine is true;
		stop the action;
	if Switch Nine is switched off and the Indigo Fuse is in Socket Nine and Points Awarded Nine is true:
		say "The indicator light goes on.";
		now Switch Nine is switched on;
		now Indicator Light Nine is switched on;
		stop the action;
	if Switch Nine is switched off and the Indigo Fuse is in Socket Nine:
		say "The indicator light goes on.";
		now Switch Nine is switched on;
		now Indicator Light Nine is switched on;
		stop the action;
	if Switch Nine is switched on:
		say "The indicator light goes off.";
		now Switch Nine is switched off;
		now Indicator Light Nine is switched off;
		stop the action.

Instead of switching on Indicator Light Nine, say "You can['] turn that on." instead.

instead of inserting when the noun is not a colored fuse, say "That won[']t fit in the socket." instead.

instead of inserting when Socket Nine is filled, say "The socket is already filled.".

before taking:
	if Socket Nine is filled and the noun is a colored fuse:
		say "Taken.";
		now the noun is in the player;
		now Indicator Light Nine is switched off;
		now Switch Nine is switched off;
		now Socket Nine is unfilled;
		stop the action.
	
instead of inserting when the noun is the Indigo Fuse and the second noun is Socket Nine and Socket Nine is unfilled and panel Nine is open:
	say "You hear a satisfying snick as the fuse slides into place.";
	now Socket Nine is filled;
	now the Indigo Fuse is in Socket Nine.

instead of inserting when the noun is a colored fuse and the second noun is Socket Nine and Socket Nine is unfilled:
	say "You put the fuse in the socket.";
	now the noun is in Socket Nine;
	now Socket Nine is filled;
	stop the action.
	
instead of unlocking when the location is Electrical Closet Nine:
	say "Using the screwdriver on the Swiss Army knife, you remove the cover to the electrical panel.";
	now Electrical Panel Nine is unlocked.

instead of locking when the location is Electrical Closet Nine, say "you can['] lock that!" instead.

Section 10 - Electrical Closet Seven

The Electrical Closet Seven is a dark room. Electrical Closet Seven is southwest of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the north east." 

Electrical Panel Seven is a locked closed openable container in Electrical Closet Seven. The swiss army knife unlocks it. Electrical Panel Seven is scenery. The printed name of Electrical Panel Seven is "the electrical panel". The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Seven is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed[end if]. [if Electrical Panel Seven is locked]There are screws holding it shut.[end if]" 

Socket Seven is in Electrical Panel Seven. Socket Seven is an open container. Socket Seven is fixed in place. Socket Seven can be filled or unfilled. Socket Seven is unfilled. The printed name of a socket Seven is "the socket". The description is "This is a socket. A fuse probably goes in here.."

Switch Seven is a switched off device. Switch Seven is part of Electrical Panel Seven. The printed name of Switch Seven is "the switch". The description is "This is a big switch. You could probably turn it [if switch Seven is switched off]on[otherwise]off[end if] if you wanted to."

Indicator Light Seven is a switched off device. Indicator Light Seven is part of Electrical Panel Seven. The printed name of Indicator Light Seven is "the indicator". The description of Indicator Light Seven is "The indicator is currently [if Indicator Light Seven is switched on]indicating something[otherwise]indicating nothing[end if]."

Points Awarded Seven is a truth state that varies. Points Awarded Seven is false.
Instead of switching on or pushing Switch Seven:
	if Switch Seven is switched off and the Gray Fuse is not in Socket Seven:
		say "You push the switch.";
		say "Nothing obvious happens." instead;
	if Switch Seven is switched off and the Gray Fuse is in Socket Seven and Points Awarded Seven is false:
		say "The indicator light goes on.";
		now Switch Seven is switched on;
		now Indicator Light Seven is switched on;
		play the sound of Strongman Bell;
		increase score by 5;
		now Points Awarded Seven is true;
		stop the action;
	if Switch Seven is switched off and the Gray Fuse is in Socket Seven and Points Awarded Seven is true:
		say "The indicator light goes on.";
		now Switch Seven is switched on;
		now Indicator Light Seven is switched on;
		stop the action;
	if Switch Seven is switched off and the Gray Fuse is in Socket Nine:
		say "The indicator light goes on.";
		now Switch Seven is switched on;
		now Indicator Light Seven is switched on;
		stop the action;
	if Switch Seven is switched on:
		say "The indicator light goes off.";
		now Switch Seven is switched off;
		now Indicator Light Seven is switched off;
		stop the action.

Instead of switching on Indicator Light Seven, say "You can['] turn that on." instead.

instead of inserting when the noun is not a colored fuse, say "That won[']t fit in the socket." instead.

instead of inserting when Socket Seven is filled, say "The socket is already filled.".

before taking:
	if Socket Seven is filled and the noun is a colored fuse:
		say "Taken.";
		now the noun is in the player;
		now Indicator Light Seven is switched off;
		now Switch Seven is switched off;
		now Socket Seven is unfilled;
		stop the action.
	
instead of inserting when the noun is the Gray Fuse and the second noun is Socket Seven and Socket Seven is unfilled and panel Seven is open:
	say "You hear a satisfying snick as the fuse slides into place.";
	now Socket Seven is filled;
	now the Gray Fuse is in Socket Seven.

instead of inserting when the noun is a colored fuse and the second noun is Socket Seven and Socket Seven is unfilled:
	say "You put the fuse in the socket.";
	now the noun is in Socket Seven;
	now Socket Seven is filled;
	stop the action.
	
instead of unlocking when the location is Electrical Closet Seven:
	say "Using the screwdriver on the Swiss Army knife, you remove the cover to the electrical panel.";
	now Electrical Panel Seven is unlocked.

instead of locking when the location is Electrical Closet Seven, say "you can['] lock that!" instead.

Section 11 - Electrical Closet Five

The Electrical Closet Five is a dark room. Electrical Closet Five is southeast of the Electrical Room."You are in a section of the electrical room. There is an electrical panel here. There is an exit to the north west." 

Electrical Panel Five is a locked closed openable container in Electrical Closet Five. The swiss army knife unlocks it. Electrical Panel Five is scenery. The printed name of Electrical Panel Five is "the electrical panel". The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Five is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed[end if]. [if Electrical Panel Five is locked]There are screws holding it shut.[end if]" 

Socket Five is in Electrical Panel Five. Socket Five is an open container. Socket Five is fixed in place. Socket Five can be filled or unfilled. Socket Five is unfilled. The printed name of a socket Five is "the socket". The description is "This is a socket. A fuse probably goes in here."

Switch Five is a switched off device. Switch Five is in Electrical Panel Five. The printed name of Switch Five is "the switch". The description is "This is a big switch. You could probably turn it [if switch Five is switched off]on[otherwise]off[end if] if you wanted to."

Indicator Light Five is a switched off device. Indicator Light Five is part of Electrical Panel Five. The printed name of Indicator Light Five is "the indicator". The description of Indicator Light Five is "The indicator is currently [if Indicator Light Five is switched on]indicating something[otherwise]indicating nothing[end if]."

Points Awarded Five is a truth state that varies. Points Awarded Five is false.
Instead of switching on or pushing Switch Five:
	if Switch Five is switched off and the Emerald Fuse is not in Socket Five:
		say "You push the switch.";
		say "Nothing obvious happens." instead;
	if Switch Five is switched off and the Emerald Fuse is in Socket Five and Points Awarded Five is false:
		say "The indicator light goes on.";
		now Switch Five is switched on;
		now Indicator Light Five is switched on;
		play the sound of Strongman Bell;
		increase score by 5;
		now Points Awarded Five is true;
		stop the action;
	if Switch Five is switched off and the Emerald Fuse is in Socket Five and Points Awarded Five is true:
		say "The indicator light goes on.";
		now Switch Five is switched on;
		now Indicator Light Five is switched on;
		stop the action;
	if Switch Five is switched off and the Emerald Fuse is in Socket Nine:
		say "The indicator light goes on.";
		now Switch Five is switched on;
		now Indicator Light Five is switched on;
		stop the action;
	if Switch Five is switched on:
		say "The indicator light goes off.";
		now Switch Five is switched off;
		now Indicator Light Five is switched off;
		stop the action.

Instead of switching on Indicator Light Five, say "You can['] turn that on." instead.

instead of inserting when the noun is not a colored fuse, say "That won[']t fit in the socket." instead.

instead of inserting when Socket Five is filled, say "The socket is already filled.".

before taking:
	if Socket Five is filled and the noun is a colored fuse:
		say "Taken.";
		now the noun is in the player;
		now Indicator Light Five is switched off;
		now Switch Five is switched off;
		now Socket Five is unfilled;
		stop the action.
	
instead of inserting when the noun is the Emerald Fuse and the second noun is Socket Five and Socket Five is unfilled and panel Five is open:
	say "You hear a satisfying snick as the fuse slides into place.";
	now Socket Five is filled;
	now the Emerald Fuse is in Socket Five.

instead of inserting when the noun is a colored fuse and the second noun is Socket Five and Socket Five is unfilled:
	say "You put the fuse in the socket.";
	now the noun is in Socket Five;
	now Socket Five is filled;
	stop the action.
	
instead of unlocking when the location is Electrical Closet Five:
	say "Using the screwdriver on the Swiss Army knife, you remove the cover to the electrical panel.";
	now Electrical Panel Five is unlocked.

instead of locking when the location is Electrical Closet Five, say "you can['] lock that!" instead.

Section 12 - Electrical Closet Three

The Electrical Closet Three is a dark room. Electrical Closet Three is east of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the west." 

Electrical Panel Three is a locked closed openable container in Electrical Closet Three. The swiss army knife unlocks it. Electrical Panel Three is scenery. The printed name of Electrical Panel Three is "the electrical panel". The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Three is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed[end if]. [if Electrical Panel Three is locked]There are screws holding it shut.[end if]" 

Socket Three is in Electrical Panel Three. Socket Three is an open container. Socket Three is fixed in place. Socket Three can be filled or unfilled. Socket Three is unfilled. The printed name of a socket Three is "the socket". The description is "This is a socket. A fuse probably goes in here."

Switch Three is a switched off device. Switch Three is part of Electrical Panel Three. The printed name of Switch Three is "the switch". The description is "This is a big switch. You could probably turn it [if switch Three is switched off]on[otherwise]off[end if] if you wanted to."

Indicator Light Three is a switched off device. Indicator Light Three is part of Electrical Panel Three. The printed name of Indicator Light Three is "the indicator". The description of Indicator Light Three is "The indicator is currently [if Indicator Light Three is switched on]indicating something[otherwise]indicating nothing[end if]."

Points Awarded Three is a truth state that varies. Points Awarded Three is false.
Instead of switching on or pushing Switch Three:
	if Switch Three is switched off and the Crimson Fuse is not in Socket Three:
		say "You push the switch.";
		say "Nothing obvious happens." instead;
	if Switch Three is switched off and the Crimson Fuse is in Socket Three and Points Awarded Three is false:
		say "The indicator light goes on.";
		now Switch Three is switched on;
		now Indicator Light Three is switched on;
		play the sound of Strongman Bell;
		increase score by 5;
		now Points Awarded Three is true;
		stop the action;
	if Switch Three is switched off and the Crimson Fuse is in Socket Three and Points Awarded Three is true:
		say "The indicator light goes on.";
		now Switch Three is switched on;
		now Indicator Light Three is switched on;
		stop the action;
	if Switch Three is switched off and the Crimson Fuse is in Socket Nine:
		say "The indicator light goes on.";
		now Switch Three is switched on;
		now Indicator Light Three is switched on;
		stop the action;
	if Switch Three is switched on:
		say "The indicator light goes off.";
		now Switch Three is switched off;
		now Indicator Light Three is switched off;
		stop the action.

Instead of switching on Indicator Light Three, say "You can['] turn that on." instead.

instead of inserting when the noun is not a colored fuse, say "That won[']t fit in the socket." instead.

instead of inserting when Socket Three is filled, say "The socket is already filled.".

before taking:
	if Socket Three is filled and the noun is a colored fuse:
		say "Taken.";
		now the noun is in the player;
		now Indicator Light Three is switched off;
		now Switch Three is switched off;
		now Socket Three is unfilled;
		stop the action.
	
instead of inserting when the noun is the Crimson Fuse and the second noun is Socket Three and Socket Three is unfilled and panel Three is open:
	say "You hear a satisfying snick as the fuse slides into place.";
	now Socket Three is filled;
	now the Crimson Fuse is in Socket Three.

instead of inserting when the noun is a colored fuse and the second noun is Socket Three and Socket Three is unfilled:
	say "You put the fuse in the socket.";
	now the noun is in Socket Three;
	now Socket Three is filled;
	stop the action.
	
instead of unlocking when the location is Electrical Closet Three:
	say "Using the screwdriver on the Swiss Army knife, you remove the cover to the electrical panel.";
	now Electrical Panel Three is unlocked.

instead of locking when the location is Electrical Closet Three, say "you can['] lock that!" instead.

Section 13 - Electrical Closet One

The Electrical Closet One is a dark room. The Electrical Closet One is northeast of the Electrical Room.  "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the south west." 

The Electrical Closet One is a scored room.

Electrical Panel One is a locked closed openable container in Electrical Closet One. The swiss army knife unlocks it. Electrical Panel One is scenery. The printed name of Electrical Panel One is "the electrical panel". The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel One is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed[end if]. [if Electrical Panel One is locked]There are screws holding it shut.[end if]" 

Socket One is in Electrical Panel One. Socket One is an open container. Socket One is fixed in place. Socket One can be filled or unfilled. Socket One is unfilled. The printed name of a socket One is "the socket". The description is "This is a socket. A fuse probably goes in here."

Switch One is a switched off device. Switch One is part of Electrical Panel One. The printed name of Switch One is "the switch". The description is "This is a big switch. You could probably turn it [if switch One is switched off]on[otherwise]off[end if] if you wanted to."

Indicator Light One is a switched off device. Indicator Light One is part of Electrical Panel One. The printed name of Indicator Light One is "the indicator". The description of Indicator Light One is "The indicator is currently [if Indicator Light One is switched on]indicating something[otherwise]indicating nothing[end if]."

Points Awarded One is a truth state that varies. Points Awarded One is false.
Instead of switching on or pushing Switch One:
	if Switch One is switched off and the Aqua Fuse is not in Socket One:
		say "You push the switch.";
		say "Nothing obvious happens." instead;
	if Switch One is switched off and the Aqua Fuse is in Socket One and Points Awarded One is false:
		say "The indicator light goes on.";
		now Switch One is switched on;
		now Indicator Light One is switched on;
		play the sound of Strongman Bell;
		increase score by 5;
		now Points Awarded One is true;
		stop the action;
	if Switch One is switched off and the Aqua Fuse is in Socket One and Points Awarded One is true:
		say "The indicator light goes on.";
		now Switch One is switched on;
		now Indicator Light One is switched on;
		stop the action;
	if Switch One is switched off and the Aqua Fuse is in Socket Nine:
		say "The indicator light goes on.";
		now Switch One is switched on;
		now Indicator Light One is switched on;
		stop the action;
	if Switch One is switched on:
		say "The indicator light goes off.";
		now Switch One is switched off;
		now Indicator Light One is switched off;
		stop the action.

Instead of switching on Indicator Light One, say "You can['] turn that on." instead.

instead of inserting when the noun is not a colored fuse, say "That won[']t fit in the socket." instead.

instead of inserting when Socket One is filled, say "The socket is already filled.".

before taking:
	if Socket One is filled and the noun is a colored fuse:
		say "Taken.";
		now the noun is in the player;
		now Indicator Light One is switched off;
		now Switch One is switched off;
		now Socket One is unfilled;
		stop the action.
	
instead of inserting when the noun is the Aqua Fuse and the second noun is Socket One and Socket One is unfilled and panel One is open:
	say "You hear a satisfying snick as the fuse slides into place.";
	now Socket One is filled;
	now the Aqua Fuse is in Socket One.

instead of inserting when the noun is a colored fuse and the second noun is Socket One and Socket One is unfilled:
	say "You put the fuse in the socket.";
	now the noun is in Socket One;
	now Socket One is filled;
	stop the action.
	
instead of unlocking when the location is Electrical Closet One:
	say "Using the screwdriver on the Swiss Army knife, you remove the cover to the electrical panel.";
	now Electrical Panel One is unlocked.

instead of locking when the location is Electrical Closet One, say "you can['] lock that!" instead.
	
The silver key is in the Electrical Closet One. The description of the silver key is "This is a small silver key. I wonder what it unlocks."

Section 14 - Storage Room

The Storage Room is a dark room. The Storage Room is south of the Electrical Room. "The carnival storage room is a chaotic yet oddly functional space, tucked away from the flashing lights and lively crowds. Its walls are made of corrugated metal or weathered wood, with patches of rust and peeling paint revealing the room's age. The faint smell of grease, dust, and damp canvas hangs in the air, mingled with a hint of stale popcorn and cotton candy from the midway outside.

Shelves line the walls, crammed with a mishmash of supplies. Boxes of lightbulbs, spools of electrical wiring, and stacks of replacement parts for rides and games are piled haphazardly, some labeled in fading marker, others left to mystery. A collection of brightly colored pennant flags and strings of carnival lights dangles from hooks, their wires tangled into an unruly knot.

In one corner, a pile of folded canvas tarps and tent poles leans precariously against the wall, ready to be deployed for setting up new attractions or repairing existing ones. Nearby, over sized crates are labeled with blocky stencils: 'GAME PRIZES', RIDE PARTS', and 'SPARE SIGNAGE'. One crate is open, revealing a jumble of stuffed animals, rubber balls, and plastic toys meant to delight lucky winners.

The center of the room is dominated by larger items—spare seats for rides, unassembled game booths, and the occasional disassembled attraction part, like a faded carousel horse or a section of a Ferris wheel’s gondola. These are covered in tarps or wrapped in protective blankets, their surfaces scratched and worn from transport and use.

A small, battered desk sits near the entrance, cluttered with maintenance logs, mismatched tools, and a few empty coffee cups. Above it, a cork board displays a chaotic array of pinned notes: ride schedules, repair requests, and a map of the carnival grounds with certain areas circled in red. A single fluorescent light flickers overhead, casting uneven shadows across the room and giving it a slightly eerie feel.

The floor is a patchwork of concrete and dirt, strewn with stray bolts, screws, and scraps of paper. In the darker corners, the scuttling of a rat or the glint of a spider’s web serves as a reminder that this space, while essential, is far from pristine.

The carnival storage room is not glamorous, but it is vital—a hidden world of spare parts, forgotten treasures, and organized chaos that keeps the carnival running smoothly. It’s a backstage glimpse into the hard work and improvisation that make the magic possible."

The khaki door is west of the Storage Room and east of the Ride Exit. The Khaki Door is a closed locked door. The description of the Khaki door is "It[']s a khaki colored door with the word 'Ride Exit' written on it." The silver key unlocks it.

Chapter 4 - Second Floor

Section 1 - Dark Hallway

Dark Hallway is a dark room. "This is a poorly lit hallway. Ahead you can see the glow of an open door."
	
Section 2 - Control Room

Control Room is a dark room. The Control Room is west of the Dark Hallway. The Control Room is a scored room. "The backstage control room is a functional, no-frills space hidden behind the glitter and chaos of the carnival. It’s where the real work happens—a nerve center for monitoring and managing the operations of the rides, attractions, and lighting systems. The room is enclosed by plain, industrial walls, painted a dull gray and marked with scuffs, scratches, and the occasional smudge of grease or fingerprints.

Rows of monitors line the main wall, displaying live feeds from security cameras and ride controls. Each screen shows a different part of the carnival: blinking lights of the Ferris wheel, the whirling motion of a carousel, and the eerie darkness of the Hell Ride. A few screens flicker or show static, adding to the sense of wear and tear that pervades the room. Beneath the monitors, a control panel is cluttered with switches, buttons, and dials, each labeled with functions like 'Ride Start,' 'Lighting Override', and 'Emergency Stop.' Small lights blink in green, yellow, or red, signaling the status of different systems.

The hum of electronics fills the air, mingled with the occasional crackle of a two-way radio resting on a desk. The radios buzz intermittently with the voices of carnival workers reporting issues or coordinating movements:
'Maintenance to Tilt-a-Whirl—need a wrench at Station 2!'

The floor is a patchwork of worn linoleum and exposed concrete, littered with stray papers, toolkits, and empty coffee cups. A cluttered desk sits against one wall, covered with logbooks, ride schedules, and laminated emergency procedures. A corkboard above the desk is pinned with maintenance charts, carnival maps, and handwritten notes, some of them circled in red ink with messages like 'Check circuit breakers on Zipper' or 'Replace bulbs near south entrance.'

A single fluorescent light fixture hangs overhead, buzzing faintly as it casts a cold, sterile glow across the room. The air is cool but tinged with a faint metallic smell, mixed with the earthy dampness from the surrounding carnival grounds. In one corner, a small, battered first-aid kit hangs on the wall, its contents slightly spilling out, and a faded fire extinguisher sits nearby.

Despite its unassuming appearance, the control room feels alive with purpose—a behind-the-scenes hub that ensures the carnival’s magic unfolds without a hitch. It’s a space where the mechanics, electronics, and human effort merge to keep the carnival running smoothly, even as chaos and excitement reign outside." 

[control panel]
The Control Panel is a thing in the Control Room. The Control Panel is a supporter and fixed in place. 

instead of examining the control panel:
	say "The control panel is populated with a row of colored lights. From left to right, the colors are aqua, crimson, emerald, gray, indigo, and khaki. Below the lights is a row of similarly colored dials and below that is a row of buttons. (The poorly generated AI & human image is meant for comparison purposes only. LOL) The control panel is [if switch count is 6]lit up like a Christmas tree[otherwise]dark[end if].[line break]";
	if switch count is 6 and every colored button is switched off:
		display the figure of ControlPanel;
	else if the aqua fuse is in socket one and the aqua button is switched on:
		display the figure of ControlPanelStocks;
	else if the crimson fuse is in socket three and the crimson button is switched on:
		display the figure of ControlPanelGallows;
	else if the emerald fuse is in socket five and the emerald button is switched on:
		display the figure of ControlPanelStake;
	else if the gray fuse is in socket seven and the gray button is switched on:
		display the figure of ControlPanelDungeon;
	else if the indigo fuse is in socket nine and the indigo button is switched on:
		display the figure of ControlPanelGuillotine;
	else if the khaki fuse is in socket eleven and the khaki button is switched on:
		display the figure of ControlPanelExit.
	
The switch count is a number that varies. The switch count is 0.
To count the switches:
	now the switch count is 0;
	if switch one is switched on, increment the switch count;
	if switch three is switched on, increment the switch count;
	if switch five is switched on, increment the switch count;
	if switch seven is switched on, increment the switch count;
	if switch nine is switched on, increment the switch count;
	if switch eleven is switched on, increment the switch count.
		
every turn when the location is the Control Room:
	if switch count is not 6:
		now all the colored lights are switched off;
		now all the colored dials are switched off;
		now the dial setting of the aqua dial is 0;
		now the dial setting of the crimson dial is 0;
		now the dial setting of the emerald dial is 0;
		now the dial setting of the gray dial is 0;
		now the dial setting of the indigo dial is 0;	
		now the dial setting of the khaki dial is 0;
		now all the colored buttons are switched off;
		
[BUGBUG remove debug output]
every turn when the location is the control room:
	count the switches;
	count the dials;
	[say "switch count: [switch count], dial count: [dial count]."]
		
[lights]
A colored light is a kind of device. A colored light is fixed in place. A colored light is usually switched off. Understand "indicator" as colored light.
The aqua light is a colored light. It is part of the control panel. The description of the aqua light is "This is an aqua colored light. The light is [if the aqua light is switched on]on[otherwise]off[end if]."
The crimson light is a colored light. It is part of the control panel. The description of the crimson light is "This is an crimson colored light. The light is [if the crimson light is switched on]on[otherwise]off[end if]."
The emerald light is a colored light. It is part of the control panel. The description of the emerald light is "This is an emerald colored light. The light is [if the emerald light is switched on]on[otherwise]off[end if]."
The gray light is a colored light. It is part of the control panel. The description of the gray light is "This is an gray colored light. The light is [if the gray light is switched on]on[otherwise]off[end if]."
The indigo light is a colored light. It is part of the control panel. The description of the indigo light is "This is an indigo colored light. The light is [if the indigo light is switched on]on[otherwise]off[end if]."
The khaki light is a colored light. It is part of the control panel. The description of the khaki light is "This is an khaki colored light. The light is [if the khaki light is switched on]on[otherwise]off[end if]."

instead of switching on a colored light, say "You can[']t do that!"

instead of switching off a colored light, say "you can[']t do that!"

[buttons]
A colored button is a kind of device. A colored button is fixed in place. A colored button is usually switched off.
The aqua button is a colored button. It is part of the control panel. The description of the aqua button is "This is an aqua colored button."
The crimson button is a colored button. It is part of the control panel. The description of the crimson button is "This is a crimson colored button."
The emerald button is a colored button. It is part of the control panel. The description of the emerald button is "This is an emerald colored button."
The gray button is a colored button. It is part of the control panel. The description of the gray button is "This is a gray colored button."
The indigo button is a colored button. It is part of the control panel. The description of the indigo button is "This is an indigo colored button."
The khaki button is a colored button. It is part of the control panel. The description of the khaki button is "This is a khaki colored button."

every turn:
	if the player is in the holding room, say "This can never happen!"

[pushing the indigo button is the winning move]
Instead of switching on or pushing the indigo button: 
	if the switch count is 6 and the dial count is 6 and the indigo button is switched off
		begin;
			say "The monitor flickers for a second and the scene it[']s displaying changes.";
			say "The monitor now shows a tableau of a guillotine. It has stopped rising and falling over the ride exit. The ride is safe again!";
			say "The indigo indicator is now on.";
			display the figure of ControlPanelGuillotine;
			now all colored buttons are switched off;
			now all colored lights are switched off;
			now the indigo button is switched on;
			now the indigo light is switched on;
			play the sound of Strongman Bell;
			increase score by 5;
			end the story finally saying "You have won!";
		else;
			say "The monitor turns off and the screen goes black.";
			say "The indigo indicator is now off.";
			now all colored lights are switched off;
			now all the colored buttons are switched off;
		end if.
		
Instead of switching on or pushing the aqua button: 
	if the switch count is 6 and the dial count is 6 and the aqua button is switched off
		begin;
			say "The monitor flickers for a second and the scene it[']s displaying changes.";
			say "The monitor now shows a tableau of poor unfortunate townsfolk locked in stocks.";
			say "The aqua indicator is now on.";
			now all colored buttons are switched off;
			now all colored lights are switched off;
			now the aqua button is switched on;
			now the aqua light is switched on;
		else;
			say "The monitor turns off and the screen goes black.";
			say "The aqua indicator is now off.";
			now all colored lights are switched off;
			now all the colored buttons are switched off;
		end if.
		
Instead of switching on or pushing the crimson button: 
	if the switch count is 6 and the dial count is 6 and the crimson button is switched off
		begin;
			say "The monitor flickers for a second and the scene it[']s displaying changes.";
			say "The monitor now shows a scene of someone waiting to be hanged.";
			say "The crimson indicator is now on.";
			now all colored buttons are switched off;
			now all colored lights are switched off;
			now the crimson button is switched on;
			now the crimson light is switched on;
		else;
			say "The monitor turns off and the screen goes black.";
			say "The crimson indicator is now off.";
			now all colored lights are switched off;
			now all the colored buttons are switched off;
		end if.
		
Instead of switching on or pushing the emerald button: 
	if the switch count is 6 and the dial count is 6 and the emerald button is switched off
		begin;
			say "The monitor flickers for a second and the scene it[']s displaying changes.";
			say "The monitor now displays a scene of witches being burned at the stake.";
			say "The emerald indicator is now on.";
			now all colored buttons are switched off;
			now all colored lights are switched off;
			now the emerald button is switched on;
			now the emerald light is switched on;
		else;
			say "The monitor turns off and the screen goes black.";
			say "The emerald indicator is now off.";
			now all colored lights are switched off;
			now all the colored buttons are switched off;
		end if;
		
Instead of switching on or pushing the gray button: 
	if the switch count is 6 and the dial count is 6 and the gray button is switched off
		begin;
			say "The monitor flickers for a second and the scene it[']s displaying changes.";
			say "The monitor now shows the implements of torture in the dungeon.";
			say "The gray indicator is now on.";
			now all colored buttons are switched off;
			now all colored lights are switched off;
			now the gray button is switched on;
			now the gray light is switched on;
		else;
			say "The monitor turns off and the screen goes black.";
			say "The gray indicator is now off.";
			now all colored lights are switched off;
			now all the colored buttons are switched off;
		end if;

Instead of Switching on or pushing the khaki button: 
	if the switch count is 6 and the dial count is 6 and the khaki button is switched off
		begin;
			say "The monitor flickers for a second and the scene it[']s displaying changes.";
			say "The monitor shows a the gift shop located at the Hell Ride exit.";
			say "The khaki indicator is now on.";
			now all colored buttons are switched off;
			now all colored lights are switched off;
			now the khaki button is switched on;
			now the khaki light is switched on;
		else;
			say "The monitor turns off and the screen goes black.";
			say "The khaki indicator is now off.";
			now all colored lights are switched off;
			now all the colored buttons are switched off;
		end if.

The monitor is part of the control panel. The monitor is fixed in place. Understand "screen" as monitor.
instead of examining the monitor:
	if the aqua button is switched on, say "The monitor now shows a tableau of poor unfortunate townsfolk locked in stocks.";
	if the crimson button is switched on, say "The monitor now shows a scene of someone waiting to be hanged.";
	if the emerald button is switched on, say "The monitor now displays a scene of witches being burned at the stake.";
	if the gray button is switched on, say "The monitor now shows the implements of torture in the dungeon.";
	if the indigo button is switched on, say "The monitor now shows a tableau of a guillotine rising and falling over the ride exit.";
	if the khaki button is switched on, say "The monitor shows a the gift shop located at the Hell Ride exit.".

[dials]
A colored dial is a kind of a device. A colored dial is fixed in place. A colored dial has a number called a dial setting. A dial setting is usually 0.

The aqua dial is a colored dial. It is part of the control panel. The description of the aqua dial is "This is an aqua dial. It is currently set to [dial setting]".
The crimson dial is a colored dial. It is part of the control panel. The description of the crimson dial is "This is a crimson dial. It is currently set to [dial setting]".
The emerald dial is a colored dial. It is part of the control panel. The description of the emerald dial is "This is an emerald dial. It is currently set to [dial setting]".
The gray dial is a colored dial. It is part of the control panel. The description of the gray dial is "This is a gray dial. It is currently set to [dial setting]".
The indigo dial is a colored dial. It is part of the control panel. The description of the indigo dial is "This is an indigo dial. It is currently set to [dial setting]".
The khaki dial is a colored dial. It is part of the control panel. The description of the khaki dial is "This is a khaki dial. It is currently set to [dial setting]".

Spinning it to is an action applying to one thing and one number. Check spinning it to: if the noun is not a colored dial, say "[The noun] does not spin." instead. Report spinning it to: 
	if the number understood is less than 0 or the number understood is greater than 11:
		say "The dial can only be set from 0 to 11.";
		stop the action;
	otherwise:
		say "The dial is now set to [the number understood].";
		now the noun is switched on;
		now the dial setting of the noun is the number understood;

Understand "spin [something] to [a number]" as spinning it to. Understand "turn [something] to [a number]" as spinning it to. Understand "set [something] to [a number]" as spinning it to.
	
The dial count is a number that varies. The dial count is 0.
To count the dials:
	now the dial count is 0;
	if dial setting of the aqua dial is 1, increment the dial count;
	if dial setting of the crimson dial is 3, increment the dial count;
	if dial setting of the emerald dial is 5, increment the dial count;
	if dial setting of the gray dial is 7, increment the dial count;
	if dial setting of the indigo dial is 9, increment the dial count;
	if dial setting of the khaki dial is 11, increment the dial count.
					
Section 3 - Holding Room

The Holding room is a room. "I am a room just to have a place to reference."

Part 3 - Regions

The Midway is a region. Parking Lot, Kiosk, Concession Stand, High Striker, Show Facade, Show Tent, and Head of the Line are in the Midway. The sky is in the Midway.

HellRide is a region. Ride Entrance, Stocks Room, Gallows Room, Stake Room, Dungeon, Guillotine Room, Ride Exit is in HellRide.

Backstage is a region. Passage, Maintenance Office, Crawl Space, Mechanical Room North, Mechanical Room South, Generator Room, Electrical Room, Electrical Closet One, Electrical Closet Three, Electrical Closet Five, Electrical Closet Seven, Electrical Closet Nine, Electrical Closet Eleven, Storage Room are in Backstage.

Second Floor is a region. Dark Hallway, Control Room, and Holding Room are in the Second Floor.

