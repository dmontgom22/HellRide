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

Include Basic Help Menu by Emily Short.

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

[When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."]

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
	say "Which prize would you like? 1) The stuffed teddy bear, 2) the Swiss Army knife, or 3) the poster of Taylor Swift?".
	
after Reading a command :
	if the player's command matches "1" and the location is the high striker:
		say "You are now holding a cute little teddy bear.";
		increase score by 5;
		now the player carries the teddy bear;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "2" and the location is the high striker:
		say "You are now holding a Swiss Army knife.";
		increase score by 5;
		now the player carries the swiss army knife;
		reject the player's command.
		
after Reading a command:
	if the player's command matches "3" and the location is the high striker:
		say "You are now holding a poster of Taylor Swift.";
		increase score by 5;
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
"[bold type]Entrance[roman type][line break]The car has begun to move toward the entrance of the ride and the safety bar has been lowered. The entrance to Hell Ride is a chilling spectacle designed to draw both thrill-seekers and the morbidly curious. The facade looms before you, a grotesque masterpiece of twisted metal and carved wood, illuminated by flickering, blood-red lights that cast eerie shadows across the ground. The air smells faintly of sulfur, mingling with the sweet scent of carnival popcorn from nearby stalls.[paragraph break]A towering archway frames the entrance, its design a chaotic blend of flames, jagged spikes, and sinister, grinning skulls. The words 'HELL RIDE' are emblazoned above in glowing, flickering letters that seem to pulse like a heartbeat. Beneath the sign, two sculpted demons crouch, their clawed hands extending outward as though inviting—or daring—you to enter.[paragraph break]Dark curtains, frayed and stained, hang over the entrance, swaying faintly in a breeze that seems to carry whispers and low, menacing chuckles. As you approach, the faint sound of distorted organ music grows louder, interspersed with sudden shrieks and the grinding of unseen machinery. A crooked sign at the side reads: 'One Ticket Admission: Enter If You Dare!'[paragraph break]Nearby, a carnival barker with a waxen smile stands under a sputtering gaslight, his voice raspy and theatrical: 'Step right up, brave souls! Take the ride of your life—or your afterlife! The gates of hell are open, and the darkness beckons!'[paragraph break]Through the entrance, the interior is shrouded in near-total darkness, save for flashes of sickly green light that illuminate the suggestion of twisting paths and grotesque shapes. The only certainty is that once you step inside, there’s no turning back from the horrors that await."
"[bold type]Hallway[roman type][line break]The doors open and your car passes through into the darkness.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Stocks[roman type][line break]The public square is an open expanse of cobblestones, surrounded by the weathered facades of timber-framed buildings. The air is heavy with the mingling scents of smoke from distant chimneys, damp earth, and the faint metallic tang of the nearby smithy. At the square's center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures. [paragraph break]The punished individuals, heads bowed in shame, are caught in an agonizing tableau of disgrace. Their expressions, a mix of resignation and despair, reflect the full weight of their predicaments. Their clothing hangs in tatters, furthering their exposure to the biting wind and the sharp tongues of the gathered crowd.[paragraph break]Around the stocks, the townsfolk revel in their collective cruelty. A wiry man leans in close, spitting insults with glee, his laughter cutting through the air. A stout woman clutching a basket of overripe vegetables hurls a squashed tomato, which splatters across one captive’s cheek, drawing a chorus of jeers. Nearby, children mimic their elders, pointing and shrieking in mockery, their faces alight with mischief.[paragraph break]The square is alive with noise: the raucous laughter of the crowd, the occasional sharp crack of a thrown object against the wood, and the soft, pained murmurs of the punished. A passing bell tolls faintly in the distance, but here it is drowned out by the cruel symphony of the jeering mob.[paragraph break]Above it all, the gray sky looms, heavy with the promise of rain, as if nature itself disapproves of the spectacle. Yet the crowd pays no mind, delighting in their collective judgment, each jeer a reminder that today’s entertainment is another's living nightmare.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Gallows[roman type][line break]The public square lies under a brooding, overcast sky, its cobblestones slick with the morning's drizzle. A grim silence has settled over the gathered crowd, broken only by the occasional murmur or the restless shuffling of feet. At the center of the square, rising like a grim monument to mortality, stands the gallows—a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike.[paragraph break]Atop the gallows, a hooded executioner looms, his imposing frame draped in a black cloak that billows faintly in the wind. His face is obscured by the deep cowl, but his presence radiates cold, methodical purpose. In his gloved hands, he adjusts the noose, its coarse fibers frayed from repeated use, ensuring it is ready for the task at hand.[paragraph break]Standing beside him is the condemned man, his hands bound tightly behind his back. His face is pale, drawn, and haunted, beads of sweat mingling with the light rain. His eyes dart to the crowd, seeking pity, perhaps, but finding only a sea of indifferent faces. His breath comes in shallow bursts, each exhalation visible in the chilly air, a stark reminder of the life still in him—for now.[paragraph break]The crowd gathers in a semicircle around the platform, a mixture of somber onlookers, opportunistic vendors hawking bread and cider, and children craning their necks for a better view. An old man mutters a prayer under his breath, clutching a rosary, while a group of rough-looking men smirk and exchange bets on how long the drop will take.[paragraph break]Above it all, the bell tower tolls, its mournful chime echoing through the square, a countdown to the inevitable. The condemned man flinches with each clang, his shoulders tensing as the final moments draw near. A raven perches on the gallows’ beam, its black eyes unblinking, as if waiting for the end with morbid curiosity.[paragraph break]The executioner steps forward, adjusting the noose around the man’s neck with a practiced efficiency. The crowd falls silent, the weight of the moment hanging heavier than the rope itself. Somewhere in the distance, thunder rumbles faintly, as though the heavens themselves are bracing for what is to come.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Stake[roman type][line break]The public square is a grim tableau, the usual bustle of commerce and chatter replaced with an oppressive silence broken only by the crackling of the flames. At the center, three wooden stakes rise ominously from a circular pyre of logs and kindling, their rough surfaces darkened by smoke from countless such scenes before. Bound tightly to these stakes are three women, their wrists and ankles secured with coarse, heavy ropes. Their faces tell different stories—one of defiance, another of resignation, and the third of pure terror.[paragraph break]A crowd encircles the pyre, their expressions a mix of morbid fascination, righteous fury, and hesitant pity. Children cling to their mothers' skirts, staring wide-eyed, while town elders nod solemnly as though approving the grim spectacle. Some townsfolk jeer loudly, throwing small stones or rotten vegetables at the condemned. Others murmur prayers or make the sign of the cross, their eyes averted.[paragraph break]The executioner, clad in a soot-streaked hood and leather apron, steps forward, his torch a blazing beacon in the dreary scene. The flames dance and writhe as he lowers the torch to the base of the pyre, igniting the dry wood with a sudden, hungry roar. A cheer erupts from a faction of the crowd, while others fall into an uneasy silence, watching the fire climb higher.[paragraph break]Thick, acrid smoke begins to rise, curling around the stakes like a living thing. The women cry out—some in curses, others in prayers—and their voices echo across the square, mingling with the crackle of the flames. The heat radiates outward, and even those in the crowd begin to feel its oppressive warmth.[paragraph break]Above, the gray clouds hang low, as if nature itself mourns the scene unfolding below. A raven caws from its perch atop the town's bell tower, its black form stark against the ashen sky. The church bells toll in slow, deliberate cadence, each strike a grim punctuation to the scene.[paragraph break]As the flames consume the pyre, the crowd remains rooted, some transfixed by the spectacle, others quietly slipping away, their faces pale and drawn. The square, once a place of gatherings and life, is now a stage for death, its air heavy with smoke, ash, and the lingering cries of the condemned.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Dungeon[roman type][line break]The dungeon is a dim, oppressive chamber carved deep into the earth, its stone walls slick with moisture and coated in a thin layer of grime. The air is heavy with the stench of sweat, blood, and mildew, punctuated by the faint, acrid tang of burning oil from flickering torches mounted on rusty iron sconces. Shadows dance on the walls, creating grotesque shapes that seem almost alive in the unsteady light.[paragraph break]Chains hang from the walls and ceilings, their metallic clinking faintly audible as prisoners shift or shudder in their restraints. The room is filled with the soft, pitiful moans of the tormented, their cries occasionally rising to sharp, desperate screams that echo through the corridors beyond. The sound of dripping water from a cracked stone ceiling adds an eerie rhythm to the unsettling cacophony.[paragraph break]Scattered throughout the dungeon are various instruments of pain and suffering, their designs brutal and unyielding. A rack sits in the center of the room, its wooden frame splintered from years of use. Nearby, a brazier glows a dull red, its coals smoldering beneath a collection of iron tools—branding irons, pincers, and knives, their edges darkened with dried blood. A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light.[paragraph break]Prisoners are scattered across the room, each trapped in their own nightmare. A man lies stretched on the rack, his face contorted in agony as the torturer methodically turns the wheel, the creaking of wood and rope echoing in the chamber. Another prisoner hangs limply from manacles affixed to the wall, their body bruised and battered, barely able to lift their head. A third, seated in the spiked chair, breathes in shallow gasps, their movements restricted by the cruel embrace of the iron seat.[paragraph break]The torturer moves about the chamber with practiced efficiency, their face obscured by a hood, their leather apron stained with the evidence of countless victims. They work silently, their movements methodical and devoid of emotion, as if the suffering around them were merely a task to be completed.[paragraph break]Above it all, the dungeon's ceiling is low and oppressive, the occasional scuttling of rats in the shadows serving as a reminder of the filth and decay that permeates the space. The only exit—a heavy, iron-bound door reinforced with rivets—seems more a barrier to hope than a passage to freedom, its small viewing slit barred and shadowed.[paragraph break]This is a place of despair and cruelty, where the line between life and death is blurred, and the only certainty is the inevitability of suffering.[paragraph break]Mist fills the area as you move to the next room."
"[bold type]The Guillotine[roman type][line break]The public square is a charged space, bustling with a crowd eager to witness the grim spectacle. The sky overhead is a patchwork of gray clouds, casting the cobblestone ground in a somber light. At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out.[paragraph break]A lone figure stands on the scaffold, their posture slumped under the weight of their fate. Their hands are bound tightly behind their back with coarse ropes, and their head hangs low, avoiding the stares of the gathered crowd. Their clothing, once fine, is now tattered and muddied, a visible testament to the fall from grace that has led to this moment.[paragraph break]The crowd presses closer, encircling the platform with a mix of emotions etched onto their faces. Some jeer, shouting curses and insults, their voices rising in a cacophony of condemnation. Others watch in heavy silence, their expressions grim and reflective. A few hold children on their shoulders, their young faces filled with curious fascination, unaware of the gravity of what they are about to witness.[paragraph break]At the edge of the platform, a town crier stands with a long scroll in hand, his voice carrying over the murmurs of the crowd:'his man has been found guilty of high treason against the crown. Let his punishment serve as a warning to all who would seek to defy the will of the realm!'[paragraph break]The condemned flinches at the words but remains silent, their face pale and eyes darting nervously. The executioner, a large figure clad in a hooded black robe, stands nearby with arms crossed, their demeanor cold and methodical. A few feet away, the guillotine looms, its blade gleaming dully in the filtered light, ready to deliver the final judgment.[paragraph break]The tension in the square is palpable as the crier steps aside and the executioner signals for the crowd to quiet. The murmurs fade, replaced by an oppressive silence that hangs over the scene like a shroud. The only sounds now are the rustle of the wind and the faint creak of the wooden scaffold.[paragraph break]As the condemned is led toward the guillotine, a crow caws from a nearby rooftop, its harsh cry echoing through the square like a dark omen. The crowd leans forward, holding its collective breath, as the weight of justice and mortality descends upon the scene. [paragraph break]There is just lone problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated.[paragraph break]Looks like your goose is cooked. Say 'Goodnight, Gracie!"

HellRideAuto ends when the number of filled rows in the Table of HellRide Events is 0.

Instead of doing something other than waiting, looking, listening or examining during HellRideAuto:
	say "You are enjoying the ride too much to do anything but wait and enjoy the show."
	
When HellRideAuto ends:
	end the story finally saying "You have died.".
	
When play ends:
	Say "You are stupified as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable."
	
Ride Entrance is a room. Ride Entrance is south of Head of the Line. "The cars that will take you into the fearsome Hell Ride stop here for you to board.  To the south is the track that will take you into the ride. The safety bar is raised allowing you to enter the car. The darkness looks just a little bit darker."

The car is a vehicle in the Ride Entrance. The description of the car is "A car waits to take you through the horror that is Hell Ride."

Before going south when the player is in the Ride Entrance:
	say "You can't go that way." instead;
	continue the action.

Section 2 - Stocks Room

The Stocks Room is south of the Ride Entrance. "The public square is an open expanse of cobblestones, surrounded by the weathered facades of timber-framed buildings. The air is heavy with the mingling scents of smoke from distant chimneys, damp earth, and the faint metallic tang of the nearby smithy. At the square's center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures.
[paragraph break]
The punished individuals, heads bowed in shame, are caught in an agonizing tableau of disgrace. Their expressions, a mix of resignation and despair, reflect the full weight of their predicaments. Their clothing hangs in tatters, furthering their exposure to the biting wind and the sharp tongues of the gathered crowd.
[paragraph break]
Around the stocks, the townsfolk revel in their collective cruelty. A wiry man leans in close, spitting insults with glee, his laughter cutting through the air. A stout woman clutching a basket of overripe vegetables hurls a squashed tomato, which splatters across one captive’s cheek, drawing a chorus of jeers. Nearby, children mimic their elders, pointing and shrieking in mockery, their faces alight with mischief.
[paragraph break]
The square is alive with noise: the raucous laughter of the crowd, the occasional sharp crack of a thrown object against the wood, and the soft, pained murmurs of the punished. A passing bell tolls faintly in the distance, but here it is drowned out by the cruel symphony of the jeering mob.
[paragraph break]
Above it all, the gray sky looms, heavy with the promise of rain, as if nature itself disapproves of the spectacle. Yet the crowd pays no mind, delighting in their collective judgment, each jeer a reminder that today’s entertainment is another's living nightmare." The Aqua Door is west of the Maintenance Office. 

Section 3 - Gallows Room

The Gallows Room is south of the Stocks Room.  "The public square lies under a brooding, overcast sky, its cobblestones slick with the morning's drizzle. A grim silence has settled over the gathered crowd, broken only by the occasional murmur or the restless shuffling of feet. At the center of the square, rising like a grim monument to mortality, stands the gallows—a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike.
[paragraph break]
Atop the gallows, a hooded executioner looms, his imposing frame draped in a black cloak that billows faintly in the wind. His face is obscured by the deep cowl, but his presence radiates cold, methodical purpose. In his gloved hands, he adjusts the noose, its coarse fibers frayed from repeated use, ensuring it is ready for the task at hand.
[paragraph break]
Standing beside him is the condemned man, his hands bound tightly behind his back. His face is pale, drawn, and haunted, beads of sweat mingling with the light rain. His eyes dart to the crowd, seeking pity, perhaps, but finding only a sea of indifferent faces. His breath comes in shallow bursts, each exhalation visible in the chilly air, a stark reminder of the life still in him—for now.
[paragraph break]
The crowd gathers in a semicircle around the platform, a mixture of somber onlookers, opportunistic vendors hawking bread and cider, and children craning their necks for a better view. An old man mutters a prayer under his breath, clutching a rosary, while a group of rough-looking men smirk and exchange bets on how long the drop will take.
[paragraph break]
Above it all, the bell tower tolls, its mournful chime echoing through the square, a countdown to the inevitable. The condemned man flinches with each clang, his shoulders tensing as the final moments draw near. A raven perches on the gallows’ beam, its black eyes unblinking, as if waiting for the end with morbid curiosity.
[paragraph break]
The executioner steps forward, adjusting the noose around the man’s neck with a practiced efficiency. The crowd falls silent, the weight of the moment hanging heavier than the rope itself. Somewhere in the distance, thunder rumbles faintly, as though the heavens themselves are bracing for what is to come."

Section 4 - Stake Room

The Stake Room is south of the Gallows Room. "The public square is a grim tableau, the usual bustle of commerce and chatter replaced with an oppressive silence broken only by the crackling of the flames. At the center, three wooden stakes rise ominously from a circular pyre of logs and kindling, their rough surfaces darkened by smoke from countless such scenes before. Bound tightly to these stakes are three women, their wrists and ankles secured with coarse, heavy ropes. Their faces tell different stories—one of defiance, another of resignation, and the third of pure terror.
[paragraph break]
A crowd encircles the pyre, their expressions a mix of morbid fascination, righteous fury, and hesitant pity. Children cling to their mothers' skirts, staring wide-eyed, while town elders nod solemnly as though approving the grim spectacle. Some townsfolk jeer loudly, throwing small stones or rotten vegetables at the condemned. Others murmur prayers or make the sign of the cross, their eyes averted.
[paragraph break]
The executioner, clad in a soot-streaked hood and leather apron, steps forward, his torch a blazing beacon in the dreary scene. The flames dance and writhe as he lowers the torch to the base of the pyre, igniting the dry wood with a sudden, hungry roar. A cheer erupts from a faction of the crowd, while others fall into an uneasy silence, watching the fire climb higher.
[paragraph break]
Thick, acrid smoke begins to rise, curling around the stakes like a living thing. The women cry out—some in curses, others in prayers—and their voices echo across the square, mingling with the crackle of the flames. The heat radiates outward, and even those in the crowd begin to feel its oppressive warmth.
[paragraph break]
Above, the gray clouds hang low, as if nature itself mourns the scene unfolding below. A raven caws from its perch atop the town's bell tower, its black form stark against the ashen sky. The church bells toll in slow, deliberate cadence, each strike a grim punctuation to the scene.
[paragraph break]
As the flames consume the pyre, the crowd remains rooted, some transfixed by the spectacle, others quietly slipping away, their faces pale and drawn. The square, once a place of gatherings and life, is now a stage for death, its air heavy with smoke, ash, and the lingering cries of the condemned."

Section 5 - Dungeon

The Dungeon is south of the Stake Room. "The dungeon is a dim, oppressive chamber carved deep into the earth, its stone walls slick with moisture and coated in a thin layer of grime. The air is heavy with the stench of sweat, blood, and mildew, punctuated by the faint, acrid tang of burning oil from flickering torches mounted on rusty iron sconces. Shadows dance on the walls, creating grotesque shapes that seem almost alive in the unsteady light.
[paragraph break]
Chains hang from the walls and ceilings, their metallic clinking faintly audible as prisoners shift or shudder in their restraints. The room is filled with the soft, pitiful moans of the tormented, their cries occasionally rising to sharp, desperate screams that echo through the corridors beyond. The sound of dripping water from a cracked stone ceiling adds an eerie rhythm to the unsettling cacophony.
[paragraph break]
Scattered throughout the dungeon are various instruments of pain and suffering, their designs brutal and unyielding. A rack sits in the center of the room, its wooden frame splintered from years of use. Nearby, a brazier glows a dull red, its coals smoldering beneath a collection of iron tools—branding irons, pincers, and knives, their edges darkened with dried blood. A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light.
[paragraph break]
Prisoners are scattered across the room, each trapped in their own nightmare. A man lies stretched on the rack, his face contorted in agony as the torturer methodically turns the wheel, the creaking of wood and rope echoing in the chamber. Another prisoner hangs limply from manacles affixed to the wall, their body bruised and battered, barely able to lift their head. A third, seated in the spiked chair, breathes in shallow gasps, their movements restricted by the cruel embrace of the iron seat.
[paragraph break]
The torturer moves about the chamber with practiced efficiency, their face obscured by a hood, their leather apron stained with the evidence of countless victims. They work silently, their movements methodical and devoid of emotion, as if the suffering around them were merely a task to be completed.
[paragraph break]
Above it all, the dungeon's ceiling is low and oppressive, the occasional scuttling of rats in the shadows serving as a reminder of the filth and decay that permeates the space. The only exit—a heavy, iron-bound door reinforced with rivets—seems more a barrier to hope than a passage to freedom, its small viewing slit barred and shadowed.
[paragraph break]
This is a place of despair and cruelty, where the line between life and death is blurred, and the only certainty is the inevitability of suffering."

Section 6 - Guillotine Room

The Guillotine Room is south of the Dungeon. "The public square is a charged space, bustling with a crowd eager to witness the grim spectacle. The sky overhead is a patchwork of gray clouds, casting the cobblestone ground in a somber light. At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out.
[paragraph break]
A lone figure stands on the scaffold, their posture slumped under the weight of their fate. Their hands are bound tightly behind their back with coarse ropes, and their head hangs low, avoiding the stares of the gathered crowd. Their clothing, once fine, is now tattered and muddied, a visible testament to the fall from grace that has led to this moment.
[paragraph break]
The crowd presses closer, encircling the platform with a mix of emotions etched onto their faces. Some jeer, shouting curses and insults, their voices rising in a cacophony of condemnation. Others watch in heavy silence, their expressions grim and reflective. A few hold children on their shoulders, their young faces filled with curious fascination, unaware of the gravity of what they are about to witness.
[paragraph break]
At the edge of the platform, a town crier stands with a long scroll in hand, his voice carrying over the murmurs of the crowd:
'his man has been found guilty of high treason against the crown. Let his punishment serve as a warning to all who would seek to defy the will of the realm!'
[paragraph break]
The condemned flinches at the words but remains silent, their face pale and eyes darting nervously. The executioner, a large figure clad in a hooded black robe, stands nearby with arms crossed, their demeanor cold and methodical. A few feet away, the guillotine looms, its blade gleaming dully in the filtered light, ready to deliver the final judgment.
[paragraph break]
The tension in the square is palpable as the crier steps aside and the executioner signals for the crowd to quiet. The murmurs fade, replaced by an oppressive silence that hangs over the scene like a shroud. The only sounds now are the rustle of the wind and the faint creak of the wooden scaffold.
[paragraph break]
As the condemned is led toward the guillotine, a crow caws from a nearby rooftop, its harsh cry echoing through the square like a dark omen. The crowd leans forward, holding its collective breath, as the weight of justice and mortality descends upon the scene. 
[paragraph break]
There is just lone problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be decapitated."

Section 7 - Ride Exit

The Ride Exit is south of the Guillotine Room.

Chapter 3 - Backstage

Backstage is a region. Backstage Entrance, Maintenance Office, Crawl Space, Mechanical Room North, Mechanical Room South, Generator Room, Electrical Room, Electrical Closet One, Electrical Closet Three, Electrical Closet Five, Electrical Closet Seven, Electrical Closet Nine, Electrical Closet Eleven, and Storage Room is in Backstage.

Section 1 - Backstage Entrance

Test b with "s / buy ticket / s / give ticket to attendent / s / e / get all / turn on flashlight / s / s / s / s / s / s / ne / get key / sw".

Test Backstage with "s / buy ticket / s / give ticket to attendent / s / e / s / s / s".

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

Backstage Entrance is a room. Backstage Entrance is east of the Ride Entrance. "This room is backstage at the Hell Ride attraction. The room is littered with bags of trash, piles of junk, and dust bunnies so large they should be paying rent. West is back the way you came from. There an exit to the south."

The pile of junk is a scenery container. The pile of junk is in the backstage entrance. The pile of junk contains the flashlight. Understand "piles" as pile of junk. The description of the pile of junk is "In the corner is a pile of junk."

after examining when the noun is pile of junk:
	say "You find a flashlight here.";

Before printing the name of a lit electric lamp, say "lit ".
Before printing the name of an unlit lit electric lamp, say "extinguished ".

After waiting when the location is dark:
	say "It's pitch black. You might be eaten by a grue!"
	
After going east when the location is Backstage Entrance and Backstage Entrance is unvisited:
	say "Walking in the darkness with your arms extended you nearly fall through an open doorway.";
	increase score by 5;
	continue the action.

Section 2 - Maintenance Office

The Maintenance Office is a dark room. The maintenance office is south of the backstage entrance. "This appears to be the maintenance office, There is a desk here.". 

[ This is the code that breaks the opening]
The desk is in the maintenance office. The desk is fixed in place. A drawer is part of the desk. The drawer is a closed openable container. The drawer is scenery. The description of the desk is "It's a desk. There are coffee stains and cigarette burns from years of abuse. The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

The scissors are in the drawer. The description is "This is a sharp pair of office scissors." The stapler is in the drawer. The description is "This is a red stapler." The ballpoint pen is in the drawer. The description is "Your standard ballpoint pen. It says Bic on the side." The pad of paper is in the drawer. The description is "This is a pad of lined paper."

The Aqua Door is west of the Maintenance Office and east of the Stocks Room. The Aqua Door is a closed locked door. The description of the Aqua door is "It's an aqua colored door with the word 'Stocks' written on it." The silver key unlocks it.

Section 3 - Crawl Space

The Crawl Space is a dark room. The Crawl Space is south of Maintenance Office. "This crawl space is extremely small. You begin to feel claustrophobic in here."

The Crimson Door is west of the Crawl Space and east of the Gallows Room. The Crimson Door is a closed locked door. The description of the Crimson door is "It's an crimson colored door with the word 'Gallows' written on it." The silver key unlocks it.

Section 4 - Mechanical Room North

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "There is machinery filling the room." The toolbox is a closed openable container in the Mechanical Room North. The toolbox contains the monkey wrench, channel locks, pliers, and a hammer.

The Emerald Door is west of the Mechanical Room North and east of the Stake Room. The Emerald Door is a closed locked door. The description of the Emerald door is "It's an emerald colored door with the word 'Stake' written on it." The silver key unlocks it.

Section 5 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "There is machinery filling the room." 

The Grey Door is west of the Mechanical Room South and east of the Dungeon. The Grey Door is a closed locked door. The description of the Grey door is "It's a grey colored door with the word 'Dungeon' written on it." The silver key unlocks it.

Section 6 - Generator Room

The Generator Room is a dark room. The Generator Room is south of the Mechanical Room South. "There are two massive generators here powering the ride." 

The Indigo Door is west of the Generator Room and east of the Guillotine Room. The Indigo Door is a closed locked door. The description of the Indigo door is "It's a indigo colored door with the word 'Guillotine' written on it." The silver key unlocks it.

Section 7 - Electrical Room

The Electrical Room is a dark room. The Electrical Room is south of the Generator Room. "This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous! There are exits in all directions."

[Instead of going from the Electrical Room:
	move the player to a random adjacent room.]
	
The Electrical Closet Eleven is a dark room. The Electrical Closet Eleven is northwest of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the south east." Electrical Panel Eleven is closed openable container in Electrical Closet Eleven. Electrical Panel Eleven is scenery. The printed name of Electrical Panel Eleven is "the electrical panel". Understand "panels" as panel. The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Eleven is open]open[otherwise]closed[end if]."

The Electrical Closet Nine is a dark room. Electrical Closet Nine is west of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the east." Electrical Panel Nine is closed openable container in Electrical Closet Nine. Electrical Panel Nine is scenery. The printed name of Electrical Panel Nine is "the electrical panel". Understand "panels" as panel. The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Nine is open]open[otherwise]closed[end if]."

The Electrical Closet Seven is a dark room. Electrical Closet Seven is southwest of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the north east." Electrical Panel Seven is closed openable container in Electrical Closet Seven. Electrical Panel Seven is scenery. The printed name of Electrical Panel Seven is "the electrical panel". Understand "panels" as panel. The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Seven is open]open[otherwise]closed[end if]."

The Electrical Closet Five is a dark room. Electrical Closet Five is southeast of the Electrical Room."You are in a section of the electrical room. There is an electrical panel here. There is an exit to the north west." Electrical Panel Five is closed openable container in Electrical Closet Five. Electrical Panel Five is scenery. The printed name of Electrical Panel Five is "the electrical panel". Understand "panels" as panel. The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Five is open]open[otherwise]closed[end if]."

The Electrical Closet Three is a dark room. Electrical Closet Three is east of the Electrical Room. "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the west." Electrical Panel Three is closed openable container in Electrical Closet Three. Electrical Panel Three is scenery. The printed name of Electrical Panel Three is "the electrical panel". Understand "panels" as panel. The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel Three is open]open[otherwise]closed[end if]."

The Electrical Closet One is a dark room. The Electrical Closet One is northeast of the Electrical Room.  "You are in a section of the electrical room. There is an electrical panel here. There is an exit to the south west." Electrical Panel One is closed openable container in Electrical Closet One. Electrical Panel One is scenery. The printed name of Electrical Panel One is "the electrical panel". Understand "panels" as panel. The description is "This is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if Electrical Panel One is open]open[otherwise]closed[end if]." The silver key is in the Electrical Closet One. The description of the silver key is "This is a small silver key. I wonder what it unlocks."

Section 8 - Storage Room

The Storage Room is a dark room. The Storage Room is south of the Electrical Room.

The Khaki Door is west of the Storage Room and east of the Ride Exit. The Khaki Door is a closed locked door. The description of the Khaki door is "It's a khaki colored door with the word 'Ride Exit' written on it." The silver key unlocks it.


