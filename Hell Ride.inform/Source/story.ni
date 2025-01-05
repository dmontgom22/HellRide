Part 1 - World Model

Chapter 1 - Inform Settings

Release along with 
	cover art, 
	a website, 
	an introductory booklet, 
	the "Quixe" interpreter, 
	the source text, 
	the solution, 
	and library card.

Use maximum things understood at once of at least 100.
Use dynamic memory allocation of at least 65536.
Use maximum text length of at least 4096.
Use DICT_WORD_SIZE of 25.
use MAX_STATIC_DATA of 300000.
use MAX_ACTIONS of 280.
use MAX_VERBS of 350.
use MAX_SYMBOLS of 28000.

Use scoring.
Use American Dialect.
Use serial comma.
The maximum score is 120.
The block giving rule is not listed in the check giving it to rules.

Chapter 2 - Biblio Card Settings

The story title is "Hell Ride".
The story author is "No Shoes".
The story headline is "The ride of a lifetime...".
The story genre is "Horror".
The release number is 117.
The story description is "You've decided to stay and enjoy the carnival anyway."
The story creation year is 2024.

Chapter 3 - Extensions

include Modified Exit by Emily Short.

Include Locksmith by Emily Short.

Include Basic Help Menu by Emily Short.

Include Basic Screen Effects by Emily Short.

Include Swearing Reloaded by Shin.

Include Singing Reloaded by Shin.

Chapter 4 - New Mechanics, Actions, Phrases

Section 1 - Money Mechanics

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
	
Before buying something free, say "That[']s not for sale." instead.

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

Instead of buying something free when the player carries the noun:
	say "[The noun] is yours already."

Instead of buying the money:
	say "The money belongs to you; you buy things with it."
	
Section 2 - Drink Mechanics

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

Report switching on an electric lamp:
	say "You flip a switch. ";
	carry out the showing action activity with the noun instead;
	continue the action.

An electric lamp is a kind of device.

Rule for showing action of an electric lamp (called item):
	if the item is switched on, say "[The item] is lit[if the number of visible lit things is greater than 1], competing with [the list of visible lit things which are not the item][end if].";
	otherwise say "[The item] is dark."
	
Carry out switching on an electric lamp: now the noun is lit. Carry out switching off an electric lamp: now the noun is unlit.

Rule for showing action of the noun:
	if the noun is switched on, and the noun is an electric lamp:
		say "A strong, narrow beam of light shines from [the item described].";
	else if the noun is switched on and the noun is not an electric lamp:
		say "It is currently switched on.";
	otherwise:
		say "It is currently switched off."
		
Before printing the name of a lit electric lamp, say "lit ".
Before printing the name of an unlit lit electric lamp, say "extinguished ".

Section 5 - Grues

Test grues with "s / buy hell ride ticket / s / give hell ride ticket to ride operator / s / e / s / s / s"

The lurking grue is a backdrop. The lurking grue is everywhere. The description of the lurking grue is "The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is humans, but its insatiable appetite is tempered by its fear of light. No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale."

Rule for printing the description of a dark room: say "It is pitch black.  You are likely to be eaten by a grue." instead. 
Rule for printing a refusal to act in the dark: say "It is too dark in here to see." instead.

The dark terminous count is a number that varies.	
every turn when in darkness:
	increment the dark terminous count;
	if the dark terminous count is 3, end the story finally.
every turn when not in darkness, now dark terminous count is 0.

Section 6 - Miscellaneous

Test Misc with "brief / xyzzy / plugh / hello sailor / please get the dime / i / score".

[for adaptive text]
A thing can be broken or unbroken. A thing is usually unbroken.

A thing can be seen or unseen. A thing is usually unseen.

Carry out examining a thing, now the noun is seen.

a coin is a kind of thing.

a dime is a kind of thing. Understand "shiny" and "coin" as a dime. The description of a dime is "It[']s a dime. Ten cents. One tenth of a dollar. And very shiny."

a quarter is a kind of thing. Understand "shiny" and "coin" as a quarter. The description of a quarter is "It[']s a quarter. Two bits. And very shiny."

[scored rooms]
A room can be scored or unscored. A room is usually unscored.

Carry out going to a unvisited scored room:
	play the sound of Bell;
	increase the score by 5.
	
[heaven and earth]
A room can be indoors or outdoors. A room is usually indoors. 

The sky is a backdrop. The sky is everywhere.

The description of the sky is "[if the location is outdoors]It[']s a beautiful evening. Not a cloud in the sky. The moon is out and there are so many stars to see. A shooting star streaks across the sky.[otherwise]You[']re indoors. You can[']t see the sky here."

The ground is a backdrop. The ground is everywhere. Understand "floor" as the ground.

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
	say "A  hollow voice says 'Plugh'."
	
Understand "plugh" or "say plugh" or "cast plugh" as casting plugh.

Casting plugh is an action applying to nothing.

Carry out casting plugh:
	say "Nothing happens."
	
Chapter 5 - The Player, Global Code

The player is in the Parking Lot. 

The description of the player is "You are despondent given that you and your date just had a huge fight and they stormed off. Maybe visiting the attractions at the carnival will make you feel better." 

Instead of examining the player:
	say "Oh, stop fussing. You look fine."

The coupon is in the wallet. The description of the coupon is "You found this in a stack of coupons on the counter of the gas station."

before examining the coupon, display Figure of Coupon.

After reading a command:
	if the player's command includes "please":
		say "Please do not say 'please.'";
		reject the player's command.

after reading a command:
	if the player's command matches "load", try restoring the game instead.
	
[obituary]
Rule for printing the player's obituary:
	[winning move]
	if Control Panel Nine's button is switched on and Control Panel Nine's dial is properly set:
		say paragraph break;
		say "As you look into the monitor on the control panel you can see that the guillotine has stopped rising and falling over the cars. You have saved the day, not to mention lives![paragraph break]";
		say "*** You have won! ***";
		say paragraph break;
		rule succeeds;
	[car was toad away]
	else if toadaway is true:
		say "[paragraph break]*** You start the long walk home. ***";
	[electrocuted by big switch]
	else if electrocuted is true:
		say "[line break]The sparks arc onto your unprotected hands electrocuting you on the spot.";
		say "[paragraph break]*** You have died! ***";
	[grues]
	else if the location is dark:
		say "[Line break]Oh no! You walked directly into the slavering fangs of a lurking grue!";
		say "[paragraph break]*** You have died! ***";
		say paragraph break;
	[some other way to die]
	otherwise:
		say "[paragraph break]*** You have died! ***"
		
After printing the player's obituary: say "[paragraph break]Wow, you achieved a whole [score] point[s] out of a possible [maximum score] in [turn count] moves! I'm very proud of you. This was a triumph. I'm being so sincere right now."
	
[fix up the map]
Index map with title set to "The Carnival".
Index map with Electrical Closet Eleven mapped northwest of Electrical Room.
Index map with Electrical Closet Seven mapped southwest of Electrical Room.
Index map with Guillotine Room mapped west of Generator Room.
Index map with room-size set to 52
	and room-size of the Electrical Room set to 74.

[toad away]
toadaway is a truth state that varies. toadaway is false.
every turn:
	if turn count is 100:
		say "Over the loud speaker, an announcement blares: Attention please. There is a vehicle being towed from the parking lot for parking illegally. The license plate of the car is '862901'.[run paragraph on]";
		if the parking stub is on the dashboard:
			say " You breathe a sigh of relief as you realize that[']s not your license plate. I guess it[']s a good thing you remembered to place the parking stub on the dashboard.";
		if the parking stub is not on the dashboard:
			say " Your heart sinks as you realize that is your license plate. You race to the parking lot in time to see the tow truck pull away with your car in tow";
			now toadaway is true;
			end the story finally.

Chapter 6 - Tables

[Bored Responses]
Table of Bored Responses
response
"He[']s just trying to earn enough money to take his sweetie to the movies next week."
"He[']s thinking about having a brewski with his bros after work."
"His mind is completely blank."
"He[']s thinking about the big game on Friday night."
"He[']s wondering if his SAT scores are good enough to get into college."
"He[']s wondering why he took this stupid job in the first place."
"His thoughts are entirely focused on a cheeseburger for lunch."
"He wonders how is he supposed to look cool dressed in this awful uniform."

[Songs]
Table of Songs
artist	song	rickroll
"Led Zeppelin"	"Fool In The Rain"	false
"Pink Floyd"	"Comfortably Numb"	false
"Aretha Franklin"	"Respect"	false
"Steely Dan"	"Aja"	false
"Taylor Swift"	"Shake It Off"	false
"Pharell"	"Happy"	false
"Dolly Parton"	"Jolene"	false
"Van Morrison"	"Brown Eyed Girl"	false
"Weezer"	"Africa"	false
"Johnny Cash"	"Folsom Prison Blues"	false
"Cat Stevens"	"Peace Train"	false
"Lou Reed"	"Sweet Jane"	false
"Queen"	"Bohemian Rhapsody"	false
"Bob Seger"	"Old Time Rock[']N[']Roll"	false
"Boston"	"More That A Feeling"	false
"Roger Miller"	"King of the Road"	false
"Elvis Presley"	"Suspicious Minds"	false
"Jimmy Buffet"	"Margaritaville"	false
"The Cure"	"Friday I'm In Love"	false
"Dave Edmunds"	"I Hear You Knocking"	false
"Bruddah Iz"	"Over The Rainbow"	false
"Aerosmith"	"Dream On"	false
"Paul Simon"	"Kodachrome"	false
"R.E.M."	"Losing My Religion"	false
"Modern English"	"Melt With You"	false
"Rick Astley"	"Never Gonna Give You Up"	true
"Bob Marley"	"No Woman, No Cry"	false
"Smokey Robinson"	"Tracks Of My Tears"	false
"Billy Joel"	"Piano Man"	false
"Warren Zevon"	"Werewolves Of London"	false
"Dusty Springield"	"Son Of A Preacher Man"	false
"Kermit the Frog"	"Rainbow Connection"	false
"David Bowie"	"Young Americans"	false
"Ben E. King"	"Stand By Me"	false
"Blondie"	"Heart Of Glass"	false
"Neil Diamond"	"Sweet Caroline"	false
"The Grateful Dead"	"Ripple"	false
"Bruce Springsteen"	"Born To Run"	false
"The Talking Heads"	"Psycho Killer"	false
"The Village People"	"YMCA"	false

[Monitor Descriptions]
Table of Monitor Descriptions
link number	figure choice		description
0	Figure of ControlPanel		"The monitor now shows a nothing but snow."
1	Figure of ControlPanelStocks		"The monitor now shows a tableau of poor unfortunate townsfolk locked in stocks."
3	Figure of ControlPanelGallows		"The monitor now shows a scene of someone waiting to be hanged."
5	Figure of ControlPanelStake		"The monitor now displays a scene of witches being burned at the stake."
7	Figure of ControlPanelDungeon		"The monitor now shows the implements of torture in the dungeon."
9	Figure of ControlPanelGuillotine		"The monitor now shows a tableau of a guillotine rising and falling over the ride exit."
11	Figure of ControlPanelExit		"The monitor shows a the gift shop located at the Hell Ride exit."

[prizes]
Table of High Striker Prizes
index	object	description
"1"	teddy bear	"a teddy bear"
"2"	swiss army knife	"a Swiss Army knife"
"3"	poster of taylor swift	"a poster of Taylor Swift"
"4"	fuse13	"a magenta fuse"

Table of Flip a Coin Prizes
index	object	description
"1"	small plush monkey	"a stuffed monkey"
"2"	fuse15	"an orange fuse"
"3"	poster of billie eilish	"a poster of Billie Eilish"
"4"	pocket mirror	"a small pocket mirror"

Table of Pitcher's Mound Prizes
index	object	description
"1"	fuse17	"a quartz fuse"
"2"	small plush donkey	"a plush donkey"
"3"	goldfish	"a goldfish in a bowl"
"4"	poster of lourde	"a poster of Lourde"

[Description of Hell Ride]			
When play begins:
	 choose row 1 in Table of Basic Help Options;
	 now description entry is "Hell Ride - A Ride to remember...

In the early 1980[']s, I had an Apple II Plus computer with 64K of RAM, dual 5.25[quotation mark] floppy disks, and a color monitor as big as a television. And the very first game I ever bought was Infocom[']s Zork I: The Great Underground Empire. This was cool. It was all text-based. The game described your surroundings and you interacted with commands that say what you wanted to do. This 'Interactive Fiction' really evoked in a game what I appreciated most about reading: rich descriptions, colorful characters, and the like. After Zork I, there was Zork II and III. Enchanter, Moonmist, Suspect, and so many 
more. I played them all with my best friend Andy.

Andy and I were software developers at the time and we thought, 'We can do this!' So we set out to do this. We developed a game engine with a natural language parser. And it was pretty good. We could support most of the kinds of things they did, certainly less graceful but pretty good. In fact, our parser was better than theirs in a case where the sentence was ambiguous. e.g. 'Walk into the room with the lamp.' Is the player carrying the lamp? Or is the lamp in the room? 

For fun, we reverse engineered parts of Infocom[']s game format. We found the dictionary, certain text tokens used for text substitution, the game text. We also discovered the first example of compression I had ever seen and it just about made my head explode. They stored all ASCII characters in five bits! Pow! Mind blown. I had never considered anything like that. Just another hook.

We developed two prototypes: Diner and Hell Ride. Diner was about bank robbers coming into the diner where you are a short order cook and you have to save the day. Hell Ride was pretty close to what you find here. I decided to implement it using modern tools. It[']s pretty good.

I hope you enjoy it.

d."

Chapter 7 - Figures

Figure of Hell Ride is the file "HellRide.png".

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

Figure of FerrisWheel is the file "FerrisWheel.png".

Figure of BumperCars is the file "BumperCars.png".

Figure of FortuneTeller is the file "FortuneTeller.png".

Figure of Carousel is the file "Carousel.png".

Figure of DimeToss is the file "DimeToss.png".

Figure of MilkBottles is the file "MilkBottles.png".

Figure of RideStocks is the file "RideStocks.png".

Figure of RideGallows is the file "RideGallows.png".

Figure of RideStake is the file "RideStake.png".

Figure of RideDungeon is the file "RideDungeon.png".

Figure of RideGuillotine is the file "RideGuillotine.png".

Figure of RideExit is the file "RideExit.png".


Chapter 8 - RNG Seed, Money, Dimes, Sounds - Not for release

[When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."]
			
When play begins:
	seed the random-number generator with 4321.
	
The price of the money is $30.00. 

Sound of Bell is the file "Silence.ogg".

five dimes underlie the seat. 

			
Chapter 9 - RNG Seed, Money, Dimes, Sounds - For Release Only

When play begins:
	seed the random-number generator with 0.

The price of the money is $20.00. 

Sound of Bell is the file "Bell.ogg".

two dimes underlie the seat.

	
Part 2 - The Game

Chapter 1 - Electrical Area

Section 1 - Colors

[the colors values are #00FFFF, #E32636, #00C957, #6F00FF, #6F00FF, #BDB76B, #FF00FF, #FFA500, and #E7BFB3]
Color is a kind of value. The colors are nondescript, aqua, crimson, emerald, gray, indigo, khaki, magenta, orange, and quartz. 

Understand "grey" as gray. 

Section 2 - Electrical Closets

An electrical closet is a kind of room. 

Electrical Closet One is a dark electrical closet. It is northeast of the Electrical Room. "This is Electrical Closet One. There[']s an electrical panel here and an exit to the south west." 
Electrical Closet Three is a dark electrical closet east of the electrical room. "This is Electrical Closet Three. There[']s an electrical panel here and an exit to the west."
Electrical Closet Five is a dark electrical closet southeast of the electrical room. "This is Electrical Closet Five. There[']s an electrical panel here and an exit to the north west."
Electrical Closet Seven is a dark electrical closet southwest of the electrical room. "This is Electrical Closet Seven. There[']s an electrical panel here and an exit to the north east."
Electrical Closet Nine is a dark electrical closet west of the electrical room. "This is Electrical Closet Nine. There[']s an electrical panel here and an exit to the east."
Electrical Closet Eleven is a dark electrical closet northwest of the electrical room. "This is Electrical Closet Eleven. There[']s an electrical panel here and an exit to the south east."

A silver key is in the Electrical Closet One. The description of the silver key is "This is a small silver key. I wonder what it unlocks."

Section 3 - Electrical Panels

An electrical panel is a kind of openable lockable container. 
Understand "panel" as an electrical panel. Understand "screws" as the electrical panel.
An electrical panel is usually closed, locked, scenery.
An electrical panel has a color. Understand the color property as describing an electrical panel.
An electrical panel has a number called a panel id. Understand the panel id property as describing an electrical panel.

The description of an electrical panel is "Electrical Panel [the panel id] is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if the item described is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed.[end if] [if the item described is locked]There are screws holding it shut.[otherwise]The screws for the door are gone.[end if]".

The printed name of an electrical panel is "Electrical Panel [the panel id]".

every electrical panel is unlocked by the Swiss Army knife.

Definition: A thing is panel-fitted if it is incorporated by an electrical panel.

[This will allow us to refer to the "corresponding" socket, switch, or indicator; i.e. the one from the same panel. This particular phrase works because there is only ever one each of these in a panel. If we decide later to have, say, three sockets per panel, only this phrase will have to be changed -- using more complex logic -- but the rest of the code could be left as-is.]
To decide what thing is --/the corresponding (name of kind of value K) of --/the (PT - a panel-fitted thing):
	let H be the holder of PT;
	decide on a random K that is part of H.[<- there will only ever be one of these]

[The following won't actually give all the panel's components a color property matching the panel, but it will allow us to refer to a "shared color" of these components and get the desired result.]
To decide what color is --/the shared color of --/a/the (PT - a panel-fitted thing):
	decide on the color of the holder of PT.

After unlocking an electrical panel with something (this is the report unlocking an electrical panel rule):
	say "Using the screwdriver on the Swiss Army knife, you remove the screws holding the electrical panel shut.".

Every electrical closet contains an electrical panel (called its electrical panel).
The panel id of Electrical Closet One's electrical panel is 1. The color of Electrical Closet One's electrical panel is aqua.
The panel id of Electrical Closet Three's electrical panel is 3. The color of Electrical Closet Three's electrical panel is crimson.
The panel id of Electrical Closet Five's electrical panel is 5. The color of Electrical Closet Five's electrical panel is emerald.
The panel id of Electrical Closet Seven's electrical panel is 7. The color of Electrical Closet Seven's electrical panel is gray.
The panel id of Electrical Closet Nine's electrical panel is 9. The color of Electrical Closet Nine's electrical panel is indigo.
The panel id of Electrical Closet Eleven's electrical panel is 11. The color of Electrical Closet Eleven's electrical panel is khaki.

Section 4 - Sockets

A socket is a kind of open container. A socket is part of every electrical panel.
A socket is always fixed in place.
The carrying capacity of a socket is always 1. 

The description of a socket is usually "Socket [the panel id of the holder of the the item described] is part of electrical panel [the panel id of the holder of the item described]. [if unfilled]A fuse probably goes in here.[end if]".

The printed name of a socket is "socket [Panel id of the holder of the item described]". 

Definition: a socket is filled rather than unfilled if it contains a fuse.

To decide what number is --/the socket id of (S - a socket):
	decide on the panel id of the holder of S.
	
To decide what color is --/the color of (S - a socket):
	decide on the color of the holder of S.

Check inserting something into a socket when the holder of the second noun is not open:
	say "You should probably open the electrical panel first." instead.

Check inserting something into a socket (this is the can only insert fuses into sockets rule):
	if the noun is not a fuse, say "That won[']t fit in the socket." instead.
	
After inserting a fuse into a socket when the color of the noun is the shared color of the second noun and the holder of the second noun is open (this is the matching fuse snick rule):
	say "You hear a satisfying snick as the [color of the noun] fuse slides into place.".
	
Understand "socket [something related by reversed incorporation]" as a socket.
Understand "[something related by reversed incorporation] socket" as a socket.

Section 5 - Indicators
 
An indicator is a kind of thing. An indicator is part of every electrical panel.
An indicator is fixed in place.

The description of an indicator is "The indicator [if the Corresponding switch of the noun is switched on]is glowing [color of the holder of the item described] and [end if]is currently [if the Corresponding switch of the noun is switched on]indicating something[otherwise]indicating nothing[end if]."

The printed name of an indicator is "[Color of the holder of the item described] indicator". 

To decide what number is --/the indicator id of (I - an indicator):
	decide on the panel id of the holder of I.
	
To decide what color is --/the color of (I - an indicator):
	decide on the color of the holder of I.
	
Understand "indicator [something related by reversed incorporation]" as an indicator.
Understand "[something related by reversed incorporation] indicator" as an indicator.

Section 6 - Fuses

A fuse is a kind of thing. 
Understand "fuse" as a fuse.
A fuse can be lost or found. A fuse is usually lost. 
A fuse has a color. Understand the color property as describing a fuse.
A fuse has a number called fuse id. Understand the fuse id property as describing a fuse.

The description of a fuse is "This is [color of the item described] colored electrical fuse." 

The printed name of a fuse is "[color of the item described] colored fuse".

Definition: a fuse is plugged-in rather than loose if it is contained by a socket.

An aqua fuse called an fuse1 underlies the wooden stocks. The fuse id of fuse1 is 1.The color of fuse1 is aqua. 
A crimson fuse called a fuse3 underlies the gallows platform. The fuse id of fuse3 is 3. The color of fuse3 is crimson. 
An emerald fuse called an fuse5 is in the pyre. The fuse id of fuse5 is 5. The color of fuse5  is emerald. 
A gray fuse called a fuse7 underlies the iron chair. The fuse id of fuse7 is 7. The color of fuse7 is gray. 
An indigo fuse called an fuse9 underlies the guillotine platform. The fuse id of fuse9 is 9. The color of fuse9 is indigo. 
A khaki fuse called a fuse11 is in the merchandise stand. The fuse id of fuse11 is 11. The color of fuse11 is khaki. 
A magenta fuse called a fuse13 is carried by the Strongman Attendant. The fuse id of fuse13 is 13. The color of fuse13 is magenta. 
An orange fuse called an fuse15 is carried by the Flip a Coin Attendant. The fuse id of fuse15 is 15. The color of fuse15 is orange. 
A quartz fuse called a fuse17 is carried by the Pitcher's Mound Attendant. The fuse id of fuse17 is 17. The color of fuse17 is quartz. 

The taking action has an object called the object taken from.

Setting action variables for taking (this is the set object taken from rule):
	now the object taken from is the holder of the noun.

After taking a fuse when the object taken from is a socket (this is the check switch after removing fuses rule):
	say "Taken.";
	if the corresponding switch of the object taken from is switched on:
		now the corresponding switch of the object taken from is switched off;
		say "The [Corresponding indicator of the object taken from] just went out.".
		
Section 7 - Switches

A switch is a kind of device. A switch is part of every electrical panel.
A switch is fixed in place. 
A switch can be switched on or switched off. A switch is usually switched off.
A switch has a truth state called points awarded. points awarded is usually false.

The description is "Switch [switch id of the item described] is part of Electrical Panel [the panel id of the holder of the item described]. It[']s a big switch. You could probably turn it [if the item described is switched off]on[otherwise]off[end if] if you wanted to."

The printed name of a switch is "switch [panel id of the holder of the item described]"

To decide what number is --/the switch id of (S - a switch):
	decide on the panel id of the holder of S.
	
To decide what color is --/the color of (S - a switch):
	decide on the color of the holder of S.
	
Understand "switch [something related by reversed incorporation]" as a switch.
Understand "[something related by reversed incorporation] switch" as a switch.

Instead of pushing a switched off switch (this is the redirect push to switch on rule):
	try switching on the noun.

Instead of pushing a switched on switch (this is the redirect push to switch off rule):
	try switching off the noun.

To decide if (S - a socket) is properly fused:
	if S is filled:
		let F be a random fuse in S;[<- can only be 1]
		if the color of F is the shared color of S:
			decide yes;
	decide no.
	
check switching on a switched off switch when the holder of the noun is not open:
	say "You should probably open the electrical panel first." instead.

Check switching on a switched off switch (this is the nothing happens unless socket is properly fused rule):
	unless the corresponding socket of the noun is properly fused:
		say "Nothing obvious happens." instead.

Last report switching on a switch (this is the final report switching on a switch rule):
	say "The [corresponding indicator of the noun]'s light goes on.";
	if points awarded of the noun is false:
		play the sound of Bell;
		increase score by 5;
		now points awarded of the noun is true.

Last report switching off a switch (this is the final report switching off a switch rule):		
	say "The [corresponding indicator of the noun]'s light turns off.".
	
The switch count is a number that varies. The switch count is 0.
To count the switches:
	now the switch count is 0;
	if Electrical Closet One's electrical panel's switch is switched on and the Electrical Closet One's electrical panel's socket is properly fused, increment the switch count;
	if Electrical Closet Three's electrical panel's switch is switched on and the Electrical Closet Three's electrical panel's socket is properly fused, increment the switch count;
	if Electrical Closet Five's electrical panel's switch is switched on and the Electrical Closet Five's electrical panel's socket is properly fused, increment the switch count;
	if Electrical Closet Seven's electrical panel's switch is switched on and the Electrical Closet Seven's electrical panel's socket is properly fused, increment the switch count;
	if Electrical Closet Nine's electrical panel's switch is switched on and the Electrical Closet Nine's electrical panel's socket is properly fused, increment the switch count;
	if Electrical Closet Eleven's electrical panel's switch is switched on and the Electrical Closet Eleven's electrical panel's socket is properly fused, increment the switch count;
		
	
Section 8 - Electrical Room

Electrical Room is a dark room.  The electrical room can be electromagnetic. The electrical room is electromagnetic. "The electrical room is a small but essential space hidden behind the carnival’s bright attractions. The air vibrates with electric energy, carrying the acrid scent of overheated wires and metal. Metal panels line the walls, some polished, others worn and streaked with grease.

A central breaker panel, labeled with destinations like 'Ferris Wheel Lights' and 'Carousel Motors,' dominates one wall. Colored indicator lights blink intermittently, reflecting off steel surfaces. Overhead, thick cable bundles snake across the ceiling, connecting to the carnival’s power network.

In a corner, an open junction box spills wires onto the wall, while a workbench holds scattered tools and a smudged wiring diagram pinned above. The dirt floor bears scratches, oil stains, and wire clippings. A faint vibration, carried from the generator or nearby rides, pulses through the room.

An emergency shutdown panel painted bright red stands near a fire extinguisher and a faded safety poster. A small fan on the workbench oscillates weakly, barely cooling the room’s warmth. Flickering fluorescent tubes overhead cast harsh, shifting shadows.

The electrical room is raw and utilitarian, revealing the fragile systems behind the carnival’s magic—a humbling reminder of the power sustaining the midway’s enchantment.

[if the location is electromagnetic]This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous! There are exits in all directions.[otherwise]You no longer feel your hair standing on end.[end if]".

Instead of going from the Electrical Room:
	if the big switch is switched on:
		move the player to a random adjacent room;
	otherwise:
		continue the action.

The breaker panel is here. It is scenery. 
The junction box is here. It is scenery. 
The workbench is here. It is scenery.
The emergency shutdown panel is here. It is scenery.
A fire extinguisher is here. It is scenery.
A faded safety poster is here. It is scenery.
A small fan is here. It is scenery.

Electrical Room is south of the Generator Room. 
Electrical Room is southwest of Electrical Closet One.
Electrical Room is west of Electrical Closet Three.
Electrical Room is northwest of Electrical Closet Five.
Electrical Room is northeast of Electrical Closet Seven.
Electrical Room is east of Electrical Closet Nine.
Electrical Room is southeast of Electrical Closet Eleven.
Electrical Room is north of the Storage Room. 

Chapter 2 - The Midway

Section 1 - Parking Lot

Test Life with "brief / Test Parking / Test Games / Test Attractions / Test Concession / Test Misc / Test Backstage".

Test Death with "brief / Test Parking / Test Games / Test Attractions / Test Concession / Test Misc / Test Ride".

Test Parking with "brief / get blueberries / eat blueberries / give coupon to operator / buy ticket / get in car / l at car / l at seat / l under seat / open glove box / get gloves / wear gloves / l at dashboard / set stub on the dashboard / l at the dashboard / exit".

Test ToadAway with "brief / test parking / get in car / get parking stub / exit car / test games / test b1 / w / l under stocks / e / s / w"

Test a1 with "s / buy fortune teller ticket / buy ferris wheel ticket / buy bumper cars ticket / buy carousel ticket / buy hell ride ticket"

Test a2 with "e / e / e / give ferris wheel ticket to ferris wheel operator / w / w / ne / give carousel ticket to carousel operator / sw / se / give fortune teller ticket to mysterious woman / nw / nw / l at two dollar bill / get two dollar bill / give bumper cars ticket to bumper cars operator / se / n"

Test Attractions with "test a1 / test a2"

Test g1 with "brief / s / w / give dime to barker / w /  z / z / z / z / z / z / z / z / get lamp / turn it on / e / e / n"

Test g2 with "s / e / buy mallet / hit lever with mallet / g / g / g / g / 2 / w / n".

Test g3 with "s / e  / ne / l at booth / l under booth / toss dime on plate / mercury / 3 / sw / se / give dime to attendant / throw baseball at bottles / 3 / nw / w / n"

Test Games with "Test g1 / test g2 / test g3".

Test Electrocution with "s / buy hell ride ticket / s / give hell ride ticket / s / e / l under junk / get flashlight / turn it on / s / u / w / remove gloves / switch the big switch off"

When play begins:
	display the figure of Hell Ride;
	say "The carnival is in town and you and your sweetie had a date to visit it. After dinner and just as you arrive at the carnival, you and your date have a terrible fight. They storm off leaving you alone. You decide to stay at the carnival anyway."

The Parking Lot is a room. The parking lot is north of the Ticket Booth. The parking lot is outdoors. "The carnival parking lot stretches across an open field, its gravel crunching under arriving cars. Temporary floodlights and the carnival[']s colorful glow light the area, while distant laughter, music, and the hum of rides fill the air.

Cars park haphazardly, guided by makeshift signs and fluttering flags. Families unload strollers and blankets, their chatter mixing with the carnival sounds. Others linger in vehicles, preparing for the chilly evening.

Shadows from nearby trees create dark pockets pierced by the occasional flashlight. Near the entrance, an attendant collects fees at a weathered booth, coins jingling in the cash box.

Puddles from recent rain shimmer with reflected lights, while patches of mud cling to unwary shoes. At the far end, RVs and trailers sit quietly, their occupants watching the Ferris wheel spin lazily against the sky.

Alive with anticipation, the parking lot marks the transition from the ordinary to the magic of the carnival.

The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush.[otherwise]The bush has been picked clean.[end if][paragraph break]Your car is here. It[']s a bit of a beater. Inside the car, you can see [the list of things which are part of the beater car]."

The Parking Attendant is a man in the the parking lot. Understand "attendent" and "operator" as parking attendant. The parking attendant carries the parking ticket and the parking stub. The price of the parking ticket is $5.00. 

instead of examining the parking attendant:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R] [if the parking attendant carries the parking ticket] He has a parking ticket. The price of a parking ticket is [the price of the parking ticket].[end if][line break]";
	stop the action.

The beater car is an open enterable container in the parking lot. The beater car is scenery. Understand "vehicle" and "car" as the beater car. The description of the beater car is "[if the player is in the beater car][bold type]Car Interior[roman type][line break][end if]This is your car. It[']s a 2002 Honda Civic and it[']s seen better days.[paragraph break][if the player is in the beater car]You[']re sitting inside your car. [end if]Even though it[']s old, it feels like an old friend. From the faux leather seats to the crack in the windshield. It[']s familiar and comforting. There[']s old fast food wrappers on the floor, clothes and text books in the back seat. There is an air freshener hanging from the rear view mirror. You see [the list of things which are part of the beater car]." 

The text books are here. They are scenery. The description of the text books is "You see Introduction to Calculus, Statistics, and Heart of Darkness here."

The clothes are here. They are scenery. The description of the clothes is "Your dirty clothes are strewn about. You really meant to do laundry before this."

instead of looking when the player is in the beater car, try examining the beater car.

The blueberry bush is here. the blueberry bush is scenery. the blueberry bush is a container. the blueberry bush is not portable. the blueberry bush contains blueberries. Understand "berries" as blueberries. The blueberries are edible.The description of the blueberries is "The blueberries are ripe and juicy.".

After taking blueberries:
	play the sound of Bell;
	increase score by 5;
	say "Good Job!".
	
after eating the blueberries, say "The blueberries were delicious. A true taste of summer."
	
check giving the coupon to the parking attendant:
	if the parking attendant carries the parking ticket:
		now the price of the parking ticket is $3.00;
		now the parking attendant carries the coupon;	
		say "Given. The price of a parking ticket is now [the price of the parking ticket].";
		stop the action;
	otherwise if the player carries the parking ticket:
		say "Given. But you already bought a parking ticket.";
		now the parking attendant carries the coupon;
		stop the action.
		
instead of buying the parking ticket when the player is not in the car:
	say "The attendant says, 'Don[']t forget to leave the stub on your dashboard'.";
	now the player carries the parking ticket;
	now the player carries the parking stub;
	continue the action.
	
instead of buying the parking ticket when the player is in the beater car:
	say "You don[']t see that here." instead.

instead of going south when the location is the parking lot and the player does not carry the parking ticket, say "You need a parking ticket to leave your car here." instead.

Section 2 - Car Interior

every turn when the location is the parking lot:
	now the left hand status line is "[the player's surroundings]".
	
every turn when the player is in the beater car:
	now the left hand status line is "Car Interior".

The air freshener is in the beater car. The description of the air freshener is "This is one of those air fresheners that are shaped like a pine tree and smell like one too. You bought it the last time you went to the car wash."

The ignition is part of the beater car. The ignition is a scenery container. 

The dashboard is part of the beater car. The dashboard is a supporter. Understand "dash" as the dashboard. The description of the dashboard is "It looks like you could set something there."

The seat is part of the beater car. The seat is a supporter. It is fixed in place. The description of the seat is "A faux leather seat that looked great when it was new."

Your keys underlie the seat. Understand "car key", "car keys", and "key" as the keys. The description of the keys is "These are your car keys. It[']s a wonder you could even find them, your house is such a mess."

three quarters underlie the seat.

The glove box is part of the beater car. The glove box is a locked openable container. Your keys unlock the glove box. Understand "glove compartment" and "compartment" as the glove box.

the pair of gloves are a thing. The pair of gloves are inside the glove box. The pair of gloves is wearable. The description of the pair of gloves is "A nice set of fur-lined leather gloves. They[']re very warm." The printed name of the pair of gloves is "pair of gloves".

[instead of inserting  when the noun is the car keys and the second noun is the ignition, say "The key slides into the ignition with a satisfying snick."]

Instead of looking under a thing which is underlaid by something:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;

Understand "exit [a direction]" as a mistake ("Please try 'go [noun]' or just '[noun]' as a direction isn[']t necessarily an exit here.")

Understand "place [something] on [something]" as putting it on. Understand "set [something] on [something]" as putting it on. 

Section 3 - Ticket Booth

After going south from the parking lot when the Ticket Booth is unvisited and the player carries the parking ticket:
	display Figure of TicketBooth;
	continue the action.
	
Before looking when the location is the Ticket Booth:
	display Figure of TicketBooth.

The Ticket Booth is a room. The Ticket Booth is outdoors. 
The Ticket Booth is northwest of the Fortune Teller Booth.
The Ticket Booth is north of Head of the Line. 
The Ticket Booth is northeast of the Concession Stand. 
The Ticket Booth is east of the Show Facade. 
The Ticket Booth is southwest of the Carousel Ride.
The Ticket Booth is south of the Parking Lot. 
The Ticket Booth is southeast of the Bumper Cars Ride.
The Ticket Booth is west of the High Striker. 

The description of the Ticket Booth is "The ticket kiosk stands at the carnival entrance, a compact booth painted in bright red and yellow stripes with bold letters above the window reading 'Tickets Here!' Twinkling lights outline its edges, blinking rhythmically to draw attention.

A single window serves visitors, where a smiling cashier dispenses colorful tickets from neatly arranged rolls. Beside the tickets, a cash drawer jingles as change is counted, and a digital payment system glows faintly for modern convenience. Too bad you don[']t have a debit card.

Next to the kiosk, a vibrant signboard lists ticket prices with playful illustrations of rides and treats. Pennant flags flutter from the kiosk’s roof, adding to the festive atmosphere, while the smell of popcorn and fried dough wafts from nearby stalls.

The worn ground around the kiosk shows the passage of eager carnival-goers. Families, couples, and friends form a buzzing line, their excitement building as they approach this first step into the magic of the carnival.

The midway continues in all directions from here. There is a cashier here. The prices of ride tickets are on the signboard. The cashier has [list of things carried by the cashier]."

The ticket kiosk is a thing. It is in the ticket booth. Understand "booth" as the ticket kiosk. The description of the ticket kiosk is "The ticket kiosk stands at the carnival entrance, a compact booth painted in bright red and yellow stripes with bold letters above the window reading 'Tickets Here!' Twinkling lights outline its edges, blinking rhythmically to draw attention.

A single window serves visitors, where a smiling cashier dispenses colorful tickets from neatly arranged rolls. Beside the tickets, a cash drawer jingles as change is counted, and a digital payment system glows faintly for modern convenience. Too bad you don[']t have a debit card.

Next to the kiosk, a vibrant signboard lists ticket prices with playful illustrations of rides and treats. Pennant flags flutter from the kiosk’s roof, adding to the festive atmosphere, while the smell of popcorn and fried dough wafts from nearby stalls.

The worn ground around the kiosk shows the passage of eager carnival-goers. Families, couples, and friends form a buzzing line, their excitement building as they approach this first step into the magic of the carnival.

The midway continues in all directions from here. There is a cashier here. The prices of ride tickets are on the signboard. The cashier has [list of things carried by the cashier]."

A ride ticket is a kind of thing. A ride ticket has a price.

The Hell Ride ticket is a ride ticket. The cashier carries the Hell Ride ticket. The price of the Hell Ride ticket is $3.00. The description of the Hell Ride ticket is "'Admit One' to the Hell Ride.[line break]It[']s a real 'E' ticket, baby!". 

The Fortune Teller ticket is a ride ticket. The cashier carries the Fortune teller ticket. The price of the fortune teller ticket is $3.00. The description of the fortune teller ticket is "'Admit One' Have your fortune told."

The Ferris Wheel ticket is a ride ticket. The cashier carries the Ferris Wheel ticket.The price of the ferris wheel ticket is $2.00. The description of the Ferris Wheel ticket is "'Admit One' to the Ferris Wheel."

The Bumper Cars ticket is a ride ticket. The cashier carries the Bumper Cars ticket. Understand "bumper car ticket" as bumper cars ticket. The price of the bumper cars ticket is $2.00. The description of the bumper cars ticket is "'Admit One' to the Bumper Cars."

The Carousel ticket is a ride ticket. The cashier carries the Carousel ticket. The price of the carousel ticket is $1.00. The description of the Carousel ticket is "'Admit One' to the Carousel."

The Cashier is a man in the Ticket Booth. 

instead of examining the cashier:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";
	stop the action.

After buying the hell ride ticket:
	play the sound of Bell;
	increase score by 5;
	say "Well done!";
	
There is a signboard in the Ticket Booth. The signboard is scenery. Understand "sign" as signboard. The description of the signboard is 
"[line break]$3.00 Hell Ride.
[line break]$3.00 Fortune Teller.
[line break]$2.00 Ferris Wheel.
[line break]$2.00 Bumper Cars.
[line break]$1.00 Carousel."

Section 4 - Concession Stand

Test Concession with "brief / s / sw / l at treats / read menu / buy cola / buy popcorn / buy candy apple / buy cotton candy / buy pretzel / inventory / drink soda / g / g / g / g / i / ne / n / i / score".

Before going southwest when the location is the Ticket Booth and the Concession Stand is unvisited:
	display Figure of ConcessionStand;
	continue the action.
	
Before looking when the location is the Concession Stand:
	display Figure of ConcessionStand.

The Concession Stand is a room. The concession stand is outdoors. "The concession stand, perched along the midway, is a colorful and bustling hub. Painted in bright reds, blues, and yellows, it features bold lettering announcing treats like 'SODA! POPCORN! CANDY APPLES!' Strings of twinkling lights frame the stand, making it a glowing beacon amid the carnival excitement.

Behind the counter, a popcorn machine churns out golden kernels, filling the air with a buttery aroma. Candy apples gleam under the lights, and cotton candy machines spin fluffy clouds of pink and blue. Warm pretzels sit under a heat lamp, their buttery, salted scent mingling with the sugary treats. A cooler holds sodas, their colorful labels visible through the frosted glass.

The counter is lively with stacks of paper bags, napkins, and cups of cheese and sugar sprinkles. A handwritten chalkboard menu lists prices in playful lettering. Workers in colorful aprons quickly hand out snacks, their movements efficient amid the cheerful chaos.

In front of the stand, kids tug at their parents, teens share pretzels, and the crowd buzzes with energy. More than just a snack stop, the stand is a sensory delight, adding flavor and charm to the carnival experience.

There is a menu to the right of the window. You can see the treats inside the stand. There is an exit to the northeast."

treats is here. Treats is scenery. Understand "treat" as treats. The description of treats is "There are a variety of things to eat here."

a menu is here.  Menu is fixed in place. The description of the menu is 
"[line break]$2.00 Cola
[line break]$2.50 Popcorn
[line break]$1.50 Candy Apple
[line break]$1.50 Cotton Candy
[line break]$1.50 Soft Pretzel
[line break]$1.00 Bubblegum"

a can is here. The price of can is $2.00. The description of the can is "This soda is ice cold."

The can is a fluid container. The liquid of the can is Cola. understand "soda" as cola. The current volume of the can is 8.0 fl oz. Understand "Coke" as the can.

Instead of player drinking a fluid container:
	if can is empty:
		say "[The person asked] tip the can again only to find it empty.";
	otherwise:
		decrease the current volume of the noun by 2.0 fl oz;
		if the current volume of the noun is less than 0.0 fl oz, now the current volume of the noun is 0.0 fl oz;
		say "[The person asked] gulp down some [liquid of the noun]."

bubblegum is here. bubblegum is edible. The price of bubblegum is $1.00. The description of the bubblegum is "This is a square of Bazooka Joe Bubblegum. Really now, is there any other?"

a bucket of popcorn is here. The bucket of popcorn is edible. The price of popcorn is $2.50. The description of the popcorn is "The bucket of popcorn looks enormous!"

a candy apple is here. The candy apple is edible. The price of a candy apple is $1.50. The description of the candy apple is "The candy apple is your typical caramel covered apple. It looks like it would get stuck in your teeth."

cotton candy is here. Cotton candy is edible. The price of cotton candy is $1.50. The description of cotton candy is "The cotton candy is a mixture of pink and blue floss."

a soft pretzel is here. The soft pretzel is edible. The price of the soft pretzel is $1.50. The description of the soft pretzel is "The soft pretzel is generously sprinkled with salt."

Section 5 - High Striker

Before going east when the location is the Ticket Booth and the High Striker is unvisited:
	display Figure of HighStriker;
	continue the action.
	
Before looking when the location is the High Striker:
	display Figure of HighStriker.

[ this was a forward reference that Inform 7 couldn't resolve for some reason]
A room called the Pitcher's Mound is southeast of the high striker. 

The High Striker is a room. The High Striker is west of the Ferris Wheel Ride, southwest of the Flip a Coin Game, and northwest of the Pitcher's Mound. The High Striker is outdoors. "This area features a tall, eye-catching machine adorned with bright, colorful lights, typically red, yellow, and blue. A large sign at the top reads 'Test Your Strength!' in bold, playful lettering. The machine[’]s base is made of polished wood, with a polished, vintage appearance. At the center is a sturdy metal pole, with a large bell hanging at the top, signaling when a successful attempt has been made. Along the length of the pole are markings indicating how strong you are.  A nearby sign says, 'Buy a mallet, strike the bell, win a prize.'[if the strongman attendant contains the mallet] You can see an over-sized mallet here.[end if]

Spectators gather around, cheering on participants and offering lighthearted jabs and encouragement, creating a lively, competitive atmosphere. The sound of the mallet hitting the target is followed by the resonant clang of the bell (if struck), alongside the buzz of carnival music in the background. The Ticket Kiosk is back the way you came and other games are northeast and northwest of here."

The markings are here. The markings are scenery. Understand "marking" and "sign" and "signs" as markings. The description of markings is "There are five levels marked on the pole: Weakling, Getting There, Average, Almost There, and Muscle Man."

The Strongman Attendant is here. Understand "attendent" and "operator" as attendant. The description of the Strongman Attendant is "An Attendant is standing here [if strongman attendant is carrying the mallet]holding a mallet[end if]."

after examining the strongman attendant:
	if HighStrikerWin is true, show the high striker prizes. 
	
after looking when the HighStrikerWin is true and the location is the High Striker:
	show the high striker prizes.
	
The teddy bear is carried by the Strongman Attendant. The description of the teddy bear is "This is a teddy bear like you had when you were a kid. Right down to the red bow around its neck." 

The Swiss Army knife is carried by the Strongman Attendant. The description of the Swiss army knife is "This is the standard issue Swiss Army knife. It has [a list of things which are part of the item described]."  The printed name of the Swiss Army knife is "Swiss Army knife". 

The screwdriver is part of the swiss army knife. The description of the screwdriver is "It[']s a handy tool that[']s part of the Swiss Army knife."
The awl is part of the swiss army knife. The description of the awl is "It[']s a handy tool that[']s part of the Swiss Army knife."
The fingernail clippers is part of the swiss army knife. The description of the fingernail clippers is "It[']s a handy tool that[']s part of the Swiss Army knife."
The can opener is part of the swiss army knife. The description of the can opener is "It[']s a handy tool that[']s part of the Swiss Army knife."
The corkscrew is part of the swiss army knife. The description of the corkscrew is "It[']s a handy tool that[']s part of the Swiss Army knife."

instead of taking when the noun is part of the Swiss army knife, say "That[']s part of the Swiss Army knife. You can[']t take that!" instead.
	
The poster of Taylor Swift is carried by the Strongman Attendant. The description of the poster of Taylor Swift is "This is a poster of America[']s sweetheart, Taylor Swift."

The lever is here. The lever is fixed in place. Understand "bullseye", "striker", and "target" as lever. The description of the lever is "There is a bullseye on the base of the lever. I guess this is where you have to hit the mallet."

The mallet is carried by the Strongman Attendant.  The price of the mallet is $2.00. Understand "hammer" as mallet. The description of the mallet is "The mallet is over sized, perhaps to give you an advantage in the Strong Man game."

A strength pattern is a kind of value. The strength patterns are Weakling, Getting Stronger, Average, Almost There, Muscle Man.

Hitting is an action applying to two visible things. 
Understand "hit [something]" as hitting. Understand "hit [something] with [something preferably held]" as hitting. 
Understand "strike [something]" as hitting. Understand "strike [something] with [something preferably held]" as hitting.
Understand "swing [something preferably held] at [something]" as hitting (with nouns reversed). 

Check hitting:
	if noun is not lever, say "Nothing happens." instead;
	if the second noun is not mallet, say "You can[']t hit [the noun] with that!" instead;
	if the player is not carrying the mallet, say "You[']re not holding the mallet." instead.

To show the High Striker prizes:
	say "Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of High Striker Prizes:
		say "[index in row N of the Table of High Striker Prizes]) [description in row N of the Table of High Striker Prizes][if N < number of rows in the Table of High Striker Prizes], [otherwise]?[end if]".

Carry out hitting when the player is carrying the mallet:
	say "You lift the mallet high and bring it down on the lever with all your might! The striker rises towards the bell stopping at '[a random strength pattern between weakling and almost there]'.  C[']mon! You can do better than that!";
	
HighStrikerWin is a truth state that varies. HighStrikerWin is false.
After hitting the lever when second noun is the mallet 4 times:
	play the sound of Bell;
	now HighStrikerWin is true;
	say "You swing the mallet one more time. The bell rings as the striker reaches the top of the pole. The attendant says, 'You[']re a Muscle Man. Here[']s a prize for you.'";
	show the high striker prizes.

after reading a command when the location is the high striker and HighStrikerWin is true:
	let C be "[the player's command]";
	if there is an index of C in the Table of High Striker Prizes:
		choose a row with an index of C in the Table of High Striker Prizes;
		play the sound of Bell;
		increase the score by 5;
		say "You are now holding [description entry].";
		now the player carries the object entry;
		now HighStrikerWin is false;
		reject the player's command;
	otherwise:
		continue the action.
		
Section 6 - Flip a Coin

Before going northeast when the location is the High Striker and the Flip a Coin Game is unvisited:
	display Figure of DimeToss;
	continue the action.
	
Before looking when the location is the Flip a Coin Game:
	display Figure of DimeToss.

A room called the Flip a Coin Game is northeast of the high striker. "The game booth is adorned with vibrant colors—red-and-white striped awnings, twinkling lights, and eye-catching signage that reads 'TOSS A DIME – WIN A PRIZE!'. You can see prizes of all shapes and sizes hang around the booth, from stuffed animals and novelty toys to shiny trinkets and quirky collectibles. The larger prizes are prominently displayed to entice passersby. Rows of gleaming plates sparkle under overhead lights, their glass surfaces reflecting the surrounding glow.

The distinctive 'ping' of dimes hitting plates creates a rhythmic soundtrack, punctuated by the occasional satisfying 'plop' when a dime lands perfectly. Victorious shouts mix with playful groans of near-misses, creating a symphony of excitement. Nearby, the hum of other booths, upbeat carnival music, and the distant laughter of children add to the lively backdrop. The booth operator calls out enthusiastically, 'Step right up! Test your skill! Win big!' Their energetic pitch draws in curious onlookers.[if a dime underlies the Flip a Coin booth] You thought you caught a flash of something coming from the area of the booth.[end if]

You[']re surprised to see that this game only costs a dime."

the Flip a Coin booth is a thing in the Flip a Coin Game. the Flip a Coin booth is scenery. The description of the Flip a Coin booth is "The game booth is adorned with vibrant colors—red-and-white striped awnings, twinkling lights, and eye-catching signage. [if a dime underlies the Flip a Coin booth] You can see something shiny on the ground under the booth.[end if]"

a mercury dime is a dime. it underlies the Flip a Coin booth.

Tossing relates one thing to another.
The verb to toss means the tossing relation.

Tossing is an action applying to two things.
Understand "toss [something preferably held] at/on [something]" as tossing.
Understand "flip [something preferably held] at/on [something]" as tossing.
		
check tossing a dime when the location is the Flip a Coin Game:
	if the player carries a dime:
		continue the action;
	otherwise:
		say "That seems futile to me.";
		rule fails.

The small plush monkey is carried by the Flip a Coin Attendant. Understand "stuffie" and "stuffed" as monkey. The description of the monkey is "You feel rather underwhelmed as you look at the small plush monkey on a keychain."

The poster of Billie Eilish is carried by the Flip a Coin Attendant. The description of the poster is "This is a poster of Billie Eilish. Doesn[']t your sweetie like them?"

The small pocket mirror is carried by the Flip a Coin Attendant. The description of the small pocket mirror is "This is a small pocket mirror. You could use it to check your hair."

To show the Toss A Dime prizes:
	say "Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Flip a Coin Prizes:
		say "[index in row N of the Table of Flip a Coin Prizes]) [description in row N of the Table of Flip a Coin Prizes][if N < number of rows in the Table of Flip a Coin Prizes], [otherwise]?[end if]".

TossADimeWin is a truth state that varies. TossADimeWin is false.
instead of tossing a dime when the second noun is the plate and the player carries the noun:
	say "You toss the dime. [run paragraph on]";
	if a random chance of 3 in 5 succeeds:
		now TossADimeWin is true;
		now noun is nowhere;
		say "The dime hits the plate, starts to spins, and lands in the center of the plate. The attendant shouts out, 'Winner! Winner! [run paragraph on]";
		show the Toss A Dime prizes;
	otherwise:
		let N be a random number between 1 and 3;
		if N is:
			-- 1: say "The dime hits the plate and bounces straight off.";
			-- 2: say "Like skipping a stone in water, the dime skitters off the plate.";
			-- 3: say "The dime lands on the edge of the plate. You watch in anticipation until the dime falls off the plate.";
		now the noun is nowhere.

after reading a command when the location is the Flip a Coin Game and TossADimeWin is true:
	let C be "[the player's command]";
	if there is an index of C in the Table of Flip a Coin Prizes:
		choose a row with an index of C in the Table of Flip a Coin Prizes;
		play the sound of Bell;
		increase the score by 5;
		say "You are now holding [description entry].";
		now the player carries the object entry;
		now TossADimeWin is false;
		reject the player's command;
	otherwise:
		continue the action.
			
The plate is a supporter. The plate is scenery in the Flip a Coin Game. Understand "plates" as plate. The description of the plate is "This is a small, flat plate, almost a saucer. You are meant to toss a dime on this plate to win a prize!"

The Flip a Coin Attendant is a man in the the Flip a Coin Game. Understand "attendent" and "operator" as the Flip a Coin attendant. 

after examining the flip a coin attendant:
	if TossADimeWin is true, show the toss a dime prizes. 
	
after looking when the TossADimeWin is true and the location is the Flip a Coin Game:
	show the Toss A Dime prizes.

instead of examining the flip a coin attendant:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";

Section 7 - Pitcher's Mound

Before going southeast when the location is the High Striker and the Pitcher's Mound is unvisited:
	display Figure of MilkBottles;
	continue the action.
	
Before looking when the location is the Pitcher's Mound:
	display Figure of MilkBottles.

A room called the Pitcher's Mound is southeast of the high striker. "The milk bottle ball toss is a classic carnival game that combines skill, strength, and a bit of luck. The setup features a pyramid of brightly colored milk bottles stacked on a sturdy platform—three on the bottom, two in the middle, and one on top. Players stand behind a marked line and toss baseballs, aiming to knock down as many bottles as possible. Clearing the entire stack wins a prize.

The booth buzzes with energy, its colorful banners and flashing lights drawing a lively crowd. The satisfying clatter of falling bottles mixes with cheers and groans from players and spectators. A carnival barker calls out, 'Step right up and test your aim! Three balls for just a dime.' Prizes—ranging from small toys to giant stuffed animals—hang prominently, enticing players to take a shot. With every toss, the game delivers moments of suspense, joy, and fun, making it a favorite at the carnival.

You[']re surprised to see that this game only costs a dime."

The small plush donkey is carried by the Pitcher's Mound Attendant. Understand "stuffie" and "stuffed" as donkey. The description of the donkey is "You feel rather underwhelmed as you look at the small plush donkey on a keychain."

The poster of Lourde is carried by the Pitcher's Mound Attendant. The description of the poster of Lourde is "This is a poster of Lourde. You love her singing."

The goldfish is carried by the Pitcher's Mound Attendant. Understand "bowl" as goldfish. The description of the goldfish is "This is a small goldfish in a bowl. A pet is just what you need."

a baseball is a kind of thing. Understand "ball" as baseball.The Pitcher's Mound Attendant carries three baseballs.

the milk bottles are scenery in the Pitcher's Mound. Understand "bottle" as milk bottles.

Throwing is an action applying to two things.
Understand "throw [something preferably held] at/on [something]" as throwing.

instead of giving a dime to the pitcher's mound attendant:
	say "The attendant gives you three baseballs in return.";
	now the pitcher's mound attendant carries the noun;
	now the player carries all baseballs;
	stop the action.

instead of throwing a baseball at the milk bottles:
	if the player carries a baseball:
		continue the action;
	otherwise:
		say "That seems futile to me.";
		rule fails.
		
To show the Pitcher's Mound prizes:
	say "Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Pitcher's Mound Prizes:
		say "[index in row N of the Table of Pitcher's Mound Prizes]) [description in row N of the Table of Pitcher's Mound Prizes][if N < number of rows in the Table of Pitcher's Mound Prizes], [otherwise]?[end if]";
		
PitchersMoundWin is a truth state that varies. PitchersMoundWin is false.
instead of throwing a baseball at the milk bottles when the player carries the noun:
	say "You wind up and throw the baseball at the milk bottles. [run paragraph on]";
	if a random chance of 3 in 5 succeeds:
		now PitchersMoundWin is true;	
		say "The ball hits the bottles in the sweet spot and they go flying off the platform. The attendant shouts out, 'Winner! Winner! [run paragraph on]";
		show the Pitcher's Mound prizes;
		now the noun is nowhere;
	otherwise:
		let N be a random number between 1 and 5;
		if N is:
			-- 1: say "You knocked over one bottle. You can do better than that.";
			-- 2: say "You knocked over two bottles. Too bad.";
			-- 3: say "You knocked over three bottles. So close.";
			-- 4: say "You knocked over four bottles. So sad.";
			-- 5: say "You knocked over five bottles. Better luck next time.";
		now the noun is nowhere.

after reading a command when the location is the Pitcher's Mound and PitchersMoundWin is true:
	let C be "[the player's command]";
	if there is an index of C in the Table of Pitcher's Mound Prizes:
		choose a row with an index of C in the Table of Pitcher's Mound Prizes;
		play the sound of Bell;
		increase the score by 5;
		say "You are now holding [description entry].";
		now the player carries the object entry;
		now PitchersMoundWin is false;
		reject the player's command;
	otherwise:
		continue the action.
			
The Pitcher's Mound Attendant is a man in the the Pitcher's Mound. Understand "attendent" and "operator" as the Pitcher's mound attendant. 

after examining the pitcher's mound attendant:
	if PitchersMoundWin is true, show the pitcher's mound prizes. 
	
after looking when the PitchersMoundWin is true and the location is the Pitcher's Mound:
	show the Pitcher's Mound prizes.

instead of examining the pitcher's mound attendant:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";

Section 8 - Show Facade

Before going west when the location is the Ticket Booth and the Show Facade is unvisited:
	display Figure of LittleEgyptFacade;
	continue the action.
	
Before looking when the location is the Show Facade:
	display Figure of LittleEgyptFacade.

Show Facade is a room. Show Facade is east of Show Tent. Show Facade is outdoors. "You head west through the midway, the bright lights of the carnival fading behind you as you approach a wooden booth. A sign above the entrance reads 'Little Egypt Show – A Journey Into the Mysterious and Exotic!' A rotund barker, wearing a fez and a dazzling smile, gestures to a small sign beside him that says 'Dime Admission.'  The Ticket Kiosk is back the way you came.

You are standing in front of a dark and mysterious tent filled with illusions and exotic performers. Perhaps there’s a fortune teller inside, offering cryptic clues about your journey or a hidden artifact that can be collected. There is a stage in front of the tent. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show.[if location is unvisited]The barker cries: 

Ladies and gentlemen, boys and girls, gather [']round! [line break]Step right up and witness the spectacle that[’]s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await![end if]"

The sign is in the Show Facade. The sign is scenery. The description of the sign is "The sign reads, 'Little Egypt Show – A Journey Into the Mysterious and Exotic!'".

The Barker is a person in Show Facade. Understand "attendant", "attendent", and "operator" as the Barker. The description of the barker is "Here is a man dressed in black pants, a white shirt,a striped vest, a fez, and a dazzling smile. The barker cries:

Ladies and gentlemen, boys and girls, gather [']round! [line break]Step right up and witness the spectacle that[’]s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await!"

Check going west when the location is the Show Facade and the barker is not carrying a dime:
	say "It[']ll cost you a dime to go that way.";
	stop the action.
	
Check going west when the location is the Show Facade and the barker is carrying a dime:
	Continue the action.

After giving when the noun is dime and the second noun is barker:
	say "You hand over a dime, and the barker nods, waving you through. As you step past the entrance, the air feels thicker, almost humid, and the sounds of the carnival fade away. You’ve entered an entirely different world now—one filled with the scents of incense and exotic spices, and the low, hypnotic music of a faraway land. Before you, a series of dimly lit tents stretch out, their flaps slightly swaying in the breeze. Intrigued, you take your first step into the Little Egypt Show. You can now head west into the show."

Section 9 - Show Tent	

Test Egypt with "brief / s / w / l at barker / give dime to barker / w / z / z / n / z / z / z / z / z / e / e / n / i / score".

Before going west when the location is the Show Facade and the Show Tent is unvisited and barker is carrying a dime:
	display Figure of LittleEgyptShow;
	continue the action.
	
Before looking when the location is the the Show Tent:
	display Figure of LittleEgyptShow.		

The Show Tent is a room. The Show Tent is west of Show Facade. "You are inside the Little Egypt Show. The attraction[']s facade is to the east. There are folding chairs organized neatly in rows. The show should start soon."

Little Egypt is a woman. Little Egypt is in the Show Tent. Little Egypt is scenery. The description of Little Egypt is "Little Egypt is an exotic looking, beautiful woman who is draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."

The sheer veil is a wearable thing. The description of the Sheer Veil is "This is a sheer gold veil that Little Egypt wore (and removed) during her show. Your head swims as you smell the scent of her perfume on her veil: patchouli."

The Stage is here. The Stage is scenery. The description of the Stage is "The stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'."

The wall is a scenery container. The wall is in the Show Tent. 

The lantern is an electric lamp. It is in the wall. Understand "lamp" as the lantern. The description of the lantern is "This is a highly polished brass lantern."

after taking the lantern for the first time:
	say "Taken.";
	if  the flashlight is in the pile of junk
		begin;
			play the sound of Bell;
			increase score by 5;
		end if.
	now the lantern is seen;

The folding chair is a enterable scenery supporter in the Show Tent. The description of the Folding Chair is "This is one of many folding chairs in the tent tonight."

LittleEgyptAuto is a scene. 
LittleEgyptAuto begins when the player has been in the show tent for exactly three turns or the player has been on the folding chair for exactly two turns.. 
LittleEgyptAuto ends when the number of filled rows in the Table of LittleEgypt Events is 0.

When LittleEgyptAuto ends:
	say "You applaud until your hands are sore. Did she just wink at you?[paragraph break]As she leaves the stage, Little Egypt tosses one of her veils to you!";
	play the sound of Bell;
	increase score by 5;
	now the player carries the Sheer Veil.
	
Every turn during LittleEgyptAuto:
	repeat through Table of LittleEgypt Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		rule succeeds.

Instead of doing something other than waiting, looking, listening or examining during LittleEgyptAuto:
	say "You[']re much too entranced by the show to do anything other than watch the show. You are riveted[if the player is in the folding chair] to your seat[end if]!".

Table of LittleEgypt Events
event
"As you enter the dimly lit tent, you see that the stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'. "
"Little Egypt emerges draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."
"The performance begins with slow, undulating movements, drawing you into the rhythm of exotic live music played on traditional instruments like the oud, darbuka, or zurna. As the tempo builds, her hips, torso, and hands move in intricate, mesmerizing patterns, demonstrating remarkable control and fluidity. She incorporates dramatic spins, drops, and shimmies, often accentuating the beat of the music with a quick jingle of her coin belt."
"Little Egypt makes eye contact with you and smiles enigmatically. During her performance she balances a sword on her head and accents her dance with finger cymbals."
"The music alternates between hauntingly slow melodies and rapid, energetic drum beats, creating an emotional arc that keeps you entranced. Little Egypt relies on the music[']s dynamic changes to tell a story with movements reflecting joy, sorrow, seduction, and celebration."
"The performance concludes with a dramatic flourish of a fast-paced shimmy, a bold spin, and Little Egypt dramatically casts off her veils. The dancer takes a bow to enthusiastic applause, leaving you spellbound by the sensual yet artful display."

Section 10 - Ferris Wheel Ride

After going east from the high striker when the ferris wheel ride is unvisited:
	display Figure of FerrisWheel;
	continue the action.
	
Before looking when the location is the Ferris Wheel Ride:
	display Figure of FerrisWheel.

A room called the Ferris Wheel Ride is outdoors. The Ferris Wheel Ride is east of the High Striker. "The Ferris wheel is the towering centerpiece of the carnival, its vibrant lights and graceful rotations drawing the attention of visitors from every corner of the fairgrounds. The wheel[']s massive steel frame arches high into the sky, its intricate network of beams glinting under the colorful glow of bulbs strung along its circumference. Each gondola, painted in bright hues like red, yellow, and blue, dangles from the wheel, swaying gently as it turns.

At night, the Ferris wheel transforms into a dazzling spectacle, with hundreds of synchronized lights creating patterns and ripples that pulse outward like waves. The bulbs flash in bursts of red, green, and white, casting playful reflections on nearby attractions and the surrounding crowd.

The air around the wheel is filled with a mix of excited chatter, the hum of its motor, and the occasional squeal of laughter or nervousness from riders high above. The ride operator, standing in a small booth at the base, keeps a steady rhythm of loading and unloading passengers, their voice occasionally calling out, 'Step right up! The best view of the carnival awaits!'

The Ferris wheel offers an ever-changing perspective of the carnival below. From its peak, riders can see the entire fairground: the spinning lights of the rides, the colorful stripes of game booths, and the winding paths of visitors navigating the midway. Beyond the carnival, the view stretches to the horizon, with city lights or rolling countryside adding to the magical experience.

Whether it[']s a romantic ride for couples, a thrilling adventure for friends, or a calming retreat for families, the Ferris wheel captures the spirit of the carnival—an iconic blend of excitement, wonder, and timeless charm."

The Ferris Wheel operator is a man in the Ferris Wheel Ride. Understand "attendent" and "attendant" as Ferris Wheel operator. 

instead of examining the ferris wheel operator:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";
	stop the action.

instead of giving the ferris wheel ticket to the ferris wheel operator:
	say "You give [the noun] to [the second noun].";
	now the ferris wheel operator carries the ferris wheel ticket;
	say "[line break]As you step into the gently swaying gondola, a faint creak accompanies the safety bar locking into place. The Ferris wheel begins its slow ascent, the hum of its machinery blending with the distant sounds of carnival games and laughter below. A soft breeze brushes against your face as the gondola rises higher, offering an ever-expanding view of the fairgrounds.

With each rotation, the world transforms. At the peak, the carnival sprawls beneath you like a miniature village, its vibrant lights twinkling against the twilight sky. The sound of the midway fades into a soft murmur, replaced by the serene quiet of being high above the bustling crowd. Beyond the fair, the horizon stretches endlessly, framed by the glow of distant city lights.

The gondola sways gently, adding a hint of thrill to the tranquil ride. You exchange smiles with your companions, pointing out tiny figures darting between booths or the dizzying motion of other rides below. The Ferris wheel begins its descent, and the lively carnival sounds grow louder once again, bringing you back into the heart of the action.

Whether you’re seeking a moment of calm, a romantic view, or the sheer wonder of seeing the world from above, the Ferris wheel delivers an unforgettable ride that captures the magic of the carnival."

Section 11 - Bumper Cars

After going northwest from the ticket Booth when the bumper cars ride is unvisited:
	display Figure of BumperCars;
	continue the action.
	
Before looking when the location is the Bumper Cars Ride:
	display Figure of BumperCars.
	
The Bumper Cars Ride is a room. The Bumper Cars Ride is northwest of the Ticket Booth. The Bumper Cars Ride is outdoors. "The bumper cars is a bustling hub of excitement and laughter, set beneath a canopy of flashing lights and colorful decorations. The rectangular arena is surrounded by padded barriers, ensuring a safe yet thrilling experience for riders. The floor, slick and metallic, allows the brightly colored cars—painted in shades of red, blue, yellow, and green—to glide effortlessly in all directions.

Each car is equipped with a steering wheel and a padded bumper, designed to absorb the impact of playful collisions. As the ride begins, drivers of all ages eagerly maneuver their cars, aiming for friends, family, or strangers with mischievous grins. The air is filled with the sound of bumpers colliding, laughter, and the occasional squeal of surprise.

Overhead, a web of electric poles connects the cars to the ceiling, sparking faintly as they supply power to the vehicles. The ride operator watches from a booth, ensuring everyone enjoys the chaos safely. Surrounding the bumper cars are cheering onlookers, carnival lights, and the lively hum of the fairground.

The bumper cars perfectly captures the playful spirit of the carnival, offering a mix of harmless competition, shared laughter, and nostalgic fun for all ages."

The Bumper Cars operator is a man in the Bumper Cars Ride. Understand "attendent" and "attendant" as Bumper Cars operator. 

instead of examining the Bumper Cars operator:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";
	stop the action.

instead of giving the bumper cars ticket to the bumper cars operator:
	say "You give [the noun] to [the second noun].";
	now the bumper cars operator carries the bumper cars ticket;
	say "[line break]Sliding into the snug seat of the bumper car, your hands grip the steering wheel, anticipation buzzing in the air. Around you, the arena is alive with flashing lights, bursts of laughter, and the hum of electric currents running through the overhead poles. A quick glance shows other riders locking eyes, playful grins spreading as everyone braces for the chaos about to unfold.

As the ride starts, your car jolts forward, and you steer into the fray. The slick metal floor beneath makes every turn feel smooth yet unpredictable. Suddenly, bam!—another car collides into you from the side, sending your car into a spin. You laugh, recovering quickly to aim your vehicle at a friend or an unsuspecting rider across the arena.

The thrill of the bumper cars is in the collisions—every thud and jolt accompanied by squeals of delight or mock indignation. The impact is cushioned by the padded bumpers, keeping the fun safe but exhilarating. You swerve, dodge, and sometimes reverse in a desperate attempt to avoid being cornered, all while plotting your next playful crash.

The ride is a whirlwind of laughter, harmless competition, and shared joy. As the music fades and the cars slow to a stop, you climb out with a wide grin, already looking forward to your next turn in the driver’s seat."

The two dollar bill is a thing. The two dollar bill is in the Bumper Cars Ride. Understand "bill" as the two dollar bill. "Hey! Is that a two dollar bill on the ground?" The description of the two dollar bill is "It has a picture of Thomas Jefferson on it."

instead of taking the two dollar bill:
	say "Taken.[paragraph break]";
	increase the price of the money by $2.00;
	say "You now have [the price of the money].";
	now the two dollar bill is nowhere.
	

Section 12 - Fortune Teller

After going southeast from the ticket Booth when the fortune teller booth is unvisited:
	display Figure of FortuneTeller;
	continue the action.
	
Before looking when the location is the Fortune Teller Booth:
	display Figure of FortuneTeller.
	
The Fortune Teller Booth is a room. The Fortune Teller Booth is outdoors. The fortune teller booth is southeast of the Ticket Booth. "Approaching the fortune teller[’]s booth, you’re drawn in by its mysterious allure. Draped in deep purple curtains adorned with golden moons and stars, the booth glows with the soft, inviting light of lanterns. The air is heavy with the scent of incense, mingling with the sweet aroma of carnival treats. A sign reading 'Fortunes Told—What Does Your Future Hold?' sways slightly in the evening breeze."

The Mysterious Woman is a woman in the fortune teller booth. The description of the Mysterious Woman is "The fortune teller sits in a dimly lit booth, draped in rich fabrics of deep purple and gold, adorned with celestial patterns of stars and moons. Their appearance is enigmatic, with piercing eyes that seem to look right through you and a knowing smile that hints at secrets yet untold. They wear flowing robes embellished with shimmering beads, and a jeweled headpiece catches the flickering light of nearby candles."

instead of giving the fortune teller ticket to the Mysterious Woman:
	say "You give [the noun] to [the second noun].";
	now the Mysterious Woman carries the fortune teller ticket;
	say "[line break]Stepping inside, you’re greeted by the fortune teller, a figure cloaked in flowing robes with a jeweled headpiece catching the flickering light. Their piercing eyes seem to look right through you as they gesture for you to sit at a small round table covered in an ornate cloth. At its center rests a glowing crystal ball, surrounded by tarot cards and mysterious trinkets.

The fortune teller[’]s voice is low and melodic, weaving an air of intrigue as they ask you to focus on a question or offer your palm for a reading. The room seems to shrink, the bustling carnival outside fading into the background as they reveal your fate. Each card turned or line traced feels significant, as though unlocking a secret you didn’t know you carried.

As the reading concludes, the fortune teller gazes into your eyes with a cryptic smile and delivers their final words of wisdom. Whether you leave with a sense of wonder, excitement, or unease, the encounter lingers with you—a touch of magic amid the carnival’s chaos, as if you’ve glimpsed something beyond the ordinary."

Section 13 - Carousel

After going northeast from the ticket Booth when the carousel ride is unvisited:
	display Figure of Carousel;
	continue the action.
	
Before looking when the location is the Carousel Ride:
	display Figure of Carousel.

The Carousel Ride is a room. The Carousel Ride is outdoors. The Carousel Ride is northeast of the Ticket Booth. "The carousel is a timeless carnival attraction, radiating charm and nostalgia with its brightly painted horses, vibrant lights, and cheerful music. The circular platform is adorned with a canopy of swirling colors, gold trim, and decorative mirrors that reflect the flickering bulbs lining its edges.

Rows of hand-carved animals, most often horses with flowing manes, are arranged in a circle. Each is painted in vivid colors, detailed with golden saddles and ribbons. It also features exotic creatures like lions, tigers, and sea dragons, adding whimsy to the ride. The animals rise and fall gently as the carousel spins, mimicking a galloping motion.

The carousel[’]s warm, playful tunes drift across the midway, inviting riders of all ages to enjoy its simple delight. Children laugh as they choose their favorite animals, while adults savor the nostalgia of the spinning ride. As it rotates, the carousel becomes a moving work of art, blending motion, color, and music into an enchanting centerpiece of the carnival. The Ticket Kiosk is back the way you came."

The Carousel operator is a man in the Carousel Ride. Understand "attendent" and "attendant" as Carousel operator. 

instead of examining the Carousel operator:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";
	stop the action.

instead of giving the carousel ticket to the carousel operator:
	say "You give [the noun] to [the second noun].";
	now the carousel operator carries the carousel ticket;
	say "[line break]Stepping onto the carousel[']s spinning platform, you’re greeted by a kaleidoscope of color—brightly painted horses, glittering lights, and golden trim. The cheerful melody of calliope music fills the air as you choose your mount, perhaps a galloping horse with a flowing mane, a majestic lion, or a whimsical giraffe. Gripping the polished pole, you settle onto the saddle, feeling the smooth rise and fall as the carousel begins to turn.

As the ride picks up speed, the world outside becomes a blur of glowing carnival lights and swirling colors. The gentle up-and-down motion mimics a playful gallop, and the rhythmic whir of the carousel’s machinery adds a soothing backdrop to the cheerful atmosphere. Laughter and the sound of children’s chatter mix with the music, creating a sense of nostalgia and joy.

For a few moments, you’re transported into a magical world, the worries of the day fading away with each graceful rotation. Whether you’re enjoying the ride alone, with friends, or sharing a special moment with family, the carousel[’]s charm captures a timeless blend of whimsy and wonder. As it slows to a stop, you step off with a smile, the music lingering in your ears as you rejoin the bustling carnival."

Section 14 - Head of the Line

Head of the Line is a room. Head of the Line is south of Ticket Booth. Head of the Line is north of Ride Entrance. The Head of the Line is outdoors. "You are standing in front of a ticket taker with his hand open waiting for your ticket. The entrance to the ride is south of here. The ride operator tells you that you[']re lucky you showed up when you did because this will be the last trip through Hell Ride. You notice that all the other cars are empty. The Ticket Kiosk is back the way you came."

The Hell Ride operator is a man in Head of the Line. Understand "attendent" and "attendant" as Hell Ride operator. 

instead of examining the Hell Ride operator:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]";
	stop the action.

Check going south when the location is Head of the Line and the Ride operator does not have the hell ride ticket:
	say "You[']ll need a ticket to go that way.";
	stop the action.

Chapter 3 - Backstage

Section 1 - Dark Passage

[get the key]
Test b1 with "brief / s / buy hell ride ticket / s / give hell ride ticket to operator / s / e / l at piles / get flashlight / turn it on / s / turn on radio / u / w / switch off big switch / e / d / l at desk / open drawer / get all from the drawer / s / s / open toolbox / get all from toolbox / s / s / s / ne / get silver key / l at panel / open panel / l at socket / sw / n / n / n / n / n"

[get the fuses]
Test b2 with "w / l under stocks / e / s / w / l under platform / e / s / w / l in pyre / get fuse from pyre / e / s / w / l under seat / e / s / w / l under platform / e / s / s / w / l in stand / get khaki fuse from merchandise stand / e / n"

[fill the sockets]
Test b3 with "ne / open panel / put aqua in socket  / push switch / sw / e / open panel / put crimson in socket / push switch / w / se / open panel / put emerald in socket / push switch / nw / sw / open panel / put gray in socket / push switch / ne / w / open panel / put indigo in socket / push switch / e / nw / l at panel / unlock panel with knife / l at panel / open  panel / l at panel / l at switch. / l at indicator / l at socket / put khaki in socket / push switch / l at socket / se"

[turn the dials]
test b4 with "n / n / n / n / n / climb ladder / w / l at control panel 1 / turn aqua dial to 1 / turn crimson dial to three / turn emerald dial to 5 / turn gray dial to seven / turn indigo dial to 9 / turn khaki dial to eleven / push aqua button / l at control panel 1 / push crimson button / l at control panel  3 / push emerald button / l at control panel 5 / push gray button / l at control panel 11 / push khaki button"

Test Backstage with "test b1 / test b2 / test b3 / test b4"

Dark Passage is a room. Dark Passage is east of the Ride Entrance. The dark passage is scored. "This room is backstage at the Hell Ride attraction. The room is littered with bags of trash, piles of junk, and dust bunnies so large they should be paying rent. West is back the way you came from. There an exit to the south."

The dust bunnies are scenery. The dust bunnies are here. Understand "bunnies" as dust bunnies.

The bags of trash are scenery. The bags of trash are here. Understand "bags" and "trash" as bags of trash.

instead of looking under when the noun is the pile of junk:
	try examining the junk instead. 

The flashlight is an electric lamp. The description of the flashlight is "This is a flashlight. It[']s a nice one."

The pile of junk is a scenery container. The pile of junk is in the dark passage. The pile of junk contains the flashlight. Understand "piles" and "junk" as pile of junk. 

after examining when the noun is pile of junk and the flashlight is in the pile of junk:
	say "You find a flashlight here.".
	
after taking the flashlight for the first time:
	say "Taken.";
	if  the lantern is in the wall
		begin;
			play the sound of Bell;
			increase score by 5;
		end if.
	now the flashlight is seen;

Section 2 - Maintenance Office

After going south from the dark passage when the Maintenance Office is unvisited and the the player carries a lit electric lamp:
	display Figure of MaintenanceOffice;
	continue the action.
			
Before looking when the location is the Maintenance Office and the the player carries a lit electric lamp:
	display Figure of MaintenanceOffice.

The Maintenance Office is a dark room. The maintenance office is south of the dark passage. "The maintenance office, hidden behind the carnival’s bright facade, is a dim and cluttered space reeking of grease, sweat, and faint traces of popcorn from the midway. The air hangs heavy with oil and stirred-up dust.

The walls are lined with shelves holding tools and parts in disarray—rusty wrenches, screws, and mismatched containers with faded labels. Paint cans and grease jars clutter the workbenches, many left half-open. In the center, a battered desk is strewn with wires, gears, and springs, a bent piece of metal held in a vise. Overhead, a single flickering fluorescent light struggles to illuminate the room.

In one corner, a disassembled ride mechanism lies exposed, chains and pulleys dangling from hooks above, faintly clinking with the vibrations of the rides. A grease-stained manual and a half-drained mug of coffee sit abandoned on a nearby stool.

The walls display faded safety posters, a corkboard with maintenance schedules and notes, and a worn photo of the carnival in its prime. A clock ticks faintly, its hands out of sync with reality. The floor, gritty with dust and scattered nails, adds to the room’s chaotic charm.

Despite the mess, the room buzzes with purpose—a hidden hub where the carnival’s magic is sustained through sweat, ingenuity, and the hum of machinery." 

The rusty wrenches are here. They are scenery. 
The paint cans are here. They are scenery. 
The grease jars are here. They are scenery. 
The safety posters are here. They are scenery. 
The notes are here. They are scenery. 
The clock is here. They are scenery. 
The lubricant is here. It is scenery.

The coffee mug is on the desk. The coffee mug is edible. Understand "coffee" as the coffee mug. The description of the coffee mug is "Who knows how long this has been sitting here. I wouldn[']t drink it if I were you." 

Instead of drinking the coffee mug: say "That looks nasty. You decide against drinking the coffee." instead.

The desk is in the maintenance office. The desk is a supporter. The desk is fixed in place. A drawer is part of the desk. The drawer is a closed openable container. The drawer is scenery. The description of the desk is "It[']s a desk. There are coffee stains and cigarette burns from years of abuse. The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

Nearness relates a room (called A) to a room (called B) when the number of moves from B to A is less than 2. The verb to be near means the nearness relation.

The radio is a device on the desk. The radio is switched off and fixed in place. The description of the radio is "[if switched on]The radio burbles on[otherwise]The radio is off[end if]." 

Every turn when the radio is switched on and location is near the maintenance office:
	choose a random row in Table of Songs;
	let A be the artist entry;
	Let S be the song entry;
	Let R be the rickroll entry;
	say "[one of]You hear [A][']s '[S]' playing on the radio.[or]'[S]' by [A] plays on the radio.[or]You sing along to [A][']s '[S]'.[or]The DJ announces that '[S]' by [A] will be up next.[or]Nearby, you can hear [S] by [A].[or]You whistle along to [S] by [A].[at random][if R is true] Yes, you have been Rick Rolled![end if]";

Rule for showing action of the radio:
	if the radio is switched on, say "Through the static, you pick up hear bits of the latest number one hit.";
	otherwise say "The radio is silent. You[']re saving the batteries."

Instead of listening in the presence of the switched on radio:
	carry out the showing action activity with the radio instead.

The scissors are in the drawer. The description is "This is a sharp pair of office scissors." 
The stapler is in the drawer. The description is "This is a red stapler." 
The ballpoint pen is in the drawer. The description is "Your standard ballpoint pen. It says Bic on the side." 
The pad of paper is in the drawer. The description is "This is a pad of lined paper."

[doors]
A wooden door is a kind of openable lockable door.
A wooden door is usually closed. 
A wooden door is usually locked.
A wooden door has a color. A wooden door is usually nondescript. 
The description of a wooden door is "The [color of the item described] door is [if the item described is open]open[otherwise]locked[end if]."
The printed name of a wooden door is "[color of the item described] colored door".

door1 is a wooden door. The color of door1 is aqua. The description of door1 is "It[']s [printed name of item described]. It has the word 'Stocks' written on it." The silver key unlocks it. 
door1 is west of the Maintenance Office and east of the Stocks Room. 

The ladder is up from the Maintenance Office and down from the Dark Hallway. The ladder is an open door. The description of the Ladder is "It[']s a typical 10 foot ladder."

Instead of climbing a ladder:
	try entering the noun.

Section 3 - Crawl Space

The Crawl Space is a dark room. The Crawl Space is south of Maintenance Office. "The crawl space beneath the carnival ride is a tight, claustrophobic tunnel shrouded in darkness and filled with the hum of machinery above. The air is stale and heavy, carrying the sharp metallic scent of oil and the faint tang of rust. Every sound is amplified in the confined space—the groaning of steel beams, the clanking of chains, and the rhythmic thrum of motors driving the ride above.

The ground is uneven, a mix of packed dirt and loose gravel scattered with forgotten tools, scraps of metal, and tangled wires. Overhead, a network of pipes and cables crisscross the space, some wrapped in fraying insulation that crackles faintly as you crawl past. Small puddles of murky water collect in dips on the floor, their surfaces rippling with vibrations from the ride’s movement."

door3 is a wooden door. The color of door3 is crimson. The description of door3 is "It[']s [printed name of item described]. It has the word 'Gallows' written on it." The silver key unlocks it. door3 is west of the Crawl Space and east of the Gallows Room. 


Section 4 - Mechanical Room North

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "The north mechanical room is compact and specialized, housing auxiliary systems that keep the ride running smoothly. A subdued hum of capacitors and relays fills the space, its quiet rhythm broken only by the occasional hiss of hydraulic fluid.

Electrical panels line the walls, labeled for functions like 'Lighting Controls,' 'Brake Systems,' and 'Emergency Shutdown.' Smaller cables and conduits snake along the walls, linking these systems to the main hub. In one corner, a hydraulic pump and reservoir manage lifting arms and rotating platforms, their gauges flickering as they work. 

A small workbench against the eastern wall is cluttered with tools and coiled wires, while shelves above hold neatly labeled spare parts—fuses, cables, and hydraulic tubing. A faded ride diagram pinned nearby is marked with red annotations from past repairs.

Dimly lit by a single hanging bulb, the room feels cooler and slightly damp, the metallic tang of machinery mixing with a hint of mildew. Though quieter and less prominent than the south mechanical room, this space plays a vital role in supporting the ride’s operation and ensuring its emergency systems are always prepared." 

The toolbox is a closed openable container in the Mechanical Room North. The toolbox contains a monkey wrench, a channel lock, pliers, and a hammer.

A hydraulic pump is here. It is scenery.
The gauges are here. They are scenery.

door5 is a wooden door. The color of door5 is emerald. The description of door5 is "It[']s [printed name of item described]. It has the word 'Stake' written on it." The silver key unlocks it. door5 is west of the Mechanical Room North and east of the Stake Room. 

Section 5 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "The south mechanical room is the operational core of the carnival ride, a bustling, noisy space dominated by a massive motor. Its steady hum drives the thick belts, pulleys, and gears that work in perfect unison to power the ride.

Heavy-duty electrical panels line the walls, adorned with warning labels like 'High Voltage' and blinking indicator lights in an array of colors. Overhead, labeled conduits and wires snake across the ceiling, connecting systems with meticulous precision.

A cluttered workbench holds tools and spare parts—wrenches, bolts, and lubricants—alongside open maintenance logs marked with greasy fingerprints. The air is thick with the smell of oil, metal, and a faint trace of ozone from the electrics.

A cooling fan spins in the corner, barely cutting through the room’s warmth. The hum of machinery is occasionally punctuated by clinking chains and the sharp hiss of hydraulic fluid. The floor, a mix of metal grates and worn concrete, reflects years of use and maintenance.

Bright fluorescent lights in wire cages illuminate the space, highlighting the intricate systems at work. The south mechanical room is the ride’s powerhouse, where every movement is controlled with precision to deliver its thrilling experience." 

door7 is a wooden door. The color of door7 is gray. The description of door7 is "It[']s [printed name of item described]. It has the word 'Dungeon' written on it." The silver key unlocks it. door7 is west of the Mechanical Room South and east of the Dungeon. 

Section 6 - Generator Room

The Generator Room is a dark room. The Generator Room is south of the Mechanical Room South. "
The generator room is a compact, utilitarian space where the lifeblood of the carnival’s power is produced. Its reinforced concrete walls bear grime, oil streaks, and faint graffiti from past workers. The air carries a mix of diesel, hot metal, ozone, and damp earth, creating a distinctly industrial scent.

At the center, the main generator hums steadily, its scuffed steel casing evidence of years of service. Thick rubberized cables extend from it like veins, connecting to junction boxes and circuit breakers along the walls. A large panel nearby is cluttered with buttons, switches, and gauges, many with faded labels like 'Fuel Intake' and 'Emergency Shutoff.' A flickering display screen shows power levels and load distribution.

The rough concrete floor is uneven, marked by small puddles of spilled fuel or condensation. Shelves along the walls hold spare parts—filters, spark plugs, and wire coils—while tools lie scattered on a workbench beside a grease canister and a worn maintenance manual.

A single industrial bulb in a protective cage casts harsh light, leaving deep shadows across the machinery. In the corner, a vent fan whirs faintly, struggling to cool the warm, vibrating air. A row of diesel canisters gleams beneath a faded safety poster that warns, 'Fuel Safely—No Open Flames!'

Though isolated and utilitarian, the generator room is the carnival’s heartbeat, powering its lights, rides, and sounds. Its quiet separation from the carnival’s chaos serves as a stark reminder of the machinery driving the magic." 

The graffiti is here. It is scenery. instead of examining the graffiti, say "The graffiti is varied, from 'Peace, Love, Goodwill on Earth' to 'Anarchy Rules'."
The junction boxes are here. They are scenery.
The large panel is here. It is scenery.

door9 is a wooden door. The color of door9 is indigo. The description of door9 is "It[']s [printed name of item described]. It has the word 'Guillotine' written on it." The silver key unlocks it. door9 is west of the Generator Room and east of the Guillotine Room. 

Section 7 - Storage Room

The Storage Room is a dark room. The Storage Room is south of the Electrical Room. "The carnival storage room is a cramped yet essential space, tucked away from the bustling grounds. Its rusted metal and peeling wooden walls bear the marks of years of use, while the air hangs heavy with grease, dust, damp canvas, and a faint trace of stale popcorn.

Shelves overflow with supplies—boxes of lightbulbs, spools of wire, and assorted ride parts—piled without order. Tangled flags and strings of lights dangle from hooks, while crates labeled 'GAME PRIZES' and 'RIDE PARTS' hold items like stuffed animals and plastic toys. Folded tarps and tent poles teeter in one corner.

The room’s center is dominated by larger objects: spare ride seats, unassembled booths, and faded attraction pieces like a scratched carousel horse, all hidden beneath protective tarps.

Near the entrance, a battered desk is cluttered with maintenance logs, tools, and empty coffee cups. Above it, a corkboard brims with ride schedules, repair requests, and notes. A flickering fluorescent bulb casts uneven shadows, adding an eerie atmosphere.

The floor, a rough blend of concrete and dirt, is littered with bolts, screws, and wire scraps. In the dim corners, the scuttle of rats and the glint of cobwebs underline the room[']s gritty nature.

Chaotic yet indispensable, this hidden space powers the carnival’s magic, ensuring every ride and booth runs seamlessly."

The supplies are here. They are scenery.
The seats are here. They are scenery.
The booths are here. They are scenery.
The horse is here. It is scenery.
The rats are here. The rats are scenery. The description of the rats is "You see rats scurry in all directions fleeing from the light cast by you."

door11 is a wooden door. The color of door11 is khaki. The description of door11 is "It[']s [printed name of item described]. It has the word 'Ride Exit' written on it." The silver key unlocks it. door11 is west of the Storage Room and east of the Ride Exit. 
	
Chapter 4 - Hell Ride

Section 1 - Ride Entrance

Before going south when the location is the Ticket Booth and the Head of the Line is unvisited:
	display Figure of HellRideEntrance;
	continue the action.
	
Before looking when the location is the Head of the Line:
	display Figure of HellRideEntrance.

Test Ride with "brief / s / buy hell ride ticket / s / give hell ride ticket to operator / s / enter hell ride car / wait / z / z / z / z / z / z".

HellRideAuto is a scene. 
HellRideAuto begins when the player is in the hell ride car for 3 turns.
HellRideAuto ends when the number of filled rows in the Table of HellRide Events is 0.

When HellRideAuto begins:
	say "The car moves forward and the safety bar begins to lower."
	
When HellRideAuto ends:
	end the story finally saying "You have died.".
	
Every turn during HellRideAuto:
	repeat through Table of HellRide Events:
		say "[bold type][locale entry][roman type][line break][event entry][paragraph break]Mist fills the area as you move to the next room...
[paragraph break]";
		blank out the whole row;
		rule succeeds.
		
Table of HellRide Events
locale	event
"Ride Entrance"	"The cars move forward, the safety bar locked in place, as the entrance to Hell Ride looms ahead—a grotesque facade of twisted metal and carved wood, illuminated by flickering blood-red lights. The air carries a faint sulfuric tang mingled with the sweet aroma of carnival popcorn.

A towering archway of flames, spikes, and grinning skulls frames the entrance, crowned by flickering letters that read 'HELL RIDE', pulsing like a heartbeat. Below, crouching demon sculptures extend clawed hands in a sinister invitation. Wooden doors cover the entrance, whispering with faint, menacing chuckles as distorted organ music grows louder, punctuated by shrieks and grinding machinery.

A crooked sign warns, 'One Ticket Admission: Enter If You Dare!' Nearby, a carnival barker with a theatrical, raspy voice calls out, 'Step right up! The gates of hell are open—will you brave the darkness?'

Inside, near-total darkness is broken by flashes of sickly green light revealing twisted paths and grotesque shapes. Beyond the threshold lies only uncertainty and terror."
"The Stocks"	"The public square is a cobblestone expanse bordered by weathered timber-framed buildings. The air carries the mingling scents of chimney smoke, damp earth, and the faint tang of a nearby smithy. At its center, crude wooden stocks stand as a grim focal point, their beams weathered and stained from years of use. Iron clasps lock captives in degrading postures, their tattered clothing offering little protection from the biting wind.

The punished individuals hang their heads in shame, their faces etched with despair. Around them, the crowd revels in cruelty—a wiry man spits insults with gleeful laughter, while a stout woman throws overripe vegetables, each impact sparking jeers. Even children join in, pointing and mocking with mischievous delight.

The square hums with noise: the crowd’s taunts, the crack of objects hitting wood, and the quiet murmurs of the suffering captives. Overhead, a gray sky threatens rain, indifferent to the spectacle below. The jeering mob ignores its ominous weight, too engrossed in their shared cruelty to notice nature’s disapproval."
"The Gallows"	"The public square, slick with morning drizzle, lies under a brooding, overcast sky. At its center looms the gallows, a weathered wooden platform with thick ropes swaying ominously. The crowd stands in somber silence, broken by the shuffle of feet or faint murmurs, their eyes fixed on the grim scene.

A hooded executioner, cloaked in black, adjusts the frayed noose with practiced precision, his cold presence exuding purpose. Beside him stands the condemned man, pale and trembling, his bound hands behind him. Beads of sweat mix with rain on his haunted face as his darting eyes search the indifferent crowd. Each shallow breath forms a fleeting cloud in the chilly air—a fragile reminder of his fleeting life.

Vendors hawk bread and cider, while children strain for a better view. An old man clutches a rosary, whispering prayers, as others smirk and place bets. Above, the bell tower tolls, its mournful chime marking the passage of the man’s final moments. A raven perches on the gallows’ beam, its unblinking gaze fixed on the scene below.

As the executioner adjusts the noose around the man’s neck, the crowd falls silent, the air thick with dread. Distant thunder rumbles faintly, as if the heavens themselves await the inevitable."
"The Stake"	"The public square is steeped in grim silence, broken only by the crackling of flames. At its center, three wooden stakes rise from a pyre of logs and kindling, darkened by smoke from past executions. Bound to the stakes are three women, their faces reflecting defiance, resignation, and terror.

A crowd encircles the scene, expressions ranging from morbid fascination to righteous fury. Children cling to their mothers, while elders nod solemnly. Some jeer and throw stones; others murmur prayers or avert their gaze.

The executioner, hooded and clad in a leather apron, steps forward with a blazing torch, igniting the pyre in a sudden roar. Flames climb rapidly as thick smoke coils upward. The condemned cry out, their voices mingling with the crackle of fire. The oppressive heat radiates outward, pressing against the silent, uneasy crowd.

Gray clouds loom overhead, nature’s somber backdrop to the grim spectacle. A raven caws from the bell tower as slow church bells toll, each strike punctuating the tragedy. As the pyre burns, some onlookers remain transfixed while others quietly slip away, the square heavy with ash, smoke, and the echoes of the condemned."
"The Dungeon"	"The dungeon is a dark, suffocating chamber carved into the earth, its stone walls slick with moisture and grime. The air reeks of sweat, blood, mildew, and burning oil from flickering torches mounted on rusted sconces. Shadows twist on the walls, creating grotesque, unsettling shapes in the dim light.

Chains hang from walls and ceilings, their faint clinking blending with the moans and occasional screams of prisoners. Water drips rhythmically from a cracked ceiling, adding to the chamber[’]s eerie ambiance.

The room is littered with instruments of torment: a splintered rack, a glowing brazier holding bloodstained tools, and a spiked chair gleaming faintly in the light. Prisoners endure their own horrors—one stretched on the rack, another hanging limply from manacles, and a third gasping weakly in the spiked chair.

The hooded torturer moves with detached precision, their leather apron stained with the evidence of countless victims. They work silently, indifferent to the agony surrounding them.

Above, rats scuttle in the shadows, and the low ceiling presses down like the weight of despair. The sole exit, a riveted iron-bound door, feels more like a barrier to hope than a path to freedom.

This is a realm of suffering and hopelessness, where life and death blur, and torment is the only certainty."
"The Guillotine"	"The public square buzzes with tense anticipation, a crowd gathered under gray skies that cast a somber light on the cobblestones. At the center, a stark wooden platform looms, its purpose grim and unavoidable.

A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd’s gaze. Their tattered clothing, once fine, reflects the fall that led them to this moment.

The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event’s gravity. Near the edge of the platform, the town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'

The condemned flinches but remains silent as the executioner—a hooded figure in black—stands ready beside the guillotine, its blade gleaming faintly in the dim light. The murmurs of the crowd fall into silence at the executioner’s signal, leaving only the rustle of wind and the creak of the scaffold.

As the condemned approaches the guillotine, a crow caws sharply from a nearby rooftop, its cry echoing through the square like an omen. The crowd leans forward, breath held, as justice and mortality converge on the scene.

There is just one problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated.

Looks like your goose is cooked. Say 'Goodnight, Gracie!' 

You are stupefied as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable."

Instead of doing something other than waiting, looking, listening or examining during HellRideAuto:
	say "You are having such a good time that you don['] want to do anything but sit and enjoy the ride."
	
Ride Entrance is a room. Ride Entrance is south of Head of the Line. "The cars that will take you into the fearsome Hell Ride stop here for you to board.  To the south is the track that will take you into the ride. The safety bars lower as the cars move into the darkness. To one side, the darkness looks just a little bit darker."

The Hell Ride car is a vehicle in the Ride Entrance. The description of the Hell Ride car is "A car waits to take you through the horror that is Hell Ride."

Before going south when the player is in the Ride Entrance:
	say "You can[']t go that way." instead;
	continue the action.

Section 2 - Stocks Room

After going when the location is the Stocks Room and the Stocks Room is unvisited:
	display Figure of RideStocks;
	continue the action.
	
Before looking when the location is the Stocks Room:
	display Figure of RideStocks.

The Stocks Room is south of the Ride Entrance. "The public square is a cobblestone expanse bordered by weathered timber-framed buildings. The air carries the mingling scents of chimney smoke, damp earth, and the faint tang of a nearby smithy. At its center, crude wooden stocks stand as a grim focal point, their beams weathered and stained from years of use. Iron clasps lock captives in degrading postures, their tattered clothing offering little protection from the biting wind.

The punished individuals hang their heads in shame, their faces etched with despair. Around them, the crowd revels in cruelty—a wiry man spits insults with gleeful laughter, while a stout woman throws overripe vegetables, each impact sparking jeers. Even children join in, pointing and mocking with mischievous delight.

The square hums with noise: the crowd’s taunts, the crack of objects hitting wood, and the quiet murmurs of the suffering captives. Overhead, a gray sky threatens rain, indifferent to the spectacle below. The jeering mob ignores its ominous weight, too engrossed in their shared cruelty to notice nature’s disapproval." 

The wooden stocks are here. The wooden stocks are a supporter. The wooden stocks are fixed in place. The description of the wooden stocks is "At the square[']s center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures." 

Instead of looking under a thing which is underlaid by the aqua fuse when the fuse1 is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;
	now the fuse1 is found.
	
Section 3 - Gallows Room

After going when the location is the Gallows Room and the Gallows Room is unvisited:
	display Figure of RideGallows;
	continue the action.
	
Before looking when the location is the Gallows Room:
	display Figure of RideGallows.

The Gallows Room is south of the Stocks Room.  "The public square, slick with morning drizzle, lies under a brooding, overcast sky. At its center looms the gallows, a weathered wooden platform with thick ropes swaying ominously. The crowd stands in somber silence, broken by the shuffle of feet or faint murmurs, their eyes fixed on the grim scene.

A hooded executioner, cloaked in black, adjusts the frayed noose with practiced precision, his cold presence exuding purpose. Beside him stands the condemned man, pale and trembling, his bound hands behind him. Beads of sweat mix with rain on his haunted face as his darting eyes search the indifferent crowd. Each shallow breath forms a fleeting cloud in the chilly air—a fragile reminder of his fleeting life.

Vendors hawk bread and cider, while children strain for a better view. An old man clutches a rosary, whispering prayers, as others smirk and place bets. Above, the bell tower tolls, its mournful chime marking the passage of the man’s final moments. A raven perches on the gallows’ beam, its unblinking gaze fixed on the scene below.

As the executioner adjusts the noose around the man’s neck, the crowd falls silent, the air thick with dread. Distant thunder rumbles faintly, as if the heavens themselves await the inevitable."

The gallows platform is here. The gallows platform is a supporter. The gallows platform is fixed in place. Understand "gallows" as gallows platform. The description of the gallows platform is "At the center of the square, rising like a grim monument to mortality, stands the gallows—a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike." 

Instead of looking under a thing which is underlaid by crimson fuse when fuse3 is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;
	now fuse3 is found.

Section 4 - Stake Room

After going when the location is the Stake Room and the Stake Room is unvisited:
	display Figure of RideStake;
	continue the action.
	
Before looking when the location is the Stake Room:
	display Figure of RideStake.

The Stake Room is south of the Gallows Room. "The public square is steeped in grim silence, broken only by the crackling of flames. At its center, three wooden stakes rise from a pyre of logs and kindling, darkened by smoke from past executions. Bound to the stakes are three women, their faces reflecting defiance, resignation, and terror.

A crowd encircles the scene, expressions ranging from morbid fascination to righteous fury. Children cling to their mothers, while elders nod solemnly. Some jeer and throw stones; others murmur prayers or avert their gaze.

The executioner, hooded and clad in a leather apron, steps forward with a blazing torch, igniting the pyre in a sudden roar. Flames climb rapidly as thick smoke coils upward. The condemned cry out, their voices mingling with the crackle of fire. The oppressive heat radiates outward, pressing against the silent, uneasy crowd.

Gray clouds loom overhead, nature’s somber backdrop to the grim spectacle. A raven caws from the bell tower as slow church bells toll, each strike punctuating the tragedy. As the pyre burns, some onlookers remain transfixed while others quietly slip away, the square heavy with ash, smoke, and the echoes of the condemned."

The pyre is scenery in the Stake Room. The pyre is a container. understand "bonfire", "fire", "stake", "stakes", "flame", and "flames" as the pyre. The description of the pyre is "At the center, three wooden stakes rise ominously from a circular pyre of logs and kindling, their rough surfaces darkened by smoke from countless such scenes before. Bound tightly to these stakes are three women, their wrists and ankles secured with coarse, heavy ropes. Their faces tell different stories—one of defiance, another of resignation, and the third of pure terror." 

Instead of taking the emerald fuse when fuse5 is lost:
	say "You find [the noun]!";
	now the noun is in the player;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;
	now fuse5 is found.

Section 5 - Dungeon

After going when the location is the Dungeon and the Dungeon is unvisited:
	display Figure of RideDungeon;
	continue the action.
	
Before looking when the location is the Dungeon:
	display Figure of RideDungeon.
	
The Dungeon is south of the Stake Room. "The dungeon is a dark, suffocating chamber carved into the earth, its stone walls slick with moisture and grime. The air reeks of sweat, blood, mildew, and burning oil from flickering torches mounted on rusted sconces. Shadows twist on the walls, creating grotesque, unsettling shapes in the dim light.

Chains hang from walls and ceilings, their faint clinking blending with the moans and occasional screams of prisoners. Water drips rhythmically from a cracked ceiling, adding to the chamber’s eerie ambiance.

The room is littered with instruments of torment: a splintered rack, a glowing brazier holding bloodstained tools, and a spiked chair gleaming faintly in the light. Prisoners endure their own horrors—one stretched on the rack, another hanging limply from manacles, and a third gasping weakly in the spiked chair.

The hooded torturer moves with detached precision, their leather apron stained with the evidence of countless victims. They work silently, indifferent to the agony surrounding them.

Above, rats scuttle in the shadows, and the low ceiling presses down like the weight of despair. The sole exit, a riveted iron-bound door, feels more like a barrier to hope than a path to freedom.

This is a realm of suffering and hopelessness, where life and death blur, and torment is the only certainty."

The iron chair is scenery in the Dungeon. The iron chair is a supporter. understand "spiked" and "seat" as iron chair. The description of the iron chair is "A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light." 

The chains are here. They are scenery. The description of the chains is "The chains rattle against the walls."
The rack is here. It is scenery. The description of the rack is "The rack has a prisoner splayed in four directions."
The brazier is here. It is scenery. The description of the brazier is "It is glowing red with an infernal heat."
The riveted iron-bound door is here. It is scenery.

Instead of looking under a thing which is underlaid by the gray fuse when fuse7 is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;
	now fuse7 is found.
	
Section 6 - Guillotine Room

After going when the location is the Guillotine Room and the Guillotine Room is unvisited:
	display Figure of RideGuillotine;
	continue the action.
	
Before looking when the location is the Guillotine Room:
	display Figure of RideGuillotine.

The Guillotine Room is south of the Dungeon. "The public square buzzes with tense anticipation, a crowd gathered under gray skies that cast a somber light on the cobblestones. At the center, a stark wooden platform looms, its purpose grim and unavoidable.

A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd’s gaze. Their tattered clothing, once fine, reflects the fall that led them to this moment.

The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event’s gravity. Near the edge of the platform, the town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'

The condemned flinches but remains silent as the executioner—a hooded figure in black—stands ready beside the guillotine, its blade gleaming faintly in the dim light. The murmurs of the crowd fall into silence at the executioner’s signal, leaving only the rustle of wind and the creak of the scaffold.

As the condemned approaches the guillotine, a crow caws sharply from a nearby rooftop, its cry echoing through the square like an omen. The crowd leans forward, breath held, as justice and mortality converge on the scene.

There is just lone problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated."

The guillotine platform is here. The guillotine platform is a supporter. Understand "scaffold" as guillotine platform. The description of the guillotine platform is "At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out." 

Instead of looking under a thing which is underlaid by the indigo fuse when fuse9 is lost:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is carried by the player;
	now every thing which underlies the noun does not underlie the noun;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;
	now fuse9 is found.
	
Section 7 - Ride Exit

After going when the location is the Ride Exit and the Ride Exit is unvisited:
	display Figure of RideExit;
	continue the action.
	
Before looking when the location is the Ride Exit:
	display Figure of RideExit.

The Ride Exit is south of the Guillotine Room. "The exit of Hell Ride is designed to leave riders with lingering unease. Emerging from a dark corridor with peeling black and red-streaked walls, flickering lights cast erratic shadows on the uneven floor. The air is cool and damp, carrying a faint metallic tang, while faint whispers and distant screams echo softly in the background.

Riders step into a small courtyard enclosed by jagged, rusted fencing draped with cobwebs and plastic bones. Overhead, a weathered sign reads, 'You[’]ve Survived… For Now.' Nearby, carnival workers in tattered costumes watch silently, occasionally muttering cryptic remarks like, 'Not everyone makes it out.'

A merchandise stand glows red, selling items like Hell Ride Survivor shirts and devil horns. Beyond the fencing, the cheerful carnival lights and sounds feel jarring, contrasting sharply with the ride’s oppressive atmosphere.

The exit ensures Hell Ride isn’t just an experience—it lingers, blurring the line between thrill and fear."

The merchandise stand is scenery in the Ride Exit. The merchandise stand is a container. Understand "stand" as merchandise. The description of the merchandise is "The stand is bathed in red light, adding to the ominous mood." 

Instead of taking the khaki fuse when the fuse11 is lost:
	say "You find [the noun]!";
	now the noun is carried by the player;
	say "Taken.";
	play the sound of Bell;
	increase score by 5;
	now fuse11 is found.
	
Chapter 5 - Second Floor

Section 1 - Holding Room

The Holding Room is a room. "I am a room to hold things."

every turn when the location is the holding room, say "Danger, Will Robinson! This can never happen!"

Section 2 - Dark Hallway

Dark Hallway is a dark room. "This is a poorly lit hallway. Ahead to the west you can see the glow of an open door."
	
Section 3 - Control Room

Control Room is a dark room. The Control Room is west of the Dark Hallway. The Control Room is a scored room. "The backstage control room is a plain, functional hub where the carnival’s rides, lights, and attractions are managed. Gray industrial walls, scuffed and greasy, surround a large monitor streaming live carnival feeds. Beneath them, control panels with labeled dials, colored buttons, and lights oversee the systems scattered about the room. Glancing that the control panels, you can see they are [if the switch count is 6]lit up like a Christmas tree[otherwise]dark[end if].

The hum of electronics fills the air, punctuated by the crackle of a radio: 'Maintenance to Bumper Cars—wrench needed!' The worn floor is scattered with papers, tools, and coffee cups. A cluttered desk holds logs and schedules, while a corkboard above displays charts and red-marked notes like 'Check Zipper circuit breakers.'

A flickering light casts cold shadows as the metallic tang of machinery mixes with dampness. Functional yet essential, this hidden space ensures the carnival’s magic runs seamlessly. On one wall is a large switch[if the big switch is switched on] with sparks arcing out from it[end if].

A dark hallway lies to the east." 

The big switch is a device in the control room. The big switch is fixed in place. The big switch is switched on. The description of the big switch is "This is a large switch. It[']s the kind Dr. Frankenstein might pull to route the lightning to his creature.[if the big switch is switched on] Currently there are sparks arcing out from the switch.[end if]"

electrocuted is a truth state that varies. electrocuted is false.
instead of switching off the big switch:
	if the player is wearing the gloves:
		now the electrical room is not electromagnetic;
		play sound of Bell;
		increase the score by 5;
		continue the action;
	otherwise:
		now electrocuted is true;
		end the story finally.

instead of switching on the big switch:
	now the electrical room is electromagnetic;
	continue the action.

The cluttered desk is here. The desk is scenery. 
A corkboard is here. The corkboard is scenery.
The charts are here. They are scenery.

every turn when the location is the Control Room:
	count the switches;
	count the dials;
	[say "switch count: [switch count], dial count: [dial count].";]
	if switch count is not 6:
		now all buttons are switched off;
		repeat with item running through dials:		
			now the dial setting of the item is 0		

Section 4 - Control Panels

A control panel is a kind of open container. 
Understand "control" and "panel" as a control panel.
A control panel is scenery.
A control panel has a color. Understand the color property as describing a control panel.
A control panel has a number called a panel id. Understand the panel id property as describing a control panel.

Control Panel One is a control panel in the Control Room. The panel id of Control Panel One is 1. The color of Control Panel One is aqua.
Control Panel Three is a control panel in the Control Room. The panel id of Control Panel Three is 3. The color of Control Panel Three is crimson.
Control Panel Five is a control panel in the Control Room. The panel id of Control Panel Five is 5. The color of Control Panel Five is emerald.
Control Panel Seven is a control panel in the Control Room. The panel id of Control Panel Seven is 7. The color of Control Panel Seven is gray.
Control Panel Nine is a control panel in the Control Room. The panel id of Control Panel Nine is 9. The color of Control Panel Nine is indigo.
Control Panel Eleven is a control panel in the Control Room. The panel id of Control Panel Eleven is 11. The color of Control Panel Eleven is khaki.

instead of examining a control panel:
	say "Each control panel is populated with a dial, a button, and a light. From left to right, the colors are aqua, crimson, emerald, gray, indigo, and khaki. Below the lights is a row of similarly colored dials and below that is a row of buttons. (This AI and human generated image is poor and is meant for comparison purposes only. LOL) The control panels are [if switch count is 6]lit up like a Christmas tree[otherwise]dark[end if].[paragraph break]";
	say "[Noun] is [if switch count is 6]lit[otherwise]dark[end if]. The [color of the noun] dial is set to [the dial setting of the corresponding dial of the noun]. The [color of the noun] light is now [if the corresponding button of the noun is switched on]on[otherwise]off[end if].";
	if switch count is 6 and every button is switched off:
		display the figure of ControlPanel instead;
		now the figure id of the monitor is 0;
		stop the action;
	otherwise:
		let N be the panel id of the noun;
		now the figure id of the monitor is N;
		choose a row with a link number of N in the table of monitor descriptions;
		now ControlPanelImage is figure choice entry;
		if the corresponding dial of the noun is properly set and the corresponding button of the noun is switched on:
			display figure choice entry.
	
Definition: A thing is control-fitted if it is incorporated by a control panel.

[This will allow us to refer to the "corresponding" socket, switch, or indicator; i.e. the one from the same panel. This particular phrase works because there is only ever one each of these in a panel. If we decide later to have, say, three sockets per panel, only this phrase will have to be changed -- using more complex logic -- but the rest of the code could be left as-is.]
To decide what thing is --/the corresponding (name of kind of value K) of --/the (CT - a control-fitted thing):
	let H be the holder of CT;
	decide on a random K that is part of H.[<- there will only ever be one of these]
	
To decide what thing is --/the corresponding (name of kind of value K) of --/the (T - a thing):
	decide on a random K that is part of T.[<- there will only ever be one of these]
	
[The following won't actually give all the panel's components a color property matching the panel, but it will allow us to refer to a "shared color" of these components and get the desired result.]
To decide what color is --/the shared color of --/a/the (CT - a control-fitted thing):
	decide on the color of the holder of CT.

Section 5 - Buttons

A button is a kind of device.  A button is part of every control panel. 
A button is usually switched off.
A button is always fixed in place.

The description of a button is "This is a [color of the holder of the item described] colored button.".

The printed name of a button is "a [color of the holder of the item described] button".

To decide what number is --/the button id of (B - a button):
	decide on the panel id of the holder of B.
	
To decide what color is --/the color of (B - a button):
	decide on the color of the holder of B.

Understand "button [something related by reversed incorporation]" as a button.
Understand "[something related by reversed incorporation] button" as a button.

Instead of pushing a switched off button (this is the redirect push to button on rule):
	try switching on the noun.

Instead of pushing a switched on button (this is the redirect push to button off rule):
	try switching off the noun.
	
Last report switching on a button when the switch count is 6 and the dial count is 6 (this is the final report switching on a button rule):
	let N be the panel id of the holder of the noun;
	choose a row with a link number of N in the table of monitor descriptions;
	now ControlPanelImage is figure choice entry;
	say "The monitor flickers for a second and the scene it displays changes to something different.";
	say "[description entry][line break]";
	say "The [color of the holder of the noun] light is now on.";
	display ControlPanelImage;
	now all buttons are switched off;
	now the noun is switched on;
	now the figure id of the monitor is N;
	if the color of the holder of the noun is indigo:
		play the sound of Bell;
		increase score by 5;
		end the story finally;

Last report switching off a button (this is the final report switching off a button rule):	
	choose a row with a link number of 0 in the table of monitor descriptions;
	now ControlPanelImage is figure choice entry;
	say "The monitor turns off and the screen goes black.";
	say "[description entry][line break]";
	say "The [color of the holder of the noun] light is now off.";
	display ControlPanelImage;
	now the figure id of the monitor is 0;
	now all buttons are switched off.

Section 6 - Dials

A dial is a kind of thing. A dial is part of every control panel.
A dial is fixed in place.
A dial has a number called a dial setting. 

The description of a dial is "This is [color of the holder of the item described] colored dial. It is currently set to [dial setting of the item described]. I bet you could SPIN it.".

The printed name of a dial is "[color of the holder of the item described] dial".

To decide if (D - a dial) is properly set:
	if the panel id of the holder of D is the dial setting of D :
		decide yes;
	decide no.
	
To decide what number is --/the dial id of (D - a dial):
	decide on the panel id of the holder of D.
	
To decide what color is --/the color of (D - a dial):
	decide on the color of the holder of D.
	
To decide what number is --/the dial setting of (D - a dial):
	decide on the dial setting of D.

Understand "dial [something related by reversed incorporation]" as a dial.
Understand "[something related by reversed incorporation] dial" as a dial.

Spinning it to is an action applying to one thing and one number. 
Check spinning it to: if the noun is not a dial, say "[The noun] does not spin." instead. 
Report spinning it to: 
	if the number understood is less than 0 or the number understood is greater than 20:
		say "The [color of the holder of the noun] colored dial can only be set from 0 to 20.";
		stop the action;
	otherwise:
		say "The [color of the holder of the noun] colored dial is now set to [the number understood].";
		if the switch count is not 6:
			say "Before your eyes, the dial spins back to 0.";
			now the dial setting of the noun is 0;
		otherwise:
			now the dial setting of the noun is the number understood.

Understand "spin [something] to [a number]" as spinning it to. Understand "turn [something] to [a number]" as spinning it to. Understand "set [something] to [a number]" as spinning it to.
	
The dial count is a number that varies. The dial count is 0.
To count the dials:
	now the dial count is 0;
	if control panel one's dial is properly set, increment the dial count;
	if control panel three's dial is properly set, increment the dial count;
	if control panel five's dial is properly set, increment the dial count;
	if control panel seven's dial is properly set, increment the dial count;
	if control panel nine's dial is properly set, increment the dial count;
	if control panel eleven's dial is properly set, increment the dial count.

Section 7 - Lights

A light is a kind of thing. A light is part of every control panel.
A light is fixed in place.

The description of a light is "This is [a printed name of the item described]. The light is [if the corresponding button of the item described is switched on]on[otherwise]off[end if]."

The printed name of a light is "[a color of the holder of the item described] colored light".

To decide what number is --/the socket id of (L - a light):
	decide on the panel id of the holder of L.
	
To decide what color is --/the color of (L - a light):
	decide on the color of the holder of L.
	
Understand "light [something related by reversed incorporation]" as a light.
Understand "[something related by reversed incorporation] light" as a light.

Section 8 - The Monitor

ControlPanelImage is a figure name that varies. ControlPanelImage is Figure of ControlPanel.

The monitor is in the Control Room. The monitor is scenery. Understand "screen" as monitor. The monitor has a number called the figure id. The figure id is 0.

instead of examining the monitor:
	let N be the figure id of the monitor;
	choose a row with a link number of N in the table of monitor descriptions;
	say "The monitor flickers for a second and the scene it displays changes to something different.";
	say "[description entry][line break]";
	now ControlPanelImage is figure choice entry;
	display ControlPanelImage.

Part 3 - Regions

The Midway is a region. Parking Lot, Ticket Booth, Concession Stand, High Striker, Show Facade, Show Tent, Head of the Line,
Ferris Wheel Ride, Bumper Cars Ride, Fortune Teller, Carousel Ride, Flip a Coin Game, and the Pitcher's Mound are in the Midway. The sky is in the Midway.

HellRide is a region. Ride Entrance, Stocks Room, Gallows Room, Stake Room, Dungeon, Guillotine Room, Ride Exit is in HellRide.

Electrical Area is a region. Electrical Room, Electrical Closet One, Electrical Closet Three, Electrical Closet Five, Electrical Closet Seven, Electrical Closet Nine, and Electrical Closet Eleven are in the Electrical Area.

Backstage is a region. Dark Passage, Maintenance Office, Crawl Space, Mechanical Room North, Mechanical Room South, Generator Room, Storage Room are in Backstage.

Second Floor is a region. Dark Hallway, Control Room, and Holding Room are in the Second Floor.

