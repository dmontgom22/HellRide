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

Use unabbreviated object names.
Use maximum things understood at once of at least 500.
Use dynamic memory allocation of at least 131072.
Use maximum text length of at least 4096.
Use DICT_WORD_SIZE of 25.
use MAX_STATIC_DATA of 300000.
use MAX_ACTIONS of 280.
use MAX_VERBS of 350.
use MAX_SYMBOLS of 28000.

Use scoring.
The maximum score is 150.
Use American Dialect.
Use serial comma.
The block giving rule is not listed in the check giving it to rules.

Chapter 2 - Library Card Settings

The story title is "Hell Ride".
The story author is "No Shoes".
The story headline is "The ride of a lifetime...".
The story genre is "Horror".
The story description is "Hell Ride - A ride to remember...

Date night with your sweetie: dinner at your favorite restaurant and a night at the carnival. 

After a lovely meal, you get into a big fight over the tip. Your date storms off, ruining your chances of that romantic evening you had hoped for. You decide to stay and enjoy the carnival anyway.

As you explore the carnival, you learn (the hard way) that the Hell Ride attraction is malfunctioning with the potential for serious injuries to the riders. You must disable the ride off and prevent any loss of life... including your own."
The story creation year is 2025.
The release number is 201.
	
Chapter 3 - Extensions

Include Modified Exit by Emily Short.

Include Locksmith by Emily Short.

Include Basic Help Menu by Wade Clarke.

Include Menus by Wade Clarke.

Include Object Response Tests by Juhana Leinonen.

Chapter 4 - The Player, Global Code

The player is in the PL-room. 
The carrying capacity of the player is 20.
The description of the player is "You are despondent given that you and your date just had a huge fight and they stormed off. At least your hair looks nice. Maybe visiting the attractions at the carnival will make you feel better." 

hair is a thing. the hair is part of the player. the description is "Your hair is clean, well styled, and smells nice.".

some fingernails are a thing. the fingernails are part of the player. the description is "You[']ve been biting your nails. Too bad you can[']t trim them neatly.".

The coupon is in the wallet. The description of the coupon is "You found this in a stack of coupons on the counter of the gas station."

before examining the coupon:
	if show images is true, display Figure of Coupon.

The fanny pack is a player's holdall. The fanny pack is wearable. The player is wearing the fanny pack. The description of the fanny pack is "This stylish fanny pack looks like it can hold quite a bit.".

after reading a command:
	if the player's command includes "please":
		say "Please do not say 'please.'";
		reject the player's command.

after reading a command:
	if the player's command matches "load", try restoring the game instead.
	
[time]
when play begins:
	now the left hand status line is "Score: [score] / Turns: [turn count] / [the player's surroundings]";
	now the right hand status line is "Time: [time of day]".
	
The time of day is 7:53 PM.
	
[obituary]
Rule for printing the player's obituary:
	[winning move]
	if Control Panel Nine's button is switched on and Control Panel Nine's dial is properly set:
		say "As you push the indigo button, the monitor switches to a view of the guillotine room. You can still see the blade rising and falling over the cars. Suddenly, you see the blade slowing down, taking longer and longer to fall. Until it finally comes to a complete rest. 

The room is heavy with uneasy silence. The Hell Ride, once a thrilling spectacle, now looms motionless, as the guillotine blade is frozen halfway down its track. Moments ago, chaos erupted as the malfunctioning mechanism sent the blade crashing unpredictably, ripping through the roofs of cars on the track.

A single car, its roof gashed open, sits under the still blade — a grim reminder of the disaster narrowly averted. Above, a black crow lands on the guillotine’s frame, its sharp caw cutting through the murmurs of anger and fear.

Two mechanics climb the scaffolding with tools in hand, their appearance met with wary hope. A crowd has gathered and is watching, holding their breath, as the cursed ride[’]s fate hangs in the balance.

As you exit the ride, the carnival owner and the mayor are present and extending their undying gratitude for saving the day, not to mention lives![paragraph break]";
		say "*** You have won! ***";
		say paragraph break;
		rule succeeds;
	[car was toad away]
	else if toadaway is true:
		say "[line break]*** You start the long walk home. ***[line break]";
	[electrocuted by big switch]
	else if electrocuted is true:
		say "The sparks arc onto your unprotected hands electrocuting you on the spot.";
		say "[line break]*** You have died! ***[line break]";
	[grues]
	else if the location is dark:
		say "Oh no! You walked directly into the slavering fangs of a lurking grue!";
		say "[line break]*** You have died! ***";
		say paragraph break;
	[some other way to die]
	otherwise:
		say "*** You have died! ***[line break]"
		
After printing the player's obituary: 
	try requesting the complete score.
	
[fix up the map]
Index map with title set to "The Carnival".
Index map with Electrical Closet Eleven mapped northwest of Electrical Room.
Index map with Electrical Closet Seven mapped southwest of Electrical Room.
Index map with Guillotine Room mapped west of Generator Room.
Index map with room-size set to 52
	and room-size of the Electrical Room set to 74.

Chapter 5 - New Mechanics, Actions, Phrases

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

Understand "buy [things]" as buying.

Instead of buying something:
	decrease the price of the money by the price of the noun;
	say "You fork over [the price of the noun] for [the noun], leaving yourself with [the price of the money].";
	if the money is free, now the money is nowhere;
	now the price of the noun is $0.00;
	now the noun is in the location;
	silently try taking the noun;
	rule succeeds.
	
The player carries a wallet. The wallet contains money. The description is "This is a nice, leather, tri-fold wallet." The printed name of the money is "[price of the money] in cash". Understand "cash" as the money. The carrying capacity of the wallet is 2.

Instead of taking the money:
	say "Best to leave it alone until you need to BUY something."

Instead of buying something free when the player carries the noun:
	say "[The noun] is yours already."

Instead of buying the money:
	say "The money belongs to you; you buy things with it."

Understand "offer [price] to [someone]" as a mistake ("Try PAY FOR something or BUY something instead.").
Understand "pay [someone]" as a mistake ("Try PAY FOR something or BUY something instead.").
paying for is an action applying to one thing. Understand "pay for [something]" as paying for.
instead of paying for something, try buying the noun instead.
	
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

Understand "look under/underneath/beneath [something]" as looking under.
Understand "examine under/underneath/beneath [something]" as looking under.
	
Instead of looking under a thing which is underlaid by something:
	say "You find [the list of things which underlie the noun]!";
	now every thing which underlies the noun is in the location;
	now every thing which underlies the noun does not underlie the noun.

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

Section 5 - Weight Mechanics

A weight is a kind of value. 10kg specifies a weight. 10kg net specifies a weight. 10 kg specifies a weight. 
The verb to weigh means the weight property. Everything has a weight. A thing usually weighs 1kg.
Every container, every supporter, and every person has a weight called maximum weight. 
The maximum weight of a person is usually 25kg.
The maximum weight of a container is usually 15kg.
The maximum weight of a supporter is usually 15kg.

check inserting:
	let W be the weight of the noun plus the total weight of things in the second noun;
	if W is greater than the maximum weight of the second noun:
		say "There[']s no room in [the second noun] to hold [the noun].";
		stop the action.

Section 6 - Toad Away

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

Section 7 - Grues

The lurking grue is a backdrop. The lurking grue is everywhere. The description of the lurking grue is "The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is humans, but its insatiable appetite is tempered by its fear of light. No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale."

Rule for printing the description of a dark room: say "It is pitch black.  You are likely to be eaten by a grue." instead. 
Rule for printing a refusal to act in the dark: say "It is too dark in here to see." instead.

The dark terminus count is a number that varies.	
every turn when in darkness:
	increment the dark terminus count;
	if the dark terminus count is 3, end the story finally.
every turn when not in darkness, now dark terminus count is 0.

instead of examining something when in darkness, say "It[']s dark. It[']s really dark. It[']s so dark you can[']t see anything. Really.".

Section 8 - Hello Sailor

Hi-speaking is an action applying to one visible thing. Understand "hello [something]", "hi [something]" and "[someone] hello" and "[someone] hi" as hi-speaking.
Check hi-speaking:
if the noun is the sailor, say "Nothing happens here." instead;
if the noun is not a person, say "I think that only schizophrenics say 'Hello' to [a noun]." instead.
Carry out hi-speaking:
say "[The noun] bows their head to you in greeting."

The Sailor is a backdrop. The sailor is everywhere. The sailor is scenery. The description is "This sailor seems familiar to you.".

Check hi-speaking the sailor for the tenth time:
say "I think that phrase is getting a bit worn out." instead.
Check hi-speaking the sailor for the 20th time:
say "You seem to be repeating yourself." instead.

Section 9 - xyzzy

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy.

Casting xyzzy is an action applying to nothing.

Carry out casting xyzzy:
	say "A  hollow voice says 'Plugh'."
	
Understand "plugh" or "say plugh" or "cast plugh" as casting plugh.

Casting plugh is an action applying to nothing.

Carry out casting plugh:
	say "Nothing happens."
	
Section 10 - Attendants

An attendant is a kind of male person. Understand "attendent", "operator", "cashier",  "teen", "teenager", "employee", and "bored" as an attendant.  The description of an attendant is "This is a bored teenager."

Understand the command "tell" as something new.
Understand "talk to [someone] about [text]" as telling it about.
Understand "tell [someone] about [text]" as telling it about.

instead of asking an attendant about a topic listed in the Table of Attendant Conversation Responses, say "[response entry][paragraph break]".
instead of telling an attendant about something: try asking the noun about it.

Understand "talk to [someone]" as a mistake ("To start a conversation, try to ASK [the noun] ABOUT something or TELL [the noun] ABOUT something.").

Persuasion rule for asking an attendant to try going:
	say "[The actor] says, 'I can[']t leave my post or I[']ll get fired!";
	persuasion fails.
	
instead of examining an attendant:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]" instead;
	
instead of smelling an attendant, say "You get close to [the noun]. They smell like angst and regret.".

instead of listening to an attendant, say "All you can hear is [the noun] whining about working at the carnival.".

instead of touching an attendant, say "Touching [the noun] without consent is likely to get you punched in the face! Better not.".

Section 11 - The Janitor

the janitor is an a male person. the janitor is in the Head of the Line. The description of the janitor is "The janitor is a portly gentleman wearing dirty overalls, leaning on a broom.[if the janitor is wearing the brass ring] The janitor is wearing a brass ring with a key on it.[end if]".

[the janitor walks]
every turn:
	let M be the minutes part of the time of day;
	if the remainder after dividing M by 5 is 0:
		if there is a mins of M in the Table of Janitor Movements:
			choose a row with a mins of M in Table of Janitor Movements;
			let last space be the location of the janitor;
			if the janitor can be seen by the player, say "The janitor heads to [the destination entry].";
			move the janitor to the destination entry;
			if the janitor can be seen by the player, say "The janitor arrives from [the last space].";
			
instead of asking the janitor about a topic listed in the Table of Janitor Conversation Responses, say "[response entry][paragraph break]".
instead of telling the janitor about something: try asking the noun about it.

instead of giving the flashlight to the janitor:
	say "Hey! Thanks, I really appreciate it. I[']ve been lost without my flashlight.";
	now the flashlight is carried by the janitor.
	
The brass ring is a keychain. understand "chain/keychain" as the brass ring. The description is "A ring to hold keys." The brass key is a passkey. The brass key unlocks the sturdy door and the metal door. the brass key is on the brass ring. the description of the brass key is "This is a shiny brass key. It must be important if the janitor has it.". The brass ring is worn by the janitor. 

Section 12 - The Owner

Mr Whidbey is a male person. Mr Whidbey is in the Carnival Office. understand "mr/mister/Whidbey/owner" as Mr Whidbey. The description of Mr Whidbey is "The owner of the carnival, Mr. Whidbey, is dressed in s black tuxedo with a red and white striped vest. He is sporting a snazzy top hat.".

[the owner walks]
every turn:
	let M be the minutes part of the time of day;
	unless the carnival office is visited for the first time:
		if there is a mins of M in the Table of Owner Movements:
			choose a row with a mins of M in Table of Owner Movements;
			let last space be the location of Mr Whidbey;
			if Mr Whidbey can be seen by the player, say "The Mr Whidbey heads to [the destination entry].";
			move Mr Whidbey to the destination entry;
			if Mr Whidbey can be seen by the player, say "The Mr Whidbey arrives from [the last space].";
			
instead of asking Mr Whidbey about a topic listed in the Table of Owner Conversation Responses, say "[response entry][paragraph break]".
instead of telling Mr Whidbey about something: try asking the noun about it.

Section 13 - Scoring

Table of Scored Circumstances
criteria	point value	description	turn stamp
"[if the blueberries are consumed]Y[otherwise]N[end if]"	5	"Eating the blueberries"	-1
"[if your keys are visible]Y[otherwise]N[end if]"	5	"Finding the coins and keys"	-1
"[if the player is carrying the Hell Ride ticket]Y[otherwise]N[end if]"	10	"Buying the Hell Ride ticket"	-1
"[if the player is wearing the sheer veil]Y[otherwise]N[end if]"	5	"Wearing the sheer veil"	-1
"[if the player is carrying the lantern]Y[otherwise]N[end if]"	5	"Taking the lantern"	-1
"[if the player is carrying the flashlight]Y[otherwise]N[end if]"	5	"Taking the flashlight"	-1
"[if the player is carrying the mercury dime]Y[otherwise]N[end if]"	5	"Taking the Mercury dime"	-1
"[if the big switch is switched off]Y[otherwise]N[end if]"	15	"Turning off the big switch"	-1
"[if the location is the Control Room]Y[otherwise]N[end if]"	5	"Finding the Control Room"	-1
"[if the location is the Dark Passage]Y[otherwise]N[end if]"	5	"Finding the Dark Passage"	-1	
"[if the bumper cars attendant is carrying the adjustable wrench]Y[otherwise]N[end if]"	5	"Bringing the wrench to the Bumper Cars"	-1
"[if the player is carrying the aqua fuse]Y[otherwise]N[end if]"	5	"Acquiring the Aqua fuse"	-1
"[if the player is carrying the emerald fuse]Y[otherwise]N[end if]"	5	"Acquiring the Emerald fuse"	-1
"[if the player is carrying the gray fuse]Y[otherwise]N[end if]"	5	"Acquiring the Gray fuse"	-1
"[if the player is carrying the indigo fuse]Y[otherwise]N[end if]"	5	"Acquiring the Indigo fuse"	-1
"[if the player is carrying the khaki fuse]Y[otherwise]N[end if]"	5	"Acquiring the Khaki fuse"	-1
"[if electrical closet one's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Aqua switch"	-1
"[if electrical closet three's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Crimson switch"	-1
"[if electrical closet five's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Emerald switch"	-1
"[if electrical closet seven's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Gray switch"	-1
"[if electrical closet nine's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Indigo switch"	-1
"[if electrical closet eleven's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Khaki switch"	-1
"[if the player is carrying the teddy bear]Y[otherwise]N[end if]"	5	"Winning the teddy bear"	-1
"[if the player is carrying the Swiss Army knife]Y[otherwise]N[end if]"	10	"Winning the Swiss Army knife"	-1
"[if the player is carrying the poster of Taylor Swift]Y[otherwise]N[end if]"	5	"Winning the poster of Taylor Swift"	-1
"[if the player is carrying the magenta fuse]Y[otherwise]N[end if]"	5	"Winning the Magenta fuse"	-1
"[if the player is carrying the small plush monkey]Y[otherwise]N[end if]"	5	"Winning the stuffed monkey"	-1
"[if the player is carrying the orange fuse]Y[otherwise]N[end if]"	5	"Winning the Orange fuse"	-1
"[if the player is carrying the poster of Billie Eilish]Y[otherwise]N[end if]"	5	"Winning the poster of Billie Eilish"	-1
"[if the player is carrying the horseshoe magnet]Y[otherwise]N[end if]"	5	"Winning the horseshoe magnet"	-1
"[if the player is carrying the crimson fuse]Y[otherwise]N[end if]"	10	"Winning the Crimson fuse"	-1
"[if the player is carrying the small plush donkey]Y[otherwise]N[end if]"	5	"Winning the a plush donkey"	-1
"[if the player is carrying the goldfish]Y[otherwise]N[end if]"	5	"Winning the goldfish in a bowl"	-1
"[if the player is carrying the poster of Lourde]Y[otherwise]N[end if]"	5	"Winning the poster of Lourde"	-1

Every turn (this is the award points rule), award points.

The award points rule is listed before the notify score changes rule in the turn sequence rules.
	
To award points:
	repeat through Table of Scored Circumstances:
		if the turn stamp entry is -1:
			if the criteria entry is "Y":
				now turn stamp entry is turn count;
				increase the score by point value entry;
				follow the notify score changes rule;
				play the Sound of Bell.

Understand "full score" or "full" as requesting the complete score. Requesting the complete score is an action out of world.

Check requesting the complete score:
	if the score is 0, say "You have not yet achieved anything of note." instead.

Carry out requesting the complete score:
	if score is less than 100:
		say "Wow, you[']ve received [score] point[s] out of a possible [maximum score] in [turn count] moves! I[']m very proud of you. This was a triumph. I[']m being so sincere right now.[paragraph break]";
	otherwise:
		say "You[']ve received [score] point[s] out of a possible [maximum score] in [turn count] moves![paragraph break]";
	say "You have received points for the following: [paragraph break]";
	sort the Table of Scored Circumstances in turn stamp order;
	repeat through the Table of Scored Circumstances:
		if the turn stamp entry is greater than 0:
			say "•  [description entry]: [point value entry] points.".
	
check requesting the score:
	try requesting the complete score instead;
	stop the action.
	
[taking prize winnings]	
prize table is a table name that varies. The prize table is Table of High Striker Prizes.
prize taken is a truth state that varies. prize taken is false.
points awarded is a number that varies.
To receive a prize:
	let C be "[the player's command]";
	if there is an index of C in the prize table:
		choose a row with an index of C in prize table;
		say "You are now holding [description entry].";
		now the object entry is in the location;
		silently try taking the object entry;
		now prize taken is true;
		award points;
		reject the player's command;
	otherwise:
		now prize taken is false;
		continue the action.

Section 14 - Swearing

Swearing mildly is an action applying to nothing.
The Swearing mildly action translates into I6 as "Mild".

Check an actor swearing mildly (this is the block swearing mildly rule):
	say "Said with such force!";
	stop the action.

Understand "bother" as swearing mildly.
Understand the commands "curses", "drat" and "darn" as "bother".

Understand the command "screw" as something new. 
Screwing is an action applying to one thing.
Understand "screw [someone]" as screwing. Understand "screw [something]" as screwing. Understand the commands "fuck", "suck", "sodomize", and "rape" as "screw".
instead of screwing something, say "[story title] isn[']t that kind of game!".

Swearing obscenely is an action applying to nothing.
The Swearing obscenely action translates into I6 as "Strong".

Check an actor swearing obscenely (this is the block swearing obscenely rule):
	say "[one of]I can certainly understand your frustration but swearing is not the answer.[or]Real adventurers don[']t use that sort of language![or]And you kiss your mother with that mouth?[or]Shhh! Someone will hear you![at random]";
	stop the action.

Understand "[swears]" as swearing obscenely.
understand "shit", "piss", "fuck", "cunt", "cocksucker", "motherfucker", "tits", "cock sucker", "mother fucker", "prick", "cock", and "damn" as "[swears]".

Section 15 - Singing

Check an actor singing (this is the block singing rule):
	say "[one of]Your singing is abominable.[or]You open your mouth expecting a warble and getting a squawk instead.[or]Don[']t give up your day job.[or]You can[']t carry a tune in a bucket.[at random]";
	stop the action.

singing is an action applying to nothing.
Understand "sing" as singing.

Section 16 - Stealing

stealing is an action applying to one thing. Understand "steal [something]" as stealing.
	
instead of stealing something:
	if the noun is held by the player:
		say "You[']re already holding [the noun].";
	otherwise if the noun is for sale:
		say "Stealing [an noun] is unbecoming for an adventurer.";
	otherwise if the noun is the brass ring or the noun is the brass key:
		if a random chance of 3 in 10 succeeds:
			say "While the janitor is distracted, you manage to steal the brass ring from the janitor.";
			now the brass ring is in the location;
			try taking the brass ring;
		otherwise:
			say "[one of]Out of the corner of his eye, the janitor sees you reach for his key ring.[or]The janitor catches you as he turns to face you.[or]The janitor says, 'Hey! What do you think you[']re doing?![or]The janitor slaps your hand away as you reach for the key.[at random]";
	otherwise:
		say "Lowering yourself to a life of crime? You think better of it.".

Section 17 - The Strings

a thing has an object called tied to. the tied to of a thing is usually nothing. a thing can be tied or untied. a thing is usually untied. 

a string is a kind of thing

a long string is a string. understand "twine" as long string. The long string is inside the glove box. The description is "It[']s a 14' long piece of red and white striped baker[']s twine.[if the tied to of the item described is not nothing] (tied to [tied to of the item described])[end if]". the printed name is "14' long piece of string[if the tied to of the item described is not nothing] (tied to [an tied to of the item described])[end if]".

a short string is a kind of string. two short strings are in the Holding Room. the description is "It[']s a 7' long piece of red and white striped baker[']s twine.[if the tied to of the item described is not nothing] (tied to [an tied to of the item described])[end if]". [the printed name is "[the printed name of the item described][if the tied to of the item described is not nothing] (tied to [tied to of the item described])[end if]".]

untying it from is an action applying to two things. understand "untie [something] from [something]" as untying it from.
instead of untying something from:
	if the noun is untied:
		say "[The noun] isn[']t tied to [the second noun].";
	otherwise if the second noun is untied:
		say "[The second noun] isn[']t tied to [the noun].";
	otherwise if the tied to of the noun is not the second noun:
		say "[The noun] isn[']t tied to [the second noun]." instead;
	otherwise if the tied to of the noun is a string or the tied to of the second noun is a string:
		say "You untie [the noun] from [the second noun].";
		now the tied to of the noun is nothing;
		now the tied to of the second noun is nothing;
		now the noun is untied;
		now the second noun is untied;
	[otherwise if the tied to of the noun is a string or the tied to of the second noun is a string:]
	otherwise:
		say "You untie [the noun] from [the second noun].";
		now the tied to of the noun is nothing;
		now the tied to of the second noun is nothing;
		now the noun is untied;
		now the second noun is untied;
	
tying is an action applying to two things. understand "tie [something] to [something]" as tying it to.
instead of tying something to:
	if the noun is tied:
		 say "[The noun] is already tied to [the tied to of the noun].";
	otherwise if the second noun is tied:
		 say "[The second noun] is already tied to [the tied to of the second noun].";
	otherwise if the noun is the long string and the second noun is the long string:
		say "You can[']t tie [the noun] to [the second noun].";
	otherwise if the noun is not a string and the second noun is not a string:
		say "You can[']t tie [the noun] to [the second noun].";
	otherwise if the noun is a short string and the second noun is a short string:
		say "You tie [the noun] to [the second noun].";
		now all short strings are in the holding room;
		now the long string is carried by the player;
		now the tied to of the noun is the second noun;
		now the tied to of the second noun is the noun;
		now the noun is tied;
		now the second noun is tied;
	otherwise:
		say "You tie [the noun] to [the second noun].";
		now the tied to of the noun is the second noun;
		now the tied to of the second noun is the noun;
		now the noun is tied;
		now the second noun is tied;
	
Instead of cutting something:
	if the second noun is nothing:
		if the player is holding the scissors:
			say "(with the scissors)";
			try cutting the noun with the scissors;
		otherwise if the player is holding the fingernail clippers:
			say "(with the fingernail clippers)";
			try cutting the noun with the fingernail clippers;
		otherwise:
			continue the action;
	otherwise if the second noun is the scissors or the second noun is the fingernail clippers:
		if the second noun is held by the player:
			try cutting the noun with the second noun;
		otherwise:
			say "Your fingernails are not sharp enough.";
	otherwise:
		say "You can[']t cut [the noun] with [the second noun].".

cutting it with is an action applying to two things. understand "cut [something] with [something]" as cutting it with.

check cutting it with:
	if the noun is a person, say "That would hurt." instead;
	if the noun is tied, say "You can[']t cut [the noun] while it is tied to [the tied to of the noun]." instead;
	if the second noun is tied, say "You can[']t [the noun] while [the second noun] is tied to [the tied to of the second noun]." instead;
	if the second noun is not the scissors and the second noun is not the fingernail clippers, say "[The second noun] hasn[']t got enough of a blade." instead;
	if the noun is not a string or ( the the second noun is not the fingernail clippers and the second noun is not the scissors), say "You can[']t cut [the noun] with [the second noun]!" instead;
	if the noun is a short string, say "You can't cut the string any shorter." instead.

Carry out cutting it with:
	if the noun is the long string:
		now the long string is in the holding room;
		now all short strings are carried by the player.

Report cutting it with:
	say "You cut [the noun] with [the second noun]."

Section 18 - Talking/Asking/Telling/Showing

Understand "talk about [text]" as talking randomly about. Talking randomly about is an action applying to one topic.
instead of talking randomly about, say "No one wants to hear you prattle on about [the noun]."
		
Understand "talk about [something]" as talking about. Talking about is an action applying to one visible thing.
instead of talking about something :
	say "No one wants to hear you prattle on about [the noun]."

Instead of asking someone about something:
	say "'[one of]Sorry,[or]I[']m afraid[or]Hmm,[at random] [one of]I don[']t know much about that[or]you[']ve got me there[or]I haven[']t the faintest[at random],' [the noun] [one of]drawls[or]replies[or]comments[or]exclaims[at random].";
	
Instead of telling an someone about something:
	say "[The noun] looks [one of]surprised[or]intrigued[or]nonplussed[at random]. '[one of]You don[']t say[or]That[']s very interesting[or]Do go on[or]I wish I[']d known that sooner[at random]!'".
	
Instead of showing something to an someone:
	say "'[one of]Sorry,[or]I[']m afraid[or]Hmm,[at random] [one of]I don[']t know much about that[or]you[']ve got me there[or]I haven[']t the faintest[at random],' [the second noun] [one of]drawls[or]replies[or]comments[or]exclaims[at random].";

Section 19 - Senses

instead of kissing, say "Oh, my! Why would you want to kiss [the noun]? Your sweetie wouldn[']t like that!".

instead of touching a person, say "Touching [the noun] without consent is likely to get you punched in the face! Better not.".
instead of touching a thing, say "You don[']t notice anything unusual about the way [the noun][if the noun is plural-named] feel[otherwise] feels[end if]."

Understand "smell carnival" as smelling.
instead of smelling:
	if the location is in the Midway:
		say "You smell the odors of the carnival. As you inhale deeply, you can discern fresh, hot buttered popcorn, the sweet aroma of cotton candy, and the warm doughy scent of pretzels.";
	otherwise if the location is in the back stage or the location is in the second floor:
		say "You smell grease, oil, and the other scents that linger back stage.";
	otherwise if the location is in HellRide:
		say "You smell incense as it permeates through [story title].";
		
instead of listening:
	if the location is in the Midway:
		say "You can hear all the sounds of the carnival. The sounds of a calliope waft across the thoroughfare from the carousel. You can hear the laughter and screams as other patrons ride the rides and play the games.";
	otherwise if the location is in the back stage or the location is in second floor:
		say "You hear mechanical sounds: the screech metal upon metal, gears turning in precision, and the thump of the cars as they traverse the tracks through the ride.";
	otherwise if the location is in HellRide:
		say "As you travel through [story title], you hear ominous music, the murmurs of the crowd, and the occasional scream in the distance.";

instead of tasting someone, say "Ew! You[']re weird!".
instead of tasting something, say "Ew! You[']re weird!".

a thing called music is a backdrop. the description of the music is "You can hear music in the air. Perhaps you should listen to it.".
instead of listening to music, say "You can hear all the sounds of the carnival. The sounds of a calliope waft across the thoroughfare from the carousel. You can hear the laughter and screams as other patrons ride the rides and play the games.".

Section 20 - Miscellaneous

[coins]
a coin is a kind of thing. Understand "shiny" as a coin.
a nickel is a kind of coin. The description of a nickel is "Five cents, a nickel. And very shiny. The weight of a nickel is 5 grams.".
a dime is a kind of coin. The description of a dime is "It[']s a dime. Ten cents. One tenth of a dollar. And very shiny. A modern dime has a weight of 2.268 grams.".
a quarter is a kind of coin. . The description of a quarter is "It[']s a quarter. Two bits. And very shiny. The weight of a quarter is 5.67 grams.".

three quarters and one nickel underlie the seat.

[heaven and earth]
A room can be indoors or outdoors. A room is usually indoors.

The sky is a backdrop. The sky is everywhere. The description of the sky is "[if the location is outdoors]It[']s a beautiful evening. Not a cloud in the sky. The moon is out and there are so many stars to see. A shooting star streaks across the sky.[otherwise]You[']re indoors. You can[']t see the sky here."

The moon is a backdrop. It is everywhere. The description of the moon is "[if the location is outdoors]It[']s a full moon tonight. It[']s sort of romantic. Too bad you[']re alone.[otherwise]You can[']t see the moon here.".

The ground is a backdrop. The ground is everywhere. Understand "floor" as the ground. The description is "[if the location is in the midway]You see nothing special about the ground.[otherwise]You see nothing special about the floor.[end if]"

[Carnival]
The carnival is a backdrop. it is everywhere. The description of the carnival is "The carnival is lively and colorful filled with fun attractions, games, and entertainment. It features rides like the Ferris Wheel and the Carousel, game booths offering prizes, live performances such as dancers and musicians, and a variety of food stands serving treats like cotton candy, popcorn, and pretzels. The atmosphere is vibrant, with bright lights, music, and the cheerful sounds of laughter and excitement.".

[images]
show images is a truth state that varies. show images is false.

Images on is an action out of world applying to nothing. Understand "images on" as images on.
carry out images on:
	say "Images on. Game images will be displayed.";
	now show images is true.
	
Images off is an action out of world applying to nothing. Understand "images off" as images off.
carry out images off:
	say "Images off. Game images will not be displayed.";
	now show images is false.
	
[beta tester's notes]
After reading a command (this is the ignore beta-comments rule):
	if the player's command matches the regular expression "^[bracket]!@#$%^&*[close bracket]":
		say "(Noted.)";
		reject the player's command.
	
Section 21 - Does The Player Mean

[hell ride]
Does the player mean doing something with Hell Ride when the location is outdoors: it is very likely.
Does the player mean doing something with the Hell Ride ticket when (the location of the player is the Head of the Line) and (the Hell Ride attendant is in the location of the player): it is likely.

[ferris wheel]
Does the player mean doing something with the Ferris Wheel when the location is outdoors: it is very likely.
Does the player mean doing something with the Ferris Wheel ticket when (the location of the player is the FW-room) and (the Ferris Wheel attendant is in the location of the player): it is likely.

[fortune teller]
Does the player mean doing something with the fortune when the location is the FT-room: it is very likely.
Does the player mean doing something with the Fortune Teller ticket when (the location of the player is the FT-room) and (Esmeralda the Mysterious is in the location of the player): it is likely.

[bumper cars]
Does the player mean doing something with the Bumper Cars when the location is the BC-room: it is very likely.
Does the player mean doing something with the Bumper Cars ticket when (the location of the player is the BC-room) and (the Bumper Cars attendant is in the location of the player): it is likely.

[carousel]
Does the player mean doing something with the Carousel when the location is the CR-room: it is very likely.
Does the player mean doing something with the Carousel ticket when (the location of the player is the CR-room) and (the Carousel attendant is in the location of the player): it is likely.

[miscellaneous]
Does the player mean doing something with the bumper cars ticket when the location is Head of the Line: it is very unlikely.
Does the player mean doing something with the bumper cars ticket when the location is Ride Entrance: it is very unlikely.
Does the player mean doing something with the bumper cars ticket when the location is Guillotine Room: it is very unlikely.

[mini knick-knacks]
Does the player mean doing something with the mini ferris wheel when the player is carrying the mini ferris wheel: it is very likely.
Does the player mean doing something with the mini carousel when the player is carrying the mini carousel: it is very likely.

[brass key doors]
Does the player mean doing something with the brass ring when the janitor is in the location of the player: it is very likely.
Does the player mean doing something with the brass key when the location is the CS-room or the location is the dark hallway: it is very likely.

[cutting w/o second noun]
Does the player mean doing something with the scissors when the player holds the long string: it is very likely.
Does the player mean doing something with the fingernail clippers when the player holds the long string: it is very likely.

[generator]
Does the player mean doing something with the main generator when the location is the generator room: it is very likely.

[pitchers mound]
Does the player mean throwing a baseball when the location is the Pitchers Mound: it is very likely.

[high striker]
Does the player mean doing something with the High Striker when the location is the HS-room: it is very likely.
Does the player mean doing something with the mallet when the location is the HS-room: it is very likely.

[mercury dime]
Does the player mean doing something with the mercury dime when the location is the Dime Toss Game or the location is Pitchers Mound: it is likely.

[glove box]
Does the player mean doing something with the glove box when the location is PL-room: it is very likely.

[rolls of tickets in the ticket booth]
Does the player mean doing something with the rolls when the location is the TB-room: it is very unlikely.

Section 22 - Directions

[parking lot]
instead of going when the location is the PL-room:
	if the current action is going south:
		continue the action;
	otherwise:
		say "The only exit is south.";
		rule fails.

[show tent]
instead of going when the location is the ST-room:
	if the current action is going east:
		continue the action;
	otherwise:
		say "The only exit is east.";
		rule fails.

[show facade]
instead of going when the location is the SF-room:
	if the current action is going east:
		continue the action;
	otherwise if the current action is going west:
		continue the action;
	otherwise:
		say "There are exits to the east and west.".

[bumper cars]
instead of going when the location is the BC-room:
	if the current action is going southeast:
		continue the action;
	otherwise:
		say "The only exit is to the southeast.".
		
[concession stand]
instead of going when the location is the CS-room:
	if the current action is going northeast:
		continue the action;
	otherwise if the current action is going south:
		continue the action;
	otherwise if the current action is going west and the ferris wheel ticket is nowhere:
		continue the action;
	otherwise:
		if Behind the Concession Stand is visited:
			say "There are exits to the west, south, and northeast.";
		otherwise:
			say "The only exits you can see are south and northeast of here.".
			
[behind the concession stand]
instead of going when the location is Behind the Concession Stand:
	if the current action is going east:
		continue the action;
	otherwise:
		say "The only exit is to the east.".
		
[carnival office]
instead of going when the location is Carnival Office:
	if the current action is going north:
		continue the action;
	otherwise:
		say "The only exit is to the north. ".
		
[carousel]
instead of going when the location is the CR-room:
	if the current action is going southwest:
		continue the action;
	otherwise:
		say "The only exit is to the southwest.".
		
[fortune teller]
instead of going when the location is the FT-room:
	if the current action is going northwest:
		continue the action;
	otherwise:
		say "The only exit is to the northwest.".
		
[high striker]
instead of going when the location is the HS-room:
	if the current action is going northeast:
		continue the action;
	if the current action is going southeast:
		continue the action;
	if the current action is going east:
		continue the action;
	if the current action is going west:
		continue the action;
	otherwise:
		say "There are exits northeast, southeast, west, and east of here.".
		
[dime toss]
instead of going when the location is the Dime Toss Game:
	if the current action is going southwest:
		continue the action;
	otherwise:
		say "The only exit is to the southwest.".
		
[pitchers mound]
instead of going when the location is the Pitchers Mound:
	if the current action is going northwest:
		continue the action;
	otherwise:
		say "The only exit is to the northwest.".
		
[ferris wheel]
instead of going when the location is the FW-room:
	if the current action is going west:
		continue the action;
	otherwise:
		say "The only exit is to the west.".
		
[ride entrance]
instead of going when the location is the Ride Entrance:
	if the current action is going east:
		continue the action;
	if the current action is going north:
		continue the action;
	otherwise:
		if the Dark Passage is visited:
			say "There are exits to the north and east of here.";
		otherwise:
			say "The only exit you can see is to the north.".
		
[dark passage]
instead of going when the location is the Dark Passage:
	if the current action is going west:
		continue the action;
	if the current action is going south:
		continue the action;
	otherwise:
		say "The only exits you can see are to the south and west.".
		
[maintenance office]
instead of going when the location is the Maintenance Office:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going west:
		continue the action;
	if the current action is going up:
		continue the action;
	if the current action is going the ladder:
		continue the action;
	otherwise:
		if not in darkness:
			say "There are exits are to the north, south, west, and up.";
		otherwise:
			say "It[']s too dark to see.".
		
[crawl space]
instead of going when the location is the Crawl Space:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going west:
		continue the action;
	otherwise:
		if not in darkness:
			say "There are exits are to the north, south, and west.";
		otherwise:
			say "It[']s too dark to see.".
		
[mechanical room north]
instead of going when the location is the Mechanical Room North:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going west:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and west.".
		
[mechanical room south]
instead of going when the location is the Mechanical Room South:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going west:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and west.".
		
[generator room]
instead of going when the location is the Generator Room:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going west:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and west.".
		
[storage room]
instead of going when the location is Storage Room:
	if the current action is going north:
		continue the action;
	if the current action is going west:
		continue the action;
	otherwise:
		say "There are exits are to the north and west.".
		
[dark hallway]
instead of going when the location is Dark Hallway:
	if the current action is going west:
		continue the action;
	if the current action is going down:
		continue the action;
	if the current action is going the ladder:
		continue the action;
	otherwise:
		say "There are exits are to the west and down.".
		
[control room]
instead of going when the location is Control Room:
	if the current action is going east:
		continue the action;
	otherwise:
		say "The only exit is to the east.".
		
[stocks room]
instead of going when the location is the Stocks Room:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going east:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and east.".
		
[gallows room]
instead of going when the location is the Gallows Room:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going east:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and east.".
		
[stake room]
instead of going when the location is the Stake Room:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going east:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and east.".
		
[dungeon]
instead of going when the location is the Dungeon:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going east:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and east.".
		
[guillotine room]
instead of going when the location is the Guillotine Room:
	if the current action is going north:
		continue the action;
	if the current action is going south:
		continue the action;
	if the current action is going east:
		continue the action;
	otherwise:
		say "There are exits are to the north, south, and east.".
		
[ride exit]
instead of going when the location is the Ride Exit:
	if the current action is going north:
		continue the action;
	if the current action is going east:
		continue the action;
	otherwise:
		say "There are exits are to the north and east.".
		
[electrical closet 1]
instead of going when the location is the Electrical Closet One:
	if the current action is going southwest:
		continue the action;
	otherwise:
		say "The only exit is to the southwest.".
		
[electrical closet 3]
instead of going when the location is the Electrical Closet Three:
	if the current action is going west:
		continue the action;
	otherwise:
		say "The only exit is to the west.".
		
[electrical closet 5]
instead of going when the location is the Electrical Closet Five:
	if the current action is going northwest:
		continue the action;
	otherwise:
		say "The only exit is to the northwest.".
		
[electrical closet 7]
instead of going when the location is the Electrical Closet Seven:
	if the current action is going northeast:
		continue the action;
	otherwise:
		say "The only exit is to the northeast.".
		
[electrical closet 9]
instead of going when the location is the Electrical Closet Nine:
	if the current action is going east:
		continue the action;
	otherwise:
		say "The only exit is to the east.".
		
[electrical closet 11]
instead of going when the location is the Electrical Closet Eleven:
	if the current action is going southeast:
		continue the action;
	otherwise:
		say "The only exit is to the southeast.".

Chapter 6 - Figures

Figure of Hell Ride is the file "HellRide.png" ("The entrance to Hell Ride").

Figure of TicketBooth is the file "TicketBooth.png" ("A ticket kiosk").

Figure of ConcessionStand is the file "ConcessionStand.png" ("A concession stand").

Figure of LittleEgyptFacade is the file "LittleEgyptFacade.png" ("The Little Egypt facade").

Figure of LittleEgyptShow is the file "LittleEgyptShow.png" ("The Little Egypt tent").

Figure of HighStriker is the file "HighStriker.png" ("The High Striker game").

Figure of ControlPanel is the file "ControlPanel.png" ("Control panel displaying nothing").

Figure of ControlPanelStocks is the file "ControlPanelStocks.png" ("Control panel displaying the Stocks Room").

Figure of ControlPanelGallows is the file "ControlPanelGallows.png" ("Control panel displaying the Gallows Room").

Figure of ControlPanelStake is the file "ControlPanelStake.png" ("Control panel displaying the Stakes Room").

Figure of ControlPanelDungeon is the file "ControlPanelDungeon.png" ("Control panel displaying the Dungeon").

Figure of ControlPanelGuillotine is the file "ControlPanelGuillotine.png" ("Control panel displaying the Guillotine Room").

Figure of ControlPanelExit is the file "ControlPanelExit.png" ("Control panel displaying the Hell Ride Exit").

Figure of Coupon is the file "Coupon.png" ("A carnival parking coupon. Saves two dollars").

Figure of MaintenanceOffice is the file "MaintenanceOffice.png" ("A carnival maintenance office").

Figure of FerrisWheel is the file "FerrisWheel.png" ("A Ferris Wheel ride").

Figure of BumperCars is the file "BumperCars.png" ("A Bumper Cars ride").

Figure of FortuneTeller is the file "FortuneTeller.png" ("A fortune teller[']s booth").

Figure of Carousel is the file "Carousel.png" ("A Carousel").

Figure of DimeToss is the file "DimeToss.png" ("The Dime Toss game").

Figure of MilkBottles is the file "MilkBottles.png" ("The Pitcher[']s Mound game").

Figure of RideStocks is the file "RideStocks.png" ("The Stocks Room").

Figure of RideGallows is the file "RideGallows.png" ("The Gallows Room").

Figure of RideStake is the file "RideStake.png" ("The Stake Room").

Figure of RideDungeon is the file "RideDungeon.png" ("The Dungeon").

Figure of RideGuillotine is the file "RideGuillotine.png" ("The Guillotine Room").

Figure of RideExit is the file "RideExit.png" ("The Hell Ride Exit").

Figure of MercuryDime is the file "MercuryDime.png" ("A Mercury dime").

Chapter 7 - RNG Seed, Money, Dimes, Sounds - Not for release
			
When play begins:
	seed the random-number generator with 4321.
	
The price of the money is $35.00. 

Sound of Bell is the file "Silence.ogg" ("The sound of silence").

five dimes underlie the seat. 

The carrying capacity of the fanny pack is 50.

Displaying signs is an action out of world applying to nothing. Understand "display signs" as displaying signs.
carry out displaying signs:
	now sign table is Table of Tickets;
	show a sign table;
	say "[line break]";
	now sign table is Table of Concessions;
	show a sign table;
	say "[line break]";
	now sign table is Table of Merchandise;
	show a sign table;
	say "[line break]";

Displaying prices is an action out of world applying to nothing. Understand "display prices" as displaying prices.
Carry out displaying prices:
	let C be 0;
	repeat with item running through things:
		if item is for sale:
			increment C;
			say "[price of the item] [an item].";
	say "[C] items.".

Displaying fuses is an action out of world applying to nothing. Understand "display fuses " as displaying fuses.
Carry out displaying fuses:
	let C be 0;
	repeat with item running through things:
		if item is a fuse:
			increment C;
			say "[an item] is in [the location of the item].";
	say "[C] items.".
			
Displaying attendants is an action out of world applying to nothing. Understand "display attendants" as displaying attendants.
Carry out displaying attendants:
	let C be 0;
	repeat with item running through things:
		if item is an attendant:
			increment C;
			say "[an item] is an attendant in [the location of the item].";
	say "[C] items.".

Displaying containers is an action out of world applying to nothing. Understand "display containers" as displaying containers.
Carry out displaying containers:
	let C be 0;
	repeat with item running through things:
		if the item is a container or the item is a supporter or the item is a person:
			increment C;
			say "[total weight of things in the item] *** [maximum weight of the item] [an item][line break]";
	say "[C] items.".

Displaying missing descriptions is an action out of world applying to nothing. Understand "display missing descriptions" as displaying missing descriptions.			
Carry out displaying missing descriptions:
	let C be 0;
	repeat with item running through things:
		if description of the item is "":
			increment C;
			say "[an item] has no description.";
	say "[C] items.".
			
Displaying things is an action out of world applying to nothing. Understand "display things" as displaying things.
Carry out displaying things:
	let C be 0;
	repeat with item running through things:
		if the item is not a person and the item is not scenery and the item is not fixed in place and the item is not part of something:
			increment C;
			say "[weight of item] *** [price of the item] *** [an item][line break]";
	say "[C] items.".

Displaying all things is an action out of world applying to nothing. Understand "display all things" as displaying all things.
Carry out displaying all things:
	let C be 0;
	repeat with item running through things:
		increment C;
		say "[weight of item] *** [price of the item] *** [an item][line break]";
	say "[C] items.".


Chapter 8 - RNG Seed, Money, Dimes, Sounds - For Release Only

When play begins:
	seed the random-number generator with 0.

The price of the money is $20.00. 

Sound of Bell is the file "Bell.ogg" ("The sound of a bell").

three dimes underlie the seat.

The carrying capacity of the fanny pack is 15.

Part 2 - The Game

Chapter 1 - Electrical Area

Section 1 - Colors

[the color values are #00FFFF, #E32636, #00C957, #6F00FF, #6F00FF, #BDB76B, #FF00FF, #FFA500, and #E7BFB3]
Color is a kind of value. The colors are nondescript, aqua, crimson, emerald, gray, indigo, khaki, magenta, orange, and quartz. 

Understand "grey" as gray. 

Section 2 - Electrical Closets

[An electrical closet has an electrical panel. Each electrical panel has a light, a socket, and a switch. Colors and Id's inherit from the electrical panel and are referenced using the variable: [the color of holder of the noun]. Similarly, there are actions that return the corresponding switch/socket/light of the switch/socket/light. This allows us to reference which light belongs with which socket, etc. without the need to create a mass of individually named objects.]

An electrical closet is a kind of room. 

Electrical Closet One is a dark electrical closet. It is northeast of the Electrical Room. "This is Electrical Closet One. There[']s an electrical panel here and an exit to the southwest." 
Electrical Closet Three is a dark electrical closet east of the electrical room. "This is Electrical Closet Three. There[']s an electrical panel here and an exit to the west."
Electrical Closet Five is a dark electrical closet southeast of the electrical room. "This is Electrical Closet Five. There[']s an electrical panel here and an exit to the northwest."
Electrical Closet Seven is a dark electrical closet southwest of the electrical room. "This is Electrical Closet Seven. There[']s an electrical panel here and an exit to the northeast."
Electrical Closet Nine is a dark electrical closet west of the electrical room. "This is Electrical Closet Nine. There[']s an electrical panel here and an exit to the east."
Electrical Closet Eleven is a dark electrical closet northwest of the electrical room. "This is Electrical Closet Eleven. There[']s an electrical panel here and an exit to the southeast."

A silver key is in the Electrical Closet One. The description of the silver key is "This is a small silver key. I wonder what it unlocks."

Section 3 - Electrical Panels

An electrical panel is a kind of openable lockable container.
Understand "panel" as an electrical panel. Understand "screws" as an electrical panel.
An electrical panel is usually closed, locked, scenery.
An electrical panel has a color. Understand the color property as describing an electrical panel.
An electrical panel has a number called a panel id. Understand the panel id property as describing an electrical panel.

The description of an electrical panel is "Electrical Panel [the panel id] is a standard issue 200 amp electrical panel supplying 220 power throughout the ride. The electrical panel is [if the item described is open]open. Inside the panel you see a switch, a socket, and an indicator light.[otherwise]closed.[end if] [if the item described is locked]There are screws holding it shut.[otherwise]The screws for the door are gone.[end if]".

The printed name of an electrical panel is "Electrical Panel [the panel id]".

every electrical panel is unlocked by the Swiss Army knife. understand "screwdriver" as Swiss Army knife.

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
Understand "light" and "indicator light" as indicator.

The description of an indicator is "The indicator [if the Corresponding switch of the noun is switched on]is glowing [color of the holder of the item described] and [end if]is currently [if the Corresponding switch of the noun is switched on]indicating something[otherwise]indicating nothing[end if]."

The printed name of an indicator is "[Color of the holder of the item described] indicator". 

To decide what number is --/the indicator id of (I - an indicator):
	decide on the panel id of the holder of I.
	
To decide what color is --/the color of (I - an indicator):
	decide on the color of the holder of I.
	
Understand "indicator [something related by reversed incorporation]" as an indicator.
Understand "[something related by reversed incorporation] indicator" as an indicator.

Section 6 - Fuses

[resolve printed names for fuses]
when play begins:
	repeat with f running through fuses:
		now the printed name of f is "[a color of f] colored fuse";

A fuse is a kind of thing. 
Understand "fuse" as a fuse.
A fuse has a color. Understand the color property as describing a fuse.
A fuse has a number called fuse id. Understand the fuse id property as describing a fuse.
The description of a fuse is "This is [an color of the item described] colored electrical fuse." 
The printed name of a fuse is "[an color of the item described] colored fuse".

Definition: a fuse is plugged-in rather than loose if it is contained by a socket.

An aqua fuse called an fuse1 is in the merchandise stand. The fuse id of fuse1 is 1.The color of fuse1 is aqua. The price of fuse1 is $3.50.
A crimson fuse called a fuse3 is carried by the Pitchers Mound attendant. The fuse id of fuse3 is 3. The color of fuse3 is crimson. 
An emerald fuse called an fuse5 is in the grate. The fuse id of fuse5 is 5. The color of fuse5  is emerald. 
A gray fuse called a fuse7 is carried by the Bumper Cars attendant. The fuse id of fuse7 is 7. The color of fuse7 is gray. 
An indigo fuse called an fuse9 is in the safe. The fuse id of fuse9 is 9. The color of fuse9 is indigo. 
A khaki fuse called a fuse11 is in the trash can. The fuse id of fuse11 is 11. The color of fuse11 is khaki. 
A magenta fuse called a fuse13 is carried by the Strongman attendant. The fuse id of fuse13 is 13. The color of fuse13 is magenta. 
An orange fuse called an fuse15 is carried by the Dime Toss attendant. The fuse id of fuse15 is 15. The color of fuse15 is orange. 
A quartz fuse called a fuse17 is in the pyre. The fuse id of fuse17 is 17. The color of fuse17 is quartz. 

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

The description is "Switch [switch id of the item described] is part of Electrical Panel [the panel id of the holder of the item described]. It[']s a big switch. You could probably turn it [if the item described is switched off]on[otherwise]off[end if] if you wanted to."

To decide what number is --/the switch id of (S - a switch):
	decide on the panel id of the holder of S.
	
To decide what color is --/the color of (S - a switch):
	decide on the color of the holder of S.

To decide if (S - a socket) is properly fused:
	if S is filled:
		let F be a random fuse in S;[<- can only be 1]
		if the color of F is the shared color of S:
			decide yes;
	decide no.
	
Understand "switch [something related by reversed incorporation]" as a switch.
Understand "[something related by reversed incorporation] switch" as a switch.

toggling is an action applying to one thing.
understand "toggle [something]" as pushing.

flipping is an action applying to one thing.
understand "flip [something]" as pushing.

Instead of pushing a switched off switch (this is the redirect push to switch on rule):
	try switching on the noun.

Instead of pushing a switched on switch (this is the redirect push to switch off rule):
	try switching off the noun.
	
check switching on a switched off switch when the holder of the noun is not open:
	say "You should probably open the electrical panel first." instead.

Check switching on a switched off switch (this is the nothing happens unless socket is properly fused rule):
	unless the corresponding socket of the noun is properly fused:
		say "Nothing obvious happens." instead.

Last report switching on a switch (this is the final report switching on a switch rule):
	say "The [corresponding indicator of the noun]'s light goes on.";

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

The electrical room is raw and utilitarian, revealing the fragile systems behind the carnival’s magic — a humbling reminder of the power sustaining the midway’s enchantment.

[if the location is electromagnetic]This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous! There are exits in all directions.[otherwise]This room is eerily quiet, missing the ever present buzz of electricity. There are exits in all directions.[end if]".

Instead of going from the Electrical Room:
	if the big switch is switched on, move the player to a random adjacent room;
	otherwise continue the action.

some metal panels are here. they are scenery. the description is "Some are polished, others are worn and streaked with grease.".
a central breaker panel is here. It is scenery. The description is "This breaker panel controls various portions of the carnival.".
a junction box is here. It is scenery. understand "cables", "bundles", and "wires" as the junction box. The description is "This is a junction box routing the various wires and electrical cables running through the back stage area.".
an electrical workbench is here. It is scenery. understand "work" and "bench" as the electrical workbench. The description is "This is a cluttered work bench. You would have a hard time finding room to do anything on it.".
an emergency shutdown panel is an open unopenable container in the electrical room. It is scenery. "This is an emergency shut down panel. There is a switch on the panel.".
a fire extinguisher is here. It is scenery. The description is "This is a Class E fire extinguisher, specially made for electrical fires.".
a faded safety poster is here. It is scenery. The description is "The poster reads, 'Safety First!'".
a small fan is here. It is scenery. The description is "The fan sits on the desktop oscillating back and forth.".
a smudged wiring diagram is here. it is scenery. the description is "It[']s hard to make out what this is supposed to be. Better leave it alone.".
some scattered tools are here. they are scenery. the description is "These are various tools you might use to repair electrical equipment.".
some thick cable bundles are here. they are scenery. understand "wires" as thick cable bundles. the description is "Thick cable bundles snake across the ceiling.".

instead of smelling when the location is the electrical room, say "The air vibrates with electric energy, carrying the acrid scent of overheated wires and metal.".

The red switch is a device. it is part of the emergency shutdown panel. The red switch can be switched on or switched off. The red switch is switched on. The description of the red switch is "This is a big red switch, presumably to shut down the carnival rides.".

Instead of pushing or flipping or toggling a switched off red switch:
	say "You apply a considerable amount of force and push [the noun]. You listen and can still hear the sounds of the machinery working somewhere. Nothing happens.";
	try switching on the noun.

Instead of pushing or flipping or toggling a switched on red switch:
	say "You apply a considerable amount of force and push [the noun]. You listen and can still hear the sounds of the machinery working somewhere. Nothing happens.";
	try switching off the noun.

Electrical Room is south of the Generator Room. 
Electrical Room is southwest of Electrical Closet One.
Electrical Room is west of Electrical Closet Three.
Electrical Room is northwest of Electrical Closet Five.
Electrical Room is northeast of Electrical Closet Seven.
Electrical Room is east of Electrical Closet Nine.
Electrical Room is southeast of Electrical Closet Eleven.
Electrical Room is north of the Storage Room. 

Chapter 2 - Second Floor

Section 1 - Holding Room

Holding Room is a room. "This is where we hold things.".

Section 2 - Dark Hallway

Dark Hallway is a dark room. "This is a poorly lit hallway. Ahead to the west you can see [if the metal door is open]the glow of an open[otherwise]a closed[end if] door."

Section 3 - Control Room

Control Room is a dark room. "The backstage control room is a plain, functional hub where the carnival’s rides, lights, and attractions are managed. Gray industrial walls, scuffed and greasy, surround a large monitor streaming live carnival feeds. Beneath them, control panels with labeled dials, colored buttons, and lights oversee the systems scattered about the room. Glancing at the control panels, you can see they are [if the switch count is 6]lit up like a Christmas tree[otherwise]dark[end if].

The hum of electronics fills the air, punctuated by the crackle of a radio: 'Maintenance to Bumper Cars — wrench needed!' The worn floor is scattered with papers, tools, and coffee cups. A cluttered desk holds logs and schedules, while a cork board above displays charts and red-marked notes like 'Check Zipper circuit breakers.'

A flickering light casts cold shadows as the metallic tang of machinery mixes with dampness. Functional yet essential, this hidden space ensures the carnival’s magic runs seamlessly. On one wall is a large switch[if the big switch is switched on] with sparks arcing out from it[end if].

A dark hallway lies to the east." 

The metal door is an openable and lockable door. it is closed and locked. The description of the metal door is "This is the door into the Control Room. It has the words 'Employees Only' written on it. The door is [if the item described is open]open[otherwise]closed[end if]. It is [if the item described is locked]locked[otherwise]unlocked[end if].". The brass key unlocks it. The metal door is east of the Control Room and west of the Dark Hallway. 

A big switch is a device in the control room. The big switch is fixed in place. The big switch can be switched on or switched off. The big switch is switched on. 
"[if the big switch is switched on]Currently there are sparks arcing out from the switch. It looks dangerous.[end if]".
The description of the big switch is "This is a large switch. It[']s the kind Dr. Frankenstein might push to route the lightning to his creature. A label underneath the switch reads: 'Electrical Room'.".

there is a label in the control room. it is scenery. The description is "It reads, 'Electrical Room'.".

electrocuted is a truth state that varies. electrocuted is false.
instead of switching off the big switch:
	if the player is wearing the pair of gloves:
		now the electrical room is not electromagnetic;
		continue the action;
	otherwise:
		now electrocuted is true;
		end the story finally.

Instead of pushing or flipping or toggling a switched off big switch:
	now the electrical room is not electromagnetic;
	try switching on the noun.

Instead of pushing or flipping or toggling a switched on big switch:
	now the electrical room is electromagnetic;
	try switching off the noun.

a cluttered desk is in the control room. The cluttered desk is scenery. The description is "The desk is covered with all matter of detritus.".
a cork board is in the control room. The cork board is scenery. The description is "The cork board displays charts and notes.".
some charts are in the control room. They are scenery. understand "notes", "red", "red-marked" as charts. The description is "There is nothing interesting about the charts and notes.".
some papers are here. they are scenery. understand "tools", "coffee", and "cups" as papers. the description is "The worn floor is scattered with papers, tools, and coffee cups.".
some logs are here. they are scenery. understand "schedules" as logs. the description is "The cluttered desk holds logs and schedules.".

instead of listening when the location is the control room, say "The hum of electronics fills the air, punctuated by the crackle of a radio: 'Maintenance to Bumper Cars — wrench needed!'".

every turn when the location is the Control Room:
	count the switches;
	count the dials;
	[say "switch count: [switch count], dial count: [dial count].";]
	if switch count is not 6:
		now all buttons are switched off;
		repeat with item running through dials:		
			now the dial setting of the item is 0		

Section 4 - Control Panels

[The main control panel contains control panels. Each control panel has a an indicator, dial, and a button. Colors and Id's inherit from the control panels panel and are referenced using the variable: [the color of holder of the noun]. Similarly, there are actions that return the corresponding indicator/dial/button of the indicator/dial/button. This allows us to reference which indicator belongs with which dial, etc. without the need to create a mass of individually named objects.]

A control panel is a kind of open container. 
Understand "control" and "panel" as a control panel.
A control panel is scenery.
A control panel has a color. Understand the color property as describing a control panel.
A control panel has a number called a panel id. Understand the panel id property as describing a control panel.
The description of a control panel is "This is a control panel."

Control Panel One is a control panel in the Control Room. The panel id of Control Panel One is 1. The color of Control Panel One is aqua.
Control Panel Three is a control panel in the Control Room. The panel id of Control Panel Three is 3. The color of Control Panel Three is crimson.
Control Panel Five is a control panel in the Control Room. The panel id of Control Panel Five is 5. The color of Control Panel Five is emerald.
Control Panel Seven is a control panel in the Control Room. The panel id of Control Panel Seven is 7. The color of Control Panel Seven is gray.
Control Panel Nine is a control panel in the Control Room. The panel id of Control Panel Nine is 9. The color of Control Panel Nine is indigo.
Control Panel Eleven is a control panel in the Control Room. The panel id of Control Panel Eleven is 11. The color of Control Panel Eleven is khaki.

instead of examining a control panel:
	say "Each control panel is populated with a dial, a button, and a light. From left to right, the colors are aqua, crimson, emerald, gray, indigo, and khaki. Below the lights is a row of similarly colored dials and below that is a row of buttons. The control panels are [if switch count is 6]lit up like a Christmas tree[otherwise]dark[end if].[paragraph break]";
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
			if show images is true, display figure choice entry.
	
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

The description of a button is "This is the [a color of the holder of the item described] colored button.".

The printed name of a button is "the [a color of the holder of the item described] button".

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
	
last report switching on a button when the switch count is 6 and the dial count is 6 (this is the final report switching on a button rule):
	let N be the panel id of the holder of the noun;
	choose a row with a link number of N in the table of monitor descriptions;
	now ControlPanelImage is figure choice entry;
	say "The monitor flickers for a second and the scene it displays changes to something different.";
	say "[description entry][line break]";
	say "The [color of the holder of the noun] light is now on.";
	now all buttons are switched off;
	now the noun is switched on;
	now the figure id of the monitor is N;
	if the color of the holder of the noun is indigo:
		end the story finally;

Last report switching off a button (this is the final report switching off a button rule):	
	choose a row with a link number of 0 in the table of monitor descriptions;
	now ControlPanelImage is figure choice entry;
	say "The monitor turns off and the screen goes black.";
	say "[description entry][line break]";
	say "The [color of the holder of the noun] light is now off.";
	now the figure id of the monitor is 0;
	now all buttons are switched off.

Section 6 - Dials

A dial is a kind of thing. A dial is part of every control panel.
A dial is fixed in place.
A dial has a number called a dial setting. 

The description of a dial is "This is the [color of the holder of the item described] colored dial. It is currently set to [dial setting of the item described]. I bet you could SET it to a number.".

The printed name of a dial is "the [color of the holder of the item described] dial".

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

Does the player mean spinning a dial to a number when the location is the Control Room: it is very likely.
Does the player mean spinning a control panel to a number when the location is the Control Room: it is very unlikely.

Spinning it to is an action applying to one thing and one number. 
Check spinning it to: if the noun is not a dial, say "[The noun] does not spin." instead. 
Report spinning it to: 
	if the noun is a dial:
		if the number understood is less than 0 or the number understood is greater than 20:
			say "The [color of the holder of the noun] colored dial can only be set from 0 to 20.";
			stop the action;
		otherwise:
			say "The [color of the holder of the noun] colored dial is now set to [the number understood].";
			if the switch count is not 6:
				say "Before your eyes, the dial spins back to 0.";
				now the dial setting of the noun is 0;
			otherwise:
				now the dial setting of the noun is the number understood;
				
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

The printed name of a light is "the [a color of the holder of the item described] colored light".

To decide what number is --/the socket id of (L - a light):
	decide on the panel id of the holder of L.
	
To decide what color is --/the color of (L - a light):
	decide on the color of the holder of L.
	
Understand "light [something related by reversed incorporation]" as a light.
Understand "[something related by reversed incorporation] light" as a light.

Section 8 - The Monitor

ControlPanelImage is a figure name that varies. ControlPanelImage is Figure of ControlPanel.

The monitor is in the Control Room. The monitor is scenery. Understand "screen" as monitor. The monitor has a number called the figure id. The figure id is 0. The description is "This is a monitor that displays the various scenes from Hell Ride.".

instead of examining the monitor:
	let N be the figure id of the monitor;
	choose a row with a link number of N in the table of monitor descriptions;
	say "The monitor flickers for a second and the scene it displays changes to something different.";
	say "[description entry][line break]";
	now ControlPanelImage is figure choice entry;
	display ControlPanelImage.
	

Chapter 3 - The Midway

Section 1 - Parking Lot

When play begins:
	now show images is false;
	say "Type 'Images On' to display images. Type 'Help' for hints about [story title] and general information about playing interactive fiction games.";
	display the figure of Hell Ride;
	say "Date night with your sweetie: dinner at your favorite restaurant and a night at the carnival. 

After a lovely meal, you get into a big fight over the tip. Your date storms off, ruining your chances of that romantic evening you had hoped for. You decide to stay and enjoy the carnival anyway.".

The PL-room is a room. The printed name is "Parking Lot". The PL-room is north of the TB-room. The PL-room is outdoors. "The carnival parking lot stretches across an open field, its gravel crunching under arriving cars. Temporary floodlights and the carnival[']s colorful glow light the area, while distant laughter, music, and the hum of rides fill the air.

Cars park haphazardly, guided by makeshift signs and fluttering flags. Families unload strollers and blankets, their chatter mixing with the carnival sounds. Others linger in vehicles, preparing for the chilly evening.

Shadows from nearby trees create dark pockets pierced by the occasional flashlight. Near the entrance, an attendant collects fees at a weathered booth, coins jingling in the cash box.

Puddles from recent rain shimmer with reflected lights, while patches of mud cling to unwary shoes. At the far end, RVs and trailers sit quietly, their occupants watching the Ferris wheel spin lazily against the sky.

Alive with anticipation, the parking lot marks the transition from the ordinary to the magic of the carnival.

The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush.[otherwise]The bush has been picked clean.[end if][paragraph break]Your car is here. It[']s a bit of a beater. Inside the car, you can see [the list of things which are part of the beater car]."

The Parking Attendant is an attendant in the the PL-room. The parking attendant carries a parking ticket. The price of the parking ticket is $5.00. The description of the parking ticket is "This is your receipt for parking."

The parking attendant carries a parking stub. The description of the parking stub is "This stub is meant to be placed on your dashboard to indicate you paid for parking.". Understand "stub" or "ticket stub" as the parking stub.

after looking when the location is the PL-room:
	say "[if the parking attendant carries the parking ticket]The attendant has a parking ticket. The price of a parking ticket is [the price of the parking ticket].[end if]";

some parked cars are here. they are scenery. understand "vehicles" as parked cars. the description is "The cars are parked, filling the lot.".

The beater car is an open enterable unopenable container in the PL-room. The beater car is scenery. Understand "vehicle" and "car" as the beater car. The description of the beater car is "[if the player is in the beater car][bold type]Car Interior[roman type][line break][end if]This is your car. It[']s a 2002 Honda Civic and it[']s seen better days.[paragraph break][if the player is in the beater car]You[']re sitting inside your car. [end if]Even though it[']s old, it feels like an old friend. From the faux leather seats to the crack in the windshield. It[']s familiar and comforting. There are old fast food wrappers on the floor, dirty clothes and text books in the back seat. [if the player does not carry the air freshener]There is an air freshener hanging from the rear view mirror.[end if]" 

a cash box is here. it is scenery. understand "drawer" as the cash box. the description is "The cash box is full of change and paper money.".

The puddles are here. The puddles are scenery. understand "mud" as the puddles. The description is "You carefully skirt the mud and puddles to avoid getting your feet wet.".

some parking lot signs are here. they are scenery. the description is "The signs are painted with arrows pointing the way to the parking spaces."

some parking lot flags are here. they are scenery. understand "pennants" as the parking lot flags. the description is "The flags are strung from saw horse to saw horse marking the space between rows.".

The wrappers are here. The wrappers are scenery. The description of the wrappers is "McDonald[']s, Burger King, Jack In The Box, Taco Bell, Carl[']s Jr., Five Guys... You[']re a regular equal opportunity garbage gut."

The text books are here. The text books are scenery. Understand "books" as text books. The description of the text books is "The titles you see are Introduction to Calculus, Statistics, and Heart of Darkness here."

Your dirty clothes are here. Your dirty clothes are scenery. The description is "Your dirty clothes are strewn about. You really meant to do laundry days ago."

instead of looking when the player is in the beater car, try examining the beater car.

A blueberry bush is here. the blueberry bush is scenery. the blueberry bush is a container.  The description is "This is a high bush blueberry plant.". The blueberry bush is not portable. the blueberry bush contains some blueberries. Understand "bushes" as blueberry bush.

Understand "berries" as blueberries. The blueberries are edible. The description of the blueberries is "The blueberries are ripe and juicy.". The blueberries can be consumed or uneaten. The blueberries are uneaten. understand "Pick [blueberries]" as taking.
	
instead of eating the blueberries when the blueberries are uneaten:
	say "The blueberries were delicious. A true taste of summer!";
	now the blueberries are consumed;
	now the blueberries are nowhere.

check giving the coupon to the parking attendant:
	if the parking attendant carries the parking ticket:
		now the price of the parking ticket is $3.00;
		now the coupon is nowhere;
		say "Done. The price of a parking ticket is now [the price of the parking ticket].";
		stop the action;
	otherwise if the parking ticket was handled:
		say "Done. But you already bought a parking ticket.";
		now the coupon is nowhere;
		stop the action.

instead of buying the parking ticket when the player is not in the beater car:
	say "The attendant mumbles something about the stub.";
	now the player carries the parking ticket;
	now the player carries the parking stub;
	continue the action.
	
instead of buying something when the player is in the beater car:
	say "You don[']t see that here." instead.
	
understand "stub", "the stub", "ticket stub", and "the ticket stub" as "[stub]".
instead of showing the parking stub to the parking attendant: say "[The noun] replies, 'Put the ticket stub on your dashboard or your car will get towed.'".
instead of asking the parking attendant about "[stub]": say "[The noun] replies, 'Put the ticket stub on your dashboard or your car will get towed.'".
instead of telling the parking attendant about the "[stub]": say "[The noun] replies, 'Put the ticket stub on your dashboard or your car will get towed.'".

instead of going south when the location is the PL-room and the parking ticket was not handled, say "You need to buy a parking ticket to leave your car here." instead.

Section 2 - Car Interior

every turn when the location is the PL-room:
	now the left hand status line is "Score: [score] / Turns: [turn count] / [the player's surroundings]".
	
every turn when the player is in the beater car:
	now the left hand status line is "Score: [score] / Turns: [turn count] / Car Interior".

An air freshener is in the beater car. The description of the air freshener is "This is one of those air fresheners that are shaped like a pine tree and smell like one too. You bought it the last time you went to the car wash."

instead of smelling the air freshener, say "It smells like fake pine trees. The odor is pretty strong.".

A rear view mirror is part of the beater car. it is scenery. understand "rearview/rear-view" as the rear view mirror. The description is "You catch a glimpse of yourself in the rear view mirror. 'Looking good!' you think."

An ignition is part of the beater car. The ignition is a scenery container. The description is "It[']s an ignition. You put your car key here and start your car."

A dashboard is part of the beater car. The dashboard is a supporter. Understand "dash/board" as the dashboard. The description of the dashboard is "It looks like you could set something there."

A seat is part of the beater car. The seat is a supporter. It is fixed in place. Understand "car seat" as seat. The description of the seat is "A faux leather seat that looked great when it was new." The plural of seat is seats.

Your keys underlie the seat. Understand "car key", "car keys", and "key" as your keys. The description is "These are your car keys. It[']s a wonder you could even find them, your house is such a mess."

instead of turning your keys, say "If you left now you would just end up in a bar, crying over a beer about your fight. You decide to stay and enjoy the carnival after all." instead.

A glove box is part of the beater car. The glove box is a locked openable container. The description is "This glove box contains things like your registration and insurance information." Your keys unlock the glove box. Understand "glove compartment", "glovebox/compartment" as the glove box.

A pair of gloves are a thing. The pair of gloves are inside the glove box. The pair of gloves is wearable. The description of the pair of gloves is "A nice set of fur-lined leather gloves. They[']re very warm." The printed name of the pair of gloves is "pair of gloves".

Understand "exit [a direction]" as a mistake ("Please try 'go [noun]' or just '[noun]' as a direction isn[']t necessarily an exit here.")

Understand "place [something] on [something]" as putting it on. Understand "set [something] on [something]" as putting it on.  

Section 3 - Ticket Booth

After going south from the PL-room when the TB-room is unvisited and the parking ticket was handled:
	if show images is true, display Figure of TicketBooth;
	continue the action.
	
Before looking when the location is the TB-room:
	if show images is true, display Figure of TicketBooth;

The TB-room is a room. The TB-room is outdoors. The printed name is "Ticket Booth".
The TB-room is northwest of the FT-room.
The TB-room is north of Head of the Line. 
The TB-room is northeast of the CS-room. 
The TB-room is east of the SF-room. 
The TB-room is southwest of the CR-room.
The TB-room is south of the PL-room. 
The TB-room is southeast of the BC-room.
The TB-room is west of the HS-room. 

The Cashier is an attendant in the TB-room. Understand "smiling/attendant" as cashier.

The description of the TB-room is "The ticket kiosk stands at the carnival entrance, a compact booth painted in bright red and yellow stripes with bold letters above the window reading 'Tickets Here!' Twinkling lights outline its edges, blinking rhythmically to draw attention.

A single window serves visitors, where a smiling cashier dispenses colorful tickets from neatly arranged rolls. Beside the tickets, a cash drawer jingles as change is counted, and a digital payment system glows faintly for modern convenience. Too bad you don[']t have a debit card.

Next to the kiosk, a vibrant signboard lists ticket prices with playful illustrations of rides. Pennant flags flutter from the kiosk’s roof, adding to the festive atmosphere, while the smell of popcorn and pretzels wafts from the southwest.

The worn ground around the kiosk shows the passage of eager carnival-goers. Families, couples, and friends form a buzzing line, their excitement building as they approach this first step into the magic of the carnival.

The midway continues in all directions from here. There is a cashier here. A price list for attraction tickets is on the signboard. The cashier has [list of things carried by the cashier]."

a window is here. it is scenery. the description is "Behind the window is a cashier selling tickets to the various rides.".

some playful illustrations are here. they are scenery. the description is "You can see colorful illustrations of some of the rides: the Carousel, [story title], the Bumper Cars, and the Ferris Wheel.".

some pennant flags are here. they are scenery. the description is "Pennant flags flutter from the kiosk[’]s roof.".

some kiosk lights are here. they are scenery. the description is "Twinkling lights outline its edges, blinking rhythmically to draw attention.".

some rolls are here. they are scenery. understand "roll", "rolls of tickets", and "roll of tickets" as rolls. the description is "Neatly arranged rolls of colorful tickets are displayed behind the cashier.".

The ticket kiosk is a thing. It is in the TB-room. Understand "booth" as the ticket kiosk. The description of the ticket kiosk is "A single window serves visitors, where a smiling cashier dispenses colorful tickets from neatly arranged rolls. Beside the tickets, a cash drawer jingles as change is counted, and a digital payment system glows faintly for modern convenience. Too bad you don[']t have a debit card.

Next to the kiosk, a vibrant signboard lists ticket prices with playful illustrations of rides."

An attraction ticket is a kind of thing. An attraction ticket has a price. The plural of attraction ticket is attraction tickets.

a thing called a Hell Ride ticket is an attraction ticket. The cashier carries the hell ride ticket. The price of the hell ride ticket is $4.00. The description of the Hell Ride ticket is "'Admit One' to the Hell Ride.[line break]It[']s a real 'E' ticket, baby!". 

a thing called a Fortune Teller ticket is an attraction ticket. The cashier carries the fortune teller ticket. The price of the fortune teller ticket is $3.00. The description of the fortune teller ticket is "'Admit One' Have your fortune told."

a thing called a Ferris Wheel ticket is an attraction ticket. The cashier carries the ferris wheel ticket.The price of the ferris wheel ticket is $2.00. The description of the ferris wheel ticket is "'Admit One' to the Ferris Wheel."

a thing called a Bumper Cars ticket is an attraction ticket. The cashier carries the bumper cars ticket. Understand "bumper car ticket" as bumper cars ticket. The price of the bumper cars ticket is $2.00. The description of the bumper cars ticket is "'Admit One' to the Bumper Cars."

a thing called a Carousel ticket is an attraction ticket. The cashier carries the carousel ticket. The price of the carousel ticket is $1.00. The description of the carousel ticket is "'Admit One' to the Carousel."

a digital payment system is here. it is scenery. the description is "This is your usual credit/debit card reader. Too bad you have neither.".

a cash drawer is here. it is scenery. understand "box" as cash drawer. the description is "The cash drawer is full of change and paper money.".

some families are here. they are scenery. understand "couples", "visitors", and "friends" as families. the description is "Families, couples, and friends form a buzzing line, their excitement building as they approach this first step into the magic of the carnival.".

There is a signboard in the TB-room. The signboard is scenery. Understand "sign", "board", "price", and "list" as signboard. The description of the signboard is "It[']s a sign displaying the prices of the various rides".

understand the command "read" as something new. reading is an action applying to one thing. Understand "read [something]" as reading.
instead of reading the noun, try examining the noun.

instead of reading or examining the signboard:
	now sign table is Table of Tickets;
	show a sign table.
	
instead of smelling when the location is the TB-room, say "The smell of popcorn and pretzels wafts from the southwest.".

Section 4 - Concession Stand

Before going southwest when the location is the TB-room and the CS-room is unvisited:
	if show images is true, display Figure of ConcessionStand;
	continue the action.
	
Before looking when the location is the CS-room:
	if show images is true, display Figure of ConcessionStand.

The CS-room is a room. The printed name is "Concession Stand". The CS-room is outdoors. The CS-Room is east of Behind the Concession Stand. "The concession stand, perched along the midway, is a colorful and bustling hub. Painted in bright reds, blues, and yellows, it features bold lettering announcing treats like 'SODA! POPCORN! CANDY APPLES!' Strings of twinkling lights frame the stand, making it a glowing beacon amid the carnival excitement.

Behind the counter, a popcorn machine churns out golden kernels, filling the air with a buttery aroma. Candy apples gleam under the lights, and cotton candy machines spin fluffy clouds of pink and blue. Warm pretzels sit under a heat lamp, their buttery, salted scent mingling with the sugary treats. A cooler holds sodas, their colorful labels visible through the frosted glass.

The counter is lively with stacks of paper bags, napkins, and cups of cheese and sugar sprinkles. A handwritten chalkboard menu lists prices in playful lettering. Workers in colorful aprons quickly hand out snacks, their movements efficient amid the cheerful chaos.

In front of the stand, kids tug at their parents, teens share pretzels, and the crowd buzzes with energy. More than just a snack stop, the stand is a sensory delight, adding flavor and charm to the carnival experience.

To the south is the Carnival Office. The trailer’s exterior is painted in dull, peeling shades of red and white, with old carnival advertisements that are barely legible due to sun damage. A string of dimly lit, flickering bulbs hang above the door, and an old 'Private' sign is half-hanging on the side, clearly neglected.

There is a menu to the right of the window. You can see the treats inside the stand. There is an exit to the south and northeast. "

The Concession Attendant is an attendant in the CS-room. 

The concession stand is here. it is scenery. the description is "The Concession Stand, perched along the midway, is a colorful and bustling hub. Painted in bright reds, blues, and yellows, it features bold lettering announcing treats like 'SODA! POPCORN! CANDY APPLES!' Strings of twinkling lights frame the stand, making it a glowing beacon amid the carnival excitement."

some treats are here. Treats are scenery. Understand "treat/sweets/snacks/sugary/goodies" as treats. The description of treats is "There are a variety of things to eat here."

a menu is here.  Understand "sign/price/list/chalk/board/chalkboard" as menu. the Menu is fixed in place. The description of the menu is "It[']s a sign display the prices of the various concession items for sale."

a Drink is here. The price of a drink is $2.00. The description of the drink is "This soda is ice cold."

The drink is a fluid container. The liquid of the drink is Cola. understand "soda/drink/cola/Coke" as the drink. The current volume of the drink is 8.0 fl oz. 

Instead of player drinking a fluid container:
	if drink is empty:
		say "[The person asked] tip the can again only to find it empty.";
	otherwise:
		decrease the current volume of the noun by 2.0 fl oz;
		if the current volume of the noun is less than 0.0 fl oz, now the current volume of the noun is 0.0 fl oz;
		say "[The person asked] gulp down some [liquid of the noun]."

chewing is an action applying to one thing. understand "chew [something]" as chewing.
instead of chewing:
	if the noun is not carried by the player:
		say "You[']re not carrying [the noun].";
	otherwise if the noun is not the bubblegum:
		say "[The noun] doesn[']t taste very good.";
	otherwise:
		say "You chew the bubblegum, blowing a few bubbles as you do so.";
		now the printed name of the bubblegum is "chewed bubblegum";
		now the description of the bubblegum is "This is a pink ball of chewed bubblegum.";
		now the bubblegum is chewed.

some Bubblegum is here. The price of bubblegum is $1.00. Understand "bubble/gum" as bubblegum. The description of the bubblegum is "This is a square of Bazooka Joe Bubblegum. Really now, is there any other?". the bubblegum can be unchewed or chewed. the bubblegum is unchewed.

a Bucket of Popcorn is here. The bucket of popcorn is edible. The price of a bucket of popcorn is $2.50. Understand "bucket", "buttered" as bucket of popcorn. The description of the bucket of popcorn is "The bucket of popcorn looks enormous!"

a Candy Apple is here. The candy apple is edible. The price of a candy apple is $1.50. understand "apples" and "caramel" as the candy apple. The description of the candy apple is "The candy apple is your typical caramel covered apple. It looks like it would get stuck in your teeth."

Cotton Candy is here. Cotton candy is edible. The price of cotton candy is $1.50. The description of cotton candy is "The cotton candy is a mixture of pink and blue floss."

a Soft Pretzel is here. The soft pretzel is edible. The price of the soft pretzel is $1.50. understand "pretzels" as soft pretzel. The description of the soft pretzel is "The soft pretzel is generously sprinkled with salt."

instead of reading or examining the menu:
	now sign table is Table of Concessions;
	show a sign table.
	
the counter is here. it is scenery . the description is "On the counter there are paper bags, napkins, and cups of cheese and sugar sprinkles.".
the napkin dispenser is here. it is scenery. understand "napkin/napkins" as napkin dispenser. the description is "It[']s the kind of dispenser that doesn[']t allow you to take more than one at a time.".
some paper bags are here. they are scenery. the description is "The paper bags are used to send the customer off with their goodies.".
some cups are here. they are scenery. understand "cheese/sugar/sprinkles" as cups. the description is "The cups are full of cheese and sugar sprinkles Not together though. That[']s nasty!".
some concession workers are here. they are scenery. the description is "More bored teenagers doing their jobs.".
a cooler is here. it is scenery. the description is "The cooler holds sodas.".
some kids are here. they are scenery. understand "parents/teens/crowd" as kids. the description is "In front of the stand, kids tug at their parents, teens share pretzels, and the crowd buzzes with energy.".
the machine is here. it is scenery. understand "machines/popcorn/cotton/candy" as the machine. the description is "The machines faithfully prepares batch of batch of treats for the crowd.".
some aprons are here. they are scenery. the description is "These are full-sized aprons with the carnival[']s logo printed on them."

Section 5 - Behind the Concession Stand

The Behind the Concession Stand is a room. The Behind the Concession Stand is outdoors. Behind the Concession Stand is west of the CS-room. "Behind the concession stand, to one side, is the trash generated from the day[']s activities and to the other side boxes of supplies. There is a chair here surrounded by cigarette butts. There is an exit to the east."

a trash can is here. it is an openable closed container. it is fixed in place. understand "trash/can/trashcan/garbage can/garbage" as the trash can. the description is "This a garbage can overflowing with trash."

some concession boxes are here. they are fixed in place. understand "supplies/bucket/buckets/cones" as the concession boxes. the description is "The boxes of supplies are stacked high behind the concession stand. They contain buckets for the popcorn and cones for the cotton candy. Stuff like that."

a chair is enterable scenery in Behind the Concession Stand. it is a supporter. the description is "The employees sit in this chair while on break."

some cigarette butts are here. they are scenery. understand "cigarettes" as the cigarette butts. the description is "The chair is surrounded by cigarette butts carelessly discarded on the ground."

Section 6 - Carnival Office

The Carnival Office is a room. The Carnival Office is indoors. "Dim, yellow light from an overhead bulb casts long shadows over the room, A single desk lamp, flickering provides additional light. A few carnival-themed knick-knacks sit atop the desk. A framed photograph hangs askew on the wall. 

The desk is covered in stacks of paperwork, old receipts, invoices, and faded carnival brochures. A locked cabinet is tucked away against one wall. Next to it, there’s a small, heavy safe."

the filing cabinet is here. it is a closed locked openable lockable container. it is fixed in place. the description is "A locked cabinet, likely filled with old carnival financial records, is tucked away against one wall.".

a messy desk is here. it is a scenery supporter. the description is "The desk is covered in stacks of paperwork, old receipts, invoices, and faded carnival brochures.".

some paperwork is on the messy desk. it is scenery. understand "stacks/piles/financial/statements/documents" as paperwork. the description is "Piles of invoices and old financial statements cover much of the desk, but the documents seem to be a mix of chaotic disorganization and purposeful concealment. Some of the invoices are stamped with the word 'PAID' in red ink, while others appear to have been hastily shoved aside. I wonder if the carnival is in some kind of financial trouble."

some receipts are on the messy desk. understand "receipt" as receipts. the description is "These are receipts for regular day to day expenses for the carnival: paper goods, consumables, etc. Some are marked paid and others are not. Some are marked 'Overdue'. I wonder if the carnival is in some kind of financial trouble.".

instead of reading the receipts, say "The receipt on the top of the pile reads:[fixed letter spacing][paragraph break]
Cash [']N['] Carry.[line break]
121 Maple St[line break]
Stoneham, WA 98272[paragraph break]
 $82.50     Soda Cups[line break]
$106.73    Popcorn Buckets	[line break]
 $56.41     Napkins[paragraph break]
After the 10th of the month, this invoice will be assessed a finance charge of 3.75% per month, We appreciate your prompt payment.[roman type][line break]".

some invoices are on the messy desk. understand "invoice" as invoices. the description is "The invoices are for the regular day to day supplies that the carnival orders. Closer inspection shows a steadily declining volume of goods ordered. Almost as if the carnival couldn[']t afford the full cost. Some are marked 'Paid'.  A surprising number are not."

instead of reading the invoices, say "The invoice on the top of the stack reads:[fixed letter spacing][paragraph break]
Mystic Industries, Inc.[line break]
40 Elm St[line break]
Sultan, MA 01880[paragraph break]
For services rendered:[line break]
Repairs to the Stake Room in the Hell Ride Attraction after Fire			$22,500.00[paragraph break]
Please note that this invoice is overdue and will be assessed a finance charge of 2.5% per month, We appreciate your prompt payment.[roman type][line break]".

some carnival brochures are here. understand "brochure" as carnival brochures. they are scenery. the description is "The brochures are meant to be left at convenience stores restaurants, and other businesses as a way to attract visitors to the carnival." .

some knick-knacks are on the messy desk. they are scenery. understand "trinkets/knack/knick-knacks" or "knick knacks" as the knick-knacks. the description is "These are little bits of memorabilia from the carnival life. [if the mini ferris wheel is visible]There is a miniature Ferris wheel here.[end if][if the mini carousel is visible] You can also see a mini carousel here.".
a mini Ferris wheel is on the messy desk. the description is "This is a miniature reproduction of the Ferris wheel.". 
a mini carousel is on messy desk. the description is "This is a miniature replica of the Carousel.".

a office bulb is here. the printed name is "bulb". it is scenery. understand "lightbulb/lamp" or "desk lamp" or "light bulb" as office bulb. the description is "The flickering light from the lamps casts a yellow hue about the office.".

a framed photograph is here. understand "photo" as the framed photograph. the description is "This appears to be a photo of the carnival[']s opening night, a once proud moment lost in time. On the back reads a date: '03/22/62'.[if the maintenance office is visited] This looks like the same photo you found in the Maintenance Office.[end if]".

The sturdy door is an openable and lockable door. it is closed and locked . The description of sturdy door is "This is the door into the Carnival Office. It has the word 'Private' written on it. The door is [if the item described is open]open[otherwise]closed[end if] and [if the item described is locked]locked[otherwise]unlocked[end if].". The brass key unlocks it. The sturdy door is south of the CS-room and north of the Carnival Office. 

The initial appearance of a door is usually "Nearby [an item described] leads [if the other side of the item described is visited][direction of the item described from the location] to [the other side of the item described][otherwise][direction of the item described from the location][end if]."

an insurance policy is in the safe. the description is "This is an insurance policy on the Whidbey Amusements. It is for $1,000,000. That[']s an awfully high number and it was dated last month.".

the safe is in the carnival office. it is a closed locked, openable, lockable container. it is fixed in place. understand "small/heavy/knob/dial" as the safe. the description is "Next to the filing cabinet, there’s a small, heavy safe where the owner keeps more sensitive materials. There is a knob on the front of the safe".

The safe has a list of numbers called the current combination.
The safe has a list of numbers called the true combination. The true combination of the safe is {3, 22, 62}.

Instead of examining the safe:
	if the number of entries in the current combination of the safe is 0,
		say "You haven't turned the knob to any combination yet.";
	otherwise say "You have turned the knob to [the current combination of the safe].".

Instead of spinning the safe to the number understood:
	if the number understood is less than 0 or the number understood is greater than 100:
		say "The knob can only be set to numbers between 0 and 100.";
	otherwise:
		truncate the current combination of the safe to the last 2 entries;
		add the number understood to the current combination of the safe;
		if the safe is locked and the current combination of the safe is the true combination of the safe:
			say "You turn the knob to [the number understood], and you hear a click.";
			now the safe is unlocked;
		otherwise if safe is unlocked and the safe is closed and the current combination of the safe is not the true combination of the safe:
			say "You spin the knob, and [the safe] snicks locked.";
			now the safe is locked;
		otherwise:
			say "You turn the knob to [the number understood]."

Section 7 - High Striker

Before going east when the location is the TB-room and the HS-room is unvisited:
	if show images is true, display Figure of HighStriker;
	continue the action.
	
Before looking when the location is the HS-room:
	if show images is true, display Figure of HighStriker.

[ this was a forward reference that Inform 7 couldn't resolve for some reason]
A room called the Pitchers Mound is southeast of the HS-room. 

The HS-room is a room. The printed name is "High Striker". The HS-room is west of the FW-room, southwest of the Dime Toss Game, and northwest of the Pitchers Mound. The printed name is "High Striker". The HS-room is outdoors. "This area features a tall, eye-catching machine adorned with bright, colorful lights, typically red, yellow, and blue. A large sign at the top reads 'Test Your Strength!' in bold, playful lettering. The machine[’]s base is made of polished wood, giving it a vintage appearance. At the center is a sturdy metal pole, with a large bell hanging at the top, signaling when a successful attempt has been made. Along the length of the pole are markings indicating how strong you are.  A nearby sign says, 'Buy a mallet, strike the bell, win a prize.'[if the strongman attendant contains the mallet] You can see an over-sized mallet here.[end if]

Spectators gather around, cheering on participants and offering lighthearted jabs and encouragement, creating a lively, competitive atmosphere. The sound of the mallet hitting the target is followed by the resonant clang of the bell (if struck), alongside the buzz of carnival music in the background. 

The Ticket Kiosk is to the west. Other games are northeast and southeast of here. The Ferris Wheel lies to the east."

The markings are here. The markings are scenery. Understand "marking" and "sign", "signs", and "pole" as markings. The description of markings is "There are five levels marked on the pole: Weakling, Getting There, Average, Almost There, and Muscle Man."

The Strongman Attendant is an attendant in the HS-room. 

after looking when the location is the HS-room:
	say "[if the strongman attendant carries the mallet]The attendant is holding a mallet.[end if]";

after examining the strongman attendant when the HighStrikerWin is true, show the high striker prizes. 
after looking when the HighStrikerWin is true and the location is the HS-room, show the high striker prizes.
	
instead of listening when the location is the HS-room, say "The sound of the mallet hitting the target is followed by the resonant clang of the bell ), alongside the buzz of carnival music in the background.".
	
The High Striker is in the HS-room. It is scenery. understand "machine", "wood", "polished" and "base" as High Striker. the description is "The High Striker is a tall, eye-catching machine adorned with bright, colorful lights. A large sign at the top reads 'Test Your Strength!'. The machine[’]s base is made of polished wood. At the center is a sturdy metal pole, with a large bell hanging at the top.".

The bell is here. The bell is scenery. The description of the bell is "This is the bell that will ring out when you prove to everyone that you[']re a 'Muscle Man'."

a High Striker sign is here. it is scenery. the description is "Buy a mallet, strike the bell, win a prize."

some High Striker spectators are here. they are scenery. understand "participants" as High Striker spectators. the description is "Spectators gather around, cheering on participants and offering lighthearted jabs and encouragement.".

A teddy bear is carried by the Strongman attendant. The description of the teddy bear is "This is a teddy bear like you had when you were a kid. Right down to the red bow around its neck." 

A Swiss Army knife is carried by the Strongman attendant. The description of the Swiss army knife is "This is the standard issue Swiss Army knife. It has [a list of things which are part of the item described]."  The printed name of the Swiss Army knife is "Swiss Army knife". 

A screwdriver is part of the Swiss army knife. The description of the screwdriver is "It[']s a handy tool that[']s part of the Swiss Army knife."
An awl is part of the Swiss army knife. The description of the awl is "It[']s a handy tool that[']s part of the Swiss Army knife."
A fingernail clippers is part of the Swiss army knife. The description of the fingernail clippers is "It[']s a handy tool that[']s part of the Swiss Army knife."
A can opener is part of the Swiss army knife. The description of the can opener is "It[']s a handy tool that[']s part of the Swiss Army knife."
A corkscrew is part of the Swiss army knife. The description of the corkscrew is "It[']s a handy tool that[']s part of the Swiss Army knife."

instead of taking when the noun is part of the Swiss army knife, say "That[']s part of the Swiss Army knife. You can[']t take that!" instead.

clipping is an action applying to one thing. understand "clip [something]" as clipping. understand "trim [something]" as clipping. understand "cut [something]" as clipping.
instead of clipping fingernails, say "Your fingernails look much neater now that you[']ve trimmed them.".

biting is an action applying to one thing. understand "bite [something]" as biting.
instead of biting fingernails, say "That[']s a bad habit. You should really try to stop biting your fingernails."
	
A poster of Taylor Swift is carried by the Strongman attendant. The description of the poster of Taylor Swift is "This is a poster of America[']s sweetheart, Taylor Swift."

A lever is here. The lever is fixed in place. Understand "bullseye", "striker", and "target" as lever. The description of the lever is "There is a bullseye on the base of the lever. I guess this is where you have to hit the mallet."

A mallet is carried by the Strongman attendant.  The price of the mallet is $2.00. Understand "hammer" as mallet. The description of the mallet is "The mallet is over sized, perhaps to give you an advantage in the Strong Man game."

A strength pattern is a kind of value. The strength patterns are Weakling, Getting Stronger, Average, Almost There, Muscle Man.

understand the command "punch" as something new.
piercing is an action applying to two things. Understand "pierce [something preferably held] with [something]" as punching.
punching is an action applying to two things. Understand "punch [something preferably held] with [something]" as punching.
instead of punching:
	say "You [if the second noun is not the awl or the noun is not the wallet]can[']t [end if]punch a hole in [the noun] with the [second noun].".
	
instead of asking the strongman attendant about "mallet/lever/bullseye/striker/target", say "Use the mallet to strike the bullseye. Ring the bell to win a prize.".

understand the command "hit" as something new. understand the command "swing" as something new.
hitting relates one thing to one thing. The verb to hit means the hitting relation.
Hitting is an action applying to two visible things. 
Understand "hit [something] with [something preferably held]" as hitting.
Understand "strike [something] with [something preferably held]" as hitting.
Understand "swing [something preferably held] at [something]" as hitting (with nouns reversed).  

Rule for supplying a missing second noun while hitting:
	if the mallet is carried, now the second noun is the mallet;
	otherwise say "You will have to specify what to hit [the noun] with."

Check hitting:
	if noun is an attendant:
		say "[The noun] blocks your swing and takes [the second noun] from you!";
		now the second noun is nowhere;
		stop the action;
	if noun is not lever, say "Nothing happens." instead;
	if the second noun is not mallet and the second noun is not the sledgehammer, say "You can[']t hit [the noun] with [the second noun]!" instead;
	if the player is not carrying the mallet and the player is not carrying the sledgehammer, say "You[']re not holding anything you can hit with." instead.
	
some High Striker prizes are here. understand "stuffie", "stuffed", "animals", "novelty", "toys", "quirky", and "trinkets" as high striker prizes. the description is "The prizes range from stuffed animals and novelty toys to shiny trinkets and quirky collectibles."

instead of examining the high striker prizes:
	say "The prizes are [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of High Striker Prizes:
		choose row N in the Table of High Striker prizes;
		if object entry is carried by the strongman attendant:
			say "[description entry][if N < number of rows in the Table of High Striker Prizes], [end if][if N is the number of rows in the Table of High Striker Prizes - 1]and [end if][if N is the number of rows in the Table of High Striker Prizes].[end if]".

To show the High Striker prizes:
	say "[line break]Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of High Striker Prizes:
		say "[index in row N of the Table of High Striker Prizes]) [description in row N of the Table of High Striker Prizes][if N < number of rows in the Table of High Striker Prizes], [otherwise]?[end if]".

Carry out hitting when the noun is the lever and the second noun is the mallet and the player is carrying the mallet:
	say "You lift the mallet high and bring it down on the lever with all your might! The striker rises towards the bell stopping at '[a random strength pattern between weakling and almost there]'.[line break] ";
	
after hitting the lever when the second noun is the mallet for the fourth time:
	say "You can[']t be sure of it but it seems as if the mallet isn[']t heavy enough to ring the bell.".
after hitting the lever when the second noun is the mallet for the seventh time:
	say "This mallet is definitely not heavy enough to ring the bell.".
	
HighStrikerWin is a truth state that varies. HighStrikerWin is false.
After hitting the lever when second noun is the sledgehammer:
	play the sound of Bell;
	now HighStrikerWin is true;
	say "As you swing, you feel the extra weight from the sledgehammer. As it comes down on the bullseye, you can[']t help but feel like the extra weight gives you an edge. The bell rings as the striker reaches the top of the pole. The attendant says, 'You[']re a Muscle Man. Here[']s a prize for you.'";
	show the high striker prizes.

after reading a command when the location is the HS-room and HighStrikerWin is true:
	now prize table is Table of High Striker Prizes;
	receive a prize;
	if prize taken is true:
		now HighStrikerWin is false;
		stop the action.
	
Section 8 - Dime Toss

Before going northeast when the location is the HS-room and the Dime Toss Game is unvisited:
	if show images is true, display Figure of DimeToss;
	continue the action.
	
Before looking when the location is the Dime Toss Game:
	if show images is true, display Figure of DimeToss.

A room called the Dime Toss Game is northeast of the HS-room. "The game booth is adorned with vibrant colors — red-and-white striped awnings, twinkling lights, and eye-catching signage that reads 'TOSS A DIME — WIN A PRIZE!'. You can see prizes of all shapes and sizes hang around the booth, from stuffed animals and novelty toys to shiny trinkets and quirky collectibles. The larger prizes are prominently displayed to entice passersby. Rows of gleaming plates sparkle under overhead lights, their glass surfaces reflecting the surrounding glow.

The distinctive 'ping' of dimes hitting plates creates a rhythmic soundtrack, punctuated by the occasional satisfying 'plop' when a dime lands perfectly. Victorious shouts mix with playful groans of near-misses, creating a symphony of excitement. Nearby, the hum of other booths, upbeat carnival music, and the distant laughter of children add to the lively backdrop. The booth operator calls out enthusiastically, 'Step right up! Test your skill! Win big!' Their energetic pitch draws in curious onlookers.[if a dime underlies the Dime Toss  booth] You thought you caught a flash of something coming from the area of the booth.[end if]

You[']re surprised to see that this game only costs a dime. The exit is to the southwest."

the Dime Toss booth is a thing in the Dime Toss Game. the Dime Toss booth is scenery. understand "game" as the dime toss booth. The description of the Dime Toss booth is "The game booth is adorned with vibrant colors — red-and-white striped awnings, twinkling lights, and eye-catching signage. [if a dime underlies the Dime Toss booth] You can see something shiny on the ground under the booth.[end if]". understand "awning", "awnings", "twinkling", and "lights" as the dime toss booth.

a Mercury dime is a dime. it underlies the Dime Toss booth. The description is "The Mercury dime is a ten-cent coin struck by the United States Mint from late 1916 to 1945. Designed by Adolph Weinman and also referred to as the Winged Liberty Head dime, it gained its common name because the obverse depiction of a young Liberty, identifiable by her winged Phrygian cap, was confused with the Roman god Mercury. It is 90% silver, 10% copper, and has a weight of 2.50 grams."

before examining the mercury dime:
	if show images is true, display Figure of MercuryDime.

Tossing relates one thing to another.
The verb to toss means the tossing relation.

Tossing is an action applying to two things.
Understand "toss [something preferably held] at/on [something]" as tossing.
Understand "flip [something preferably held] at/on [something]" as tossing.
Understand "throw [a dime] at/on [something]" as tossing.
		
check tossing a dime when the location is the Dime Toss Game:
	if the player carries a dime:
		continue the action;
	otherwise:
		say "That seems futile to me.";
		rule fails.

A small plush monkey is carried by the Dime Toss attendant. Understand "stuffie" and "stuffed" as small plush monkey. The description of the small plush monkey is "You feel rather underwhelmed as you look at the small plush monkey on a key chain."

A poster of Billie Eilish is carried by the Dime Toss attendant. The description of the poster of Billie Eilish is "This is a poster of Billie Eilish. Doesn[']t your sweetie like them?"

A horseshoe magnet is carried by the Dime Toss attendant. The description of the horseshoe magnet is "This is a magnet. It[']s shaped like a horseshoe."

the Dime Toss sign is here. it is scenery. understand "signage" as the dime toss sign. the description is "The sign reads, 'TOSS A DIME - WIN A PRIZE!'.".

some Dime Toss prizes are here. understand "stuffie", "stuffed", "animals", "novelty", "toys", "quirky", and "trinkets" as dime toss prizes. the description is "The prizes range from stuffed animals and novelty toys to shiny trinkets and quirky collectibles."

instead of examining the Dime Toss prizes:
	say "The prizes are [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Dime Toss Prizes:
		choose row N in the Table of Dime Toss prizes;
		if object entry is carried by the dime toss attendant:
			say "[description entry][if N < number of rows in the Table of Dime Toss Prizes], [end if][if N is the number of rows in the Table of Dime Toss Prizes - 1]and [end if][if N is the number of rows in the Table of Dime Toss Prizes].[end if]".

instead of listening when the location is the Dime Toss Game, say "The distinctive 'ping' of dimes hitting plates creates a rhythmic soundtrack.".

To show the Toss A Dime prizes:
	say "[line break]Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Dime Toss Prizes:
		say "[index in row N of the Table of Dime Toss Prizes]) [description in row N of the Table of Dime Toss Prizes][if N < number of rows in the Table of Dime Toss Prizes], [otherwise]?[end if]".

TossADimeWin is a truth state that varies. TossADimeWin is false.
instead of tossing a dime when the second noun is the plate and the player carries the noun:
	say "You toss the dime. [run paragraph on]";
	if the noun is the mercury dime:
		now TossADimeWin is true;
		now noun is nowhere;
		say "The heavier Mercury dime hits the plate, starts to spins, and lands in the center of the plate. The attendant shouts out, 'Winner! Winner!'";
		show the Toss A Dime prizes;
	otherwise:
		let N be a random number between 1 and 3;
		if N is:
			-- 1: say "The dime hits the plate and bounces straight off.";
			-- 2: say "Like skipping a stone in water, the dime skitters off the plate.";
			-- 3: say "The dime lands on the edge of the plate. You watch in anticipation until the dime falls off the plate.";
		now the noun is nowhere.

after reading a command when the location is the Dime Toss Game and TossADimeWin is true:
	now prize table is Table of Dime Toss Prizes;
	receive a prize;
	if prize taken is true:
		now TossADimeWin is false;
		stop the action.
			
The plate is a supporter in the Dime Toss Game. Understand "plates" as plate. The description of the plate is "These are small, flat plates, almost saucers. You are meant to toss a dime on these plates to win a prize!"

The Dime Toss Attendant is an attendant in the the Dime Toss Game. understand "operator" as dime toss attendant.

after examining the Dime Toss attendant when the TossADimeWin is true, show the toss a dime prizes. 
after looking when the TossADimeWin is true and the location is the Dime Toss Game, 	show the Toss A Dime prizes.

Section 9 - Pitchers Mound

Before going southeast when the location is the HS-room and the Pitchers Mound is unvisited:
	if show images is true, display Figure of MilkBottles;
	continue the action.
	
Before looking when the location is the Pitchers Mound:
	if show images is true, display Figure of MilkBottles.

A room called the Pitchers Mound is southeast of the HS-room. "The milk bottle ball toss is a classic carnival game that combines skill, strength, and a bit of luck. The setup features a pyramid of brightly colored milk bottles stacked on a sturdy platform — three on the bottom, two in the middle, and one on top. Players stand behind a marked line and toss baseballs, aiming to knock down as many bottles as possible. Clearing the entire stack wins a prize.

The booth buzzes with energy, its colorful banners and flashing lights drawing a lively crowd. The satisfying clatter of falling bottles mixes with cheers and groans from players and spectators. A carnival attendant calls out, 'Step right up and test your aim! Three balls for just a dime.' Prizes — ranging from small toys to giant stuffed animals — hang prominently, enticing players to take a shot. With every toss, the game delivers moments of suspense, joy, and fun, making it a favorite at the carnival.

You[']re surprised to see that this game only costs a dime. The High Striker is to the northwest.".

A small plush donkey is carried by the Pitchers Mound attendant. Understand "stuffie" and "stuffed" as small plush donkey. The description is "You feel rather underwhelmed as you look at the small plush donkey on a key chain."

A poster of Lourde is carried by the Pitchers Mound attendant. The description of the poster of Lourde is "This is a poster of Lourde. You love her music."

A goldfish is carried by the Pitchers Mound attendant. Understand "bowl" as goldfish. The description of the goldfish is "This is a small goldfish in a bowl. A pet is just what you need."

a baseball is a kind of thing. Understand "ball" as baseball.The Pitchers Mound attendant carries three baseballs. The description of a baseball is "This is a regulation MLB baseball."

some Pitchers Mound spectators are here. they are scenery. the description is "The satisfying clatter of falling bottles mixes with cheers and groans from players and spectators.".

the Pitchers Mound booth is here. it is scenery. the description is "The booth buzzes with energy, its colorful banners and flashing lights drawing a lively crowd.".

some banners are here. they are scenery. understand "flashing", and "lights" as the banners. the description is "The booth buzzes with energy, its colorful banners and flashing lights drawing a lively crowd.".

instead of listening when the location is the Pitchers Mound, say "The satisfying clatter of falling bottles mixes with cheers and groans from players and spectators.".

The futile to throw things at inanimate objects rule is not listed in the check throwing it at rules.

The block throwing at people rule is listed instead of the block throwing at rule in the check throwing it at rules.

This is the block throwing at people rule:
	if the second noun is a person, say "That might be construed as an attack." instead.

Throwing is an action applying to two things.
Understand "throw [something preferably held] at/on [something]" as throwing.

Instead of buying a baseball, say "You don[']t need to buy the baseballs. Just give the attendant a dime.".

some Pitchers Mound prizes are here. Understand "toys", "toy", "stuffed", "stuffie", "stuffed animal", "animal", "animals", and "prizes" as Pitchers Mound prizes. The description is "Prizes - ranging from small toys to giant stuffed animals - hang prominently.".

instead of examining the Pitchers Mound prizes:
	say "The prizes are [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Pitchers Mound Prizes:
		choose row N in the Table of Pitchers Mound prizes;
		if object entry is carried by the Pitchers Mound attendant:
			say "[description in row N of the Table of Pitchers Mound Prizes][if N < number of rows in the Table of Pitchers Mound Prizes], [end if][if N is the number of rows in the Table of Pitchers Mound Prizes - 1]and [end if][if N is the number of rows in the Table of Pitchers Mound Prizes].[end if]".
		
To show the Pitchers Mound prizes:
	say "[line break]Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Pitchers Mound Prizes:
		say "[index in row N of the Table of Pitchers Mound Prizes]) [description in row N of the Table of Pitchers Mound Prizes][if N < number of rows in the Table of Pitchers Mound Prizes], [otherwise]?[end if]";
		
instead of giving a dime to the pitchers mound attendant:
	say "The attendant gives you three baseballs in return and says, 'Throw the baseball at bottle X where X is the bottle number you want to hit. The bottles are numbered one to six'.";
	now the noun is nowhere;
	now the player carries every baseball;
	stop the action.

understand "throw [baseball] at [milk bottles]" as a mistake ("THROW baseball at BOTTLE X where X is the bottle number you want to hit. The bottles are numbered one to six'.")

instead of throwing a baseball at the milk bottles:
	if the player carries a baseball:
		say "THROW baseball at BOTTLE X where X is the bottle number you want to hit. The bottles are numbered one to six'.";
		continue the action;
	otherwise:
		say "That seems futile to me.";
		rule fails.
		
instead of throwing a baseball at a bottle:
	if the player carries a baseball:
		continue the action;
	otherwise:
		say "That seems futile to me.";
		rule fails.
		
the milk bottles are in the Pitchers Mound.  understand "pyramid" and "stack" as milk bottles."The milk bottles are stacked in three neat rows: three bottles on the bottom, two in the middle, and one on top.[paragraph break][fixed letter spacing]         1         [line break]       2   3     [line break]     4   5   6     [line break][roman type]". the description is "The milk bottles are stacked in three neat rows: three on the bottom, two in the middle, and one on top. [paragraph break][fixed letter spacing]         1         [line break]       2   3     [line break]     4   5   6     [line break][roman type]"

a bottle is a kind of thing. 
a bottle has a number called an Id. Understand the Id property as describing a bottle.
the description is "This is a milk bottle marked with the number [an id of the item described].". the printed name is "bottle [id of the item described]".

bottle 1 is a bottle in the pitchers mound. it is scenery. the id of bottle 1 is 1.
bottle 2 is a bottle in the pitchers mound. it is scenery. the id of bottle 2 is 2.
bottle 3 is a bottle in the pitchers mound. it is scenery. the id of bottle 3 is 3.
bottle 4 is a bottle in the pitchers mound. it is scenery. the id of bottle 4 is 4.
bottle 5 is a bottle in the pitchers mound. it is scenery. the id of bottle 5 is 5.
bottle 6 is a bottle in the pitchers mound. it is scenery. the id of bottle 6 is 6.
		
PitchersMoundWin is a truth state that varies. PitchersMoundWin is false.
instead of throwing a baseball at a bottle when the player carries the noun:
	say "You wind up and throw the baseball at the milk bottles. [run paragraph on]";
	if the second noun is bottle 5:
		now PitchersMoundWin is true;	
		say "The ball hits the bottles in the sweet spot and they topple over onto the platform. The attendant shouts out, 'Winner! Winner!'";
		show the Pitchers Mound prizes;
		now every baseball is nowhere;
	otherwise:
		let N be a random number between 1 and 5;
		if N is:
			-- 1: say "You knocked over one bottle. You can do better than that.";
			-- 2: say "You knocked over two bottles. Too bad.";
			-- 3: say "You knocked over three bottles. So close.";
			-- 4: say "You knocked over four bottles. So sad.";
			-- 5: say "You knocked over five bottles. Better luck next time.";
		now the noun is nowhere.

after reading a command when the location is the Pitchers Mound and PitchersMoundWin is true:
	now prize table is Table of Pitchers Mound Prizes;
	receive a prize;
	if prize taken is true:
		now PitchersMoundWin is false;
		stop the action.
			
The Pitchers Mound Attendant is an attendant in the Pitchers Mound. 

after examining the pitchers mound attendant:
	if PitchersMoundWin is true, show the pitchers mound prizes. 
	
after looking when the PitchersMoundWin is true and the location is the Pitchers Mound:
	show the Pitchers Mound prizes.

Section 10 - Show Facade

Before going west when the location is the TB-room and the SF-room is unvisited:
	if show images is true, display Figure of LittleEgyptFacade;
	continue the action.

Before looking when the location is the SF-room:
	if show images is true, display Figure of LittleEgyptFacade.

SF-room is a room. SF-room is east of ST-room. The printed name is "Show Facade". SF-room is outdoors. "You head west through the midway, the bright lights of the carnival fading behind you as you approach a tent. A sign above the entrance reads 'Little Egypt Show — A Journey Into the Mysterious and Exotic!' A rotund barker, wearing a fez and a dazzling smile, gestures to a small sign beside him. The Ticket Kiosk is back the way you came.

There is a stage in front of the tent. The Barker is encouraging you to step up and enjoy the Little Egypt Show."

the facade is in the SF-room. it is scenery. the description is "You are standing in front of a dark and mysterious tent filled with illusions and mysterious performers. Perhaps there’s a bearded lady inside, offering cryptic clues about your journey or a hidden artifact that can be collected. There is a stage in front of the tent. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show."

To say the barker's cry:
	say "The barker cries:[paragraph break]Ladies and gentlemen, boys and girls, gather [']round! [line break]Step right up and witness the spectacle that[’]s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids — a dazzling display of mystery, grace, and exotic allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await!"
	
some facade incense is here. they are scenery. the description is "The smell of incense and spices wafts through the tent.". understand "spices" as facade incense.
instead of smelling when the location is the ST-room, try examining the incense instead.

report going west when the location is the SF-room and the location is unvisited:
	say "[the barker's cry]".

a tent is in the SF-room. it is scenery. the description is "Inside the tent is the Little Egypt show.".

the facade stage is here. it is scenery. the description is "On the stage stands a barker extolling the wonders of Little Egypt.".

a fez is here. it is scenery. understand "hat" as fez. the description is "The fez is a type of hat that originates from the Ottoman Empire and is named after the city of Fez in Morocco. It is a brimless, cylindrical or truncated conical hat, typically made of red felt. The hat often features a black tassel that hangs from the top, though the design can vary slightly.".

A sign is in the SF-room. The sign is scenery. The description of the sign is "The sign reads, 'Little Egypt Show — Dime Admission'. Underneath it says 'The show starts every 15 minutes beginning at the top of the hour.'".

The Barker is a man in SF-room. Understand "attendant", "attendent", "operator", "shirt", "pants", and "vest" as the Barker. The description of the barker is "Here is a man dressed in black pants, a blue shirt, a red vest, a hat much like a fez, and a dazzling smile.". 

after examining the barker, say "[the barker's cry]".

Check going west when the location is the SF-room and the barker is not carrying a dime:
	say "It[']ll cost you a dime to go that way.";
	stop the action.

After giving when the noun is dime and the second noun is barker:
	say "You hand over a dime, and the barker nods, waving you through. As you step past the entrance, the air feels thicker, almost humid, and the sounds of the carnival fade away. You’ve entered an entirely different world now — one filled with the scents of incense and exotic spices, and the low, hypnotic music of a faraway land. Before you, a series of dimly lit tents stretch out, their flaps slightly swaying in the breeze. Intrigued, you take your first step into the Little Egypt Show. You can now head west into the show."
	
instead of listening when the location is the SF-room, say "You hear the low, hypnotic music of a faraway land.".
instead of smelling when the location is the SF-room, say "The smell of incense and spices wafts through the tent."

Section 11 - Show Tent	

Before going west when the location is the SF-room and the ST-room is unvisited and barker is carrying a dime:
	if show images is true, display Figure of LittleEgyptShow;
	continue the action.
	
Before looking when the location is the the ST-room:
	if show images is true, display Figure of LittleEgyptShow.		

The ST-room is a room. The printed name is "Show Tent". The ST-room is west of SF-room. "You are inside the Little Egypt Show. The attraction[']s facade is to the east. There are folding chairs organized neatly in rows. The show should start soon."

Little Egypt is a woman. Little Egypt is in the ST-room. Little Egypt is scenery. The description of Little Egypt is "Little Egypt is a beautiful woman who is draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements.". understand "silk", "veils", "bodice", "sequined", "sequins", "flowing", "skirt", "jingling", "coins", "belts", "belt" and "jewelry" as Little Egypt.

A sheer veil is a wearable thing. understand "pink" as the sheer veil. The description of the Sheer Veil is "This is a sheer pink veil that Little Egypt wore (and removed) during her show. Your head swims as you smell the scent of her perfume on the veil: Pyramid Patchouli.".

instead of smelling the sheer veil, say "The smell of Pyramid Patchouli fills your head.".

after wearing the sheer veil, say "You wrap the veil around your head, shrouding your eyes. The world is a lovely color pink as you look through the veil while her perfume fills your nostrils in the most delightful way. You look pretty!"

the show tent is a thing in the ST-room. it is scenery. The description is "You are inside the Little Egypt Show. The attraction[']s facade is to the east. There are folding chairs organized neatly in rows.". 

The Stage is here. The Stage is scenery. understand "market", "palace" as the stage. The description of the Stage is "The stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The canvas displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'."

some painted scenes are here. they are scenery. understand "pyramids", "pyramid", "desert", "landscapes", "domed", and "structures" as the painted scenes. the description is "The canvas displays painted scenes of pyramids, desert landscapes, and domed structures .".

some incense is here. they are scenery. the description is "The smell of incense and spices wafts through the tent.". understand "spices" as incense.
instead of smelling when the location is the ST-room, try examining the incense instead.

instead of listening when the location is the ST-room, say "The soft sounds of exotic music fill the air.".

some fabric is here. they are scenery. understand "fabrics" as fabric. the description is "The linen and silk fabrics come in all different colors.".

some brass ornaments are here. they are scenery. the description is "There are highly polished incense holders and brass lanterns here.". understand "polished", "holders", "holder", and "brass" as brass ornaments.

The canvas display is here. It is scenery. understand "backdrop" as canvas display. The description of the canvas display is "Elegantly painted on linen, the backdrop shows scenes of Middle Eastern life.".

some finger cymbals are here. they are scenery. the description is "The cymbals are placed on the thumb and index finger of each hand. Tapping them together produces a ringing sound.".

The sword is here. It is scenery. The description is "This is a beautiful steel sword with a filigreed handle and blade.".

The wall is a scenery container. The wall is here. The description is "[if the wall contains the lantern]Hanging on the wall is a lantern.[otherwise]You see nothing special about the wall.[end if]". Understand "walls" as wall.

A lantern is an electric lamp. It is in the wall. Understand "lamp" and "lanterns" as the lantern. The description of the lantern is "This is a highly polished brass lantern.".

a  musical instrument is here. it is scenery. understand "instruments", "oud", "darbuka", and "zurna" as musical instrument. the description is "[The noun] is of traditional Middle Eastern origins.".

after taking the lantern for the first time:
	now the player is carrying the lantern;
	say "Taken.".

The folding chair is a enterable scenery supporter in the ST-room. The description of the Folding Chair is "This is one of many folding chairs in the tent tonight." Understand "chairs" as folding chair.

Little Egypt AutoPlay is a recurring scene. 
Little Egypt AutoPlay begins when the location is the ST-room and (minutes part of time of day is 0 or minutes part of time of day is 15 or minutes part of time of day is 30 or minutes part of time of day is 45).
Little Egypt AutoPlay ends when the index is the number of rows in the Table of Little Egypt Events plus 1.

When Little Egypt AutoPlay begins, now index is 1;

When Little Egypt AutoPlay ends:
	say "You applaud until your hands are sore. Did she just wink at you?[run paragraph on]";
	if the sheer veil was not handled:
		say "[paragraph break]As she leaves the stage, Little Egypt tosses one of her veils to you!";
		now the player carries the Sheer Veil;
	say "[paragraph break]";
	now index is 1.

last description is text that varies. last description is "".		
index is a number that varies. index is usually 1.		
every turn during Little Egypt AutoPlay:
	choose row index in the Table of Little Egypt Events;
	now last description is description entry;
	say "[description entry][paragraph break]";
	increment index;
	rule succeeds;

instead of looking during the Little Egypt AutoPlay, say "[last description][paragraph break]";

Instead of doing something other than waiting, looking, listening, smelling, or examining during Little Egypt AutoPlay:
	say "You[']re much too entranced by the show to do anything other than watch the show. You are riveted[if the player is in the folding chair] to your seat[end if]!".
	
clapping is an action applying to nothing. Understand "clap" and "applaud" as clapping.
instead of clapping, say "Your hands are sore from clapping so much!".

the entryway is a thing in the ST-room. the entryway is scenery. The description of the entryway is "The show[']s facade and the barker are back to the east.". Understand "facade" as entryway.
examining the entryway is an action applying to one thing. Understand "examine entryway" as examining the entryway.

Section 12 - Ferris Wheel

After going east from the HS-room when the FW-room is unvisited:
	if show images is true, display Figure of FerrisWheel;
	continue the action.
	
Before looking when the location is the FW-room:
	if show images is true, display Figure of FerrisWheel.

A room called the FW-room is outdoors. The printed name of the FW-room is "Ferris Wheel". The FW-room is east of the HS-room. "The Ferris wheel is the towering centerpiece of the carnival, its vibrant lights and graceful rotations drawing the attention of visitors from every corner of the fairgrounds. The wheel[']s massive steel frame arches high into the sky, its intricate network of beams glinting under the colorful glow of bulbs strung along its circumference. Each gondola, painted in bright hues like red, yellow, and blue, dangles from the wheel, swaying gently as it turns.

At night, the Ferris wheel transforms into a dazzling spectacle, with hundreds of synchronized lights creating patterns and ripples that pulse outward like waves. The bulbs flash in bursts of red, green, and white, casting playful reflections on nearby attractions and the surrounding crowd.

The air around the wheel is filled with a mix of excited chatter, the hum of its motor, and the occasional squeal of laughter or nervousness from riders high above. The ride operator, standing in a small booth at the base, keeps a steady rhythm of loading and unloading passengers, their voice occasionally calling out, 'Step right up! The best view of the carnival awaits!'

The Ferris wheel offers an ever-changing perspective of the carnival below. From its peak, riders can see the entire fairground: the spinning lights of the rides, the colorful stripes of game booths, and the winding paths of visitors navigating the midway. Beyond the carnival, the view stretches to the horizon, with city lights adding to the magical experience.

Whether it[']s a romantic ride for couples, a thrilling adventure for friends, or a calming retreat for families, the Ferris wheel captures the spirit of the carnival — an iconic blend of excitement, wonder, and timeless charm."

The Ferris Wheel Attendant is an attendant in the FW-room. 

instead of giving the Ferris wheel ticket to the Ferris wheel attendant:
	say "You give [the noun] to [the second noun].";
	now the Ferris wheel ticket is nowhere;
	say "[line break]As you step into the gently swaying gondola, a faint creak accompanies the safety bar locking into place. The Ferris wheel begins its slow ascent, the hum of its machinery blending with the distant sounds of carnival games and laughter below. A soft breeze brushes against your face as the gondola rises higher, offering an ever-expanding view of the fairgrounds.

With each rotation, the world transforms. At the peak, the carnival sprawls beneath you like a miniature village, its vibrant lights twinkling against the twilight sky. The sound of the midway fades into a soft murmur, replaced by the serene quiet of being high above the bustling crowd. Beyond the carnival, the horizon stretches endlessly, framed by the glow of distant city lights.

From the top you can see something to the west behind the concession stand. 

The gondola sways gently, adding a hint of thrill to the tranquil ride. You exchange smiles with your companions, pointing out tiny figures darting between booths and the dizzying motion of other rides below. The Ferris wheel begins its descent, and the lively carnival sounds grow louder once again, bringing you back into the heart of the action.

Whether you’re seeking a moment of calm, a romantic view, or the sheer wonder of seeing the world from above, the Ferris wheel delivers an unforgettable ride that captures the magic of the carnival."

a Ferris Wheel safety bar is here. it is scenery. the description is "The safety bar is locks into place ensuring you don[']t tumble out of the gondola.".
instead of examining the Ferris Wheel safety bar, say "The safety bar is locked in place.".

The gondola is here. it is scenery. understand "gondolas" as gondola. The description is "Each gondola, painted in bright hues like red, yellow, and blue, dangles from the wheel, swaying gently as it turns."

a view is here. it is scenery. the description is "From the peak of the Ferris Wheel., riders can see the entire fairground: the spinning lights of the rides, the colorful stripes of game booths, and the winding paths of visitors navigating the midway. Beyond the carnival, the view stretches to the horizon, with city lights adding to the magical experience.".

some passengers are here. they are scenery. the description is "The passengers file into the gondolas sitting across from one another.". understand "crowd", "companions", and "visitors" as the passengers.

A Ferris Wheel booth is here. it is scenery. the description is "From this booth, the attendant collects tickets and operates the ride.".

A thing called the Ferris Wheel is a backdrop. The description of the Ferris Wheel is "The Ferris wheel towers above the carnival and is illuminated with vibrant lights, creating a dazzling display. As the wheel turns slowly, the gondolas remain upright, offering riders a thrilling yet gentle experience and spectacular views from the top.". understand "frame", "beams", "bulbs", "lightbulbs", "ferris", "wheel", and "ride" as the ferris wheel.

instead of listening when the location is FW-room, say "You hear a mix of excited chatter, the hum of its motor, and the occasional squeal of laughter or nervousness from riders high above.".

A two dollar bill is a thing. The two dollar bill is in the FW-room. Understand "bill" as the two dollar bill. "Hey! Is that a two dollar bill on the ground?" The description of the two dollar bill is "It has a picture of Thomas Jefferson on it.".

instead of taking the two dollar bill:
	say "Taken.[paragraph break]";
	increase the price of the money by $2.00;
	say "You now have [the price of the money].";
	now the two dollar bill is nowhere.

Section 13 - Bumper Cars

After going northwest from the TB-room when the BC-room is unvisited:
	if show images is true, display Figure of BumperCars;
	continue the action.
	
Before looking when the location is the BC-room:
	if show images is true, display Figure of BumperCars.
	
The BC-room is a room. The printed name is "Bumper Cars". The BC-room is northwest of the TB-room. The BC-room is outdoors. "The bumper cars is a bustling hub of excitement and laughter, set beneath a canopy of flashing lights and colorful decorations. The rectangular arena is surrounded by padded barriers, ensuring a safe yet thrilling experience for riders. The floor, slick and metallic, allows the brightly colored cars — painted in shades of red, blue, yellow, and green — to glide effortlessly in all directions.

Each car is equipped with a steering wheel and a padded bumper, designed to absorb the impact of playful collisions. As the ride begins, drivers of all ages eagerly maneuver their cars, aiming for friends, family, or strangers with mischievous grins. The air is filled with the sound of bumpers colliding, laughter, and the occasional squeal of surprise.

Overhead, a web of electric poles connects the cars to the ceiling, sparking faintly as they supply power to the vehicles. The ride operator watches from a booth, ensuring everyone enjoys the chaos safely. Surrounding the bumper cars are cheering onlookers, carnival lights, and the lively hum of the fairground.

The bumper cars perfectly captures the playful spirit of the carnival, offering a mix of harmless competition, shared laughter, and nostalgic fun for all ages. The Ticket Kiosk is southeast of here."

The Bumper Cars Attendant is an attendant in the BC-room. 

instead of giving the bumper cars ticket to the bumper cars attendant:
	say "You give [the noun] to [the second noun].";
	now the bumper cars ticket is nowhere;
	say "[line break]Sliding into the snug seat of the bumper car, your hands grip the steering wheel, anticipation buzzing in the air. Around you, the arena is alive with flashing lights, bursts of laughter, and the hum of electric currents running through the overhead poles. A quick glance shows other riders locking eyes, playful grins spreading as everyone braces for the chaos about to unfold.

As the ride starts, your car jolts forward, and you steer into the fray. The slick metal floor beneath makes every turn feel smooth yet unpredictable. Suddenly, bam! — another car collides into you from the side, sending your car into a spin. You laugh, recovering quickly to aim your vehicle at a friend across the arena.

The thrill of the bumper cars is in the collisions — every thud and jolt accompanied by squeals of delight or mock indignation. The impact is cushioned by the padded bumpers, keeping the fun safe but exhilarating. You swerve, dodge, and sometimes reverse in a desperate attempt to avoid being cornered, all while plotting your next playful crash.

The ride is a whirlwind of laughter, harmless competition, and shared joy. As the music fades and the cars slow to a stop, you climb out with a wide grin, already looking forward to your next turn in the driver’s seat."

A thing called the Bumper Cars are in the BC-room. The Bumper Cars are scenery. understand "car" as the bumper cars. The description of the Bumper Cars is "The Bumper Cars are small, colorful, electric-powered vehicles equipped with a padded outer rim to absorb impacts, allowing riders to safely bump into each other as part of the game. The ceiling has a conductive surface that powers the cars. Riders are thrilled by chaotic collisions, laughter, and the challenge of maneuvering away from — or into — other drivers."

some padded barriers are here. they are scenery. the description is "The padded barriers ensure a safe yet thrilling experience for riders. ".
some padded bumpers are here. they are scenery. the description is "The padded bumper on each car is designed to absorb the impact of playful collisions.".
some drivers are here. they are scenery. understand "riders", "strangers", "family", and "friends" as drivers. the description is "Drivers of all ages eagerly maneuver their cars, aiming for others.".
some electric poles are here. they are scenery. the description is "The electric poles connects the cars to the ceiling, sparking faintly as they supply power to the vehicles.".
some onlookers are here. they are scenery. the description is "Surrounding the bumper cars are cheering onlookers.".
the steering wheel is here. it is scenery. the description is "The steering wheel turns 360 degrees adding to the fun and excitement.".
the bumper cars booth is here. it is scenery. the description is "The operator stands in this booth overseeing the action below.".

instead of listening when the location is the BC-room, say "The air is filled with the sound of bumpers colliding, laughter, and the occasional squeal of surprise.".

instead of giving the adjustable wrench to the bumper cars attendant:
	say "Hey! Thanks, I really appreciate it. Usually no one ever responds to the radio in the Control Room. Here, take this fuse.";
	now the adjustable wrench is carried by the bumper cars attendant;
	now the fuse7 is in the location;
	try taking the fuse7;

Section 14 - Fortune Teller

After going southeast from the TB-room when the FT-room is unvisited:
	if show images is true, display Figure of FortuneTeller;
	continue the action.
	
Before looking when the location is the FT-room and Fortune Teller AutoPlay is not happening:
	if show images is true, display Figure of FortuneTeller.
	
FT-room is a room. The printed name is "Fortune Teller". The FT-room is outdoors. The FT-room is southeast of the TB-room. "Approaching the fortune teller[’]s booth, you’re drawn in by its mysterious allure. Draped in deep purple curtains adorned with golden moons and stars, the booth glows with the soft, inviting light of candles. The air is heavy with the scent of incense, mingling with the sweet aroma of carnival treats. A sign sways slightly in the evening breeze."

some candles are here. The candles are scenery. The description of the candles is "The candles flicker in the soft breeze casting light on Esmeralda[']s face.". Understand "candle" as candles. instead of taking the candles, say "Esmeralda says, 'Hey! I need those!'".

The Fortune Teller Booth is here. It is scenery. The description is "Draped in deep purple curtains adorned with golden moons and stars, the booth glows with the soft, inviting light of candles. The air is heavy with the scent of incense, mingling with the sweet aroma of carnival treats."

instead of smelling when the location is the FT-room, say "The smell of incense wafts through the air mixed with the scent of fresh, buttered popcorn.".

some curtains are here. They are scenery. Understand "drapes" as curtains. The description of the curtains is "The curtains are deep purple with golden moons and stars.".
The Fortune Teller sign is here. The Fortune Teller sign is scenery. The description of the Fortune Teller sign is "'Fortunes Told — What Does Your Future Hold?' Underneath that it says 'Ticket Required'".
some robes are here. they are scenery. understand "robe" as robes. the description is "Esmeralda wears flowing robes embellished with shimmering beads, and a jeweled headpiece.".
a headpiece is here. it is scenery. understand "beads", "jewels", and "jeweled" as headpiece. the description is "Esmeralda wears flowing robes embellished with shimmering beads, and a jeweled headpiece.".
a round table is here. it is scenery. It is a  supporter. the description is "This is a small round table with a crystal ball, some tarot cards, and some trinkets on it.".
a crystal ball is on the round table. The crystal ball is scenery. The description is "A softball sized crystal ball sits on the table, glowing dimly.".
some tarot cards are on the round table. they are scenery. understand "card" as tarot cards. the description is "The tarot cards have beautiful drawings upon them.".
some trinkets are on the round table. they are scenery. the description is "The purpose of the trinkets remains a mystery.".
your palm is here. it is scenery. the description is "It[']s your palm, in the middle of your hand.".

Esmeralda the Mysterious is a woman in the FT-room. Understand "mysterious", "woman", "fortune teller", and "Esmerelda" as Esmeralda the Mysterious. The description of Esmeralda the Mysterious is "The fortune teller sits in a dimly lit booth, draped in rich fabrics of deep purple and gold, adorned with celestial patterns of stars and moons. Her appearance is enigmatic, with piercing eyes that seem to look right through you and a knowing smile that hints at secrets yet untold. She wears flowing robes embellished with shimmering beads, and a jeweled headpiece catches the flickering light of nearby candles."

a thing called a fortune is here. it is scenery. the description is "You ponder the ramifications of having your fortune told.".

instead of giving the fortune teller ticket to Esmeralda the Mysterious:
	say "You give [the noun] to [the second noun].";
	now Esmeralda the Mysterious carries the fortune teller ticket;
	say "[line break]Stepping inside, you’re greeted by the Esmeralda, a figure cloaked in flowing robes with a jeweled headpiece catching the flickering light. Her piercing eyes seem to look right through you as they gesture for you to sit at a small round table covered in an ornate cloth. At its center rests a glowing crystal ball, surrounded by tarot cards and mysterious trinkets.

Esmeralda[’]s voice is low and melodic, weaving an air of intrigue as they ask you to focus on a question and offer you a tarot reading. The room seems to shrink, the bustling carnival outside fading into the background as they reveal your fate. Each card turned  feels significant, as though unlocking a secret you didn’t know you carried."

instead of asking Esmeralda the Mysterious about "fortune", say "You[']ll need a ticket if you want me to reveal your future.".
instead of asking Esmeralda the Mysterious about "me", say "You[']ll need a ticket if you want me to reveal your future.".

Fortune Teller AutoPlay is a scene. 
Fortune Teller AutoPlay begins when Esmeralda the Mysterious carries the Fortune Teller ticket.
Fortune Teller AutoPlay ends when the index is 6.

last category is text that varies. last category is usually ""..
last card is text that varies. last card is usually "".
last card description is text that varies. last card description is usually "".
tarot reading is a number that varies. tarot reading is usually 1;

When Fortune Teller AutoPlay begins:
	now tarot reading is a random number between 1 and 3;
	now index is 1.
	
When Fortune Teller AutoPlay ends:
	say "As the reading concludes, Esmeralda gazes into your eyes with a cryptic smile and delivers their final words of wisdom: 'The order of things is important. Alphabetically and numerically; one follows another and provides the link between the two. If you will learn, think on this carefully.' 

Whether you leave with a sense of wonder, excitement, or unease, the encounter lingers with you — a touch of magic amid the carnival’s chaos, as if you’ve glimpsed something beyond the ordinary.";
	now the fortune teller ticket is nowhere.

every turn during Fortune Teller AutoPlay:
	let K be (tarot reading * 10) + index;
	choose a row with the key of K in the Table of Tarot Readings;
	say "[bold type][category entry]: [card entry][roman type][line break][description entry][paragraph break]";
	now last category is category entry;
	now last card is card entry;
	now last card description is description entry;
	increment index;
	rule succeeds;

instead of looking during the Fortune Teller AutoPlay, say "[bold type][last category]: [last card][roman type][line break][last card description][paragraph break]";

Section 15 - Carousel

After going northeast from the TB-room when the CR-room is unvisited:
	if show images is true, display Figure of Carousel;
	continue the action.
	
Before looking when the location is the CR-room:
	if show images is true, display Figure of Carousel.

The Carousel Attendant is an attendant in the CR-room. 

The CR-room is a room. The CR-room is outdoors. The printed name is "Carousel". The CR-room is northeast of the TB-room. "The carousel is a timeless carnival attraction, radiating charm and nostalgia with its brightly painted horses, vibrant lights, and cheerful music. The circular platform is adorned with a canopy of swirling colors, gold trim, and decorative mirrors that reflect the flickering bulbs lining its edges.

Rows of hand-carved animals, most often horses with flowing manes, are arranged in a circle. Each is painted in vivid colors, detailed with golden saddles and ribbons. It also features exotic creatures like lions, tigers, and sea dragons, adding whimsy to the ride. The animals rise and fall gently as the carousel spins, mimicking a galloping motion.

The carousel[’]s warm, playful tunes drift across the midway, inviting riders of all ages to enjoy its simple delight. Children laugh as they choose their favorite animals, while adults savor the nostalgia of the spinning ride. As it rotates, the carousel becomes a moving work of art, blending motion, color, and music into an enchanting centerpiece of the carnival. The Ticket Kiosk is back to the southwest; the way you came."

instead of giving the carousel ticket to the carousel attendant:
	say "You give [the noun] to [the second noun].";
	now the carousel ticket is nowhere;
	say "[line break]Stepping onto the carousel[']s spinning platform, you’re greeted by a kaleidoscope of color — brightly painted horses, glittering lights, and golden trim. The cheerful melody of calliope music fills the air. What will you choose as your mount, perhaps a galloping horse with a flowing mane, a majestic lion, or a whimsical giraffe. Gripping the polished pole, you settle onto the saddle, feeling the smooth rise and fall as the carousel begins to turn.

As the ride picks up speed, the world outside becomes a blur of glowing carnival lights and swirling colors. The gentle up-and-down motion mimics a playful gallop, and the rhythmic whir of the carousel’s machinery adds a soothing backdrop to the cheerful atmosphere. Laughter and the sound of children’s chatter mix with the music, creating a sense of nostalgia and joy.

For a few moments, you’re transported into a magical world, the worries of the day fading away with each graceful rotation. Whether you’re enjoying the ride alone, with friends, or sharing a special moment with family, the carousel[’]s charm captures a timeless blend of whimsy and wonder. As it slows to a stop, you step off with a smile, the music lingering in your ears as you rejoin the bustling carnival."

Understand "merry-go-round" and "merry go round" as carousel.
A thing called the Carousel is in the CR-room. The Carousel is scenery. The description of the Carousel is "The carousel features intricately decorated, moving figures such as horses, chariots, and sea dragons, all mounted on poles. The figures move up and down in an endless chase accompaniment of cheerful, calliope music. Illuminated by bright, twinkling lights, the carousel creates a magical and timeless atmosphere.".

instead of listening when the location is the CR-room, say "The carousel[']s warm, playful tunes drift across the midway, inviting riders of all ages to enjoy its simple delight.".

the calliope is here. it is scenery. The description is "The sounds of the calliope fill the air with pleasant music.".
some mirrors are here. they are scenery. the description is "You gaze at yourself in the mirror and think you look pretty good.". Understand "mirror" as mirrors.
a thing called the animals are here. they are scenery. the description is "The carousel is populated with exotic creatures like lions, tigers, and sea dragons, adding whimsy to the ride.". Understand "animal" as animals.
some horses are here. they are scenery. The description is "The horses are mounted on poles which go up and down as the Carousel turns.". Understand "horse" as horses.
some lions are here. they are scenery. The description is "The majestic lions and tigers are mounted on poles which go up and down as the carousel turns.". Understand "lion", "tigers", and "tiger" as lions.
some giraffes are here. they are scenery. The description is "The giraffes are mounted on poles which go up and down as the carousel turns.". Understand "giraffe"as giraffes.
some sea dragons are here. They are scenery. The description is "The sea dragons, with their long necks are mounted to the poles which go up and down as the carousel turns.".  Understand "sea dragon", "sea", and "dragon" as sea dragons.
some saddles are here. they are scenery. the description is "Each animal is painted in vivid colors, detailed with golden saddles and ribbons.".
Some children are here. they are scenery. understand "adults" as children. the description is "Adults and children laugh in delight as they choose their noble steed.".

Section 16 - Head of the Line

Head of the Line is a room. Head of the Line is south of TB-room. Head of the Line is north of Ride Entrance. The Head of the Line is outdoors. "You are standing in front of an attendant[if hell ride attendant does not carry the hell ride ticket] with his hand open waiting for your ticket[end if]. The entrance to the ride is south of here. The ride operator tells you that you[']re lucky you showed up when you did because this will be the last trip through [story title] for the night. You notice that all the other cars are empty. The Ticket Kiosk is north of here."

a thing called Hell Ride is a backdrop. Understand "hell ride" and "ride" as hell ride. The description of Hell Ride is "Through the lights and excitement of the carnival, you can see the facade for [story title] looming ominously over the midway.". 

the hell ride cars are here. they are scenery. understand "car" as hell ride cars. the description is "These cars ferry carnival goers into the depths of [story title].".

The Hell Ride Attendant is an attendant in Head of the Line. 

Check going south when the location is Head of the Line and the Hell Ride attendant does not have the hell ride ticket:
	say "You[']ll need a ticket to go that way.";
	stop the action.
	
Chapter 4 - Backstage

Section 1 - Wooden Doors

A wooden door is a kind of openable lockable door.
A wooden door is usually closed. 
A wooden door is usually locked.
A wooden door has a color. A wooden door is usually nondescript. 
The initial appearance of a door is usually "Nearby [an item described] leads [if the other side of the item described is visited][direction of the item described from the location] to [the other side of the item described][otherwise][direction of the item described from the location][end if]."
The description of a wooden door is "The [color of the item described] door is [if the item described is open]open[otherwise]closed[end if]. It is [if the item described is locked]locked[otherwise]unlocked[end if]."
The printed name of a wooden door is "[a color of the item described] colored door".

Section 2 - Dark Passage

Dark Passage is a room. Dark Passage is east of the Ride Entrance. "This room is backstage at the Hell Ride attraction. The room is littered with bags of trash, piles of junk, and dust bunnies so large they should be paying rent. There an exit to the south and west."

some dust bunnies are scenery. The dust bunnies are here. Understand "bunnies" as dust bunnies. The description of the dust bunnies is "These are some massive dust bunnies. Be careful, I[']ve heard they bite."

some bags of trash are scenery. The bags of trash are here. Understand "bags" and "trash" as bags of trash. The description of the bags of trash is "The bags of trash are piled in the corner."

A pile of junk is a scenery container. The pile of junk is in the dark passage. The pile of junk contains the flashlight. Understand "piles" and "junk" as pile of junk. The description of the pile of junk is "This is a pile of assorted flotsam and jetsam from the carnival. None of it looks very interesting."

instead of looking under when the noun is the pile of junk:
	try examining the pile of junk instead. 

The flashlight is an electric lamp. understand "light" and "torch" as flashlight. The description of the flashlight is "This is a flashlight. It[']s a nice one."

after taking the flashlight for the first time:
	now the player is carrying the flashlight;
	say "Taken.".


Section 3 - Maintenance Office

After going south from the dark passage when the Maintenance Office is unvisited and the the player carries a lit electric lamp:
	if show images is true, display Figure of MaintenanceOffice;
	continue the action.
			
Before looking when the location is the Maintenance Office and the the player carries a lit electric lamp:
	if show images is true, display Figure of MaintenanceOffice.

The Maintenance Office is a dark room. The maintenance office is south of the dark passage. "The maintenance office, hidden behind the carnival’s bright facade, is a dim and cluttered space reeking of grease, sweat, and faint traces of popcorn from the midway. The air hangs heavy with oil and stirred-up dust.

The walls are lined with shelves holding tools and parts in disarray — screws and mismatched jars with faded labels. Paint cans and grease jars clutter the workbenches, many left half-open. In the center, a battered desk is strewn with wires, gears, and springs, a bent piece of metal held in a vise. Overhead, a single flickering fluorescent light struggles to illuminate the room.

In one corner, a disassembled ride mechanism lies exposed, chains and pulleys dangling from hooks above, faintly clinking with the vibrations of the rides. A grease-stained manual and a half-drained mug of coffee sit abandoned on a nearby stool.

The walls display faded safety posters, a cork board with maintenance schedules and notes[if the worn photo is in the location], and a worn photo of the carnival in its prime[end if]. A clock ticks faintly, its hands out of sync with reality. The floor, gritty with dust and scattered nails, adds to the room’s chaotic charm.

Despite the mess, the room buzzes with purpose — a hidden hub where the carnival’s magic is sustained through sweat, ingenuity, and the hum of machinery.

Exits lead north and south." 

a maintenance workbench is here. it is scenery. understand "workbenches", "work" and "bench" as the maintenance workbench. the description is "The workbenches are messy, cluttered, and covered with things.".
some faded labels are here. they are scenery. the description is "The labels have faded so much that they are illegible.".
some shelves are here. they are scenery. the description is "The shelves hold all manner of things.".
some maintenance tools are here. they are scenery. the description is "The tools are varied and surely fit all manner of things around the carnival.".
some parts are here. they are scenery. the description is "The parts are varied and surely fit all manner of things around the carnival.".
some wires are here. they are scenery. the description is "The wires lay in twisted tangles on the desk.".
some paint cans are here. They are scenery. understand "screws", "grease", "grease jars", "grease jar", "jars",and "jar" as paint cans. The description is "Screws, grease jars, and cans of paint are here.".
a vise is here. It is scenery. The description is "This is just a standard issue vice.".
a bent piece of metal is here. It is scenery. The description is "This is a piece of scrap steel.".
some safety posters are here. They are scenery. The description is "You[']re the safe choice for safety!".
some notes are here. They are scenery. understand "schedules" as the notes. The description is "Looking at the maintenance schedules and notes, all you can see are the illegible scribbles of a child.".
a clock is here. It is scenery. The description is "The clock is wildly off the correct time. I guess it[']s broken.".
some lubricant is here. It is scenery. The description is "It[']s lubricant. It[']s slippery.".
a manual is here. It is scenery. The description of the manual is "The manual is titled: 'Fixing Your Ferris Wheel. It[']s Easier Than You Think!'".
a stool is here. It is a supporter. It is scenery.  The description is "This is just a stool.".
some pulleys are here. they are scenery. understand "chains" as pulleys. The description is "The chains and pulleys hang from hooks on the ceiling.".
some springs are here. they are scenery. understand "gears" as springs. The description is "The gears and springs are strewn on the desk.".

instead of listening when the location is the maintenance office, say "You can hear a clock ticking softly nearby.".

The worn photo is here. Understand "picture" as the worn photo. The description of the worn photo is "This is a photo of the carnival in its heyday! A ragtag bunch of people are featured in the picture in front of the Hell Ride facade. On the back reads a date: '03/22/62'.[if the carnival office is visited] This looks like the same photo you found in the Carnival Office.[end if]"

The coffee mug is on the maintenance desk. The coffee mug is edible. Understand "coffee" and "cup" as the coffee mug. The description of the coffee mug is "Who knows how long this has been sitting here. I wouldn[']t drink it if I were you." 

Instead of drinking the coffee mug for the first time: say "That looks nasty. There[']s something floating on the top. I wouldn[']t drink that if I was you." instead.
Instead of drinking the coffee mug for the second time: say "You decide to drink it after all. Your stomach lurches as the cold, nasty coffee settles." instead.
Instead of drinking the coffee mug for the third time: say "You[']ve learned your lesson and set the coffee cup down." instead.

A maintenance desk is in the maintenance office. The printed name of the maintenance desk is "desk". The maintenance desk is a supporter. The maintenance desk is fixed in place. The description of the maintenance desk is "It[']s a desk. There are coffee stains and cigarette burns from years of abuse. The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

A drawer is part of the maintenance desk. The drawer is a closed openable container. The drawer is scenery. The description of the drawer is "The single drawer is [if the drawer is open]open[otherwise]shut[end if]."

Nearness relates a room (called A) to a room (called B) when the number of moves from B to A is less than 2. The verb to be near means the nearness relation.

The radio is a device on the maintenance desk. The radio is switched off and fixed in place. The description of the radio is "[if switched on]The radio burbles on[otherwise]The radio is off[end if]." 

instead of listening when the radio is switched on and the location is in back stage:
	if the location is near the maintenance office:
		play a song;
	otherwise if the location is in the back stage:
		say "The hum of electronics fills the air, punctuated by the crackle of a radio.";
	otherwise:
		continue the action.

every turn when the radio is switched on and the location is near the maintenance office, play a song.

To play a song:
	choose a random row in Table of Songs;
	let A be the artist entry;
	Let S be the song entry;
	Let R be the rickroll entry;
	say "[one of]You hear [A][']s '[S]' playing on the radio.[or]'[S]' by [A] plays on the radio.[or]You sing along to [A][']s '[S]'.[or]The DJ announces that '[S]' by [A] will be up next.[or]Nearby, you can hear '[S]' by [A].[or]You whistle along to '[S]' by [A].[at random][if R is true] Yes, you have been Rick Rolled![end if]";

Rule for showing action of the radio:
	if the radio is switched on, say "Through the static, you pick up hear bits of the music.";
	otherwise say "The radio is silent. You[']re saving the batteries."

Instead of listening in the presence of the switched on radio:
	carry out the showing action activity with the radio instead.

some scissors are in the drawer. The description is "This is a sharp pair of office scissors." 
A stapler is in the drawer. The description is "This is a red stapler." 
A ballpoint pen is in the drawer. The description is "Your standard ballpoint pen. It says Bic on the side." 
A pad of paper is in the drawer. The description is "This is a pad of lined paper."

An aqua colored door is a wooden door. The color of the aqua colored door is aqua.The description of the aqua colored door is "It[']s [printed name of item described]. It has the word 'Stocks' written on it." The silver key unlocks it. the aqua colored door is west of the Maintenance Office and east of the Stocks Room. 

A ladder is up from the Maintenance Office and down from the Dark Hallway. The ladder is an open door. The description of the Ladder is "It[']s a typical 10 foot ladder."

Instead of climbing a ladder:
	try entering the noun.

Section 4 - Crawl Space

The Crawl Space is a dark room. The Crawl Space is south of Maintenance Office. "The crawl space beneath the carnival ride is a tight, claustrophobic tunnel shrouded in darkness and filled with the hum of machinery above. The air is stale and heavy, carrying the sharp metallic scent of oil and the faint tang of rust. Every sound is amplified in the confined space — the groaning of steel beams, the clanking of chains, and the rhythmic thrum of motors driving the ride above.

The ground is uneven, a mix of packed dirt and loose gravel scattered with forgotten tools, scraps of metal, and tangled wires. Overhead, a network of pipes crisscross the space, some wrapped in fraying insulation that crackles faintly as you crawl past. Small puddles of murky water collect in dips on the floor, their surfaces rippling with vibrations from the ride’s movement.

The backstage area continues north and south."

A crimson colored door is a wooden door. The color of crimson colored door is crimson. The description of crimson colored door is "It[']s [printed name of item described]. It has the word 'Gallows' written on it." The silver key unlocks it. crimson colored door is west of the Crawl Space and east of the Gallows Room. 

some tangled wires are here. they are scenery. the description is "Scattered on the floor are some hopelessly tangled wires.".
some forgotten tools are here. they are scenery. the description is "Scattered on the floor are some long forgotten tools.".
some gravel is here. it is scenery. understand "dirt" as gravel. the description is "The dirt and gravel digs into your clothes and through to your skin. You hope you don[']t ruin your clothes.".
the network of pipes is here. The network of pipes are scenery. The description of the network of pipes is "The pipes head in every direction.".
The insulation is here. The insulation is scenery. The description of the insulation is "The insulation is ratty and not doing much good to protect the cables and pipes.".
some small puddles are here. they are scenery. the description is "You move gingerly to avoid the puddles. It[']s much more pleasant to be dry.".
some scraps of metal are here. they are scenery. the description is "These scraps are mostly angle iron and scaffolding.".

instead of listening when the location is the crawl space, say "You can hear the hum of the machinery above.".
instead of smelling when the location is the crawl space, say "The air is stale and heavy, carrying the sharp metallic scent of oil and the faint tang of rust.".

Section 5 - Mechanical Room North

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "The north mechanical room is compact and specialized, housing auxiliary systems that keep the ride running smoothly. A subdued hum of capacitors and relays fills the space, its quiet rhythm broken only by the occasional hiss of hydraulic fluid.

Circuit breaker panels line the walls, labeled for functions like 'Lighting Controls' and 'Brake Systems'. Smaller cables and conduits snake along the walls, linking these systems to the main hub. In one corner, a hydraulic pump and reservoir manage lifting arms and rotating platforms, their gauges flickering as they work. 

A small workbench against the eastern wall is cluttered with tools and coiled wires, while shelves above hold neatly labeled spare parts — cables, and hydraulic tubing. A faded ride diagram pinned nearby is marked with red annotations from past repairs.

Dimly lit by a single hanging bulb, the room feels cooler and slightly damp, the metallic tang of machinery mixing with a hint of mildew. Though quieter and less prominent than the south mechanical room, this space plays a vital role in supporting the ride’s operation and ensuring its emergency systems are always prepared.

There are exists north and south." 

The toolbox is a closed openable container in the Mechanical Room North. The toolbox is fixed in place. Understand "tool", "box", and "tool box" as toolbox. The description of the toolbox is "This is a toolbox. I bet it contains tools."

an adjustable wrench is in the toolbox. The description of the adjustable wrench is "Just one of the many tools used to maintain the carnival.".
some channel locks are in the toolbox. The description of the channel locks is "Just one of the many tools used to maintain the carnival.".
some pliers is in the toolbox. The description of the pliers is "Just one of the many tools used to maintain the carnival.".
a hammer is in the toolbox. The description of the hammer is "Just one of the many tools used to maintain the carnival.".
a sledgehammer is here. The description of the sledgehammer is "This is an eight pound sledgehammer. Feels really hefty.".

instead of listening when the location is the mechanical room north, say "You hear the subdued hum of capacitors and relays.".

some capacitors are here. they are scenery. understand "capacitor", "relay", and "relays" as the capacitors. the description is "The subdued hum of capacitors and relays fills the air.".
some mechanical cables are here. they are scenery. the description is "The cables snake along the walls.".
some circuit breaker panels are here. understand "breakers" as the circuit breaker panels. they are scenery. the description is "These are electrical panels for other parts of the carnival.".
a mechanical bulb is here. the printed name is "bulb". it is scenery. The description is "This single bulb is feebly trying to light the room.".
a hydraulic pump is here. It is scenery. The description is "This is some of the equipment that keeps the carnival running smoothly.".
some gauges are here. They are scenery. The description is "The room is full of gauges reporting on the condition of the carnival.".
some tools are here. They are scenery. The description is "Just some of the many tools used to maintain the carnival.".
a mechanical workbench is here. It is scenery. Understand "work", "bench" as the mechanical workbench. The description is "The workbench is covered in all manner of things.".
hydraulic tubing is here. It is scenery. understand "wires", "spare" and "parts" as hydraulic tubing. The description is "Wires, spare parts, and hydraulic tubing is here.".
a diagram is here. It is scenery. The description is "This is an electrical diagram for something.".

An emerald colored door is a wooden door. The color of emerald colored door is emerald. The description of emerald colored door is "It[']s [printed name of item described]. It has the word 'Stake' written on it." The silver key unlocks it. emerald colored door is west of the Mechanical Room North and east of the Stake Room. 

Section 6 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "The south mechanical room is the operational core of the carnival ride, a bustling, noisy space dominated by a massive motor. Its steady hum drives the thick belts, pulleys, and gears that work in perfect unison to power the ride.

Heavy-duty electrical panels line the walls, adorned with warning labels like 'High Voltage' and blinking indicator lights in an array of colors. Overhead, labeled conduits and wires snake across the ceiling, connecting systems with meticulous precision.

A cluttered table holds tools and spare parts — bolts and lubricants — alongside open maintenance logs marked with greasy fingerprints. The air is thick with the smell of oil, metal, and a faint trace of ozone from the electrics.

A cooling fan spins in the corner, barely cutting through the room’s warmth. The hum of machinery is occasionally punctuated by clinking chains and the sharp hiss of hydraulic fluid. The floor, a mix of metal grates and worn concrete, reflects years of use and maintenance.

Bright fluorescent lights in wire cages illuminate the space, highlighting the intricate systems at work. The south mechanical room is the ride’s powerhouse, where every movement is controlled with precision to deliver its thrilling experience.

You can travel north and south from here." 

some panels are here. they are scenery. understand "electrical panel" and "panel" as the panels. the description is "These are electrical panels controlling other parts of the carnival.".
some conduits are here. they are scenery. understand "wires" as conduits. the description is "The labeled conduits and wires snake across the ceiling.".
some thick belts are here. They are scenery. understand "pulleys", "gears", and "lights" as thick belts. The description is "The table is covered with belts, lubricants, gears, pulleys, gears and bolts.".
a cluttered table is here. It is scenery. understand "bolts" and "lubricants" as the cluttered table. The description is "The table is covered with belts, lubricants, gears, pulleys, gears and bolts.".
a cooling fan is here. It is scenery. The description is "This is an overworked fan.".
some mechanical room chains are here. they are scenery. the description is "The chains clink as they sway against the vibrations of the machinery.".
some machinery is here. they are scenery. understand "machines", "equipment", and "motor" as machinery. the description is "There is all manner of unidentifiable equipment here.".
some maintenance logs are here. they are scenery. the description is "These logs record the dates, times, and repairs made for the carnival rides. You notice that Hell Ride is conspicuously missing from the logs.".
some greasy fingerprints are here. they are scenery. the description is "The police could use these to track down a criminal.".
some wire cages are here. they are scenery. understand "fluorescent" and "lights" as the wire cages. the description is "The wire cages protect the fluorescent lights from becoming damaged.".

instead of listening when the location is the mechanical room south, say "The hum of machinery is occasionally punctuated by clinking chains and the sharp hiss of hydraulic fluid.".

instead of smelling when the location is the mechanical room south, say "The air is thick with the smell of oil, metal, and a faint trace of ozone from the electrics.".

A grate is an open lockable locked container in the Mechanical Room South. it is fixed in place. The description is "This grate leads down into the darkness. Too bad it[']s locked."

instead of inserting something into the grate:
	if the noun is untied:
		continue the action;
	otherwise:
		if the tied to of bubblegum is a short string:
			say "The string isn[']t long enough to reach the fuse." instead;
		if ((the noun is the bubblegum and the bubblegum is chewed) or the noun is the horseshoe magnet) and fuse5 is contained by the grate:
			say "You drop [the noun] into the grate. The [fuse5] attaches to [the noun]. You quickly and carefully raise [the noun] and drop [fuse5] into your hand.";
			now fuse5 is carried by the player;
		otherwise if the noun is the bubblegum and the bubblegum is not chewed:
			say "It[']s a hard square of bubblegum and won[']t stick to the fuse.";
		otherwise:
			say "Nothing happens.".

instead of taking when the noun is contained by the grate, say "Your fingers won[']t fit inside the grate. You can[']t reach [the noun].[if fuse5 is contained by the grate] If only you could grab [the noun] with something.[end if]".

A gray colored door is a wooden door. The color of gray colored door is gray. understand "door" as gray colored door. The description of gray colored door is "It[']s [printed name of item described]. It has the word 'Dungeon' written on it." The silver key unlocks it. gray colored door is west of the Mechanical Room South and east of the Dungeon. 

Section 7 - Generator Room

The Generator Room is a dark room. The Generator Room is south of the Mechanical Room South. "
The generator room is a compact, utilitarian space where the lifeblood of the carnival’s power is produced. Its reinforced concrete walls bear grime, oil streaks, and faint graffiti from past workers. The air carries a mix of diesel, hot metal, ozone, and damp earth, creating a distinctly industrial scent.

At the center, the main generator hums steadily, its scuffed steel casing evidence of years of service. Thick rubberized cables extend from it like veins, connecting to junction boxes and circuit breakers along the walls. A large panel nearby is cluttered with buttons, switches, and gauges, many with faded labels like 'Fuel Intake' and 'Emergency Shutoff.' A flickering display screen shows power levels and load distribution.

The rough concrete floor is uneven, marked by small puddles of spilled fuel or condensation. Shelves along the walls hold spare parts — filters, spark plugs, and wire coils — while a work area sits beside a grease canister and a worn maintenance manual.

A single industrial bulb in a protective cage casts harsh light, leaving deep shadows across the machinery. In the corner, a vent fan whirs faintly, struggling to cool the warm, vibrating air. A row of diesel canisters gleams beneath a faded safety sign that warns, 'Fuel Safely — No Open Flames!'

Though isolated and utilitarian, the generator room is the carnival’s heartbeat, powering its lights, rides, and sounds. Its quiet separation from the carnival’s chaos serves as a stark reminder of the machinery driving the magic.

The backstage area continues north and south of here." 

the main generator is here. it is scenery. the description is "The main generator hums steadily.".
graffiti is here. It is scenery. The description of the graffiti is "The graffiti is varied, from 'Peace, Love, Goodwill on Earth' to 'Anarchy Rules'.".
some junction boxes are here. They are scenery. The description is "These are electrical junction boxes carrying the power throughout the carnival.".
some generator cables are here. They are scenery. The description is "These cables connect different parts of the ride to the hydraulics.".
some circuit breakers are here. They are scenery. The description is "These circuit breakers control the flow of power to the rides.".
some filters are here. They are scenery. The description is "The filters litter the shelves.".
some spark plugs are here. They are scenery. The description is "The spark plugs are piled on the shelves.".
some wire coils are here. They are scenery. The description is " The wire coils littler the shelves.".
a grease canister is here. It is scenery. The description is "This is a canister of grease used to provide proper lubrication to the machinery.".
some diesel canisters are here. They are scenery. The description is "The canisters are full of diesel fuel.".
a maintenance manual is here. It is scenery. The description is "The cover reads, 'Put The Bump In Your Bumper Cars'.".
a large panel is here. It is scenery. The description is "The panel looks important.".
the work area is here. it is scenery. the description is "The work area is surprisingly uncluttered.". 
a safety sign is here. it is scenery. the description is "The sign reads, 'Fuel Safety - No Open Flames!'".
some generator shelves are here. they are scenery. understand "spare" and "parts" as the generator shelves. the description is "The shelves are piled high with filters, spark plugs, and wire coils.".
some generator puddles are here. they are scenery. the description is "Not wanting to get your shoes wet, you carefully avoid the puddles.".

instead of smelling when the location is the generator room, say "The air carries a mix of diesel, hot metal, ozone, and damp earth, creating a distinctly industrial scent.
".

instead of listening when the location is the generator room, say "The quiet separation from the carnival[']s chaos here serves as a stark reminder of the machinery driving the magic."

An indigo colored door is a wooden door. The color of indigo colored door is indigo. The description of indigo colored door is "It[']s [printed name of item described]. It has the word 'Guillotine' written on it." The silver key unlocks it. An indigo colored door is west of the Generator Room and east of the Guillotine Room. 

Section 8 - Storage Room

The Storage Room is a dark room. The Storage Room is south of the Electrical Room. "The carnival storage room is a cramped yet essential space, tucked away from the bustling grounds. Its rusted metal and peeling wooden walls bear the marks of years of use, while the air hangs heavy with grease, dust, damp canvas, and a faint trace of stale popcorn.

Shelves overflow with supplies — boxes of light bulbs, spools of wire, and assorted ride parts — piled without order. Tangled flags and strings of lights dangle from hooks, while crates labeled 'GAME PRIZES' and 'RIDE PARTS' hold items like stuffed animals and plastic toys. Folded tarps and tent poles teeter in one corner.

The room’s center is dominated by larger objects: spare ride seats, unassembled booths, and faded attraction pieces like a scratched carousel horse, all hidden beneath protective tarps.

Near the entrance, a battered desk is cluttered with maintenance logs and empty coffee cups. Above it, a bulletin board brims with ride schedules and repair requests. A flickering fluorescent bulb casts uneven shadows, adding an eerie atmosphere.

The floor, a rough blend of concrete and dirt, is littered with nuts and wire scraps. In the dim corners, the scuttle of rats and the glint of cobwebs underline the room[']s gritty nature.

Chaotic yet indispensable, this hidden space powers the carnival’s magic, ensuring every ride and booth runs seamlessly.

There is an exit to the north."

some empty coffee cups are here. they are scenery. the description is "People just use the desk as a trash can.".
some storage logs are here. they are scenery. the description is "So much tattered paper on this bulletin board. Most of it is illegible.".
some repair requests are here. they are scenery. the description is "So much tattered paper on this bulletin board. Most of it is illegible.".
some ride schedules are here. they are scenery. the description is "So much tattered paper on this bulletin board. Most of it is illegible.".
a bulletin board is here. it is scenery. the description is "So much tattered paper on this bulletin board. Most of it is illegible.".
some crates are here. They are scenery. The description is "The crates labeled 'GAME PRIZES' and 'RIDE PARTS' hold items like stuffed animals and plastic toys.".
a battered desk are here. It is scenery. The description is "The desk is covered with supplies, light bulbs, and ride parts.".
some supplies are here. They are scenery. The description is "The shelves are full of supplies, light bulbs, and ride parts.".
some boxes of lightbulbs are here. They are scenery. Understand "light" and "bulbs" as boxes of lightbulbs.The description is "The shelves are full of supplies, light bulbs, and ride parts.".
some spools of wire are here. They are scenery. The description is "The shelves are full of supplies, light bulbs, and ride parts.".
some ride parts are here. They are scenery. The description is "The shelves are full of supplies, light bulbs, and ride parts.".
some tangled flags are here. They are scenery. The description is "The flags are pennants used for decorating the midway.".
some seats are here. They are scenery. The description is "These are broken seats from some of the rides.".
a horse is here. It is scenery. The description is "This is one of the horses from the carousel ride. It looks like its tail is broken.".
some nuts are here. they are scenery. The description is "The shelves are full of supplies, light bulbs, and ride parts.".
some wire scraps are here. They are scenery. The description is "The shelves are full of supplies, light bulbs, and ride parts.".
some rats are here. The rats are scenery. The description of the rats is "You see rats scurry in all directions fleeing from the light cast by you.".
some walls are here. they are scenery. the description is "The rusted metal and peeling wooden walls bear the marks of years of use.".
some storage shelves are here. they are scenery. the description is "The shelves are full of supplies, light bulbs, and ride parts".
some storage boxes are here. they are scenery. understand "crates", "stuffed", "animal", "animals", "plastic", and "toys" as the storage boxes. the description is "The crates hold things like stuffed animals and plastic toys.".
some folded tarps are here. they are scenery. understand "poles", and "tent" as the folded tarps. the description is "The tarps and tent poles are used to provide shelter to the attendants if it should rain.".
some unassembled booths are here. they are scenery. the description is "It[']s impossible to tell which parts belong to which attraction.".
a flickering bulb is here. it is scenery. understand "light", "bulb", and "lightbulb" as the flickering bulb. the description is "The fluorescent bulb flickers overhead.".
some storage cobwebs are here. they are scenery. the description is "There are cobwebs everywhere. I guess it[']s been a while since this place was cleaned.".

A khaki colored door is a wooden door. The color of khaki colored door is khaki. The description of khaki colored door is "It[']s [printed name of item described]. It has the word 'Ride Exit' written on it." The silver key unlocks it. khaki colored door is west of the Storage Room and east of the Ride Exit. 
	
instead of smelling when the location is the storage room, say "The air hangs heavy with grease, dust, damp canvas, and a faint trace of stale popcorn.".

Chapter 5 - Hell Ride

Section 1 - Hell Ride Scene

Hell Ride AutoPlay is a scene. 
Hell Ride AutoPlay begins when the player is in the hell ride car for 2 turns.
Hell Ride AutoPlay ends when index is the number of rows in the Table of Hell Ride Events.
	
When Hell Ride AutoPlay begins, now index is 1.
When Hell Ride AutoPlay ends, end the story finally.
	
Instead of doing something other than waiting, looking, listening, smelling or examining during Hell Ride AutoPlay:
	say "You[']re enjoying the ride so much that you don[']t want to do anything but sit and watch the ride go by."
	
index is a number that varies. index is usually 1.		
every turn during Hell Ride AutoPlay:
	choose row index in the Table of Hell Ride Events;
	move the hell ride car to the locale entry, without printing a room description;
	try looking;
	say "Mist fills the area as you move to the next room...[paragraph break]";
	increment index;

Section 2 - Ride Entrance

After going south from the Head of the Line when the Ride Entrance is unvisited:
	if show images is true, display Figure of Hell Ride;
	continue the action.
	
Before looking when the location is the Ride Entrance:
	if show images is true, display Figure of Hell Ride.
	
Ride Entrance is a room. Ride Entrance is south of Head of the Line. "[description corresponding to the locale of Ride Entrance in the Table of Hell Ride Events]"

The Hell Ride car is a vehicle in the Ride Entrance. understand "cars" as hell ride car. The description of the Hell Ride car is "A car waits to take you through the horror that is Hell Ride."

Before going south when the player is in the Ride Entrance:
	say "You can[']t go that way." instead;
	continue the action.
	
the ride entrance facade is here. it is scenery. The description is "A towering archway of flames, spikes, and grinning skulls frames the entrance, crowned by flickering letters that read 'HELL RIDE', pulsing like a heartbeat. Below, crouching demon sculptures extend clawed hands in a sinister invitation. Wooden doors cover the entrance, whispering with faint, menacing chuckles as distorted organ music grows louder, punctuated by shrieks and grinding machinery.".

some ride entrance doors are here. they are scenery. understand "wooden", "twisted", "metal", "carved", and "wood" as the ride entrance doors. the description is "The doors begin to swing open to let a car into the ride.".	
a Hell Ride safety bar is here. it is scenery. the description is "The safety bar is locked into place ensuring you don[']t leave the car before the end of the ride.".
an archway is here. it is scenery. the description is "The archway surrounds the entrance to the ride.". Understand "flames", "arch", and "lights" as the archway.
some grinning skulls are here. they are scenery. understand "threshold" as grinning skulls. the description is "There are skulls scattered about the threshold of the ride entrance.".
some spikes are here. they are scenery. the description is "Spikes stand on either side of the door, their sharpened points gleaming in the eerie light.".
some demon sculptures are here. they are scenery. the description is "On either side of the doors are sculptures of demons welcoming you inside.".
the sickly green light is here. it is scenery. the description is "The sickly green light reveals twisted paths and grotesque shapes.".
some grotesque shapes are here. understand "shadowy" and "figures" as grotesque shapes. they are scenery. the description is "Shadowy figures in the shape of demons can be seen through the door.".
some twisted paths are here. they are scenery. the description is "The paths lead through the darkness into Hell Ride.".
some flashes of light are here. they are scenery. the description is "Flashes of sickly green light reveal twisted paths and grotesque shapes in the dark of the ride.".

instead of smelling when the location is the ride entrance, say "You can smell a faint sulfuric tang in the air.".
instead of listening when the location is the ride entrance, say "The sound of organ music, shrieks, and grinding machinery fills the air.".

lifting is an action applying to one thing. understand "lift [something]" as lifting. understand "raise [something]" as lifting. understand "pry [something]" as lifting.
instead of lifting the Hell Ride safety bar, say "The safety bar is locked in place.".
instead of lifting the Ferris Wheel safety bar, say "The safety bar is locked in place.".
instead of lifting, say "That does nothing.".

Section 3 - Stocks Room

After going south from the Ride Entrance when the Stocks Room is unvisited:
	if show images is true, display Figure of RideStocks;
	continue the action.
	
Before looking when the location is the Stocks Room:
	if show images is true, display Figure of RideStocks.

Stocks Room is south of the Ride Entrance. "[description corresponding to the locale of Stocks Room in the Table of Hell Ride Events]"

The wooden stocks are a supporter in the Stocks Room. The wooden stocks are fixed in place. understand "beams" as wooden stocks. The description of the wooden stocks is "At the square[']s center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures.".
the stocks public square is here. it is scenery. the description is "The public square is a cobblestone expanse bordered by weathered timber-framed buildings.".
some animatronics are here. they are scenery. understand "wax", and "figures" as animatronics. the description is "The animatronics and wax figures are extremely life like. Hell Ride sure lives up to its name.".
some punished individuals are here. they are scenery. understand "prisoners", and "captives" as punished individuals. the description is "The punished individuals hang their heads in shame, their faces etched with despair.".
the stocks room crowd is here. they are scenery. understand "children", "onlookers", "mob", and "jeering" as stocks room crowd. the description is "The crowd revels in cruelty - a wiry man spits insults with gleeful laughter, while a stout woman throws overripe vegetables, each impact sparking jeers.".
some tattered clothing is here. it is scenery. the description is "The prisoner[']s tattered clothing offering little protection from the biting wind.".
some iron clasps are here. they are scenery. the description is "Iron clasps lock the prisoners in place.".
some rotten vegetables are here. they are scenery. understand "fruit" as the rotten vegetables. the description is "The rotten fruit and vegetables splatter as each hits its mark, coating the prisoners with rank vegetation.".

instead of smelling when the location is the stocks room, say "The air carries the mingling scents of chimney smoke, damp earth, and the faint tang of a nearby smithy.".

Section 4 - Gallows Room

After going south from the Stocks Room when the Gallows Room is unvisited:
	if show images is true, display Figure of RideGallows;
	continue the action.
	
Before looking when the location is the Gallows Room:
	if show images is true, display Figure of RideGallows.
	
The Gallows Room is south of the Stocks Room.  "[description corresponding to the locale of Gallows Room in the Table of Hell Ride Events]"

The gallows platform is in the Gallows Room. The gallows platform is a supporter. The gallows platform is fixed in place. Understand "gallows" as gallows platform. The description of the gallows platform is "At the center of the square, rising like a grim monument to mortality, stands the gallows — a wooden platform, darkened by age and weather, with thick ropes hanging like vipers poised to strike." 

the gallows public square is here. it is scenery. the description is "The public square, slick with morning drizzle, lies under a brooding, overcast sky. At its center looms the gallows, a weathered wooden platform with thick ropes swaying ominously.".
the gallows crowd is here. it is scenery. the description is "The crowd stands in somber silence, broken by the shuffle of feet or faint murmurs, their eyes fixed on the grim scene.".
a gallows executioner is here. it is scenery. understand "hooded" as gallows executioner. the description is "A hooded executioner, cloaked in black, adjusts the frayed noose with practiced precision, his cold presence exuding purpose.".
a condemned man is here. it is scenery. understand "prisoner" as the condemned man. the description is "The condemned man, pale and trembling, has his bound hands behind him.". 
some vendors are here. they are scenery. the description is "Vendors hawk bread and cider, while children strain for a better view.".
an old man is here. it is scenery. the description is "An old man clutches a rosary, whispering prayers, as others smirk and place bets.".
a gallows room raven is here. it is scenery. the description is "A raven perches on the gallows['] beam, its unblinking gaze fixed on the scene below.".
a noose is here. it is scenery. the description is "The noose has been tied and hangs from the gallows proper.".

instead of listening when the location is the gallows room, say "Above, the bell tower tolls, its mournful chime marking the passage of the man[']s final moments.".

Section 5 - Stake Room

After going south from the Gallows Room when the Stake Room is unvisited:
	if show images is true, display Figure of RideStake;
	continue the action.
	
Before looking when the location is the Stake Room:
	if show images is true, display Figure of RideStake.

The Stake Room is south of the Gallows Room. "[description corresponding to the locale of Stake Room in the Table of Hell Ride Events]"

the condemned women  are here. they are scenery. understand "woman" and "prisoners" as the condemned women. the description is "Bound to the stakes are three women, their faces reflecting defiance, resignation, and terror.".
the stakes public square is here. it is scenery. the description is "The public square is steeped in grim silence, broken only by the crackling of flames.".
stakes are in the Stake Room. It is scenery. The description is "Three wooden stakes rise from a pyre. Bound to the stakes are three women.".
the stake crowd is here. it is scenery. understand "elders", "onlookers" and "children" as the stake crowd. the description is "A crowd encircles the scene, expressions ranging from morbid fascination to righteous fury.".
the stake executioner is here. it is scenery. the description is "The executioner, hooded and clad in a leather apron, steps forward with a blazing torch, igniting the pyre in a sudden roar.".
a stake room apron is here. it is scenery. the description is "The leather apron appears to have seen its share of action.".
a stake room raven is here. it is scenery. the description is "A raven caws from the bell tower as slow church bells toll.".
a torch is here. it is scenery. the description is "The executioner carries the torch to light the pyre.".
a raven is here. it is scenery. the description is "The raven caws from the bell tower.".

A pyre is an open unopenable container in the Stake Room. "The flames of the pyre burn ever brighter and rise ever higher engulfing the victims." The pyre is fixed in place. Understand "kindling", "logs", "fire" and "flames" as pyre. The description is "The flames burn ever higher." 

instead of listening when the location is the stake room, say "A raven caws from the bell tower as slow church bells toll.".
instead of smelling when the location is the stake room, say "The smell of smoke permeates the air.".

Section 6 - Dungeon

After going south from the Stake Room when the Dungeon is unvisited:
	if show images is true, display Figure of RideDungeon;
	continue the action.
	
Before looking when the location is the Dungeon:
	if show images is true, display Figure of RideDungeon.
	
The Dungeon is south of the Stake Room. "[description corresponding to the locale of Dungeon in the Table of Hell Ride Events]"

An iron chair is in the Dungeon. The iron chair is a supporter. understand "spiked" and "seat" as iron chair. The description of the iron chair is "A spiked chair looms in the corner, its cruel design gleaming faintly in the dim light." 

some dungeon chains are here. They are scenery. understand "manacles" as dungeon chains. The description of the dungeon chains is "The chains rattle against the walls."
A splintered rack is here. it is fixed in place. understand "rack" as the splintered rack. The description of the splintered rack is "The rack has a prisoner splayed in four directions."
A glowing brazier is here. it is fixed in place. understand "bloodstained", "blood", "stained", and "tools" as the glowing brazier. The description of the glowing brazier is "It is glowing red with an infernal heat raising the temperature of the bloodstained tools.".
some sconces are here. they are scenery. the description is "These are oil burning lamps.". understand "torch", "torches", "lamp", "lamps", and "light" as sconces.
some prisoners are here. they are scenery. the description is "Prisoners endure their own horrors - one stretched on the rack, another hanging limply from manacles, and a third gasping weakly in the spiked chair.".
the hooded torturer is here. it is scenery. the description is "The hooded torturer wears a leather apron stained with the evidence of countless victims.".
some dungeon rats are here. The dungeon rats are scenery. The description of the dungeon rats is "You see rats scurry in all directions fleeing from the light cast by you.".
some dungeon walls are here. they are scenery. the description is "The its stone walls slick with moisture and grime.".
a dungeon apron is here. it is scenery. the description is "The leather apron appears to have seen its share of action.".

instead of smelling when the location is the dungeon, say "The air reeks of sweat, blood, mildew, and burning oil from flickering torches mounted on rusted sconces.".
instead of listening when the location is the dungeon, say "Chains hang from walls and ceilings, their faint clinking blending with the moans and occasional screams of prisoners.".
	
Section 7 - Guillotine Room

After going south from the Dungeon when the Guillotine Room is unvisited:
	if show images is true, display Figure of RideGuillotine;
	continue the action.
	
Before looking when the location is the Guillotine Room:
	if show images is true, display Figure of RideGuillotine.

The Guillotine Room is south of the Dungeon. "[description corresponding to the locale of Guillotine Room in the Table of Hell Ride Events]"

The guillotine platform is in the Guillotine Room. The guillotine platform is a supporter. Understand "scaffold" as guillotine platform. The description of the guillotine platform is "At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out." 

a thing called a guillotine is here. it is scenery. The description is "The guillotine looms over the public square, its blade gleaming faintly in the dim light.".

a lone figure is here. it is scenery. understand "condemned", "man" as the lone figure. the description is "A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd[']s gaze.".

a guillotine executioner is here. it is scenery. the description is "The executioner - a hooded figure in black - stands ready beside the guillotine."

the town crier is here. it is scenery. the description is "The town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'".

the guillotine crowd is here. it is scenery. understand "children" as the guillotine crowd. the description is "The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event[']s gravity.".

a crow is here. it is scenery. the description is "The crow sits, sleek and black, on a nearby rooftop."

a thing called the guillotine cars are here. understand "car" as guillotine cars. they are scenery. the description is "The cars keep coming and move under the malfunctioning guillotine. You shudder at just the thought of it".


Section 8 - Ride Exit

After going south from the Guillotine Room when the Ride Exit is unvisited:
	if show images is true, display Figure of RideExit;
	continue the action.
	
Before looking when the location is the Ride Exit:
	if show images is true, display Figure of RideExit.

The Ride Exit is south of the Guillotine Room. "[description corresponding to the locale of Ride Exit in the Table of Hell Ride Events]"

The Merchandise Attendant is an attendant in the ride exit.

The merchandise stand is scenery in the Ride Exit. The merchandise stand is a container. Understand "display" as merchandise stand. The description of the merchandise stand is "The stand is bathed in red light, adding to the ominous mood." 

some Plastic Bones are in the merchandise stand. The price of the plastic bones is $1.00. The description is "This is a collection of plastic bones meant to decorate your yard."

some Devil Horns are in the merchandise stand. The price of the devil horns is $2.00. The description is "The devil horns tie to your head."

some Key Chains are in the merchandise stand. The price of the key chains is $2.00. The description is "The key chains say 'I Survived Hell Ride!'"

some T-Shirts are in the merchandise stand. The price of the t-shirts is $7.50. Understand "t-shirt" as t-shirts. The description is "These are black t-shirt with the caption 'I Survived Hell Ride!'"

There is a price list in the Ride Exit. The price list is scenery. Understand "sign" as price list. The description of the price list is "It[']s a sign displaying the prices of the merchandise.".

instead of reading or examining the price list:
	now sign table is Table of Merchandise;
	show a sign table.
	
the cash register is here. it is scenery. the description is "The cash register accommodates both cash and electronic payments. Too bad you don[']t have a debit card.".
some gift shop walls are here. they are scenery. understand "wall", "flickering", "lights", "erratic", and "shadows" as gift shop walls. The description is "Leading out of the ride a dark corridor with peeling black and red-streaked walls, flickering lights cast erratic shadows on the uneven floor.".
some riders are here. they are scenery. the description is "The riders exit [story title]. Some are laughing while others look rather upset.".
some carnival workers are here. they are scenery. understand "actors" as carnival workers. the description is "The actors are here dressed in their tattered costumes muttering things like 'You made it!".
some fencing is here. it is scenery. the description is "The jagged, rusted fencing is draped with cobwebs and plastic skulls.".
some cobwebs are here. they are scenery. understand "plastic" and "skulls" as cobwebs. the description is "The fake cobwebs and skulls cover the rusty fencing.".

instead of listening when the location is the ride exit, say "You hear the faint whispers and distant screams echoing softly in the background.".
instead of smelling when the location is the ride exit, say "The air is cool and damp, carrying a faint metallic tang.".

Part 3 - Regions

The Midway is a region. PL-room, TB-room, CS-room, Behind the Concession Stand, Carnival Office, HS-room, SF-room, ST-room, 
Head of the Line, FW-room, BC-room, FT-room, CR-room, Dime Toss Game, and the Pitchers Mound are in the Midway. 
The sky, music, Hell Ride, and the Ferris Wheel are in the Midway

HellRide is a region. Ride Entrance, Stocks Room, Gallows Room, Stake Room, Dungeon, Guillotine Room, Ride Exit are in HellRide.

Electrical Area is a region. Electrical Room, Electrical Closet One, Electrical Closet Three, Electrical Closet Five, Electrical Closet Seven, Electrical Closet Nine, and Electrical Closet Eleven are in the Electrical Area.

Back Stage is a region. Dark Passage, Maintenance Office, Crawl Space, Mechanical Room North, Mechanical Room South, Generator Room, Storage Room are in Back Stage.

Second Floor is a region. Dark Hallway, Holding Room, and Control Room are in the Second Floor.

Part 4 - Tables

Section 1 - Table of Bored Responses

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

Section 2 - Table of Songs

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
"Lou Reed and the Velvet Underground"	"Sweet Jane"	false
"Queen"	"Bohemian Rhapsody"	false
"Bob Seger"	"Old Time Rock[']N[']Roll"	false
"Boston"	"More That A Feeling"	false
"Roger Miller"	"King of the Road"	false
"Elvis Presley"	"Suspicious Minds"	false
"Jimmy Buffet"	"Margaritaville"	false
"The Cure"	"Friday I[']m In Love"	false
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
"Dusty Springfield"	"Son Of A Preacher Man"	false
"Kermit the Frog"	"Rainbow Connection"	false
"David Bowie"	"Young Americans"	false
"Ben E. King"	"Stand By Me"	false
"Blondie"	"Heart Of Glass"	false
"Neil Diamond"	"Sweet Caroline"	false
"The Grateful Dead"	"Ripple"	false
"Bruce Springsteen"	"Born To Run"	false
"The Talking Heads"	"Psycho Killer"	false
"The Village People"	"YMCA"	false

Section 3 - Table of Monitor Descriptions

Table of Monitor Descriptions
link number	figure choice		description
0	Figure of ControlPanel		"The monitor now shows nothing but snow."
1	Figure of ControlPanelStocks		"The monitor now shows a tableau of poor unfortunate townsfolk locked in stocks."
3	Figure of ControlPanelGallows		"The monitor now shows a scene of someone waiting to be hanged."
5	Figure of ControlPanelStake		"The monitor now displays a scene of three women being burned at the stake."
7	Figure of ControlPanelDungeon		"The monitor now shows the implements of torture in the dungeon."
9	Figure of ControlPanelGuillotine		"The monitor now shows a tableau of a guillotine rising and falling over the ride exit."
11	Figure of ControlPanelExit		"The monitor shows the gift shop located at the Hell Ride exit."

Section 4 - Table of High Striker Prizes

Table of High Striker Prizes
index (text)	object (an object)	description (text)
"1"	teddy bear	"a teddy bear"
"2"	Swiss army knife	"a Swiss Army knife"
"3"	fuse13	"a [printed name of fuse13]"
"4"	poster of Taylor Swift	"a poster of Taylor Swift"


Section 5 - Table of Dime Toss Prizes

Table of Dime Toss Prizes
index (text)	object (an object)	description (text)
"1"	small plush monkey	"a stuffed monkey"
"2"	fuse15	"an [printed name of fuse15]"
"3"	poster of Billie Eilish	"a poster of Billie Eilish"
"4"	horseshoe magnet	"a horseshoe magnet"

Section 6 - Table of Pitchers Mound Prizes

Table of Pitchers Mound Prizes
index (text)	object (an object)	description (text)
"1"	fuse3	"a [printed name of fuse3]"
"2"	small plush donkey	"a plush donkey"
"3"	goldfish	"a goldfish in a bowl"
"4"	poster of Lourde	"a poster of Lourde"

Section 7 - Table of Tickets

sign table is a table name that varies. The sign table is Table of Tickets.
To show a sign table:
	repeat through a sign table:
		let T be "[object entry]";
		say "[price entry] [T in title case][line break]".
		
[load prices into tables]
when play begins:
	repeat through Table of Tickets:
		now the price entry is the price of the object entry;
	repeat through Table of Concessions:
		now the price entry is the price of the object entry;
	repeat through Table of Merchandise:
		now the price entry is the price of the object entry;

Table of Tickets
object (object)	price (a price)
Hell Ride Ticket	
Fortune Teller Ticket	
Ferris Wheel Ticket	
Bumper Cars Ticket	
Carousel Ticket	

Section 8 - Table of Concessions

Table of Concessions
object (object)	price (a price)
Drink	
Bucket of Popcorn	
Candy Apple	
Cotton Candy	
Soft Pretzel	
Bubblegum	

Section 9 - Table of Merchandise

Table of Merchandise
object (object)	price (a price)
Key Chains	
Fuse1	
Devil Horns	
Plastic Bones	
T-Shirts	

Section 10 - Table of Hell Ride Events

Table of Hell Ride Events
locale	locale text	figure	description
Ride Entrance	"Ride Entrance"	figure of Hell Ride	"The cars that will take you into the fearsome Hell Ride stop here for you to board and then move forward, the safety bar locked in place, as the entrance to Hell Ride looms ahead — a grotesque facade of twisted metal and carved wood, illuminated by flickering blood-red lights. The air carries a faint sulfuric tang mingled with the sweet aroma of carnival popcorn.

A towering archway of flames, spikes, and grinning skulls frames the entrance, crowned by flickering letters that read 'HELL RIDE', pulsing like a heartbeat. Below, crouching demon sculptures extend clawed hands in a sinister invitation. Wooden doors cover the entrance, whispering with faint, menacing chuckles as distorted organ music grows louder, punctuated by shrieks and grinding machinery.

Inside, near-total darkness is broken by flashes of sickly green light revealing twisted paths and grotesque shapes. Beyond the threshold lies only uncertainty and terror. To one side, the darkness looks a little bit darker than the rest of the room."
Stocks Room	"Stocks Room"		figure of RideStocks	"The public square is a cobblestone expanse bordered by weathered timber-framed buildings. The air carries the mingling scents of chimney smoke, damp earth, and the faint tang of a nearby smithy. At its center, crude wooden stocks stand as a grim focal point, their beams weathered and stained from years of use. Iron clasps lock captives in degrading postures, their tattered clothing offering little protection from the biting wind.

The animatronics and wax figures are extremely life like. Hell Ride sure lives up to its name.

The punished individuals hang their heads in shame, their faces etched with despair. Around them, the crowd revels in cruelty — a wiry man spits insults with gleeful laughter, while a stout woman throws overripe vegetables, each impact sparking jeers. Even children join in, pointing and mocking with mischievous delight.

The square hums with noise: the crowd’s taunts, the crack of objects hitting wood, and the quiet murmurs of the suffering captives. Overhead, a gray sky threatens rain, indifferent to the spectacle below. The jeering mob ignores its ominous weight, too engrossed in their shared cruelty to notice nature’s disapproval."
Gallows Room	"Gallows Room"	figure of RideGallows	"The public square, slick with morning drizzle, lies under a brooding, overcast sky. At its center looms the gallows, a weathered wooden platform with thick ropes swaying ominously. The crowd stands in somber silence, broken by the shuffle of feet or faint murmurs, their eyes fixed on the grim scene.

A hooded executioner, cloaked in black, adjusts the frayed noose with practiced precision, his cold presence exuding purpose. In front of him stands the condemned man, pale and trembling, his bound hands behind him. Beads of sweat mix with rain on his haunted face as his darting eyes search the indifferent crowd. Each shallow breath forms a fleeting cloud in the chilly air — a fragile reminder of his fleeting life.

Vendors hawk bread and cider, while children strain for a better view. An old man clutches a rosary, whispering prayers, as others smirk and place bets. Above, the bell tower tolls, its mournful chime marking the passage of the man’s final moments. A raven perches on the gallows beam, its unblinking gaze fixed on the scene below.

As the executioner adjusts the noose around the man’s neck, the crowd falls silent, the air thick with dread. Distant thunder rumbles faintly, as if the heavens themselves await the inevitable."
Stake Room	"Stake Room"	figure of RideStake	"The public square is steeped in grim silence, broken only by the crackling of flames. At its center, three wooden stakes rise from a pyre of logs and kindling, darkened by smoke from past executions. Bound to the stakes are three women, their faces reflecting defiance, resignation, and terror.

A crowd encircles the scene, expressions ranging from morbid fascination to righteous fury. Children cling to their mothers, while elders nod solemnly. Some jeer and throw stones; others murmur prayers or avert their gaze.

The executioner, hooded and clad in a leather apron, steps forward with a blazing torch, igniting the pyre in a sudden roar. Flames climb rapidly as thick smoke coils upward. The condemned cry out, their voices mingling with the crackle of fire. The oppressive heat radiates outward, pressing against the silent, uneasy crowd.

Gray clouds loom overhead, nature’s somber backdrop to the grim spectacle. A raven caws from the bell tower as slow church bells toll, each strike punctuating the tragedy. As the pyre burns, some onlookers remain transfixed while others quietly slip away, the square heavy with ash, smoke, and the echoes of the condemned."
Dungeon	"Dungeon"		figure of RideDungeon	"The dungeon is a dark, suffocating chamber carved into the earth, its stone walls slick with moisture and grime. The air reeks of sweat, blood, mildew, and burning oil from flickering torches mounted on rusted sconces. Shadows twist on the walls, creating grotesque, unsettling shapes in the dim light.

Chains hang from walls and ceilings, their faint clinking blending with the moans and occasional screams of prisoners. Water drips rhythmically from a cracked ceiling, adding to the chamber[’]s eerie ambiance.

The room is littered with instruments of torment: a splintered rack, a glowing brazier holding bloodstained tools, and a spiked chair gleaming faintly in the light. Prisoners endure their own horrors — one stretched on the rack, another hanging limply from manacles, and a third gasping weakly in the spiked chair.

The hooded torturer moves with detached precision, their leather apron stained with the evidence of countless victims. They work silently, indifferent to the agony surrounding them.

Above, rats scuttle in the shadows, and the low ceiling presses down like the weight of despair. This is a realm of suffering and hopelessness, where life and death blur, and torment is the only certainty."
Guillotine Room	"Guillotine Room"		figure of RideGuillotine	"The public square buzzes with tense anticipation, a crowd gathered under gray skies that cast a somber light on the cobblestones. At the center, a stark wooden platform looms, its purpose grim and unavoidable.

A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd’s gaze. Their tattered clothing, once fine, reflects the fall that led them to this moment.

The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event’s gravity. Near the edge of the platform, the town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'

The condemned flinches but remains silent as the executioner — a hooded figure in black — stands ready beside the guillotine, its blade gleaming faintly in the dim light. The murmurs of the crowd fall into silence at the executioner’s signal, leaving only the rustle of wind and the creak of the scaffold.

As the condemned approaches the guillotine, a crow caws sharply from a nearby rooftop, its cry echoing through the square like an omen. The crowd leans forward, breath held, as justice and mortality converge on the scene.

There is just one problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be seriously injured.
[if the player is not in the hell ride car]
You[']re glad you[']re not in one of those cars now.
[otherwise]

Looks like your goose is cooked. Say 'Goodnight, Gracie!' 

You are stupefied as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable.[end if]"
Ride Exit	"Ride Exit"	figure of RideExit	"The exit of Hell Ride is designed to leave riders with lingering unease. Emerging from a dark corridor with peeling black and red-streaked walls, flickering lights cast erratic shadows on the uneven floor. The air is cool and damp, carrying a faint metallic tang, while faint whispers and distant screams echo softly in the background.

Riders step into a small courtyard enclosed by jagged, rusted fencing draped with cobwebs and plastic skulls. Overhead, a weathered sign reads, 'You[’]ve Survived… For Now.' Nearby, carnival workers in tattered costumes watch silently, occasionally muttering cryptic remarks like, 'Not everyone makes it out.'

A merchandise display glows red, selling items like Hell Ride Survivor t-shirts and key chains. Beyond the fencing, the cheerful carnival lights and sounds feel jarring, contrasting sharply with the ride’s oppressive atmosphere. 

The exit ensures Hell Ride isn’t just an experience — it lingers, blurring the line between thrill and fear.

There is a price list next to the cash register. An attendant is here to assist you with your purchases. The stand has [list of things contained by the merchandise stand] for sale."

Section 11 - Table of Little Egypt Events

Table of Little Egypt Events
description
"In the dimly lit tent, you see that the stage is decorated to resemble an exotic Middle Eastern market or palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The backdrop displays painted scenes of pyramids, desert landscapes, and domed structures evoking a sense of being transported to the 'Middle East'. "
"Little Egypt emerges draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements."
"The performance begins with slow, undulating movements, drawing you into the rhythm of exotic live music played on traditional instruments like the oud, darbuka, or zurna. As the tempo builds, her hips, torso, and hands move in intricate, mesmerizing patterns, demonstrating remarkable control and fluidity. She incorporates dramatic spins, drops, and shimmies, often accentuating the beat of the music with a quick jingle of her coin belt."
"Little Egypt makes eye contact with you and smiles enigmatically. During her performance she balances a sword on her head and accents her dance with finger cymbals."
"The music alternates between hauntingly slow melodies and rapid, energetic drum beats, creating an emotional arc that keeps you entranced. Little Egypt relies on the music[']s dynamic changes to tell a story with movements reflecting joy, sorrow, seduction, and celebration."
"The performance concludes with a dramatic flourish of a fast-paced shimmy, a bold spin, and Little Egypt dramatically casts off her veils. The dancer takes a bow to enthusiastic applause, leaving you spellbound by the sensual yet artful display."

Section 12 - Table of Tarot Readings

Table of Tarot Readings
key (number)	category (text)	card (text)	description (text)
11	"Past"	"Eight of Cups (reversed)"	"Eight of Cups reversed indicates suggests that you may be clinging tightly to your comfort zone, even if it no longer serves your best interests. This card urges you to examine whether you are avoiding necessary growth or ignoring your true desires. It may be tempting to remain in familiar territory, but by doing so, you risk missing out on the opportunities that lie ahead. Now is the time to summon the courage to explore new horizons and embrace the unknown."
12	"Present"	"Knight of Swords (reversed)"	"Knight of Swords reversed signifies a lack of strategy, where actions are taken without much thought or consideration for the consequences. It suggests a tendency to rush into situations without a clear plan, leading to hasty decisions and potential conflicts. This reversed Knight warns against reckless behavior and encourages the need for patience and careful deliberation. It serves as a reminder to slow down, reflect, and align actions with a well-thought-out strategy in order to avoid unnecessary conflicts and achieve the desired outcomes."
13	"Challenge"	"The Devil (reversed)"	"Devil reversed indicate temptations resisted, stricter moral kept and an escape from the chains from the devil. It offers hope and liberation. The Devil reversed brings the strength and self awareness to confront your inner demons and break free from the suffocating bonds that have kept you trapped in patterns of self-destruction. It is a powerful call to examine your attachments, whether they be toxic relationships, harmful habits, or limiting beliefs."
14	"Opportunity"	"The Fool (upright)"	"Fool represents new beginnings and feeling carefree. It may indicate a new phase in your life such as starting a new job, moving to a new city, or beginning a new relationship. Embrace this new chapter with optimism and an open heart. The Fool reminds you that it[']s never too late to start fresh and that you can always take a leap of faith towards your dreams."
15	"Future"	"The Devil (upright)"	"Devil symbolizes primal behaviors, desires and addictions and materialism. It represents the fears that causes obsession and compulsive behavior. Its ominous appearance serves as a reminder that you may find yourself caught in the snare of worldly desires and unhealthy patterns. This card is a wake-up call to face your fears and conquer them. This is a card of temptation, and it[']s warning you to be careful of what you allow to control you."
21	"Past"	"The High Priestess (reversed)"	"High Priestess reversed indicates blocked psychic abilities, and little to no awareness of the subconscious influence on your reality. This reversal suggests a lack of trust in your inner voice and a disconnection from spiritual realms. It may indicate a struggle to access your intuition, leading to confusion and indecision. The reversed High Priestess also urges caution in matters of secrecy and deception. It is important to exercise discernment as there may be hidden agendas or deceitful individuals around. It is crucial for you to seek inner clarity now."
22	"Present"	"Six of Swords (upright)"	"Six of Swords brings a sense of calm and transition. As you embark on this journey, find solace in leaving behind turbulent waters and moving towards a more peaceful horizon. The image of the boat slowly gliding across the steady river symbolizes the passage from one phase of life to another, offering the opportunity to heal, reflect, and gather your strength. This card invites you to embrace the subtle winds of change and trust that better days lie ahead."
23	"Challenge"	"Queen of Swords (reversed)"	"Queen of Swords reversed exudes an air of manipulation, deception, and cruelty. Her once discerning and judicious nature has turned into a cold hearted determination to achieve her own agenda, regardless of the consequences. She wields her intellectual prowess as a weapon, using it to strip others of their power and inflict emotional harm. With her cutting words and dismissive actions, she creates an atmosphere of hostility and mistrust. The Queen of Swords Reversed serves as a reminder to be cautious of those who may mask their malicious intentions with intelligence and charm."
24	"Opportunity"	"Two of Swords (upright)"	"Two of Swords encourages you to remove the blindfold and honestly assess the situation at hand. It may be necessary to weigh the pros and cons of different options, gather more information, or seek guidance from others to help you make an informed decision. However, prolonged indecision can lead to stagnation, and it[']s important to eventually address the issue at hand. The crossed swords symbolize the need to find a balance between opposing forces and find a way to reconcile conflicting aspects."
25	"Future"	"The Lovers (reversed)"	"Lovers reversed indicates a breakup between partners, families or friends. Lovers reversed can also indicate a wrong choice being made. It represents disharmony and conflicts within relationships, a lack of balance, and difficult choices. In its reversed form, this card serves as a reminder to evaluate the foundations of your relationships and address any underlying issues. It urges you to explore your desires, fears, and doubts, as well as to reflect upon the consequences of your choices."
31	"Past"	"Ten of Wands (upright)"	"Ten of Wands suggests that you may be shouldering too many responsibilities or taking on more than you can handle. You may feel overwhelmed, exhausted, or weighed down by the tasks and obligations in your life. This card serves as a reminder to evaluate your commitments and consider whether you need to delegate, seek support, or let go of some burdens."
32	"Present"	"Nine of Wands (upright)"	"Nine of Wands is the card for strength, courage, resilience and endurance. Never give up and never surrender. It suggests that while you may be tired or worn out from the struggles you[']ve faced, it[']s important to remain alert and prepared for any further challenges that may arise. This card encourages you to draw upon your past experiences and learn from them, using them as sources of wisdom and guidance."
33	"Challenge"	"The World (upright)"	"World is the final Major Arcana card and represents fulfillment and successful completion of a cycle. You know your place in the world, and your life lessons have served you well. It serves as a gentle reminder that the universe is aligning perfectly in your favor, propelling you forward towards the triumphant realization of your ambitions. The world is at your feet. You[']re on the right path towards the attainment of your long-cherished aspirations and dreams."
34	"Opportunity"	"Two of Swords (reversed)"	"Two of Swords reversed suggests that poor choices and hasty decision-making are likely to lead to movement in the wrong direction. It serves as a reminder that impulsive actions can often result in unfavorable outcomes, urging you to carefully consider your options and approach situations with thoughtfulness and patience. By taking the time to weigh your choices and make deliberate decisions, you can avoid the pitfalls that come with rushing into action without considering the potential consequences."
35	"Future"	"Four of Wands (reversed)"	"Four of Wands reversed indicates the foundation not laid or not ready. Something has caused a disruption in your plans. This could be due to external factors, such as unexpected events that have thrown you off course. Alternatively, it could be self-sabotage, your wavering self-belief or lack of confidence in your abilities can be hindering you from achieving your goals."

Section 13 - Table of Attendant Conversation Responses

Table of Attendant Conversation Responses
topic	response (text)
"hell/ride" or "hell ride"	"[one of][story title] is scary. You won[']t catch me on it![or]Last time I rode [story title], I heard strange noises.[or][story title] is so old that It[']s falling apart. I wouldn[']t ride it.[or][story title] is behind on its maintenance schedule. Might want to skip that one.[at random]"
"carousel/merry/go/round" or "merry-go-round" or "the carousel" or "the merry-go-round"	"[one of]I[']ve loved the carousel ever since I was a little kid![or]The lions are my favorite![or]I get dizzy when I ride the Merry Go Round[at random]"
"bumper/car/cars" or "bumper cars" or "bumper car" or "the bumper cars" or "the bumper car"	"[one of]The bumper cars are so much fun. You[']re heading for someone[']s car and bam! you get hit instead![or]Last time I was on the bumper cars, I nailed everyone there![or]It[']s fun to knock other people[']s cars around![at random]"
"Ferris/wheel" or "Ferris wheel" or "the Ferris wheel" or "the wheel"	"[one of]Isn[']t the Ferris wheel so romantic? I sure think so![or]Are you and your sweetie going to ride the Ferris wheel?[or]You can see the whole carnival from up there![at random]"
"fortune/teller/Esmeralda/mysterious/woman" or "fortune teller" or "the fortune teller"	"[one of]Esmeralda? She[']s down-right spooky. I asked her for a tarot reading, and boy, the things she told me![or]Esmeralda? She read my palm. I don[']t know how she knew the things she told me.[or]Esmeralda? She[']s been with the carnival for so long that no one knows how old she is. She[']s been here forever![at random]"
"high/striker" or "high striker" or "the high striker"	"[one of]You[']re a strong guy. Go for it![or]Win a prize for your sweetie![or]Swing the mallet and ring the bell![at random]"
"dime/toss" or "dime toss" or "the dime toss"	"[one of]Careful now! Don[']t want it skidding off the other side.[or]It[']s just like skipping a stone.[or]Aim carefully and you should get it.[at random]"
"pitchers/mound" or "pitchers mound"	"[one of]Batter, batter, batter, swing batter![or]Pretend you[']re pitching for the Red Sox.[or]Knock [']em down and win a prize![at random]"
"Hell Ride Ticket" or "Carousel Ticket" or "Bumper Cars Ticket" or "Ferris Wheel Ticket" or "Fortune Teller Ticket" or "ticket"	"[The noun] says, 'You need to buy a ticket in order to ride the attractions.'"
"parking" or "the parking ticket" or "parking ticket"	"[The noun] says, 'You need a parking ticket to leave your car here.'"
"/fuse/fuses/aqua/crimson/emerald/gray/indigo/khaki/magenta/orange/quartz" or "aqua fuse " or "crimson fuse" or "emerald fuse" or "gray fuse" or "indigo fuse" or "khaki fuse" or "magenta fuse" or "orange fuse" or "quartz fuse" 	"[if the player is carrying a fuse]'That looks like a fuse. Perhaps there[']s an electrical panel where it fits.'[otherwise]'What fuse?'[end if] says [the noun]"
"movies/cinema/theater"	"[The noun] says, 'There[']s a new horror movie opening on Friday. I want to take my sweetie. Perhaps they[']ll cling to me because they[']re scared.'"
"brewski/brew/beer"	"'A nice cold Coors Light would taste good about now', [the noun] replies"
"big/game/football/soccer/basketball/hockey/baseball"	"[The noun] says, 'Friday night is the league championship. I hope we win!'"
"SAT/scores/college" or "SAT scores"	"[The noun] says, 'I hope I get accepted. I want to go to school on a football scholarship.'"
"cheeseburger/lunch"	"[The noun] replies, 'I skipped breakfast this morning. Boy, am I hungry!'"
"uniform"	"Wearing blue pants and a pink shirt, [the noun] says, 'This is just awful! I look like a lollipop.'"
"little/egypt" or "little egypt"	"[one of]Little Egypt is so beautiful. She[']s a wonderful dancer too.[or]Did you know Little Egypt really IS from Egypt?[or]Maybe she[']d like to date you.[at random]"
"popcorn/bucket/buttered" or "bucket of popcorn" or "buttered popcorn"	"[The noun] says, 'The popcorn is really good. It[']s hot and fresh.'"
"bubblegum/bubble/gum"	"'It[']s Bazooka Joe! My favorite!', [the noun] says."
"candy/apple/apples" or "candy apple" or "candy apples"	"[The noun] says, 'I can[']t eat these. They get stuck in my braces.'"
"cotton/candy" or "cotton candy"	"'I love the way cotton candy melts in my mouth', says [the noun]."
"pretzel/pretzels/soft" or "soft pretzel" or "soft pretzels"	"[The noun] says, 'I prefer to eat my pretzels with mustard.'"
"mr/owner/Whidbey"	"[The noun] says , 'Mr. Whidbey? I guess he[']s alright. He[']s not in any trouble is he?'"
"invoices/receipts/paperwork"	"Oh, I don[']t know what any of that mumbo jumbo means', says [the noun]."
"insurance/policy" or "insurance policy"	"'Gosh, I wish I had a million dollars!', [the noun] says."

Section 14 - Table of Janitor Conversation Responses

Table of Janitor Conversation Responses
topic	response (text)
"hell/ride" or "hell ride"	"[story title] is a finicky ride. I[']m fixing something there every week. Last week, Mr. Whidbey asked me to skip [story title][']s maintenance slot. There was a fire in the Stakes Room last month. And just yesterday I caught him creeping around the guillotine room."
"owner/Whidbey/mister/mr" or "Mr Whidbey"	"[The noun] says , 'Mr. Whidbey? He creeps me out. It always seems like he[']s hiding something. Just yesterday I caught him sneaking around the guillotine room in [story title]"
"invoices/receipts/paperwork"	"[The noun] says, 'Wow! These don[']t look good. Looks like the carnival owes a lot of money! Cash [']N['] Carry provides every day supplies. Why is this overdue? The fire last month in [story title] was really bad. I hope I don[']t lose my job!'"
"insurance/policy" or "insurance policy"	"An insurance policy? For a million bucks? Maybe that fire last month wasn[']t an accident."
"carnival"	"[one of]The Whidbey family has owned this carnival since the 1950[']s', [the noun] says.[or]Mr. Whidbey is the last of his line. He has no one to leave the carnival to.[or]This once proud carnival has seen better days.[cycling]"
"ferris/wheel" or "ferris wheel"	"The other day, I found a bolt on one of the gondolas so loose it had almost come off. That would have been a tragedy!"
"bumper/car/cars" or "bumper cars" or "bumper car"	"That reminds me. Not long ago, one of the bumper cars was shorting out and electrifying the car. Boy, that would have been a shocking experience."
"fortune/teller/esmeralda/esmerelda" or "fortune teller"	"Her fortunes are always crazy accurate. She[']s spooky. She[']s so pretty. I wonder if I should ask her out on a date."
"carousel"	"The carousel is hard to maintain because of all the animals moving up and down. There[']s a lot of moving parts in that one."
"dime/toss/plate" or "dime toss"	"The problem with that one is that a modern dime weighs 2.268 grams and isn[']t heavy enough to land on the plate. The trick with that one is to find a Mercury dime. It weighs 2.50 grams."
"pitchers/mound/milk/bottles" or "pitchers mound" or "milk bottles"	"That[']s a tricky one. You have to aim at just the right bottle. Throw the baseball at bottle 5."
"high/striker/strongman" or "high striker" or "strong man"	"Another rigged game. The mallet isn[']t heavy enough to strike the bell. Find something heavier."
"fuse/fuses/aqua/crimson/emerald/gray/indigo/khaki/magenta/orange/quartz" or "aqua fuse " or "crimson fuse" or "emerald fuse" or "gray fuse" or "indigo fuse" or "khaki fuse" or "magenta fuse" or "orange fuse" or "quartz fuse" 	"Funny thing about that. The fuses that belong in the electrical panels in the electrical area of backstage seem to be missing. Finding them might help with disabling [story title]."
"fire"	"The very real fire in the Stakes Room in [story title] was a scary event. I couldn[']t put it out with a fire extinguisher. We had to wait for the fire department and by then there was a lot of damage done."
"accidents/mishaps"	"The fire, the Ferris wheel, the Bumper Cars... That[']s a lot of suspicious accidents."
"rides/attractions"	"Almost every ride is falling apart. I do what I can to keep things in good repair but it[']s a lot of work."
"games"	"Crooked! Everyone of them. There[']s a secret to each one of them."

Section 15 - Table of Owner Conversation Responses

Table of Owner Conversation Responses
topic	response (text)
"hell/ride" or "hell ride"	"[story title] is the premier attraction here at  Whidbey Amusements. It[']s both spooky and fun! The visitors love it! The fire last month was unfortunate and expensive."
"invoices/receipts/paperwork"	"[The noun] says, 'I know this doesn[']t look good but the cost of consumables go up every week and attendance is down. I have to pinch pennies somehow, don[']t I? And that fire was very expensive to repair.'"
"insurance/policy" or "insurance policy"	"An insurance policy? Of course, all reputable business have insurance. Even small time carnivals."
"carnival"	"'The Whidbey family has owned this carnival since the 1950[']s', [the noun] says. Unfortunately, I am an only child and never married. Alas, the carnival will close when I am gone. But for now, it[']s making a comeback!"
"ferris/wheel" or "ferris wheel"	"The Ferris Wheel is my favorite ride. It[']s always relaxing and romantic."
"bumper/car/cars" or "bumper cars" or "bumper car"	"How fun! What could be better than crashing into your friends and family?"
"fortune/teller/esmeralda/esmerelda" or "fortune teller"	"I see her regularly to have my fortune told. We[']re lucky to have her here. She[']s very beautiful. It[']s a wonder she[']s never been married."
"carousel"	"'The carousel is just one of the many rides that thrill and delight our visitors every day,' says [the noun]"
"dime/toss/plate" or "dime toss"	"'The Dime Toss is is one of the many games that thrill and delight our visitors every day!' says [the noun]."
"pitchers/mound/milk/bottles" or "pitchers mound" or "milk bottles"	"'The Pitchers Mound is is one of the many games that thrill and delight our visitors every day!' says [the noun]."
"high/striker/strongman" or "high striker" or "strong man"	"'The High Striker is is one of the many games that thrill and delight our visitors every day!' says [the noun]."
"fuse/fuses/aqua/crimson/emerald/gray/indigo/khaki/magenta/orange/quartz" or "aqua fuse " or "crimson fuse" or "emerald fuse" or "gray fuse" or "indigo fuse" or "khaki fuse" or "magenta fuse" or "orange fuse" or "quartz fuse" 	"'I know nothing about fuses', [the noun] says."
"fire"	"The fire was most unfortunate. It put [story title] out of commission for two weeks. Not only did it cost me $22,500 to repair but I lost revenue while it was closed."
"accidents/mishaps"	"Oh, that[']s nothing to worry about. Little things happen all the time, right?"

Section 16 - Table of Janitor Movements

Table of Janitor Movements
mins (number)	destination (object)	
5	TB-room
10	BC-room
15	TB-room
20	CR-room
25	TB-room
30	HS-room
35	FW-room
40	HS-room
45	TB-room
50	CS-room
55	TB-room
0	Head of the Line

Section 17 - Table of Owner Movements

Table of Owner Movements
mins (number)	destination (object)	
3	Carnival Office
8	CS-room
13	TB-room
18	Head of the Line
23	Ride Entrance
28	Dark Passage
33	Maintenance Office
38	Stocks Room
43	Gallows Room
48	Stake Room
53	Dungeon
58	Guillotine Room

Section 18 - Introduction to Hell Ride

When play begins:
	choose row 1 in Table of Help Options;
	now description entry is "Hell Ride - A ride to remember...

Date night with your sweetie: dinner at your favorite restaurant and a night at the carnival. 

After a lovely meal, you get into a big fight over the tip. Your date storms off, ruining your chances of that romantic evening you had hoped for. You decide to stay and enjoy the carnival anyway.

As you explore the carnival, you learn (the hard way) that the Hell Ride attraction is malfunctioning with the potential for serious injuries to the riders. You must disable the ride and prevent any loss of life... including your own."

Section 19 - Hell Ride Origins

When play begins:
	 choose row 2 in Table of Help Options;
	 now description entry is "Hell Ride - A ride to remember...

In the early 1980[']s, I had an Apple [close bracket][bracket]  Plus computer with 64K of RAM, dual 5.25[quotation mark] floppy disks, and a color monitor as big as a television. And the very first game I ever bought was Infocom[']s Zork I: The Great Underground Empire. This was cool. It was all text-based. The game described your surroundings and you interacted with commands that say what you wanted to do. This 'Interactive Fiction' really evoked in a game what I appreciated most about reading: rich descriptions, colorful characters, and the like. After Zork I, there was Zork II and III. Enchanter, Moonmist, Suspect, and so many 
more. I played them all with my best friend Andy.

Andy and I were software developers at the time and we thought, 'We can do this!' So we set out to do this. We developed a game engine with a natural language parser. And it was pretty good. We could support most of the kinds of things they did, certainly less graceful but pretty good. In fact, our parser was better than Infocom[']s in one case where the sentence was ambiguous. e.g. 'Walk into the room with the lamp.' Is the player carrying the lamp? Or is the lamp in the room? 

For fun, we reverse engineered parts of Infocom[']s game format. We found the dictionary, certain text tokens used for text substitution, the game text. We also discovered the first example of compression I had ever seen and it just about made my head explode. They stored all ASCII characters in five bits! Pow! Mind blown. I had never considered anything like that. Just another hook.

We developed two prototypes: Diner and Hell Ride. Diner was about bank robbers coming into the diner where you are a short order cook and you have to save the day. Hell Ride was pretty close to what you find here. I decided to implement it using modern tools. It[']s pretty good. Maybe.

I hope you enjoy it.

d.[line break]
(dmontgom22@gmail.com)"

Section 20 - Credits

Crediting is an action applying to nothing. Understand "Credits" as crediting.
instead of crediting:
	say "[story title], Copyright 2025, Dana Montgomery.[paragraph break]";
	say "Extensions used in [story title]:[line break]";
	say "[complete list of extension credits][line break]";
	say "Additional Credits:[line break]";
	say "Caitlyn Caluya-Bilbrick for their editing and proofreading super powers.[line break]";
	say "The amazing Inform community over at https://IntFiction.org[paragraph break]";
	say "The following awesome individuals for their beta testing, excellent feedback, and ideas:[line break]";
	say "John Montgomery[line break]";
	say "Andy Broding[line break]";
	say "Joey Acrimonious[line break]";
	say "RJ Kowalski[line break]";
	say "Drew Cook[line break]".
	
Part 5 - Unit Tests

Chapter 1 - Parking Lot

Test Parking with "brief / get blueberries / eat blueberries / give coupon to operator / buy ticket / ask attendant about the ticket stub/ tell attendant about stub / show the stub to the attendant / talk to attendant / l at attendant  / kiss attendant / smell attendant / listen to attendant / touch attendant / taste attendant / screw attendant / darn / damn / get in car / look / l at seat / l under seat / get all dimes / get keys / open glove box / get string / get gloves / wear gloves / set stub on the dashboard / l at the dashboard / get air freshener / look at it / put keys in ignition / turn keys / exit".

Test ToadAway with "brief / test parking / get parking stub / test games"

Chapter 2 - Games

Test g1 with "brief / s / w / give dime to barker / w /  z / z / z / z / z / z / get lamp / turn it on / wear veil / e / e / n"

Test g2 with "s / e / buy mallet / hit lever with mallet / g / g / g / g / w / n".

Test g3 with "s / e  / ne / l at booth / l under booth / flip dime on plate / toss dime on plate / get mercury dime / toss mercury dime on plate / 4 /  sw / se / give dime to attendant / throw baseball at bottle 1 / throw ball at bottle 4 / throw baseball at bottle 5 / 1 / nw / w"

Test g4 with "buy tickets / s / give ticket to attendant / s / e / l under junk / get flashlight / turn it on / s / s / s / open toolbox / get wrench / get sledgehammer / n / n / n / w / n / n / e / hit bullseye with sledgehammer / 2 / w / n"

Test Games with "Test g1 / test g2 / test g3 / test g4".

Chapter 3 - Attractions

Test a1 with "s / buy all tickets / e / e / e / l at two dollar bill / get two dollar bill / give ticket to Ferris wheel operator / w / give flashlight to janitor / w "

Test a2 with "ne / give ticket to carousel operator / sw / se / give ticket to esmeralda / z / z / z / z / nw / nw / give ticket / give wrench to attendant / se / n"

Test Attractions with "test a1 / test a2"

Chapter 4 - Back Stage

[get the key]
Test b1 with "brief / s / steal brass ring / steal brass ring / steal brass ring / s /  s / e / s / turn on radio / u / w / flip switch / push switch / push switch / e / d / l at desk / open drawer / s / s / s / chew bubblegum / tie bubblegum to string / put bubblegum in grate / s / s / ne / drop mallet / get silver key / l at panel / open panel / l at socket / sw / n / n / n / n / n / i"

[get the fuses]
Test b2 with "w / e / s / w / e / s / w / l in pyre / get fuse / e / s / w / e / s / w /  e / s / s / w / l in stand / buy aqua fuse / e / n"

[fill the sockets]
Test b3 with "ne / open panel / put aqua fuse in socket / flip switch / sw / e / open panel / put crimson fuse in socket / flip switch / w / se / open panel / put emerald fuse in socket / toggle switch / nw / sw / open panel / put gray fuse in socket / toggle switch / ne / w / open panel / put indigo fuse in socket / push switch / e / nw / l at panel / unlock panel with knife / l at panel / open  panel / l at panel / l at switch. / l at indicator / l at socket / put khaki fuse in socket / push switch / l at socket / se"

[turn the dials]
test b4 with "n / n / n / n / n / climb ladder / w / l at control panel 1 / turn aqua dial to 1 / turn crimson dial to three / turn emerald dial to 5 / turn gray dial to seven / turn indigo dial to 9 / turn khaki dial to eleven / push aqua button / l at control panel 1 / push crimson button / l at control panel  3 / push emerald button / l at control panel 5 / push gray button / l at control panel 11 / push khaki button"

Test Backstage with "test b1 / test b2 / test b3 / test b4"

Chapter 5 - Concession Stand

Test Concession with "brief / s / steal brass ring / s / steal brass key / n / sw / l at treats / read menu / buy cola / buy popcorn / buy candy apple / buy cotton candy / buy pretzel / buy bubblegum / drink soda / g / g / g / g / w / open trash can / get khaki fuse / e / s / x photo / x safe / turn dial to 3 / turn dial to 22 / turn dial to 62 / open safe / get indigo fuse / n / ne / n / i / score / ".

Chapter 6 - Hell Ride

Test Ride with "brief / s / buy hell ride ticket / s / give hell ride ticket to operator / s / enter hell ride car / wait / z / z / z / z / z".

Chapter 7 - Electrocution

Test Electrocution with "s / steal brass ring / steal brass ring / steal brass ring / steal brass ring / e / steal brass ring / steal brass ring / steal brass ring / w / buy hell ride ticket / s / give hell ride ticket / s / e / l under junk / get flashlight / turn it on / s / u / w / remove gloves / switch the big switch off"

Chapter 8 - Grues

Test Grues with "s / buy hell ride ticket / s / give hell ride ticket to ride operator / s / e / s / s / s"

Chapter 9 - Miscellaneous

Test Misc with "brief / xyzzy / plugh / hello sailor / please get the dime / i / score / bite fingernails / clip fingernails".

Part 6 - Hints

Chapter 1 - Hint Values and Code

A permission is a kind of value. The permissions are allowed and denied.
Hint usage is a permission that varies. Hint usage is allowed.

Check asking for help for the first time:
	say "Sometimes the temptation to rely on hints becomes overwhelming, and you may prefer to turn off hints now. If you do so, your further requests for guidance will be denied. Turn off hints? >";
	if player consents:
		now hint usage is denied;
		say "[line break]Truly, a real adventurer does not need hints." instead.
		
Check asking for help:
	if hint usage is denied, say "You have chosen to forego hints in this game. Be strong! Persevere!" instead.
	
when play begins:
	 now mn_master_table is the Table of Help Options.
	
[build points awarded text]
when play begins:
	let T be "[fixed letter spacing]Note that not all of these points are awarded. Some are mutually exclusive of others.[paragraph break]";
	repeat through Table of Scored Circumstances:
		let T be "[T][point value entry] - [description entry][line break]";
	choose row 12 from Table of Help Options;
	now the description entry is T.

[images]	
This is the image presentation status rule:
	if show images is true, now show images is false;
	otherwise now show images is true.

[transcript]
transcript mode is a truth state that varies. transcript mode is usually false.	
This is the switch transcript status rule:
	if transcript mode is true:
		try switching the story transcript off;
		now transcript mode is false;
	otherwise:
		try switching the story transcript on;
		now transcript mode is true.

Table of Setting Options (continued)
title (text)	toggle(rule)
"Image presentation is currently [if show images is true]ON[otherwise]OFF[end if]"	image presentation status rule
"Transcript is currently [if transcript mode is true]ON[otherwise]OFF[end if]"	switch transcript status rule

Chapter 2 - Help Options

Table of Help Options
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Introduction to Hell Ride"	--	""
"Hell Ride Origins"	--	""
"Introduction to Interactive Fiction"	Table of Instruction Options	--
"The Parking Lot"	Table of Parking Lot Hints	--
"The Attractions"	Table of Attractions Hints	--
"The Games"	Table of Games Hints	--
"Back Stage"	Table of Back Stage Hints	--
"Hell Ride"	Table of Hell Ride Hints	--
"The Electrical Area"	Table of Electrical Area Hints	--
"Where are the fuses?"	Table of Fuse Hints	--
"The Control Room"	Table of Control Room Hints	--
"How Points Are Awarded (Spoilers)"	--	""
"Settings"	Table of Setting Options	--	
"Credits"	--	"[story title], Copyright 2025, Dana Montgomery.[paragraph break]Extensions used in [story title]:[line break][complete list of extension credits][line break]Additional Credits:[line break]Caitlyn Caluya-Bilbrick for their editing and proofreading super powers.[line break]The amazing Inform community over at https://IntFiction.org.[paragraph break]The following awesome individuals for their beta testing, excellent feedback, and ideas:[line break]John Montgomery[line break]Andy Broding[line break]Joey Acrimonious[line break]RJ Kowalski[line break]Drew Cook[line break]".

Chapter 3 - The Parking Lot

Table of Parking Lot Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"What about the glove box?"	table of hinting	"It[']s locked."	
"hint"	--	"Have you tried unlocking it?"	
"hint"	--	"You need a key."	
"hint"	--	"Look under the car seat."
"Why can[']t I leave the parking lot?"	table of hinting	"Looks like you need something before heading into the carnival."
"hint"	--	"Looks like you need a parking ticket."
"hint"	--	"The parking attendant has a parking ticket."		
"hint"	--	"Buy the parking ticket."
"What do I do with the string?"	table of hinting    	"Remember that you know how to macrame."  
"hint"	--	"Isn[']t macrame the art of tying?"
"hint"	--	"You could tie something to it."  	
"hint"	--	"It looks long enough to reach the fuse in the grate."
"hint"	--	"Whatever you tied to it wouldn[']t fall into the grate."
"Why does my car get towed?"	table of hinting	"Why might your car get towed?"
"hint"	--	"Is your car parked legally?"	
"hint"	--	"Are you sure?"	
"hint"	--	"What about the parking stub"	
"hint"	--	"The parking attendant knows something about the stub"	
"hint"	--	"Put the parking stub on the dashboard."

Chapter 4 - The Attractions

Table of Attractions Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Can I ride the rides?"	table of hinting	"You[']ll need a ticket."	
"hint"	--	"Tickets are expensive though."
"hint"	--	"You can buy tickets at the Ticket Kiosk."
"Why are tickets so expensive?"	table of hinting		"What? You were expecting wrist bands?"
"hint"	--	"To remind you to spend your money wisely."
"The rides are boring."	table of hinting	"Surely not ALL the rides are boring."	
"hint"	--	"It[']s a small carnival, what do you expect?"
"hint"	--	"Have you ridden Hell Ride?"

Chapter 5 - The Games 

Table of Games Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Are the prizes important?"	table of hinting	"Important? That[']s a matter of opinion."
"hint"	--	"A teddy bear to make up with your sweetie?"
"hint"	--	"I[']d go with my instincts on this one if I were you."
"hint"	--	"Yes, the prizes are important."
"Why do the games only cost a dime?"	table of hinting	"What? You want them to cost a quarter?"
"hint"	--	"The carnival likes to maintain a link to days past when games cost only a dime?"
"hint"	--	"Just be grateful they don[']t cost more."
"I[']ve found a Mercury dime. What is it?"	table of hinting	"It[']s a dime."
"hint"	--	"It[']s a Mercury Dime."
"hint"	--	"Have you looked at it?"
"hint"	--	"It has a weight of 2.50 grams."
"The High Striker Game"	table of hinting	"Do you have what it takes? Are you a man or are you a mouse?"
"hint"	--	"You have to be pretty strong to ring the bell."
"hint"	--	"You swing with all your might and still can[']t ring the bell."
"hint"	--	"Maybe the mallet isn[']t heavy enough."
"hint"	--	"There[']s a sledgehammer in the Mechanical Room North."
"The Dime Toss Game"	table of hinting	"How hard can it be?"
"hint"	--	"The dimes keep skidding off the plate."
"hint"	--	"A modern dime weighs 2.268 grams."
"hint"	--	"A Mercury dime weighs 2.500 grams."
"hint"	--	"Toss the Mercury dime. It[']s heavier."
"The Pitcher[']s Mound"	table of hinting	"You have to choose which bottle to aim at."
"hint"	--	"The bottles are weighted in such a way as to make you lose."
"hint"	--	"You have to throw the baseball at the right bottle."
"hint"	--	"Throw the baseball at bottle 5."

Chapter 6 - Back Stage 

Table of Back Stage Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Why do I get eaten by a grue?"	table of hinting	"Grues love the dark."
"hint"	--	"Do you have a light?"
"hint"	--	"Have you looked for one?"
"hint"	--	"There are two in the game."
"hint"	--	"One is in the Dark Passage."
"hint"	--	"The other is in the Little Egypt tent."
"Are the doors important?"	table of hinting	"Only if you want to know what[']s on the other side."
"hint"	--	"Have you tried checking what[']s on the other side?"
"hint"	--	"You[']ll need a key"
"hint"	--	"You have to find it"
"hint"	--	"It[']s in Electrical Closet One"

Chapter 7 - Hell Ride Hints

Table of Hell Ride Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Why do I die?"	table of hinting	"Everybody dies."
"hint"	--	"So, you[']ve ridden Hell Ride, huh?"
"hint"	--	"Aren[']t the animatronics and wax figures amazing?"
"hint"	--	"Did you notice the guillotine rising and falling?"
"hint"	--	"Did you notice it chop you in half?"
"hint"	--	"You have to disable [story title]"
"What about the different rooms"	table of hinting	"Everything sure looks realistic."	
"hint"	--	"Aren[']t the animatronics and wax figures amazing?"
"hint"	--	"Each room shows a different manner of punishment."
"hint"	--	"There[']s the Stocks, the Gallows, the Stake, the Dungeon, and the Guillotine."
"hint"	--	"Just your typical ride in the dark."

Chapter 8 - The Electrical Area Hints

Table of Electrical Area Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"What[']s going on in the Electrical Room?"	table of hinting	"There are exits in all directions"	
"hint"	--	"Can you go in the direction you intend?"
"hint"	--	"The room is electromagnetic."
"hint"	--	"Maybe that[']s causing the problem."
"hint"	--	"You end up in a random room every time you try to move."
"hint"	--	"Maybe you can make it so it[']s not electromagnetic."
"hint"	--	"Turn off the big switch in the Control Room."
"What about the electrical panels?"	table of hinting	"There[']s a socket, a switch, and an indicator in each one."
"hint"	--	"You could probably put something in the socket."
"hint"	--	"Looks like a fuse will fit in the socket."
"hint"	--	"I[']d put a fuse in the socket and flip the switch."
"Are the fuses important?"	table of hinting	"Yes."	
"hint"	--	"They come in pretty colors."
"hint"	--	"Have you seen those colors anywhere else?"
"hint"	--	"Have you put a fuse in a socket?"

Chapter 9 - Fuse Hints

Table of Fuse Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Where[']s the Aqua fuse?"	table of hinting	"It[']s in the Hell Ride Exit."
"hint"	--	"It[']s in the merchandise stand."
"hint"	--	"Buy the Aqua fuse."
"Where[']s the Crimson fuse?"	table of hinting	"It[']s a prize at the Pitcher[']s Mound."
"Where[']s the Emerald fuse?"	table of hinting	"It[']s in the Mechanical Room South."
"hint"	--	"It[']s in the grate."
"hint"	--	"Is there anyway to extend your reach?"
"hint"	--	"The string looks long enough."
"hint"	--	"Have you tied anything to the string?"
"hint"	--	"Maybe the fuse would stick to the bubblegum or the horseshoe magnet."
"hint"	--	"Chew the bubblegum first."
"hint"	--	"Put the bubblegum (or the horseshoe magnet) in the grate."
"Where[']s the Gray fuse?"	table of hinting	"It[']s in the Bumper Cars attraction."
"hint"	--	"The attendant has it."
"hint"	--	"Bring him a wrench and he[']ll give you the fuse."
"Where[']s the Indigo fuse?"	table of hinting	"It[']s locked up tight."
"hint"	--	"It[']s in the Carnival Office."
"hint"	--	"It[']s in the safe."
"Where[']s the Khaki fuse?"	table of hinting	"In a secret location."
"hint"	--	"Have you ridden the Ferris Wheel?"
"hint"	--	"Can you see anything from the top of the Ferris Wheel?"
"hint"	--	"It[']s behind the Concession Stand to the west."
"hint"	--	"Look in the trash can."
"Where[']s the Magenta fuse?"	table of hinting	"It[']s a prize at the High Striker game."
"Where[']s the Orange fuse?"	table of hinting	"It[']s a prize at the Dime Toss game."
"Where[']s the Quartz fuse?"	table of hinting	"It[']s in the Stake Room."
"hint"	--	"It's in the pyre."

Chapter 10 - The Control Room Hints

Table of Control Room Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Tell me about the big switch."	table of hinting	"It[']s big"	
"hint"	--	"Very big"
"hint"	--	"It[']s in the Control Room."
"hint"	--	"Did you read the label?"
"hint"	--	"Have you tried turning the big switch off?"
"hint"	--	"Did you die because your hands were unprotected?"
"hint"	--	"Try wearing the gloves."
"What about the control panels?"	table of hinting	"There[']s a dial, a button, and a light in each one."
"hint"	--	"These are pretty colors."
"hint"	--	"Have you seen these colors anywhere else?"
"hint"	--	"Try spinning the dials."
"hint"	--	"Spin the dials to the right number."
"hint"	--	"Is there a number that corresponds to each color?"
"hint"	--	"Aqua = A = 1, Crimson = C = 3, etc."
"hint"	--	"Push the indigo button."
