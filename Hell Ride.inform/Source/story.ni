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
The maximum score is 100.
When play begins, seed the random-number generator with 0.

Part 1 - World Model

Chapter 1 - The Player

The description of the player is "You are despondent given that you and your date just had a huge fight and they stormed off. Maybe visiting the attractions at the carnival will make you feel better." The player carries a dime.

Instead of examining the player:
	say "Oh, stop fussing. You look fine."

Chapter 2 - Figures

Figure of HellRide is the file "HellRide.png".

Figure of Midway is the file "Midway.png".

Chapter 3 - Money Mechanics

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
	
The player carries a wallet. The wallet contains money. The price of the money is $10.00. The printed name of the money is "[price of the money] in cash". Understand "cash" as the money.

Instead of taking the money:
	say "Best to leave it alone until you need to buy something."

Instead of buying something free:
	say "[The noun] is yours already."

Instead of buying the money:
	say "The money belongs to you; you buy things with it."
	
Chapter 4 - Drink Mechanics

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

Chapter 5 - New Actions



Test me with "s / e / buy mallet / hit base with mallet".

Chapter 6 - Miscellaneous Goodies

A thing can be seen or unseen.

Carry out examining a thing:
	now the noun is seen.

Part 2 - The Game

Chapter 1 - The Midway

The Midway is a region. Parking Lot, The Booth, Concession Stand, Strongman Booth, Little Egypt Facade, Little Egypt Show, and Head of the Line are in the Midway;

Section 1 - Parking Lot

[Display the Figure of HellRide;]

when play begins:
	say "The carnival is in town and you had a date with your sweetie to visit it. After dinner and just as you arrive at the carnival, you and your date
		have a terrible fight. They storm off leaving you alone at the carnival. You decide to stay at the carnival anyway."

The Parking Lot is a room. The parking lot is north of the Booth. "You are in a parking lot full of cars. The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush[otherwise]The bush has been picked clean.[end if]"

cars is here. cars is scenery. Understand "car" as cars. The description of cars is "There are all kinds of vehicles in the parking lot."

the blueberry bush is here. the blueberry bush is scenery. the blueberry bush is a container. the blueberry bush is not portable. the blueberry bush contains blueberries. The description of the blueberries is "The blueberries are ripe, juicy, and a deep blue color.".

After taking blueberries:
	increase score by 5;
	say "Good Job!".

Section 2 - Ticket Booth

The booth is a room. The booth is north of Head of the Line. The booth is east of the Little Egypt Facade. The booth is west of Strongman Booth. The booth is northeast of the Concession Stand. The  booth is south of the Parking Lot. "You are standing in line at a ticket booth at the carnival. The booth sells tickets to the Hell Ride attraction. The line for the ride forms to the south and the midway continues east and west from here. There is a concession stand to the south west. The ticket booth is garishly painted in purple and green sparkles. There is a Ticket Seller here. [if Seller is carrying ticket]The Ticket Seller has a ticket.[end if]"

The Seller is a man in the booth. The description of seller is "This is a bored teenager hired to sell ride tickets all week at this carnival. He's thinking about having a brewski with his bros after work.". 

the ticket is a thing. The seller carries the ticket. The price of the ticket is $2.50. The description of the ticket is "This ticket will 'Admit One' to the Hell Ride.[line break]It[']s a real 'E' ticket, baby!". 

After buying the ticket:
	increase score by 5;
	say "Well done!";

[display Figure of Midway]

Section 3 - Concession Stand

The Concession Stand is a room. "You are standing in front of a brightly lit Concession Stand. There is a menu to the right of the window. You can see the treats inside the stand."

treats is here. Treats is scenery. Understand "treat" as treats. The description of treats is "There are a variety of things to eat here."

a menu is here.  Menu is fixed in place. The description of the menu is 
"[line break]$1.00 Cola
[line break]$2.50 Popcorn
[line break]$1.50 Candy Apple
[line break]$1.50 Cotton Candy
[line break]$1.50 Soft Pretzel"

a can is here. The price of can is $1.00. The description of the can is "The soda is ice cold."

The can is a fluid container. The liquid of the can is Cola. The current volume of the can is 12.0 fl oz. Understand "Coke" as the can.

Instead of player drinking a fluid container:
	if can is empty:
		say "[The person asked] tip the can again only to find it empty.";
	otherwise:
		decrease the current volume of the noun by 2.0 fl oz;
		if the current volume of the noun is less than 0.0 fl oz, now the current volume of the noun is 0.0 fl oz;
		say "[The person asked] gulp down some [liquid of the noun]."

a bucket of popcorn is here. The bucket of popcorn is edible. The price of popcorn is $2.50. The description of the popcorn is "The bucket of popcorn looks enormous!"

a candy apple is here. The candy apple is edible. The price of a candy apple is $1.50. The description of the candy apple is "The candy apple is your typical carmel covered apple. It looks like it would get stuck in your teeth."

cotton candy is here. Cotton candy is edible. The price of cotton candy is $1.50. The description of cotton candy is "The cotton candy is a mixture of pink and blue floss."

a soft pretzel is here. The soft pretzel is edible. The price of the soft pretzel is $1.50. The description of the soft pretzel is "The soft pretzel is sprinkled generously with salt."

Section 4 - Strongman Booth

Hitting is an action applying to two visible things. Understand "hit [something]" as hitting. Understand "hit [something] with [something preferably held]" as hitting.

Check hitting when the noun is not base:
	say "Nothing happens." instead.
	
Check hitting when the second noun is not mallet:
	say "You can[']t hit [noun] with that!" instead.
	
Check hitting when the player is not carrying the mallet:
	say "You['] not holding the mallet." instead.
	
Carry out hitting:
	say "You lift the mallet high and bring it down on the base with all your might! The striker rises towards the bell stopping at '[a random strength pattern]'.";
	increase the score by 5;
	say "Well done".
	
A strength pattern is a kind of value. The strength patterns are Weakling, FooBar, Average, Almost There, Muscle Man.

The Strongman Booth is a room. "The Strongman Booth is a popular carnival game in which you swing a mallet against a base and cause a striker to hit a bell. Along the length of the pole are markings indicating how strong you are. [if the room contains the mallet]You can see an over-sized mallet here.[end if]"

The markings are here. The markings are scenery. Understand "marking" and "sign" and "signs" as markings. The description of markings is "There are five levels marked on the pole: Weakling, FooBar, Average, Almost Theere, and Muscle Man."

The base is here. The base is fixed in place. 

The mallet is here.  The Price of the mallet is $2.00. The description of the mallet is "The mallet is over sized, perhaps to give you an advantage in the Strong Man game."

Section 5 - Little Egypt Facade

Little Egypt Facade is a room. Little Egypt Facade is east of Little Egypt Show. "You are standing in front of a trailer. There is a stage in front of the trailer. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show."											

The Barker is a person in Little Egypt Facade. The description of the barker is "Here is a man dressed in black pants, a white shirt, and a striped vest.  He calls out: [line break][line break]
               Step right up, folks and see Little Egypt[line break]
               Do her famous dance of the Pyramids![line break]
               She walks, she talks, she crawls on her belly like a reptile[Line Break]
               Just one thin dime, one tenth of a dollar!".
		
Section 6 - Little Egypt Show				

Little Egypt Show is a room. LIttle Egypt Show is west of Little Egypt Facade. "There are folding chairs set up in rows in front of a low stage. There is a spotlight shining on the stage. There is an empty chair in the front row. Perhaps you could sit there."

The Folding Chair is in Little Egypt Show. The Folding Chair is a enterable scenery supporter. The description of the Folding Chair is "This is one of many folding chairs in the tent tonight."

Section 7 - Head of the Line

Head of the Line is a room. Head of the Line is south of Booth. Head of the Line is north of Ride Entrance. "You are standing in front of a ticket taker with his hand open waiting for your ticket. The entrance to the ride is south of here."

The Attendant is a man in Head of the Line. The description of the Attendant is "This is another bored teenager. His thoughts are entirely focused on a cheeseburger for lunch.";

[check going south:
	if the room is not Head of the Line:
		continue the action

carry out going south		:
	if the player is not carrying the ticket:
		say "You[']ll need a ticket to go that way."]

Chapter 2 - The Ride

HellRide is a region. Ride Entrance, Stocks, Gallows, Stake, Dungeon, Guillotine, and Ride Exit are in HellRide.

Section 1 - Ride Entrance

HellRideAuto is a scene. HellRideAuto begins when the player is in the car for the second turn. HellRideAuto ends when the player is in the Guillotine Room.

When HellRideAuto begins:
	say "The car moves forward and the safety bar begins to lower."
	
When HellRideAuto ends:
	say "You have died."
	
Saved location is a room that varies. Locker is a container. Wardrobe is a container.

To strip the player:
	now every thing carried by the player is in the locker;
	now every thing worn by the player is in the wardrobe;
	now saved location is location.

To restore the player:
	now every thing carried by the player is in the Ride Entrance;
	now every thing in the locker is carried by the player;
	now every thing in the wardrobe is worn by the player;
	move the player to saved location.

Ride Entrance is a room. Ride Entrance is south of Head of the Line. "The cars that will take you into the fearsome Hell Ride stop here for you to board.  To the south is the track that will take you into the ride. The safety bar is raised allowing you to entering the car.". 

the car is a vehicle in the Ride Entrance. The description of the car is "A car waits to take you through the horror that is Hell Ride."

before going south when the player is in the Ride Entrance:
	say "You can't go that way." instead;
	continue the action.
	
[if the car contains the player
	say "The safety bar begins to lower."]

Section 2 - Stocks Room

The Stocks Room is south of the Ride Entrance. "You see stocks here."

Section 3 - Gallows Room

The Gallows Room is south of The Stocks Room. "You see gallows here."

Section 4 - Stake Room

The Stake Room is south of The Gallows Room. "You see gallows here."

Section 5 - Dungeon

The Dungeon is south of The Stake Room. "You see a dungeon here."

Section 6 - Guillotine Room

The guillotine room is south of The Dungeon. "A guillotine is about to chop your head off."

Section 7 - Ride Exit

Ride Exit is south of The Guillotine. "You made it out alive!"

Chapter 3 - Backstage



