Part 1 - World Model

Chapter 1 - Inform Settings, Biblio Card, and Includes

Use dynamic memory allocation of at least 32768.
Use maximum text length of at least 2048.

The story title is "Hell Ride".
The story author is "No Shoes".
The story headline is "The ride of a lifetime...".
The story genre is "Horror".
The release number is 1.
The story description is "You've decided to stay and enjoy the carnival anyway."
The story creation year is 2024.

Release along with cover art.

Include Locksmith by Emily Short.

Include Rideable Vehicles by Graham Nelson.

Include Swearing Reloaded by Shin

Include Singing Reloaded by Shin

Use scoring.
Use American Dialect.
Use serial comma.
The maximum score is 15.
When play begins, seed the random-number generator with 1234.
The block giving rule is not listed in the check giving it to rules.

Chapter 2- Money Mechanics

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
	
The player carries a wallet. The wallet contains money. The price of the money is $15.00. The printed name of the money is "[price of the money] in cash". Understand "cash" as the money.

Instead of taking the money:
	say "Best to leave it alone until you need to buy something."

Instead of buying something free:
	say "[The noun] is yours already."

Instead of buying the money:
	say "The money belongs to you; you buy things with it."
	
Chapter 3- Drink Mechanics

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

Chapter 4- The Player

The description of the player is "You are despondent given that you and your date just had a huge fight and they stormed off. Maybe visiting the attractions at the carnival will make you feel better." 

Instead of examining the player:
	say "Oh, stop fussing. You look fine."

Chapter 5- Figures and Sounds

Figure of Hell Ride is the file "HellRide.png".

Figure of Midway is the file "Midway.png".

Figure of TicketBooth is the file "TicketBooth.png".

Figure of ConcessionStand is the file "ConcessionStand.png".

Figure of LittleEgyptFacade is the file "LittleEgyptFacade.png".

Figure of LittleEgyptShow is the file "LittleEgyptShow.png".

Figure of HighStriker is the file "HighStriker.png".

Figure of HellRideEntrance is the file "RideEntrance.png".

Sound of Strongman Bell is the file "StrongmanBell.ogg".

Chapter 6- Miscellaneous Goodies

Test Misc with "get blueberries / xyzzy / hello sailor / please get the dime".

A thing can be seen or unseen.

Carry out examining a thing:
	now the noun is seen.
	
After reading a command:
	if the player's command includes "please":
		say "Please do not say please.";
		reject the player's command.

[hello sailor]
Asking someone about something is speech. Telling someone about something is speech. Answering someone that something is speech. Asking someone for something is speech.

The Sailor is a man. The sailor is in the Parking Lot. The sailor is scenery.

Helloing is an action applying to one thing. Understand "hello [someone]" as helloing. understand "[someone] hello" as helloing.

Instead of helloing the sailor:
	say "Nothing happens here."
	
Instead of speech when the noun is Sailor:
	say "Nothing happens here."
	
every turn:
	now the sailor is in the location.
	
[xyzzy]
Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy.

Casting xyzzy is an action applying to nothing.

Carry out casting xyzzy:
	say "A voice nearby says 'Plugh'."
	
Section 7 - Testing descriptions - Not for release

When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."

Part 2 - The Game

Chapter 1 - The Midway

The Midway is a region. Parking Lot, Kiosk, Concession Stand, High Striker, Show Facade, Show Tent, and Head of the Line are in the Midway;

Section 1 - Parking Lot

Test Me with "Test Egypt /  Test Concession / Test Striker / Test Misc / Test Ride".

When play begins:
	display the figure of Hell Ride;
	say "The carnival is in town and you had a date with your sweetie to visit it. After dinner and just as you arrive at the carnival, you and your date have a terrible fight. They storm off leaving you alone at the carnival. You decide to stay at the carnival anyway.[paragraph break]The midway is bustling with activity—lights flashing, the sounds of carnival music, and the laughter of children mix with the occasional shrill scream of a roller coaster. Various attractions line the street, promising thrills, challenges, and wonders."

The Parking Lot is a room. The parking lot is north of the Kiosk. "You are in a parking lot full of cars. The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush[otherwise]The bush has been picked clean.[end if]"

Cars is here. cars is scenery. Understand "car" as cars. The description of cars is "There are all kinds of vehicles in the parking lot."

The blueberry bush is here. the blueberry bush is scenery. the blueberry bush is a container. the blueberry bush is not portable. the blueberry bush contains blueberries. The description of the blueberries is "The blueberries are ripe, juicy, and a deep blue color.".

The dime is here. The description of the dime is "It's a dime. Ten cents. One tenth of a dollar."

After taking blueberries:
	increase score by 5;
	say "Good Job!".

Section 2 - Kiosk

Before going south when the location is the Parking Lot and the Kiosk is unvisited:
	display Figure of TicketBooth.
	
Before looking when the location is the Kiosk:
	display Figure of TicketBooth.

The kiosk is a room. The kiosk is north of Head of the Line. The kiosk is east of the Show Facade. The kiosk is west of High Striker. The kiosk is northeast of the Concession Stand. The kiosk is south of the Parking Lot. "You are standing in line at a kiosk at the carnival. The kiosk sells tickets to the Hell Ride attraction. The line for the ride forms to the south and the midway continues east and west from here. There is a concession stand to the south west. The kiosk is garishly painted in purple and green sparkles. There is a cashier here. [if cashier is carrying hell ride ticket]The Cashier has a Hell Ride ticket.[end if]"

The Hell Ride ticket is a thing. The price of the Hell Ride ticket is $2.50. The description of the Hell Ride ticket is "This Hell Ride ticket will 'Admit One' to the Hell Ride.[line break]It[']s a real 'E' ticket, baby!"

The Cashier is a man in the kiosk. The cashier carries the Hell Ride ticket. The description of cashier is "This is a bored teenager hired to sell ride tickets all week at this carnival. He's thinking about having a brewski with his bros after work.". 

After buying the hell ride ticket:
	increase score by 5;
	say "Well done!";
	

Section 3 - Concession Stand

Test Concession with "get blueberries / s / sw / l at treats / read menu / buy cola / buy popcorn / buy candy apple / buy cotton candy / buy pretzel / inventory / drink soda / g / g / g / g / i / ne / n".

Before going southwest when the location is the kiosk and the Concession Stand is unvisited:
	display Figure of ConcessionStand.
	
Before looking when the location is the Concession Stand:
	display Figure of ConcessionStand.

The Concession Stand is a room. "You are standing in front of a brightly lit Concession Stand. There is a menu to the right of the window. You can see the treats inside the stand."

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

A candy apple is here. The candy apple is edible. The price of a candy apple is $1.50. The description of the candy apple is "The candy apple is your typical carmel covered apple. It looks like it would get stuck in your teeth."

Cotton candy is here. Cotton candy is edible. The price of cotton candy is $1.50. The description of cotton candy is "The cotton candy is a mixture of pink and blue floss."

A soft pretzel is here. The soft pretzel is edible. The price of the soft pretzel is $1.50. The description of the soft pretzel is "The soft pretzel is sprinkled generously with salt."

Section 4 - High Striker

Test Striker with "get blueberries / s / e / buy mallet / hit lever with mallet / g / g / g / g / 2 / w / n".

Before going east when the location is the kiosk and the High Striker is unvisited:
	display Figure of HighStriker.
	
Before looking when the location is the High Striker:
	display Figure of HighStriker.

The High Striker is a room. "This area features a tall, eye-catching machine adorned with bright, colorful lights, typically red, yellow, and blue. A large sign at the top reads 'Test Your Strength!' in bold, playful lettering. The machine’s base is made of polished wood, with a polished, vintage appearance. At the center is a sturdy metal pole, with a large bell hanging at the top, signaling when a successful attempt has been made. Along the length of the pole are markings indicating how strong you are.  A nearby sign says, 'Buy a mallet, strike the bell, win a prize.'[if the strongman attendent contains the mallet] You can see an over-sized mallet here.[end if][paragraph break]Spectators gather around, cheering on participants and offering lighthearted jabs and encouragement, creating a lively, competitive atmosphere. The sound of the mallet hitting the target is followed by the resonant clang of the bell (if struck), alongside the buzz of carnival music in the background."

The markings are here. The markings are scenery. Understand "marking" and "sign" and "signs" as markings. The description of markings is "There are five levels marked on the pole: Weakling, Getting There, Average, Almost Theee, and Muscle Man."

The Strongman Attendent is here. The description of the Strongman Attendent is "An Attendent is standing here [if strongman attendent is carrying the mallet]holding a mallet[end if]." 

The Strongman Attendent carries the teddy bear, a swiss army knife, and a poster of Taylor Swift, and the mallet. The description of the teddy bear is "This is a teddy bear like you had when you were a kid. Right down to the red bow around its neck." The Swiss Army knife is a container. The Swiss Army knife contains a screwdriver. The description of the swiss army knife is "This is the standard issue Swss Army knife with all the expected gadgets." The description of the poster of Taylor Swift is "This is a poster of America's swwetheart, Taylor Swift."

The lever is here. The lever is fixed in place. Understand "bullseye" and "target" as lever. The description of the lever is "There is a bullseye on the base. I guess this is where you have to aim the mallet."

The mallet is carried by the Strongman Attendent.  The Price of the mallet is $2.00. Understand "hammer" as mallet. The description of the mallet is "The mallet is over sized, perhaps to give you an advantage in the Strong Man game."

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
	say "You swing the mallet one more time. The bell rings as the striker reaches the top of the pole. The attendent says, 'You[']re a Muscle Man. Here's a prize for you.'";
	increase score by 5;
	say "Which prize would you like? 1) The stuffed teddy bear, 2) the Swiss Army knife, or 3) the poster of Taylor Swift?".
	
after Reading a command :
	if the player's command matches "1" and the location is the high striker:
		say "You are now holding a cute little teddy bear.";
		now the player carries the teddy bear;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "2" and the location is the high striker:
		say "You are now holding a Swiss Army knife.";
		now the player carries the swiss army knife;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "3" and the location is the high striker:
		say "You are now holding a poster of Taylor Swift.";
		now the player carries the poster of taylor swift;
		reject the player's command.

Section 5 - Show Facade

Before going west when the location is the kiosk and the Show Facade is unvisited:
	display Figure of LittleEgyptFacade.
	
Before looking when the location is the Show Facade:
	display Figure of LittleEgyptFacade.

Show Facade is a room. Show Facade is east of Show Tent. "[if location is unvisited]You head west through the midway, the bright lights of the carnival fading behind you as you approach a wooden booth. A sign above the entrance reads 'Little Egypt Show – A Journey Into the Mysterious and Exotic!' A rotund attendent, wearing a fez and a dazzling smile, gestures to a small sign beside him that says 'Dime Admission.'[paragraph break][end if] You are standing in front of a dark and mysterious tent filled with illusions and exotic performers. Perhaps there’s a fortune teller inside, offering cryptic clues about the player's journey or a hidden artifact that can be collected. There is a stage in front of the tent. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show.[if location is unvisited]The barker cries: [paragraph break]Ladies and gentlemen, boys and girls, gather 'round! [line break]Step right up and witness the spectacle that’s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await![end if]"

The Barker is a person in Show Facade. The description of the barker is "Here is a man dressed in black pants, a white shirt,a striped vest, a fez, and a dazzling smile. The barker cries: [paragraph break]Ladies and gentlemen, boys and girls, gather 'round! [line break]Step right up and witness the spectacle that’s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids—a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await!"

Check going west when the location is the Show Facade and the barker is not carrying the dime:
	say "It'll cost you a dime to go that way.";
	stop the action.
	
Check going west when the location is the Show Facade and the barker is carrying the dime:
	Continue the action.

After giving when the noun is dime and the second noun is barker:
	say "You hand over a dime, and the attendent nods, waving you through. As you step past the entrance, the air feels thicker, almost humid, and the sounds of the carnival fade away. You’ve entered an entirely different world now—one filled with the scents of incense and exotic spices, and the low, hypnotic music of a faraway land. Before you, a series of dimly lit tents stretch out, their flaps slightly swaying in the breeze. Intrigued, you take your first step into the Little Egypt Show. You can now head west into the show."

Section 6 - Show Tent	

Test Egypt with "get blueberries / get dime / s / w / l at barker / give dime to barker / w / sit in chair / z / z / z / z / z / e / e / n".

Before going west when the location is the Show Facade and the Show Tent is unvisited and barker is carrying the dime:
	display Figure of LittleEgyptShow.	
	
Before looking when the location is the the Show Tent:
	display Figure of LittleEgyptShow.		

The Show Tent is a room. The Show Tent is west of Show Facade. "You are inside the Little Egypt Show. The attraction facade is to the east. There is a folding chair should you want to sit down and wait for the show to start."

Little Eygpt is a woman. Little Egypt is in the Show Tent. Little Egypt is scenery. The description of Little Egypt is "Little Egypt is an exotic looking, beautiful woman who is draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."

The Stage is here. The Stage is scenery. The description of the Stage is "The stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'."

The Folding Chair is in Show Tent. The Folding Chair is a enterable scenery supporter. The description of the Folding Chair is "This is one of many folding chairs in the tent tonight."

LittleEgyptAuto is a scene. LittleEgyptAuto begins when the player is in the Show Tent for the second turn.

When LittleEgyptAuto ends:
	say "You applaud until your hands are sore. Did she wink at me?";
	increase score by 5.
	
Every turn during LittleEgyptAuto:
	repeat through Table of LittleEgypt Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		rule succeeds.

Instead of doing something other than waiting, looking, listening or examining during LittleEgyptAuto:
	say "You're much to entranced to do anything other than watch the show. You are riveted!".

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

Before going south when the location is the kiosk and the Head of the Line is unvisited:
	display Figure of HellRideEntrance.
	
Before looking when the location is the Head of the Line:
	display Figure of HellRideEntrance.

Head of the Line is a room. Head of the Line is south of Kiosk. Head of the Line is north of Ride Entrance. "You are standing in front of a ticket taker with his hand open waiting for your ticket. The entrance to the ride is south of here."

The Ride Attendent is a man in Head of the Line. The description of the Ride Attendent is "This is another bored teenager. His thoughts are entirely focused on a cheeseburger for lunch.";

Check going south when the location is Head of the Line and the Ride Attendent does not have the hell ride ticket:
	say "You[']ll need a ticket to go that way.";
	stop the action.

Chapter 2 - The Ride

HellRide is a region. Ride Entrance, Stocks Room, Gallows Room, Stake Room, Dungeon, Guillotine Room, Ride Exit is in HellRide.

Section 1 - Ride Entrance

Test Ride with "get blueberries / s / buy hell ride ticket / s / give ticket to attendent / s / enter car / wait / z / z / z / z / z / z / z".

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
"[bold type]Entrance[roman type][line break]The car has begun to move toward the entrance of the ride and the safety bar has been lowered. Surrounded by skulls, chains, and ominous creatures, the doors to the ride read 'Hell Ride' in fiery, glowing letters."
"[bold type]Hallway[roman type][line break]The doors open and your car passes through into the darkness.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Stocks[roman type][line break]You pass into a room which displays mannequins in stocks in a public square. The stocks are made of heavy wood. The townsfolk are there solely to harrass and ridicule the individuals on display. The punishees['] eyes are downcast as the shame and humiliation of their predicaments are realized. The wax figures are especially life like.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Gallows[roman type][line break]The next room is dominated by a gallows made of strong hardwood. Standing on the gallows is an executioner wearing a hood protecting his identity. Next to him is a man with a noose around his neck standing on a hatch ready to open.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Stake[roman type][line break]Here you see a bonfire in full conflagration. The flames leap higher and higher consuming the woman tied to the stake. The townsfolk are here holding torches and  jeering at the sight of the poor soul being burnt alive.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Dungeon[roman type][line break]This a dungeon with all the usual devices. There is a man stretched on the rack. His screams pierce the room. An iron maiden is occupied and you notice the blood seeping from the eyes, ears, and mouth. Another is strapped to a Saint Andrew's Cross and is being flogged harshly.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Guillotine[roman type][line break]There is a guillotine in this room. The guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated. Looks like your goose is cooked. Say 'Goodnight, Gracie!'".

HellRideAuto ends when the number of filled rows in the Table of HellRide Events is 0.

Instead of doing something other than waiting, looking, listening or examining during HellRideAuto:
	say "You are enjoying the ride too much to do anything but wait and enjoy the show."
	
When HellRideAuto ends:
	end the story finally saying "You have died.".
	
When play ends:
	Say "You are stupified as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable."
	
Ride Entrance is a room. Ride Entrance is south of Head of the Line. "The cars that will take you into the fearsome Hell Ride stop here for you to board.  To the south is the track that will take you into the ride. The safety bar is raised allowing you to enter the car. East of here the darkness looks just a little bit darker."

The car is a vehicle in the Ride Entrance. The description of the car is "A car waits to take you through the horror that is Hell Ride."

Before going south when the player is in the Ride Entrance:
	say "You can't go that way." instead;
	continue the action.

Section 2 - Stocks Room

The Stocks Room is south of the Ride Entrance. The Stocks Room is west of the Maintenance Office. "You pass into a room which displays mannequins in stocks in a public square. The stocks are made of heavy wood. The townsfolk are there solely to harrass and ridicule the individuals on display. The punishee[']s eyes are downcast as the shame and humiliation of their predicaments are realized. The wax figures are especially life like."

Section 3 - Gallows Room

The Gallows Room is south of the Stocks Room. The Gallows Room is west of the Crawl Space. "The next room is dominated by a gallows made of strong hardwood. Standing on the gallows is an executioner wearing a hood protecting his identity. Next to him is a man with a noose around his neck standing on a hatch ready to open."

Section 4 - Stake Room

The Stake Room is south of the Gallows Room. The Stake Room is west of the Mechanical Room North. "Here you see a bonfire in full conflagration. The flames leap higher and higher consuming the woman tied to the stake. The townsfolk are here holding torches and  jeering at the sight of the poor soul being burnt alive."

Section 5 - Dungeon

The Dungeon is south of the Stake Room. The Dungeon is west of Mechanical Room South. "This a dungeon with all the usual devices. There is a man stretched on the rack. His screams pierce the room. An iron maiden is occupied and you notice the blood seeping from the eyes, ears, and mouth. Another is strapped to a Saint Andrew's Cross and is being flogged harshly."

Section 6 - Guillotine Room

The Guillotine Room is south of the Dungeon. The Guillotine Room is west of the Electrical Room North. "There is a guillotine in this room. The guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated."

Section 7 - Ride Exit

The Ride Exit is south of the Guillotine Room. The Ride Exit is west of the Storage Room

Chapter 3 - Backstage

Backstage is a region. Backstage Entrance, Maintenance Office, Crawl Space, Mechanical Room North, Mechanical Room South, Electrical Room North, Electrical Room South, Electrical Closet One, Electrical Closet Three, Electrical Closet Five, Electrical Closet Seven, Electrical Closet Nine, Electrical Closet Eleven, and Storage Room is in Backstage.

Section 1 - Backstage Entrance

Test b with "s / buy ticket / s / give ticket to attendent / s / e / get all / turn on flashlight / s".

Test Backstage with "s / buy ticket / s / give ticket to attendent / s / e / s".

[flashlight mechanics]
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
	carry out the showing action activity with the noun instead.

An electric lamp is a kind of device.

Rule for showing action of an electric lamp (called item):
	if the item is switched on, say "[The item] is lit[if the number of visible lit things is greater than 1], competing with [the list of visible lit things which are not the item][end if].";
	otherwise say "[The item] is dark."
	
Carry out switching on an electric lamp: now the noun is lit. Carry out switching off an electric lamp: now the noun is unlit.

The flashlight is an electric lamp. understand "light" as flashlight. The description of the flashlight is "This is a flashlight. A nice one."

Rule for showing action of the flashlight:
	if the flashlight is switched on, say "A strong, narrow beam of light shines from the flashlight.";
	otherwise say "It is currently switched off."

Backstage Entrance is a room. Backstage Entrance is east of the Ride Entrance. "This room is backstage at the Hell Ride attraction. West is back the way you came from. There an exit to the south. There is a pile of junk in the corner."

The pile of junk is a scenery container. The pile of junk is in the backstage entrance. The pile of junk contains the flashlight. The description of the pile of junk is "In the corner is a pile of junk."

after examining when the noun is pile of junk:
	say "You find a flashlight here.";

Before printing the name of a lit electric lamp, say "lit ".
Before printing the name of an unlit lit electric lamp, say "extinguished ".

After waiting when the location is dark:
	say "It's pitch black. You might be eaten by a grue!"

Section 2 - Maintenance Office

The Maintenance Office is a dark room. The maintenance office is south of the backstage entrance. "This appears to be the maintenance office, There is a desk here.". 

[ This is the code that breaks the opening]
The desk is in the maintenance office. The desk is fixed in place. A drawer is part of the desk. The drawer is a closed openable container. The drawer is scenery. The description of the desk is "It's a desk. There are coffee stains and cigarette burns from years of abuse. The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

The scissors are in the drawer. The description is "This is a sharp pair of office scissors." The stapler is in the drawer. The description is "This is a red stapler." The ballpoint pen is in the drawer. The description is "Your standard ballpoint pen. It says Bic on the side." The pad of paper is in the drawer. The description is "This is a pad of lined paper."

Section 3 - Crawl Space

The Crawl Space is a dark room. The Crawl Space is south of Maintenance Office. "This crawl space is extremely small. You begin to feel claustrophobic in here."

Section 4 - Mechanical Room North

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "There is machinery filling the room." 

Section 5 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "There is machinery filling the room." 

Section 6 -Electrical Room North

The Electrical Room North is a dark room. The Electrical Room North is south of the Mechanical Room South. "There is machinery filling the room." 

Section 7 - Electrical Room South

The Electrical Room South is a dark room. The Electrical Room South is south of the Electrical Room North. "This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous!"

[Instead of going from the Electrical Room South:
	move the player to a random adjacent room.]
	
The Maintenance Office is north of the Electrical Room South. . 
The Electrical Closet Eleven is a dark room. The Electrical Closet Eleven is northwest of the Electrical Room South. "You are in a section of the electrical room. There is an exit to the south east."
The Electrical Closet Nine is a dark room. Electrical Closet Nine is west of the Electrical Room South. "You are in a section of the electrical room. There is an exit to the east."
The Electrical Closet Seven is a dark room. Electrical Closet Seven is southwest of the Electrical Room South. "You are in a section of the electrical room. There is an exit to the north east."
The Electrical Closet Five is a dark room. Electrical Closet Five is southeast of the Electrical Room South."You are in a section of the electrical room. There is an exit to the north west."
The Electrical Closet Three is a dark room. Electrical Closet Three is east of the Electrical Room South. "You are in a section of the electrical room. There is an exit to the west."
The Electrical Closet One is a dark room. The Electrical Closet One is northeast of the Electrical Room South.  "You are in a section of the electrical room. There is an exit to the south west." The key is in the Electrical Closet One. The description of the key is "This is a small silver key. I wonder what it unlocks."


Section 8 - Storage Room

The Storage Room is a dark room. The Storage Room is south of the Electrical Room South.
