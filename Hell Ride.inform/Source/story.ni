Part 1 - World Model

Chapter 1 - Inform Settings, Biblio Card, and Extensions

Use maximum things understood at once of at least 200.
Use dynamic memory allocation of at least 65536.
Use maximum text length of at least 4096.
Use DICT_WORD_SIZE of 15.

The story title is "Hell Ride".
The story author is "No Shoes".
The story headline is "The ride of a lifetime...".
The story genre is "Horror".
The release number is 106.
The story description is "You've decided to stay and enjoy the carnival anyway."
The story creation year is 2024.

[Release along with cover art, a website, an introductory booklet, the "Quixe" interpreter, the source text, and library card].
Release along with cover art, a website, an introductory booklet, the "Quixe" interpreter.

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
	say "You[']ll have to pay for that."

Before buying something for sale when the money is not in the wallet:
	say "You[']re broke." instead.

Before buying something for sale when the money is free:
	say "You[']re broke." instead.

Before buying something for sale when the price of the money is less than the price of the noun:
	say "You don[']t have enough money to cover the price of [the noun]." instead.

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
	if the noun is not a fluid container, say "You can[']t pour [the noun]." instead;
	if the second noun is not a fluid container, say "You can[']t pour liquids into [the second noun]." instead;
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
	if the second noun is not fixed in place, say "[The second noun] wouldn[']t be a very effective place of concealment." instead.

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

Test grues with "s / buy hell ride ticket / s / give hell ride ticket to ride attendant / s / e / s / s"

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

The description of the sky is "[if the location is outdoors]It[']s a beautiful evening. Not a cloud in the sky. The moon is out and there are so many stars to see. A shooting star streaks across the sky.[otherwise]You[']re indoors. You can[']t see the sky here."

The ground is a backdrop. The ground is everywhere. Understand "floor" as the ground.

[new things specific to the game]
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
	
Chapter 3- The Player, Global Code

The description of the player is "You are despondent given that you and your date just had a huge fight and they stormed off. Maybe visiting the attractions at the carnival will make you feel better." 

Instead of examining the player:
	say "Oh, stop fussing. You look fine."

The keys underlie the car seat. Understand "car key" and "car keys" and "key" as the keys. The description of the keys is "These are your car keys. It[']s a wonder you could find them, your house is such a mess."
	
The coupon is in the wallet. The description of the coupon is "You found this in a stack of coupons on the counter of the gas station."

every turn when examining the coupon, display Figure of Coupon.

After reading a command:
	if the player's command includes "please":
		say "Please do not say please.";
		reject the player's command.
		
[fix up the map]
Index map with title set to "The Carnival".
Index map with Electrical Closet Eleven mapped northwest of Electrical Room.
Index map with Electrical Closet Seven mapped southwest of Electrical Room.
Index map with Guillotine Room mapped west of Generator Room.
Index map with room-size set to 52
	and room-size of the Electrical Room set to 74.

[toad away]
every turn:
	if turn count is 100:
		say "Over the loud speaker, an announcment blares: Attention please. There is a vehicle being towed from the parking lot for parking illegally. The license plate of the car is '862901'.[run paragraph on]";
		if the parking stub is on the dashboard:
			say " You breathe a sigh of relief as you realize that[']s not your plate. I guess it[']s a good thing you remembered to place the parking stub on the dashboard.";
		if the parking stub is not on the dashboard:
			say " Your heart sinks as you realize that is your plate. You race to the parking lot in time to see the tow truck pull away with your car in tow";
			end the story finally saying "You start the long walk home."

[Description of Hell Ride]			
When play begins:
	 choose row 1 in Table of Basic Help Options;
	 now description entry is "Hell Ride - A Ride to remember...

In the early 1980[']s, I had an Apple II Plus computer with 64K of RAM, dual 5.25[quotation mark]
floppy disks, and a color monitor as big as a television. And the very first game I ever 
bought was Infocom[']s Zork I: The Great Underground Empire. This was cool. It was all 
text-based. The game described your surroundings and you interacted with commands that 
say what you wanted to do. This 'Interactive Fiction' really evoked in a game what I 
appreciated most about reading: rich descriptions, colorful characters, and the like. 
After Zork I, there was Zork II and III. Enchanter, Moonmist, Suspect, and so many 
more. I played them all with my best friend Andy.

Andy and I were software developers at the time and we thought, 'We can do this!' So 
we set out to do this. We developed a game engine with a natural language parser. And
it was pretty good. We could support most of the kinds of things they did, certainly
less graceful but pretty good. In fact, our parser was better than theirs in a case
where the sentence was ambiguous. e.g. 'Walk into the room with the lamp.' Is the
player carrying the lamp? Or is the lamp in the room? 

For fun, we reverse engineered parts of Infocom[']s game format. We found the dictionary,
certain text tokens used for text substitution, the game text. We also discovered the
first example of compression I had ever seen and it just about made my head explode.
They stored all ASCII characters in five bits! Pow! Mind blown. I had never considered
anything like that. Just another hook.

We developed two prototypes: Diner and Hell Ride. Diner was about bank robbers coming 
into the diner where you are a short order cook and you have to save the day. Hell Ride
was pretty close to what you find here. I decided to implement it using modern tools.
It[']s pretty good.

I hope you enjoy it.

d."

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

Figure of Coupon is the file "Coupon.png".

Figure of MaintenanceOffice is the file "MaintenanceOffice.png".

Sound of Strongman Bell is the file "StrongmanBell.ogg".

Chapter 5 - Testing For Empty Descriptions - Not for release

[When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."]
			
When play begins:
	seed the random-number generator with 1234.
	
The price of the money is $20.00. 
			
Chapter 6 - Randomized Rooms, etc - For Release Only

When play begins:
	seed the random-number generator with 0.

Instead of going from the Electrical Room:
	move the player to a random adjacent room.
	
The price of the money is $10.00. 
	
Part 2 - The Game

Chapter 1 - The Midway

Section 1 - Parking Lot

Test Life with "brief / Test Parking / Test Egypt / Test Concession / Test Striker / Test Misc / Test Backstage".

Test Death with "brief / Test Parking / Test Egypt / Test Concession / Test Striker / Test Misc / Test Ride".

Test parking with "brief / get blueberries / give coupon to attendant / buy ticket / get in car / l under seat / open glove box / get gloves / wear gloves / put stub on the dashboard / l at the dashboard / s / exit".

Test ToadAway with "brief / test parking / get parking stub / test striker / test b1 / test b2 / ne / open panel / put aqua in socket / push switch / sw / e / open panel / put crimson in socket / push switch / w / se / open panel / put emerald in socket / push switch / nw / sw"

When play begins:
	display the figure of Hell Ride;
	say "The carnival is in town and you and your sweetie had a date to visit it. After dinner and just as you arrive at the carnival, you and your date have a terrible fight. They storm off leaving you alone at the carnival. You decide to stay at the carnival anyway."

The Parking Lot is a room. The parking lot is north of the Kiosk. The parking lot is outdoors. "The carnival parking lot stretches across an open field, its gravel crunching under arriving cars. Temporary floodlights and the carnival'[s] colorful glow light the area, while distant laughter, music, and the hum of rides fill the air.

Cars park haphazardly, guided by makeshift signs and fluttering flags. Families unload strollers and blankets, their chatter mixing with the carnival sounds. Others linger in vehicles, preparing for the chilly evening.

Shadows from nearby trees create dark pockets pierced by the occasional flashlight. Near the entrance, an attendant collects fees at a weathered booth, coins jingling in the cash box.

Puddles from recent rain shimmer with reflected lights, while patches of mud cling to unwary shoes. At the far end, RVs and trailers sit quietly, their occupants watching the Ferris wheel spin lazily against the sky.

Alive with anticipation, the parking lot marks the transition from the ordinary to the magic of the carnival.

The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush.[otherwise]The bush has been picked clean.[end if][if the dime is in the Parking Lot] You see something shiny on the ground.[end if]"

The Parking Attendant is a man in the the parking lot. Understand "attendent" as attendant. The parking attendant carries the parking ticket and the parking stub. The price of the parking ticket is $5.00. The description of Parking Attendant is "This is a bored teenager just trying to earn enough money to take his sweetie to the movies next week.[if the parking attendant carries the parking ticket] He has a parking ticket. The price of a parking ticket is [the price of the parking ticket].[end if]". 

The beater car is an enterable open container in the parking lot. The beater car is fixed in place. Understand "vehicle" as the beater car. The description of the beater car is "This is your car. It[']s seen better days. You can see the seat, the dashboard, and the glove box."

The car seat is a part of the car. The car seat is a supporter. It is fixed in place. The description of the seat is "A faux leather seat that looked great when it was new."

The dashboard is a part of the car. The dashboard is a supporter. The description of the dashboard is "It looks like you could set something there."

The glove box is part of the car. The glove box is a locked openable container. The keys unlocks it. Understand "glove compartment" and "compartment" as the glove box. The gloves are inside the glove box. The gloves are wearable. The description of the gloves is "A nice set of sheepskin gloves. They[']re very warm."

The blueberry bush is here. the blueberry bush is scenery. the blueberry bush is a container. the blueberry bush is not portable. the blueberry bush contains blueberries. Understand "berries" as blueberries. The blueberries are edible.The description of the blueberries is "The blueberries are ripe and juicy.".

The dime underlies the car seat. Understand "shiny" as dime. The description of the dime is "It[']s a dime. Ten cents. One tenth of a dollar. And very shiny"

Instead of looking under a thing which is underlaid by the dime:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5;

After taking blueberries:
	play the sound of Strongman Bell;
	increase score by 5;
	say "Good Job!".
	
instead of giving the coupon to the parking attendant:
	if the parking attendant carries the parking ticket:
		now the price of the parking ticket is $3.00;
		now the parking attendant carries the coupon;	
		say "Given. The price of a parking ticket is now [the price of the parking ticket].";
	otherwise if the player carries the parking ticket:
		say "Given. But you already bought a parking ticket.";
		now the parking attendant carries the coupon;
	otherwise:
		say "Danger Will Robinson, this is a bug!"
		
before buying the parking ticket:
	say "The attendant says, 'Don[']t forget to leave the parking stub on your dashboard'.";
	now the player carries the parking ticket;
	now the player carries the parking stub;
	continue the action.
	
instead of going south when the location is the parking lot and the player does not carry the parking ticket, say "You have to pay to park." instead.

instead of going south when the location is the parking lot and the player is in the beater car, say "You have to exit your car first." instead.

Section 2 - Kiosk

After going south from the parking lot when the Kiosk is unvisited and the player carries the parking ticket:
	display Figure of TicketBooth;
	say "[the description of the kiosk]"..
	
Before looking when the location is the Kiosk:
	display Figure of TicketBooth.

The kiosk is a room. The kiosk is north of Head of the Line. The kiosk is east of the Show Facade. The kiosk is outdoors. The kiosk is west of High Striker. The kiosk is northeast of the Concession Stand. The kiosk is south of the Parking Lot. "The ticket kiosk stands at the carnival entrance, a compact booth painted in bright red and yellow stripes with bold letters above the window reading 'Tickets Here!' Twinkling lights outline its edges, blinking rhythmically to draw attention.

A single window serves visitors, where a smiling attendant dispenses colorful tickets from neatly arranged rolls. Beside the tickets, a cash drawer jingles as change is counted, and a digital payment system glows faintly for modern convenience.

Next to the kiosk, a vibrant signboard lists ticket prices with playful illustrations of rides and treats. Pennant flags flutter from the kiosk’s roof, adding to the festive atmosphere, while the smell of popcorn and fried dough wafts from nearby stalls.

The worn ground around the kiosk shows the passage of eager carnival-goers. Families, couples, and friends form a buzzing line, their excitement building as they approach this first step into the magic of the carnival.

The midway continues east and west from here. There is a concession stand to the south west. There is a cashier here. [if cashier has the hell ride ticket]The Cashier has a Hell Ride ticket. The price of a ticket is [the price of the hell ride ticket].[end if]"

The Hell Ride ticket is a thing. The price of the Hell Ride ticket is $3.00. The description of the Hell Ride ticket is "This Hell Ride ticket will 'Admit One' to the Hell Ride.[line break]It[']s a real 'E' ticket, baby!"

The Cashier is a man in the kiosk. The cashier carries the Hell Ride ticket. The description of cashier is "This is a bored teenager hired to sell ride tickets all week at this carnival. He[']s thinking about having a brewski with his bros after work.". 

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

The Concession Stand is a room. The concession stand is outdoors. "The concession stand, perched along the midway, is a colorful and bustling hub. Painted in bright reds, blues, and yellows, it features bold lettering announcing treats like 'SODA! POPCORN! CANDY APPLES!' Strings of twinkling lights frame the stand, making it a glowing beacon amid the carnival excitement.

Behind the counter, a popcorn machine churns out golden kernels, filling the air with a buttery aroma. Candy apples gleam under the lights, and cotton candy machines spin fluffy clouds of pink and blue. Warm pretzels sit under a heat lamp, their buttery, salted scent mingling with the sugary treats. A cooler holds sodas, their colorful labels visible through the frosted glass.

The counter is lively with stacks of paper bags, napkins, and cups of cheese and sugar sprinkles. A handwritten chalkboard menu lists prices in playful lettering. Workers in colorful aprons quickly hand out snacks, their movements efficient amid the cheerful chaos.

In front of the stand, kids tug at their parents, teens share pretzels, and the crowd buzzes with energy. More than just a snack stop, the stand is a sensory delight, adding flavor and charm to the carnival experience.

There is a menu to the right of the window. You can see the treats inside the stand."

treats is here. Treats is scenery. Understand "treat" as treats. The description of treats is "There are a variety of things to eat here."

a menu is here.  Menu is fixed in place. The description of the menu is 
"[line break]$2.00 Cola
[line break]$2.50 Popcorn
[line break]$1.50 Candy Apple
[line break]$1.50 Cotton Candy
[line break]$1.50 Soft Pretzel"

a can is here. The price of can is $2.00. The description of the can is "The soda is ice cold."

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

The Strongman Attendant is here. Understand "attendent" as attendant. The description of the Strongman Attendant is "An Attendant is standing here [if strongman attendant is carrying the mallet]holding a mallet[end if]." 

The Strongman Attendant carries the teddy bear, a Swiss army knife, and a poster of Taylor Swift, the magenta fuse, and the mallet. 

The description of the teddy bear is "This is a teddy bear like you had when you were a kid. Right down to the red bow around its neck." 

The Swiss Army knife is an open container. The screwdriver, awl, fingernail clippers, can opener, and corkscrew are in the Swiss Army knife. The description of the Swiss army knife is "This is the standard issue Swiss Army knife with a screwdriver, an awl, a pair fingernail clippers, a can opener, and a corkscrew." 

instead of taking when the noun is in the swiss army knife, say "That[']s part of the Swiss Army knife. You can[']t take that!" instead.
	
The description of the poster of Taylor Swift is "This is a poster of America[']s sweetheart, Taylor Swift."

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
	
After hitting the lever when second noun is the mallet 4 times :
	play the sound of Strongman Bell;
	say "You swing the mallet one more time. The bell rings as the striker reaches the top of the pole. The attendant says, 'You[']re a Muscle Man. Here[']s a prize for you.'";
	say "Which prize would you like? 1) a teddy bear, 2) a Swiss Army knife, 3) a poster of Taylor Swift, or 4) a magenta fuse?".
	
after Reading a command :
	if the player's command matches "1" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		play the sound of Strongman Bell;
		increase score by 5;
		say "You are now holding a cute little teddy bear.";
		now the player carries the teddy bear;
		reject the player's command;
	if the player's command matches "2" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		say "You are now holding a Swiss Army knife.";
		play the sound of Strongman Bell;
		increase score by 5;
		now the player carries the Swiss army knife;
		reject the player's command;
	if the player's command matches "3" and the location is the high striker and the player is not carrying the teddy bear and the player is not carrying the swiss army knife and the player is not carrying the poster of taylor swift and the player is not carrying the magenta fuse:
		say "You are now holding a poster of Taylor Swift.";
		play the sound of Strongman Bell;
		increase score by 5;
		now the player carries the poster of taylor swift;
		reject the player's command;
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

Show Facade is a room. Show Facade is east of Show Tent. Show Facade is outdoors. "[if location is unvisited]You head west through the midway, the bright lights of the carnival fading behind you as you approach a wooden booth. A sign above the entrance reads 'Little Egypt Show – A Journey Into the Mysterious and Exotic!' A rotund barker, wearing a fez and a dazzling smile, gestures to a small sign beside him that says 'Dime Admission.'[end if] 

You are standing in front of a dark and mysterious tent filled with illusions and exotic performers. Perhaps there’s a fortune teller inside, offering cryptic clues about your journey or a hidden artifact that can be collected. There is a stage in front of the tent. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show.[if location is unvisited]The barker cries: 

Ladies and gentlemen, boys and girls, gather [']round! [line break]Step right up and witness the spectacle that[’]s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await![end if]"

The Barker is a person in Show Facade. The description of the barker is "Here is a man dressed in black pants, a white shirt,a striped vest, a fez, and a dazzling smile. The barker cries:

Ladies and gentlemen, boys and girls, gather [']round! [line break]Step right up and witness the spectacle that[’]s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await!"

Check going west when the location is the Show Facade and the barker is not carrying the dime:
	say "It[']ll cost you a dime to go that way.";
	stop the action.
	
Check going west when the location is the Show Facade and the barker is carrying the dime:
	Continue the action.

After giving when the noun is dime and the second noun is barker:
	say "You hand over a dime, and the barker nods, waving you through. As you step past the entrance, the air feels thicker, almost humid, and the sounds of the carnival fade away. You’ve entered an entirely different world now—one filled with the scents of incense and exotic spices, and the low, hypnotic music of a faraway land. Before you, a series of dimly lit tents stretch out, their flaps slightly swaying in the breeze. Intrigued, you take your first step into the Little Egypt Show. You can now head west into the show."

Section 6 - Show Tent	

Test Egypt with "brief / get blueberries / s / w / l at barker / give dime to barker / w / z / z / n / z / z / z / e / e / n / i / score".

Before going west when the location is the Show Facade and the Show Tent is unvisited and barker is carrying the dime:
	display Figure of LittleEgyptShow.	
	
Before looking when the location is the the Show Tent:
	display Figure of LittleEgyptShow.		

The Show Tent is a room. The Show Tent is west of Show Facade. "You are inside the Little Egypt Show. The attraction facade is to the east. There folding chairs organized neatly in rows. The show should start soon."

Little Egypt is a woman. Little Egypt is in the Show Tent. Little Egypt is scenery. The description of Little Egypt is "Little Egypt is an exotic looking, beautiful woman who is draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."

The sheer veil is a thing. The description of the Sheer Veil is "This is a sheer gold veil that Little Egypt wore (and removed) during her show. Your head swims as you smell the scent of her perfume on her veil: patchouli."

The Stage is here. The Stage is scenery. The description of the Stage is "The stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'."

The folding chair is a enterable scenery supporter in Show Tent. The description of the Folding Chair is "This is one of many folding chairs in the tent tonight."

LittleEgyptAuto is a scene. 
LittleEgyptAuto begins when the player is in the show tent for 2 turns. 
LittleEgyptAuto ends when the number of filled rows in the Table of LittleEgypt Events is 0.

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
	say "You[']re much too entranced to do anything other than watch the show. You are riveted[if the player is in the folding chair] to your seat[end if]!".

Table of LittleEgypt Events
event
"As you enter the dimly lit tent, you see that the stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'. "
"Little Egypt emerges draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."
"The performance begins with slow, undulating movements, drawing the you into the rhythm of exotic live music played on traditional instruments like the oud, darbuka, or zurna. As the tempo builds, her hips, torso, and hands move in intricate, mesmerizing patterns, demonstrating remarkable control and fluidity. She incorporates dramatic spins, drops, and shimmies, often accentuating the beat of the music with a quick jingle of her coin belt."
"Little Egypt makes eye contact with you and smiles enigmatically. During her performance she balances a sword on her head and accents her dance with finger cymbals."
"The music alternates between hauntingly slow melodies and rapid, energetic drum beats, creating an emotional arc that keeps the you entranced. Little Egypt relies on the music[']s dynamic changes to tell a story with movements reflecting joy, sorrow, seduction, and celebration."
"The performance concludes with a dramatic flourish of a fast-paced shimmy, a bold spin, and Little Egypt dramatically casts off her veils. The dancer takes a bow to enthusiastic applause, leaving you spellbound by the sensual yet artful display."

Section 7 - Head of the Line

Head of the Line is a room. Head of the Line is south of Kiosk. Head of the Line is north of Ride Entrance. The Head of the Line is outdoors. "You are standing in front of a ticket taker with his hand open waiting for your ticket. The entrance to the ride is south of here. The ride attendant tells you that you[']re lucky you showed up when you did because this will be the last trip through Hell Ride. You notice that all the other cars are empty."

The Ride Attendant is a man in Head of the Line. Understand "attendent" as attendant. The description of the Ride Attendant is "This is another bored teenager. His thoughts are entirely focused on a cheeseburger for lunch.";

Check going south when the location is Head of the Line and the Ride Attendant does not have the hell ride ticket:
	say "You[']ll need a ticket to go that way.";
	stop the action.

Chapter 2 - Hell Ride

Section 1 - Ride Entrance

Before going south when the location is the kiosk and the Head of the Line is unvisited:
	display Figure of HellRideEntrance.
	
Before looking when the location is the Head of the Line:
	display Figure of HellRideEntrance.

Test Ride with "brief / get blueberries / s / buy hell ride ticket / s / give hell ride ticket to attendant / s / enter hell ride car / wait / z / z / z / z / z / z / z".

HellRideAuto is a scene. 
HellRideAuto begins when the player is in the hell ride car for 3 turns.
HellRideAuto ends when the number of filled rows in the Table of HellRide Events is 0.

When HellRideAuto begins:
	say "The car moves forward and the safety bar begins to lower."
	
When HellRideAuto ends:
	end the story finally saying "You have died.".
	
Every turn during HellRideAuto:
	repeat through Table of HellRide Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		rule succeeds.
		
Table of HellRide Events
event
"[bold type]Entrance[roman type][line break]The car moves forward, the safety bar locked in place, as the entrance to Hell Ride looms ahead—a grotesque facade of twisted metal and carved wood, illuminated by flickering blood-red lights. The air carries a faint sulfuric tang mingled with the sweet aroma of carnival popcorn.

A towering archway of flames, spikes, and grinning skulls frames the entrance, crowned by flickering letters that read HELL RIDE, pulsing like a heartbeat. Below, crouching demon sculptures extend clawed hands in a sinister invitation. Frayed curtains sway over the entrance, whispering with faint, menacing chuckles as distorted organ music grows louder, punctuated by shrieks and grinding machinery.

A crooked sign warns, One Ticket Admission: Enter If You Dare! Nearby, a carnival barker with a theatrical, raspy voice calls out, 'Step right up! The gates of hell are open—will you brave the darkness?'

Inside, near-total darkness is broken by flashes of sickly green light revealing twisted paths and grotesque shapes. Beyond the threshold lies only uncertainty and terror."
"[bold type]Hallway[roman type][line break]The doors open and your car passes through into the darkness.

Mist fills the area as you move to the next room."
"[bold type]The Stocks[roman type][line break]The public square is a cobblestone expanse bordered by weathered timber-framed buildings. The air carries the mingling scents of chimney smoke, damp earth, and the faint tang of a nearby smithy. At its center, crude wooden stocks stand as a grim focal point, their beams weathered and stained from years of use. Iron clasps lock captives in degrading postures, their tattered clothing offering little protection from the biting wind.

The punished individuals hang their heads in shame, their faces etched with despair. Around them, the crowd revels in cruelty—a wiry man spits insults with gleeful laughter, while a stout woman throws overripe vegetables, each impact sparking jeers. Even children join in, pointing and mocking with mischievous delight.

The square hums with noise: the crowd’s taunts, the crack of objects hitting wood, and the quiet murmurs of the suffering captives. Overhead, a gray sky threatens rain, indifferent to the spectacle below. The jeering mob ignores its ominous weight, too engrossed in their shared cruelty to notice nature’s disapproval.

Mist fills the area as you move to the next room."
"[bold type]The Gallows[roman type][line break]The public square, slick with morning drizzle, lies under a brooding, overcast sky. At its center looms the gallows, a weathered wooden platform with thick ropes swaying ominously. The crowd stands in somber silence, broken by the shuffle of feet or faint murmurs, their eyes fixed on the grim scene.

A hooded executioner, cloaked in black, adjusts the frayed noose with practiced precision, his cold presence exuding purpose. Beside him stands the condemned man, pale and trembling, his bound hands behind him. Beads of sweat mix with rain on his haunted face as his darting eyes search the indifferent crowd. Each shallow breath forms a fleeting cloud in the chilly air—a fragile reminder of his fleeting life.

Vendors hawk bread and cider, while children strain for a better view. An old man clutches a rosary, whispering prayers, as others smirk and place bets. Above, the bell tower tolls, its mournful chime marking the passage of the man’s final moments. A raven perches on the gallows’ beam, its unblinking gaze fixed on the scene below.

As the executioner adjusts the noose around the man’s neck, the crowd falls silent, the air thick with dread. Distant thunder rumbles faintly, as if the heavens themselves await the inevitable.

Mist fills the area as you move to the next room."
"[bold type]The Stake[roman type][line break]The public square is steeped in grim silence, broken only by the crackling of flames. At its center, three wooden stakes rise from a pyre of logs and kindling, darkened by smoke from past executions. Bound to the stakes are three women, their faces reflecting defiance, resignation, and terror.

A crowd encircles the scene, expressions ranging from morbid fascination to righteous fury. Children cling to their mothers, while elders nod solemnly. Some jeer and throw stones; others murmur prayers or avert their gaze.

The executioner, hooded and clad in a leather apron, steps forward with a blazing torch, igniting the pyre in a sudden roar. Flames climb rapidly as thick smoke coils upward. The condemned cry out, their voices mingling with the crackle of fire. The oppressive heat radiates outward, pressing against the silent, uneasy crowd.

Gray clouds loom overhead, nature’s somber backdrop to the grim spectacle. A raven caws from the bell tower as slow church bells toll, each strike punctuating the tragedy. As the pyre burns, some onlookers remain transfixed while others quietly slip away, the square heavy with ash, smoke, and the echoes of the condemned.

Mist fills the area as you move to the next room."
"[bold type]The Dungeon[roman type][line break]The dungeon is a dark, suffocating chamber carved into the earth, its stone walls slick with moisture and grime. The air reeks of sweat, blood, mildew, and burning oil from flickering torches mounted on rusted sconces. Shadows twist on the walls, creating grotesque, unsettling shapes in the dim light.

Chains hang from walls and ceilings, their faint clinking blending with the moans and occasional screams of prisoners. Water drips rhythmically from a cracked ceiling, adding to the chamber’s eerie ambiance.

The room is littered with instruments of torment: a splintered rack, a glowing brazier holding bloodstained tools, and a spiked chair gleaming faintly in the light. Prisoners endure their own horrors—one stretched on the rack, another hanging limply from manacles, and a third gasping weakly in the spiked chair.

The hooded torturer moves with detached precision, their leather apron stained with the evidence of countless victims. They work silently, indifferent to the agony surrounding them.

Above, rats scuttle in the shadows, and the low ceiling presses down like the weight of despair. The sole exit, a riveted iron-bound door, feels more like a barrier to hope than a path to freedom.

This is a realm of suffering and hopelessness, where life and death blur, and torment is the only certainty.

Mist fills the area as you move to the next room."
"[bold type]The Guillotine[roman type][line break]The public square buzzes with tense anticipation, a crowd gathered under gray skies that cast a somber light on the cobblestones. At the center, a stark wooden platform looms, its purpose grim and unavoidable.

A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd’s gaze. Their tattered clothing, once fine, reflects the fall that led them to this moment.

The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event’s gravity. Near the edge of the platform, the town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'

The condemned flinches but remains silent as the executioner—a hooded figure in black—stands ready beside the guillotine, its blade gleaming faintly in the dim light. The murmurs of the crowd fall into silence at the executioner’s signal, leaving only the rustle of wind and the creak of the scaffold.

As the condemned approaches the guillotine, a crow caws sharply from a nearby rooftop, its cry echoing through the square like an omen. The crowd leans forward, breath held, as justice and mortality converge on the scene.

There is just one problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated.

Looks like your goose is cooked. Say 'Goodnight, Gracie! 

You are stupefied as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable."

Instead of doing something other than waiting, looking, listening or examining during HellRideAuto:
	say "You are having such a good time that you don['] want to do anything but wait and enjoy the ride."
	
Ride Entrance is a room. Ride Entrance is south of Head of the Line. "The cars that will take you into the fearsome Hell Ride stop here for you to board.  To the south is the track that will take you into the ride. The safety bar is raised allowing you to enter the car. The darkness looks just a little bit darker."

The Hell Ride car is a vehicle in the Ride Entrance. The description of the Hell Ride car is "A car waits to take you through the horror that is Hell Ride."

Before going south when the player is in the Ride Entrance:
	say "You can't go that way." instead;
	continue the action.

Section 2 - Stocks Room

The Stocks Room is south of the Ride Entrance. "The public square is a cobblestone expanse bordered by weathered timber-framed buildings. The air carries the mingling scents of chimney smoke, damp earth, and the faint tang of a nearby smithy. At its center, crude wooden stocks stand as a grim focal point, their beams weathered and stained from years of use. Iron clasps lock captives in degrading postures, their tattered clothing offering little protection from the biting wind.

The punished individuals hang their heads in shame, their faces etched with despair. Around them, the crowd revels in cruelty—a wiry man spits insults with gleeful laughter, while a stout woman throws overripe vegetables, each impact sparking jeers. Even children join in, pointing and mocking with mischievous delight.

The square hums with noise: the crowd’s taunts, the crack of objects hitting wood, and the quiet murmurs of the suffering captives. Overhead, a gray sky threatens rain, indifferent to the spectacle below. The jeering mob ignores its ominous weight, too engrossed in their shared cruelty to notice nature’s disapproval." 

The wooden stocks are here. The wooden stocks are a supporter. The wooden stocks are fixed in place. The description of the wooden stocks is "At the square[']s center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures." 

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

The Gallows Room is south of the Stocks Room.  "The public square, slick with morning drizzle, lies under a brooding, overcast sky. At its center looms the gallows, a weathered wooden platform with thick ropes swaying ominously. The crowd stands in somber silence, broken by the shuffle of feet or faint murmurs, their eyes fixed on the grim scene.

A hooded executioner, cloaked in black, adjusts the frayed noose with practiced precision, his cold presence exuding purpose. Beside him stands the condemned man, pale and trembling, his bound hands behind him. Beads of sweat mix with rain on his haunted face as his darting eyes search the indifferent crowd. Each shallow breath forms a fleeting cloud in the chilly air—a fragile reminder of his fleeting life.

Vendors hawk bread and cider, while children strain for a better view. An old man clutches a rosary, whispering prayers, as others smirk and place bets. Above, the bell tower tolls, its mournful chime marking the passage of the man’s final moments. A raven perches on the gallows’ beam, its unblinking gaze fixed on the scene below.

As the executioner adjusts the noose around the man’s neck, the crowd falls silent, the air thick with dread. Distant thunder rumbles faintly, as if the heavens themselves await the inevitable."

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

The Stake Room is south of the Gallows Room. "The public square is steeped in grim silence, broken only by the crackling of flames. At its center, three wooden stakes rise from a pyre of logs and kindling, darkened by smoke from past executions. Bound to the stakes are three women, their faces reflecting defiance, resignation, and terror.

A crowd encircles the scene, expressions ranging from morbid fascination to righteous fury. Children cling to their mothers, while elders nod solemnly. Some jeer and throw stones; others murmur prayers or avert their gaze.

The executioner, hooded and clad in a leather apron, steps forward with a blazing torch, igniting the pyre in a sudden roar. Flames climb rapidly as thick smoke coils upward. The condemned cry out, their voices mingling with the crackle of fire. The oppressive heat radiates outward, pressing against the silent, uneasy crowd.

Gray clouds loom overhead, nature’s somber backdrop to the grim spectacle. A raven caws from the bell tower as slow church bells toll, each strike punctuating the tragedy. As the pyre burns, some onlookers remain transfixed while others quietly slip away, the square heavy with ash, smoke, and the echoes of the condemned."

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

The Dungeon is south of the Stake Room. "The dungeon is a dark, suffocating chamber carved into the earth, its stone walls slick with moisture and grime. The air reeks of sweat, blood, mildew, and burning oil from flickering torches mounted on rusted sconces. Shadows twist on the walls, creating grotesque, unsettling shapes in the dim light.

Chains hang from walls and ceilings, their faint clinking blending with the moans and occasional screams of prisoners. Water drips rhythmically from a cracked ceiling, adding to the chamber’s eerie ambiance.

The room is littered with instruments of torment: a splintered rack, a glowing brazier holding bloodstained tools, and a spiked chair gleaming faintly in the light. Prisoners endure their own horrors—one stretched on the rack, another hanging limply from manacles, and a third gasping weakly in the spiked chair.

The hooded torturer moves with detached precision, their leather apron stained with the evidence of countless victims. They work silently, indifferent to the agony surrounding them.

Above, rats scuttle in the shadows, and the low ceiling presses down like the weight of despair. The sole exit, a riveted iron-bound door, feels more like a barrier to hope than a path to freedom.

This is a realm of suffering and hopelessness, where life and death blur, and torment is the only certainty."

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

The Guillotine Room is south of the Dungeon. "The public square buzzes with tense anticipation, a crowd gathered under gray skies that cast a somber light on the cobblestones. At the center, a stark wooden platform looms, its purpose grim and unavoidable.

A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd’s gaze. Their tattered clothing, once fine, reflects the fall that led them to this moment.

The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event’s gravity. Near the edge of the platform, the town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'

The condemned flinches but remains silent as the executioner—a hooded figure in black—stands ready beside the guillotine, its blade gleaming faintly in the dim light. The murmurs of the crowd fall into silence at the executioner’s signal, leaving only the rustle of wind and the creak of the scaffold.

As the condemned approaches the guillotine, a crow caws sharply from a nearby rooftop, its cry echoing through the square like an omen. The crowd leans forward, breath held, as justice and mortality converge on the scene.

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

The Ride Exit is south of the Guillotine Room. "The exit of Hell Ride is designed to leave riders with lingering unease. Emerging from a dark corridor with peeling black and red-streaked walls, flickering lights cast erratic shadows on the uneven floor. The air is cool and damp, carrying a faint metallic tang, while faint whispers and distant screams echo softly in the background.

Riders step into a small courtyard enclosed by jagged, rusted fencing draped with cobwebs and plastic bones. Overhead, a weathered sign reads, 'You[’]ve Survived… For Now.' Nearby, carnival workers in tattered costumes watch silently, occasionally muttering cryptic remarks like, 'Not everyone makes it out.'

A merchandise stand glows red, selling items like Hell Ride Survivor shirts and devil horns. Beyond the fencing, the cheerful carnival lights and sounds feel jarring, contrasting sharply with the ride’s oppressive atmosphere.

The exit ensures Hell Ride isn’t just an experience—it lingers, blurring the line between thrill and fear."

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
Test b1 with "brief / s / buy hell ride ticket / s / give hell ride ticket to attendant / s / e / l at piles / get flashlight / turn it on / s / turn on radio / l at desk / open drawer / get all from the drawer / s / s / open toolbox / get all from toolbox / s / s / s / ne / get silver key / l at panel / open panel / l at socket / sw / n / n / n / n / n"

[get the fuses]
Test b2 with "w / l under stocks / e / s / w / l under platform / e / s / w / l in pyre / get fuse from pyre / e / s / w / l under seat / e / s / w / l under platform / e / s / s / w / l in stand / get khaki fuse from merchandise stand / e / n"

[fill the sockets]
Test b3 with "ne / open panel / put aqua in socket  / push switch / sw / e / open panel / put crimson in socket / push switch / w / se / open panel / put emerald in socket / push switch / nw / sw / open panel / put gray in socket / push switch / ne / w / open panel / put indigo in socket / push switch / e / nw / l at panel / unlock panel with knife / l at panel / open  panel / l at panel / l at switch. / l at indicator / l at socket / put khaki in socket / push switch / l at socket / se"

[turn the dials]
test b4 with "n / n / n / n / n / climb ladder / w / l at control panel / turn aqua dial to 1 / turn crimson dial to three / turn emerald dial to 5 / turn gray dial to seven / turn indigo dial to 9 / turn khaki dial to eleven / push aqua button / l at panel / push crimson button / l at panel  / push emerald button / l at panel / push gray button / l at panel / push khaki button"

Test Backstage with "test b1 / test b2 / test b3 / test b4"

Dark Passage is a room. Dark Passage is east of the Ride Entrance. The dark passage is scored. "This room is backstage at the Hell Ride attraction. The room is littered with bags of trash, piles of junk, and dust bunnies so large they should be paying rent. West is back the way you came from. There an exit to the south."

The dust bunnies are scenery. The dust bunnies are here. Understand "bunnies" as dust bunnies.

The bags of trash are scenery. The bags of trash are here. Understand "bags" and "trash" as bags of trash.

instead of looking under when the noun is the pile of junk:
	try examining the junk instead. 

The pile of junk is a scenery container. The pile of junk is in the dark passage. The pile of junk contains the flashlight. Understand "piles" and "junk" as pile of junk. 

after examining when the noun is pile of junk:
	say "You find a flashlight here.".
	
after taking the flashlight for the first time:
	say "Taken.";
	play the sound of Strongman Bell;
	increase score by 5.

Section 2 - Maintenance Office

After going south from the dark passage when the Maintenance Office is unvisited:
	display Figure of MaintenanceOffice;
	say "[the description of the Maintenance Office]".
	
Before looking when the location is the Maintenance Office:
	display Figure of MaintenanceOffice.

The Maintenance Office is a dark room. The maintenance office is south of the dark passage. "The maintenance office, hidden behind the carnival’s bright facade, is a dim and cluttered space reeking of grease, sweat, and faint traces of popcorn from the midway. The air hangs heavy with oil and stirred-up dust.

The walls are lined with shelves holding tools and parts in disarray—rusty wrenches, screws, and mismatched containers with faded labels. Paint cans and grease jars clutter the workbenches, many left half-open. In the center, a battered desk is strewn with wires, gears, and springs, a bent piece of metal held in a vise. Overhead, a single flickering fluorescent light struggles to illuminate the room.

In one corner, a disassembled ride mechanism lies exposed, chains and pulleys dangling from hooks above, faintly clinking with the vibrations of the rides. A grease-stained manual and a half-drained mug of coffee sit abandoned on a nearby stool.

The walls display faded safety posters, a corkboard with maintenance schedules and notes, and a worn photo of the carnival in its prime. A clock ticks faintly, its hands out of sync with reality. The floor, gritty with dust and scattered nails, adds to the room’s chaotic charm.

Despite the mess, the room buzzes with purpose—a hidden hub where the carnival’s magic is sustained through sweat, ingenuity, and the hum of machinery." 

The desk is in the maintenance office. The desk is a supporter. The desk is fixed in place. A drawer is part of the desk. The drawer is a closed openable container. The drawer is scenery. The description of the desk is "It[']s a desk. There are coffee stains and cigarette burns from years of abuse. The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

Nearness relates a room (called A) to a room (called B) when the number of moves from B to A is less than 2. The verb to be near means the nearness relation.

The radio is a device on the desk. The radio is switched off and fixed in place. "[if switched on]The radio burbles on[otherwise]The radio is off[end if]." 

Every turn when the radio is switched on and location is the maintenance office:
	say "[one of]The radio plays 'Stairway to Heaven' by Led Zeppelin.[or]The DJ just cued up Pink Floyd[']s 'Comfortably Numb'.[or]Pharell[']s 'Happy' is playing now.[or]'Folsom Prison Blues' by Johnny Cash is on the air.[or]'Peace Train' by Cat Stevens can be heard playing on the radio.[cycling]"
	
Rule for showing action of the radio:
	if the radio is switched on, say "Through the static, you pick up hear bits of the latest Taylor Swift song.";
	otherwise say "The radio is silent. You[']re saving the batteries."

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

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "The north mechanical room is compact and specialized, housing auxiliary systems that keep the ride running smoothly. A subdued hum of capacitors and relays fills the space, its quiet rhythm broken only by the occasional hiss of hydraulic fluid.

Electrical panels line the walls, labeled for functions like 'Lighting Controls,' 'Brake Systems,' and 'Emergency Shutdown.' Smaller cables and conduits snake along the walls, linking these systems to the main hub. In one corner, a hydraulic pump and reservoir manage lifting arms and rotating platforms, their gauges flickering as they work. Nearby, a dented but functional generator stands ready for power failures.

A small workbench against the eastern wall is cluttered with tools and coiled wires, while shelves above hold neatly labeled spare parts—fuses, cables, and hydraulic tubing. A faded ride diagram pinned nearby is marked with red annotations from past repairs.

Dimly lit by a single hanging bulb, the room feels cooler and slightly damp, the metallic tang of machinery mixing with a hint of mildew. Though quieter and less prominent than the south room, this space plays a vital role in supporting the ride’s operation and ensuring its emergency systems are always prepared." 

The toolbox is a closed openable container in the Mechanical Room North. The toolbox contains a monkey wrench, a channel locks, pliers, and a hammer.

The emerald door is west of the Mechanical Room North and east of the Stake Room. The Emerald Door is a closed locked door. The description of the Emerald door is "It[']s an emerald colored door with the word 'Stake' written on it." The silver key unlocks it.

Section 5 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "The south mechanical room is the operational core of the carnival ride, a bustling, noisy space dominated by a massive motor. Its steady hum drives the thick belts, pulleys, and gears that work in perfect unison to power the ride.

Heavy-duty electrical panels line the walls, adorned with warning labels like 'High Voltage' and blinking indicator lights in green and red. Overhead, labeled conduits and wires snake across the ceiling, connecting systems with meticulous precision.

A cluttered workbench holds tools and spare parts—wrenches, bolts, and lubricants—alongside open maintenance logs marked with greasy fingerprints. The air is thick with the smell of oil, metal, and a faint trace of ozone from the electrics.

A cooling fan spins in the corner, barely cutting through the room’s warmth. The hum of machinery is occasionally punctuated by clinking chains and the sharp hiss of hydraulic fluid. The floor, a mix of metal grates and worn concrete, reflects years of use and maintenance.

Bright fluorescent lights in wire cages illuminate the space, highlighting the intricate systems at work. The south mechanical room is the ride’s powerhouse, where every movement is controlled with precision to deliver its thrilling experience." 

The gray door is west of the Mechanical Room South and east of the Dungeon. The gray door is a closed locked door. Understand "grey" as gray. The description of the gray door is "It[']s a gray colored door with the word 'Dungeon' written on it." The silver key unlocks it.

Section 6 - Generator Room

The Generator Room is a dark room. The Generator Room is south of the Mechanical Room South. "
The generator room is a compact, utilitarian space where the lifeblood of the carnival’s power is produced. Its reinforced concrete walls bear grime, oil streaks, and faint graffiti from past workers. The air carries a mix of diesel, hot metal, ozone, and damp earth, creating a distinctly industrial scent.

At the center, the main generator hums steadily, its scuffed steel casing evidence of years of service. Thick rubberized cables extend from it like veins, connecting to junction boxes and circuit breakers along the walls. A control panel nearby is cluttered with buttons, switches, and gauges, many with faded labels like 'Fuel Intake' and 'Emergency Shutoff.' A flickering display screen shows power levels and load distribution.

The rough concrete floor is uneven, marked by small puddles of spilled fuel or condensation. Shelves along the walls hold spare parts—filters, spark plugs, and wire coils—while tools lie scattered on a workbench beside a grease canister and a worn maintenance manual.

A single industrial bulb in a protective cage casts harsh light, leaving deep shadows across the machinery. In the corner, a vent fan whirs faintly, struggling to cool the warm, vibrating air. A row of diesel canisters gleams beneath a faded safety poster that warns, 'Fuel Safely—No Open Flames!'

Though isolated and utilitarian, the generator room is the carnival’s heartbeat, powering its lights, rides, and sounds. Its quiet separation from the carnival’s chaos serves as a stark reminder of the machinery driving the magic." 

The indigo door is west of the Generator Room and east of the Guillotine Room. The Indigo Door is a closed locked door. The description of the Indigo door is "It[']s an indigo colored door with the word 'Guillotine' written on it." The silver key unlocks it.

Section 7 - Electrical Room

The Electrical Room is a dark room. The Electrical Room is south of the Generator Room. "The electrical room is a small but essential space hidden behind the carnival’s bright attractions. The air vibrates with electric energy, carrying the acrid scent of overheated wires and metal. Metal panels line the walls, some polished, others worn and streaked with grease.

A central breaker panel, labeled with destinations like 'Ferris Wheel Lights' and 'Carousel Motors,' dominates one wall. Green, yellow, and red indicator lights blink intermittently, reflecting off steel surfaces. Overhead, thick cable bundles snake across the ceiling, connecting to the carnival’s power network.

In a corner, an open junction box spills wires onto the wall, while a workbench holds scattered tools and a smudged wiring diagram pinned above. The dirt floor bears scratches, oil stains, and wire clippings. A faint vibration, carried from the generator or nearby rides, pulses through the room.

An emergency shutdown panel painted bright red stands near a fire extinguisher and a faded safety poster. A small fan on the workbench oscillates weakly, barely cooling the room’s warmth. Flickering fluorescent tubes overhead cast harsh, shifting shadows.

The electrical room is raw and utilitarian, revealing the fragile systems behind the carnival’s magic—a humbling reminder of the power sustaining the midway’s enchantment."

every turn when the location is the electrical room:
	say "This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous! There are exits in all directions."

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
	if Switch Eleven is switched off and the Khaki Fuse is in Socket Eleven:
		say "The indicator light goes on.";
		now Switch Eleven is switched on;
		now Indicator Light Eleven is switched on;
		stop the action;
	if Switch Eleven is switched on:
		say "The indicator light goes off.";
		now Switch Eleven is switched off;
		now Indicator Light Eleven is switched off;
		stop the action.

Instead of switching on Indicator Light Eleven, say "You can[']t turn that on." instead.

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

instead of locking when the location is Electrical Closet Eleven, say "You can[']t lock that!" instead.

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

Instead of switching on Indicator Light Nine, say "You can[']t turn that on." instead.

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

instead of locking when the location is Electrical Closet Nine, say "You can[']t lock that!" instead.

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
	if Switch Seven is switched off and the Gray Fuse is in Socket Seven:
		say "The indicator light goes on.";
		now Switch Seven is switched on;
		now Indicator Light Seven is switched on;
		stop the action;
	if Switch Seven is switched on:
		say "The indicator light goes off.";
		now Switch Seven is switched off;
		now Indicator Light Seven is switched off;
		stop the action.

Instead of switching on Indicator Light Seven, say "You can[']t turn that on." instead.

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

instead of locking when the location is Electrical Closet Seven, say "You can[']t lock that!" instead.

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
	if Switch Five is switched off and the Emerald Fuse is in Socket Five:
		say "The indicator light goes on.";
		now Switch Five is switched on;
		now Indicator Light Five is switched on;
		stop the action;
	if Switch Five is switched on:
		say "The indicator light goes off.";
		now Switch Five is switched off;
		now Indicator Light Five is switched off;
		stop the action.

Instead of switching on Indicator Light Five, say "You can[']t turn that on." instead.

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

instead of locking when the location is Electrical Closet Five, say "You can[']t lock that!" instead.

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
	if Switch Three is switched off and the Crimson Fuse is in Socket Three:
		say "The indicator light goes on.";
		now Switch Three is switched on;
		now Indicator Light Three is switched on;
		stop the action;
	if Switch Three is switched on:
		say "The indicator light goes off.";
		now Switch Three is switched off;
		now Indicator Light Three is switched off;
		stop the action.

Instead of switching on Indicator Light Three, say "You can[']t turn that on." instead.

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

instead of locking when the location is Electrical Closet Three, say "You can[']t lock that!" instead.

Section 13 - Electrical Closet One

The Electrical Closet One is a dark room. The Electrical Closet One is northeast of the Electrical Room.  "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the south west." 

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
	if Switch One is switched off and the Aqua Fuse is in Socket One:
		say "The indicator light goes on.";
		now Switch One is switched on;
		now Indicator Light One is switched on;
		stop the action;
	if Switch One is switched on:
		say "The indicator light goes off.";
		now Switch One is switched off;
		now Indicator Light One is switched off;
		stop the action.

Instead of switching on Indicator Light One, say "You can[']t turn that on." instead.

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

instead of locking when the location is Electrical Closet One, say "You can[']t lock that!" instead.
	
The silver key is in the Electrical Closet One. The description of the silver key is "This is a small silver key. I wonder what it unlocks."

Section 14 - Storage Room

The Storage Room is a dark room. The Storage Room is south of the Electrical Room. "The carnival storage room is a cramped yet essential space, tucked away from the bustling grounds. Its rusted metal and peeling wooden walls bear the marks of years of use, while the air hangs heavy with grease, dust, damp canvas, and a faint trace of stale popcorn.

Shelves overflow with supplies—boxes of lightbulbs, spools of wire, and assorted ride parts—piled without order. Tangled flags and strings of lights dangle from hooks, while crates labeled 'GAME PRIZES' and 'RIDE PARTS' hold items like stuffed animals and plastic toys. Folded tarps and tent poles teeter in one corner.

The room’s center is dominated by larger objects: spare ride seats, unassembled booths, and faded attraction pieces like a scratched carousel horse, all hidden beneath protective tarps.

Near the entrance, a battered desk is cluttered with maintenance logs, tools, and empty coffee cups. Above it, a corkboard brims with ride schedules, repair requests, and notes. A flickering fluorescent bulb casts uneven shadows, adding an eerie atmosphere.

The floor, a rough blend of concrete and dirt, is littered with bolts, screws, and wire scraps. In the dim corners, the scuttle of rats and the glint of cobwebs underline the room[']s gritty nature.

Chaotic yet indispensable, this hidden space powers the carnival’s magic, ensuring every ride and booth runs seamlessly."

The khaki door is west of the Storage Room and east of the Ride Exit. The Khaki Door is a closed locked door. The description of the Khaki door is "It[']s a khaki colored door with the word 'Ride Exit' written on it." The silver key unlocks it.

Chapter 4 - Second Floor

Section 1 - Dark Hallway

Dark Hallway is a dark room. "This is a poorly lit hallway. Ahead you can see the glow of an open door."
	
Section 2 - Control Room

Control Room is a dark room. The Control Room is west of the Dark Hallway. The Control Room is a scored room. "The backstage control room is a plain, functional hub where the carnival’s rides, lights, and attractions are managed. Gray industrial walls, scuffed and greasy, surround rows of monitors streaming live carnival feeds—the Ferris wheel, carousel, and Hell Ride. Beneath them, a control panel with labeled switches and blinking lights oversees the systems.

The hum of electronics fills the air, punctuated by the crackle of a radio: 'Maintenance to Tilt-a-Whirl—wrench needed!' The worn floor is scattered with papers, tools, and coffee cups. A cluttered desk holds logs and schedules, while a corkboard above displays charts and red-marked notes like 'Check Zipper circuit breakers.'

A flickering light casts cold shadows as the metallic tang of machinery mixes with dampness. Functional yet essential, this hidden space ensures the carnival’s magic runs seamlessly." 

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

instead of switching off a colored light, say "You can[']t do that!"

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
			say "The monitor flickers for a second and the scene it displays changes to something different.";
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
			say "The monitor flickers for a second and the scene it displays changes to something different.";
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
			say "The monitor flickers for a second and the scene it displays changes to something different.";
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
			say "The monitor flickers for a second and the scene it displays changes to something different.";
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
			say "The monitor flickers for a second and the scene it displays changes to something different.";
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
			say "The monitor flickers for a second and the scene it displays changes to something different.";
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
		now the dial setting of the noun is the number understood.

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

