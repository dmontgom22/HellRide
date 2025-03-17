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
The maximum score is 200.
Use American Dialect.
Use serial comma.
The block giving rule is not listed in the check giving it to rules.

Chapter 2 - Library Card Settings

The story title is "Hell Ride".
The story author is "No Shoes".
The story headline is "The ride of a lifetime...".
The story genre is "Horror".
The story description is "[story title] - A ride to remember...

You[']re a part-time reporter for The Tribune, the local newspaper. Earlier in the day, your editor called you and told you of a conversation he overheard between the Chief of Police and his Deputy about Whidbey Amusements. It seems there has been a rash of accidents and mishaps at the carnival. Sounds like there could be something suspicious going on. The editor wants you to collect evidence and write a hard hitting piece about this story. If you do a good job, maybe the paper will hire you on full-time.

As you explore the carnival, you learn (the hard way) that the Hell Ride attraction is malfunctioning with the potential for serious injuries to the riders. You must disable the ride off and prevent any loss of life... including your own."
The story creation year is 2025.
The release number is 203.
	
Chapter 3 - Extensions

Include Modified Exit by Emily Short.

Include Locksmith by Emily Short.

Include Basic Help Menu by Wade Clarke.

Include Menus by Wade Clarke.

Include Story Mode by Drew Cook. 

Chapter 4 - The Player, Global Code

The player is in the PL-room. 
The carrying capacity of the player is 20.
The description of the player is "You are determined to investigate this story, collect evidence, and give that evidence to the authorities." 

hair is a thing. the hair is part of the player. the description is "Your hair is clean, well styled, and smells nice.".

some fingernails are a thing. the fingernails are part of the player. the description is "You[']ve been biting your nails. Too bad you can[']t trim them neatly.". The fingernails are plural-named.

The coupon is in the wallet. The description of the coupon is "You found this in a stack of coupons on the counter of the gas station."

The notebook is carried by the player. Understand "book" as the notebook. The description is "This is the notebook you use when investigating a story."

before examining the coupon:
	if show images is true, display Figure of Coupon.

The fanny pack is a player's holdall. The fanny pack is wearable. The player is wearing the fanny pack. The description of the fanny pack is "This stylish fanny pack looks like it can hold quite a bit.".

after reading a command:
	if the player's command includes "please":
		say "Please do not say 'please.'";
		reject the player's command.

after reading a command:
	if the player's command matches "load", try restoring the game instead.
	
[printing]
to say b: say "[bold type]".
to say r: say "[roman type]".
to say i: say "[italic type]".
	
[time]
when play begins:
	now the left hand status line is "Score: [score] / Turns: [turn count] / [the player's surroundings]";
	now the right hand status line is "Time: [time of day]".
	
The time of day is 7:53 PM.

[global variables]
ferris wheel ridden is a truth state that varies. ferris wheel ridden is false. 
hell ride disabled is a truth state that varies. hell ride disabled is false.
total evidence is a number that varies. total evidence is 0.
total accusation is a number that varies. total accusation is 0.
janitor walking is a truth state that varies. janitor walking is true.
whidbey walking is a truth state that varies. whidbey walking is true.

Understand "who" or "what" or "when" or "where" or "why" or "how" or "who's" or "what's" or "when's" or "where's" or "why's" or "how's" as "[query]".

Understand "[query] [text]" as a mistake ("[story title] understands commands, such as '[command prompt]examine [an random thing that can be seen by the player]', but not questions. For more instructions, type [bold type]'HELP'[roman type].").

evidence message is a truth state that varies. evidence message is false.
every turn when total evidence is greater than 0 and evidence message is false:
	now evidence message is true;
	say "You[']ve discovered some evidence. To see a list and weighting of the evidence you[']ve collected, type [bold type]'SHOW EVIDENCE'[roman type]. To collect more evidence, try to [bold type]ASK someone ABOUT something[roman type]. Or [bold type]SHOW something TO someone[roman type].".
	
[things that shouldn't be given away]
instead of giving something to the parking attendant when the noun is not the coupon, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the Hell Ride attendant when the noun is not the hell ride ticket, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the cashier, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the concession attendant, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the Carousel attendant when the noun is not the Carousel ticket, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the Bumper Cars attendant when the noun is not the Bumper Cars ticket and the noun is not the adjustable wrench, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the Ferris Wheel attendant when the noun is not the Ferris Wheel ticket, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the High Striker attendant, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the Pitchers Mound attendant when the noun is not a dime, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the Dime Toss attendant when the noun is not a dime, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the merchandise attendant, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the barker when the noun is not a dime, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to the janitor, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to Esmeralda when the noun is not the Fortune Teller ticket, say "[The second noun] doesn[']t seem interested in [the noun].".
instead of giving something to Mr Whidbey, say "[The second noun] doesn[']t seem interested in [the noun].".
	
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

Understand "offer [price] to [someone]" as a mistake ("Try [bold type]PAY FOR something[roman type] or [bold type]BUY something[roman type] instead.").
Understand "pay [someone]" as a mistake ("Try [bold type]PAY FOR something[roman type] or [bold type]BUY something[roman type] instead.").
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

every turn:
	if turn count is 100:
		say "Over the loudspeaker, an announcement blares: Attention please. There is a vehicle being towed from the parking lot for parking illegally. The license plate of the car is '[if the parking stub is on the dashboard]862901[otherwise]475319[end if]'.[run paragraph on]";
		if the parking stub is on the dashboard:
			say " You breathe a sigh of relief as you realize that[']s not your license plate. I guess it[']s a good thing you remembered to place the parking stub on the dashboard.";
		if the parking stub is not on the dashboard:
			say " Your heart sinks as you realize that is your license plate. You race to the parking lot in time to see the tow truck pull away with your car behind it";
			end the story saying "You start the long walk home.".

Section 7 - Grues

The lurking grue is a backdrop. The lurking grue is everywhere. The description of the lurking grue is "The grue is a sinister, lurking presence in the dark places of the earth. Its favorite diet is humans, but its insatiable appetite is tempered by its fear of light. No grue has ever been seen by the light of day, and few have survived its fearsome jaws to tell the tale."

Rule for printing the description of a dark room: say "It is pitch black.  You are likely to be eaten by a grue." instead. 
Rule for printing a refusal to act in the dark: say "It is too dark in here to see." instead.

The dark terminus count is a number that varies.	
every turn when in darkness:
	increment the dark terminus count;
	if the dark terminus count is 3:
		say "Oh no! You walked directly into the slavering fangs of a lurking grue!";
		end the story saying "You have died!".
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

An attendant is a kind of male person. Understand "attendent/operator/cashier/teen/kid/teenager/employee/bored" as an attendant.  The description of an attendant is "This is a bored teenager."

Understand the command "tell" as something new.
Understand "talk to [someone] about [text]" as telling it about.
Understand "tell [someone] about [text]" as telling it about.

instead of asking an attendant about a topic listed in the Table of Attendant Conversation Responses:
	say "[response entry][paragraph break]";
	if the turn stamp entry is -1 and the subject entry is not "NA":
		now the turn stamp entry is the turn count;
		let S be the subject entry;
		let W be the weighting entry;
		choose a row with a category of S in Table of Notebook;
		now total entry is total entry plus W;
		now total evidence is total evidence plus W.

instead of telling an attendant about something: try asking the noun about it.

Understand "talk to [someone]" as a mistake ("To start a conversation, try to [bold type]ASK [the noun] ABOUT something[roman type] or [bold type]TELL [the noun] ABOUT something[roman type].").

Persuasion rule for asking an attendant to try going:
	say "[The actor] says, 'I can[']t leave my post or I[']ll get fired!'";
	persuasion fails.
	
instead of examining an attendant:
	choose a random row in Table of Bored Responses;
	Let R be response entry;
	say "This is another bored teenager. [R][line break]" instead;
	
instead of smelling an attendant, say "You get close to [the noun]. They smell like angst and regret.".

instead of listening to an attendant, say "All you can hear is [the noun] whining about working at the carnival.".

instead of touching an attendant, say "Touching [the noun] without consent is likely to get you punched in the face! Better not.".

Section 11 - The Janitor

the janitor is an a male person. the janitor is in the Head of the Line. The description of the janitor is "The janitor is a portly gentleman wearing dirty overalls, leaning on a broom.[if the janitor is wearing the brass ring] The janitor is wearing a brass ring with a key on it.[end if][if the janitor does not carry the flashlight] He complains that he[']s missing his flashlight.[end if][if the janitor does not carry the pliers] 'My pliers are missing too!' he says.[end if]". the janitor can be active or passive. the janitor is active.

[the janitor walks]
every turn when the janitor is active and janitor walking is true:
	let M be the minutes part of the time of day;
	if the remainder after dividing M by 5 is 0 :
		if there is a mins of M in the Table of Janitor Movements:
			choose a row with a mins of M in Table of Janitor Movements;
			let last space be the location of the janitor;
			if the janitor can be seen by the player, say "The janitor heads to [the destination entry].";
			move the janitor to the destination entry;
			if the janitor can be seen by the player, say "The janitor arrives from [the last space].";
			
every turn when the janitor is passive:
	now the janitor is active.

Before doing something to the janitor:
	now the janitor is passive;
	say "[one of]The janitor looks at you and waits for you to proceed.[or]The janitor looks at you expectantly.[or]The janitor looks bored as he waits for you to speak.[at random]"

instead of asking the janitor about a topic listed in the Table of Janitor Conversation Responses:
	say "[response entry][paragraph break]";
	if the turn stamp entry is -1 and the subject entry is not "NA":
		now the turn stamp entry is the turn count;
		let S be the subject entry;
		let W be the weighting entry;
		choose a row with a category of S in Table of Notebook;
		now total entry is total entry plus W;
		now total evidence is total evidence plus W.
		
instead of showing something to the janitor:
	if there is an object of the noun in the Table of Janitor Object Responses:
		choose a row with an object of noun in the Table of Janitor Object Responses;	
		say "[response entry][paragraph break]";
		let S be the subject entry;
		let W be the weighting entry;
		if the turn stamp entry is -1 and S is not "NA":
			now the turn stamp entry is the turn count;
			choose a row with an category of S in Table of Notebook;
			now total entry is total entry plus W;
			now total evidence is total evidence plus W.
		
instead of telling the janitor about something: try asking the noun about it.

instead of giving the flashlight to the janitor:
	say "Hey! Thanks, I really appreciate it. I[']ve been lost without my flashlight.";
	now the flashlight is carried by the janitor.
	
instead of giving the pliers to the janitor:
	say "Hey! Thanks, These have been missing from my tool box. Where did you find them?";
	now the pliers are carried by the janitor.
	
The brass ring is a keychain. understand "chain/keychain" as the brass ring. The description is "A ring to hold keys." The brass key is a passkey. The brass key unlocks the sturdy door and the metal door. the brass key is on the brass ring. the description of the brass key is "This is a shiny brass key. It must be important if the janitor has it.". The brass ring is worn by the janitor. 

Section 12 - Mr Whidbey

Mr Whidbey is a male person. Mr Whidbey is in the Carnival Office. understand "mr/mister/Whidbey/owner" and "carnival owner" as Mr Whidbey. The description of Mr Whidbey is "The owner of the carnival, Mr. Whidbey, is dressed in a black tuxedo with a red and white striped vest. He is sporting a snazzy top hat.". Mr Whidbey can be active or passive. Mr Whidbey is active.

[Whidbey walks]
every turn when Mr Whidbey is active and whidbey walking is true:
	let M be the minutes part of the time of day;
	if hell ride disabled is false:
		if there is a mins of M in the Table of Whidbey Movements and Telephone Call Autoplay is not happening:
			choose a row with a mins of M in Table of Whidbey Movements;
			let last space be the location of Mr Whidbey;
			if Mr Whidbey can be seen by the player, say "Mr Whidbey heads to [the destination entry].";
			move Mr Whidbey to the destination entry;
			if Mr Whidbey can be seen by the player, say "Mr Whidbey arrives from [the last space].";
		
every turn when Mr Whidbey is passive:
	now Mr Whidbey is active.

Before doing something to Mr Whidbey:
	now Mr Whidbey is passive;
	say "[one of]Mr Whidbey looks at you expectantly.[or]Mr Whidbey waits for you to speak.[or]Mr Whidbey nervously shifts his weight from one foot to the other.[at random]".
			
WhidbeyQuestions is a number which varies. WhidbeyQuestions is 0.
instead of asking Mr Whidbey about a topic listed in the Table of Whidbey Conversation Responses:
	say "[response entry][paragraph break]";
	if  remainder after dividing WhidbeyQuestions by 4 is 0:
		say "[one of]Mr. Whidbey[']s eyes dart up and to the left.[or]Mr. Whidbey quickly changes the subject[or]Mr. Whidbey meets your eyes and quickly looks away.[cycling][line break]";
	let S be the subject entry;
	let W be the weighting entry;
	if the turn stamp entry is -1 and S is not "NA":
		now the turn stamp entry is the turn count;
		choose a row with a category of S in Table of Notebook;
		now total entry is total entry plus W;
		now total evidence is total evidence plus W;
	increment WhidbeyQuestions;
		
instead of showing something to Mr Whidbey:
	if there is an object of the noun in the Table of Whidbey Object Responses:
		choose a row with an object of noun in the Table of Whidbey Object Responses;	
		say "[response entry][paragraph break]";
		if  remainder after dividing WhidbeyQuestions by 4 is 0:
			say "[one of]Mr. Whidbey[']s eyes dart up and to the left.[or]Mr. Whidbey quickly changes the subject[or]Mr. Whidbey meets your eyes and quickly looks away.[cycling][line break]";
		let S be the subject entry;
		let W be the weighting entry;
		if the turn stamp entry is -1 and S is not "NA":
			now the turn stamp entry is the turn count;
			choose a row with an category of S in Table of Notebook;
			now total entry is total entry plus W;
			now total evidence is total evidence plus W;
		increment WhidbeyQuestions;
		
instead of telling Mr Whidbey about something: try asking the noun about it.

confronting it about is an action applying to one thing and one topic. 
understand "confront [someone] about/with [text]" as confronting it about. 
understand "accuse [someone] of/with [text]" as confronting it about.

confession is a truth state that varies. confession is false.
instead of confronting Mr Whidbey about a topic listed in the Table of Confrontation:
	if total evidence is less than 31:
		say "[The noun] says. 'You don[']t have enough evidence to confront anyone about anything.'";
	if total evidence is less than 76:
		say "'Any evidence you have is circumstantial. It[']ll be thrown out on day one of the trial!', says [the noun]";
	otherwise if hell ride disabled is false:
		say "As much as you would like to confront [the noun] about [the topic understood] you should probably take care of disabling [story title] first.";
	otherwise:
		say "[response entry][paragraph break]";
		if the turn stamp entry is -1:
			now total accusation is total accusation plus the accusation weight entry;
			now the turn stamp entry is the turn count;
			now confession is true.
			
every turn when confession is true:
	say "The Chief of Police pays particular attention to Mr. Whidbey[']s confession. He approaches Whidbey and says 'You have the right to remain silent. Anything you say will be used against you in a court of law. You have the right to an attorney during interrogation; if you cannot afford an attorney, one will be appointed to you.'

He handcuffs Whidbey, thanks you for your service to the community, and leads Mr Whidbey away to jail.";
	end the story saying "You have won!" .
			
instead of confronting somebody about something, say "There[']s no need to confront [the noun] about [the topic understood].".

Section 13 - Evidence and Accusations

instead of examining the notebook:
	if total evidence is greater than 0:
		sort the Table of Notebook in reverse total order;
		say "[fixed letter spacing]  Weight   Evidence collected:[line break]";
		say "  ------   --------------------------------------------------------[line break]";
		repeat through the Table of Notebook:
			if total entry is greater than 0:
				say "[fixed letter spacing]•   [if total entry is less than 10]  [otherwise if total entry is less than 100] [end if][total entry]    [response entry][roman type][line break]";
		say "[fixed letter spacing]  ------   --------------------------------------------------------[line break]";
		say "•   [if total evidence is less than 10]  [otherwise if total evidence is less than 100] [end if][total evidence]    Total Weighted Evidence[line break]";
		say "[line break][if total evidence is less than 36]You haven[']t got enough evidence for an arrest.[otherwise if total evidence is less than 76]You have enough evidence to press charges.[otherwise]You[']ve got enough evidence for a conviction.[end if][roman type]";
	otherwise:
		say "You haven[']t collected any evidence yet.".

showing evidence is an action out of world applying to nothing. Understand "show evidence" as showing evidence.
carry out showing evidence:
	try examining notebook.

Section 14 - Scoring

Table of Scored Circumstances
criteria	point value	description	turn stamp
"[if the blueberries are consumed]Y[otherwise]N[end if]"	5	"Eating the blueberries:                  "	-1
"[if your keys are visible]Y[otherwise]N[end if]"	5	"Finding the coins and keys:              "	-1
"[if the player is carrying the Hell Ride ticket]Y[otherwise]N[end if]"	5	"Buying the [story title] ticket:             "	-1
"[if the player is wearing the sheer veil]Y[otherwise]N[end if]"	5	"Wearing the sheer veil:                  "	-1
"[if the player is holding the Cash 'N' Carry invoice]Y[otherwise]N[end if]"	5	"Finding the Cash [']N['] Carry invoice:      "	-1
"[if the player is holding the Oriental Trading invoice]Y[otherwise]N[end if]"	5	"Finding the Oriental Trading invoice:    "	-1
"[if the player is holding the Frank's Market invoice]Y[otherwise]N[end if]"	5	"Finding the Frank[']s Market invoice:      "	-1
"[if the player is holding the Mystic Industries invoice]Y[otherwise]N[end if]"	5	"Finding the Mystic Industries invoice:   "	-1
"[if the player is holding the insurance policy]Y[otherwise]N[end if]"	5	"Finding the insurance policy:            "	-1
"[if the player is holding the brass key]Y[otherwise]N[end if]"	5	"Acquiring the brass key:                 "	-1
"[if the player is holding the cashier's check]Y[otherwise]N[end if]"	10	"Acquiring the cashier[']s check:           "	-1
"[if the player is holding the pliers]Y[otherwise]N[end if]"	5	"Acquiring the pliers:                    "	-1
"[if the player is carrying the lantern]Y[otherwise]N[end if]"	5	"Taking the lantern:                      "	-1
"[if the player is carrying the flashlight]Y[otherwise]N[end if]"	5	"Taking the flashlight:                   "	-1
"[if the player is carrying the mercury dime]Y[otherwise]N[end if]"	5	"Taking the Mercury dime:                 "	-1
"[if the big switch is switched off]Y[otherwise]N[end if]"	5	"Turning off the big switch:              "	-1
"[if the location is the Control Room]Y[otherwise]N[end if]"	5	"Finding the Control Room:                "	-1
"[if the location is the Dark Passage]Y[otherwise]N[end if]"	5	"Finding the Dark Passage:                "	-1	
"[if the bumper cars attendant is carrying the adjustable wrench]Y[otherwise]N[end if]"	5	"Bringing the wrench to the Bumper Cars:  "	-1
"[if the player is carrying the aqua fuse]Y[otherwise]N[end if]"	10	"Acquiring the Aqua fuse:                 "	-1
"[if the player is carrying the emerald fuse]Y[otherwise]N[end if]"	10	"Acquiring the Emerald fuse:              "	-1
"[if the player is carrying the gray fuse]Y[otherwise]N[end if]"	10	"Acquiring the Gray fuse:                 "	-1
"[if the player is carrying the indigo fuse]Y[otherwise]N[end if]"	10	"Acquiring the Indigo fuse:               "	-1
"[if the player is carrying the khaki fuse]Y[otherwise]N[end if]"	10	"Acquiring the Khaki fuse:                "	-1
"[if electrical closet one's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Aqua switch:                "	-1
"[if electrical closet three's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Crimson switch:             "	-1
"[if electrical closet five's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Emerald switch:             "	-1
"[if electrical closet seven's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Gray switch:                "	-1
"[if electrical closet nine's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Indigo switch:              "	-1
"[if electrical closet eleven's electrical panel's switch is switched on]Y[otherwise]N[end if]"	5	"Flipping the Khaki switch:               "	-1
"[if the player is carrying the teddy bear]Y[otherwise]N[end if]"	5	"Winning the teddy bear:                  "	-1
"[if the player is carrying the knock-off Swiss Army knife]Y[otherwise]N[end if]"	5	"Winning the knock-off Swiss Army knife:  "	-1
"[if the player is carrying the poster of Taylor Swift]Y[otherwise]N[end if]"	5	"Winning the poster of Taylor Swift:      "	-1
"[if the player is carrying the magenta fuse]Y[otherwise]N[end if]"	5	"Winning the Magenta fuse:                "	-1
"[if the player is carrying the small plush monkey]Y[otherwise]N[end if]"	5	"Winning the stuffed monkey:              "	-1
"[if the player is carrying the orange fuse]Y[otherwise]N[end if]"	5	"Winning the Orange fuse:                 "	-1
"[if the player is carrying the poster of Billie Eilish]Y[otherwise]N[end if]"	5	"Winning the poster of Billie Eilish:     "	-1
"[if the player is carrying the horseshoe magnet]Y[otherwise]N[end if]"	5	"Winning the horseshoe magnet:            "	-1
"[if the player is carrying the crimson fuse]Y[otherwise]N[end if]"	10	"Winning the Crimson fuse:                "	-1
"[if the player is carrying the small plush donkey]Y[otherwise]N[end if]"	5	"Winning the a plush donkey:              "	-1
"[if the player is carrying the goldfish]Y[otherwise]N[end if]"	5	"Winning the goldfish in a bowl:          "	-1
"[if the player is carrying the poster of Lourde]Y[otherwise]N[end if]"	5	"Winning the poster of Lourde:            "	-1

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
	if score is less than 125:
		say "Wow, you[']ve received [score] point[s] out of a possible [maximum score] in [turn count] moves! I[']m very proud of you. This was a triumph. I[']m being so sincere right now.[paragraph break]";
	otherwise:
		say "You[']ve received [score] point[s] out of a possible [maximum score] in [turn count] moves![paragraph break]";
	say "You have received points for the following: [paragraph break][fixed letter spacing]";
	sort the Table of Scored Circumstances in turn stamp order;
	repeat through the Table of Scored Circumstances:
		if the turn stamp entry is greater than 0:
			say "•  [description entry] [point value entry] points[line break]";
	say "[roman type][paragraph break]";
	try showing evidence.
	
check requesting the score:
	try requesting the complete score instead;
	stop the action.
	
[taking prize winnings]	
prize table is a table name that varies. The prize table is Table of High Striker Prizes.
prize taken is a truth state that varies. prize taken is false.
points awarded is a number that varies.
To receive a prize:
	let C be "[the player's command]";
	if there is an txtindex of C in the prize table:
		choose a row with an txtindex of C in prize table;
		say "You are now holding [description entry].";
		now the object entry is in the location;
		silently try taking the object entry;
		now prize taken is true;
		award points;
		reject the player's command;
	otherwise:
		now prize taken is false;
		continue the action.

Section 15 - Swearing

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
understand "shit/piss/fuck/cunt/cocksucker/motherfucker/tits/prick/cock/damn/hell", "cock sucker", and "mother fucker" as "[swears]".

Section 16 - Singing

Check an actor singing (this is the block singing rule):
	say "[one of]Your singing is abominable.[or]You open your mouth expecting a warble and getting a squawk instead.[or]Don[']t give up your day job.[or]You can[']t carry a tune in a bucket.[at random]";
	stop the action.

singing is an action applying to nothing.
Understand "sing" as singing.

Section 17 - Stealing

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

Section 18 - The Strings

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

to cut cables:
	say "There is a giant arc flash as you cut into the wiring here. You can feel the electricity coursing through your body electrocuting you on the spot.";
	end the story saying "You have died!".

check cutting it with:
	if the noun is a person, say "That would hurt." instead;
	if the noun is tied, say "You can[']t cut [the noun] while it is tied to [the tied to of the noun]." instead;
	if the second noun is tied, say "You can[']t cut [the noun] while [the second noun] is tied to [the tied to of the second noun]." instead;
	if the second noun is not the scissors and the second noun is not the fingernail clippers, say "You can[']t cut [the noun] with [the second noun]!" instead;
	if the noun is a short string, say "You can't cut the string any shorter." instead.

Carry out cutting it with:
	if the noun is the long string:
		now the long string is in the holding room;
		now all short strings are carried by the player;
	otherwise if the noun is the generator cables:
		cut cables;
	otherwise if the noun is the mechanical cables:
		cut cables;
	otherwise if the noun is the electrical cables:
		cut cables;
	otherwise if the noun is the tangled wires:
		cut cables;
	otherwise if the noun is the thick cable bundles:
		cut cables;
	otherwise if the noun is the conduit wires:
		cut cables.

Report cutting it with:
	say "You cut [the noun] with [the second noun]."

Section 19 - Talking/Asking/Telling/Showing

Understand "talk about [text]" as talking randomly about. Talking randomly about is an action applying to one topic.
instead of talking randomly about, say "No one wants to hear you prattle on about [the noun]."
		
Understand "talk about [something]" as talking about. Talking about is an action applying to one visible thing.
instead of talking about something :
	say "No one wants to hear you prattle on about [the noun]."

instead of asking someone about something:
	say "'[one of]Sorry,[or]I[']m afraid[or]Hmm,[at random] [one of]I don[']t know much about that[or]you[']ve got me there[or]I haven[']t the faintest[at random],' [the noun] [one of]drawls[or]replies[or]comments[or]exclaims[at random].";
	
Instead of telling an someone about something:
	say "[The noun] looks [one of]surprised[or]intrigued[or]nonplussed[at random]. '[one of]You don[']t say[or]That[']s very interesting[or]Do go on[or]I wish I[']d known that sooner[at random]!'".
	
Instead of showing something to an someone:
	say "'[one of]Sorry,[or]I[']m afraid[or]Hmm,[at random] [one of]I don[']t know much about that[or]you[']ve got me there[or]I haven[']t the faintest[at random],' [the second noun] [one of]drawls[or]replies[or]comments[or]exclaims[at random].";

Section 20 - Senses

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

Section 21 - Miscellaneous

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
	if the player's command matches the regular expression "^[bracket]!@#$%^&*;/[close bracket]":
		say "(Noted.)";
		reject the player's command.
	
Section 22 - Does The Player Mean

[ticket booth]
Does the player mean doing something with the hell ride ticket when the location is the TB-room: it is very likely.
Does the player mean doing something with the bumper cars ticket when the location is the TB-room: it is very likely.
Does the player mean doing something with the ferris wheel ticket when the location is the TB-room: it is very likely.
Does the player mean doing something with the fortune teller ticket when the location is the TB-room: it is very likely.
Does the player mean doing something with the carousel ticket when the location is the TB-room: it is very likely.
Does the player mean doing something with the rolls when the location is the TB-room: it is very unlikely.
Does the player mean doing something with the ticket kiosk when the location is the TB-room: it is very likely.

[hell ride]
Does the player mean doing something with Hell Ride when the location is outdoors: it is very likely.
Does the player mean doing something with the Hell Ride ticket when (the location of the player is the Head of the Line) and (the Hell Ride attendant is in the location of the player): it is likely.
Does the player mean buying hell ride: it is very unlikely.

[ferris wheel]
Does the player mean doing something with the Ferris Wheel when the location is outdoors: it is very likely.
Does the player mean doing something with the Ferris Wheel ticket when (the location of the player is the FW-room) and (the Ferris Wheel attendant is in the location of the player): it is likely.
Does the player mean buying the ferris wheel: it is very unlikely.

[fortune teller]
Does the player mean doing something with the fortune when the location is the FT-room: it is very likely.
Does the player mean doing something with the Fortune Teller ticket when (the location of the player is the FT-room) and (Esmeralda is in the location of the player): it is likely.

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
Does the player mean doing something with the mini ferris wheel when the mini ferris wheel is visible: it is likely.
Does the player mean doing something with the mini ferris wheel when the player is carrying the mini ferris wheel: it is very likely.
Does the player mean doing something with the mini carousel when the player is carrying the mini carousel: it is very likely.

[brass key doors]
Does the player mean doing something with the brass ring when the janitor is in the location of the player: it is very likely.
Does the player mean doing something with the brass key when the location is the CS-room or the location is the dark hallway: it is very likely.

[stake room]
Does the player mean doing something with the stakes public square: it is very unlikely.

[cutting w/o second noun]
Does the player mean doing something with the scissors when the player holds the long string: it is very likely.
Does the player mean doing something with the fingernail clippers when the player holds the long string: it is very likely.

[generator]
Does the player mean doing something with the main generator when the location is the generator room: it is very likely.

[pitchers mound]
Does the player mean throwing a baseball at something when the location is the Pitchers Mound: it is very likely.

[high striker]
Does the player mean doing something with the High Striker when the location is the HS-room: it is very likely.
Does the player mean doing something with the mallet when the location is the HS-room: it is very likely.

[mercury dime]
Does the player mean doing something with the mercury dime when the location is the Dime Toss Game: it is very likely.
Does the player mean doing something with a dime when the location is the Dime Toss Game: it is likely.
Does the player mean doing something with the mercury dime when the location is the Pitchers Mound: it is very unlikely.
Does the player mean doing something with a dime when the location is the Pitchers Mound: it is very likely.

[glove box]
Does the player mean doing something with the glove box when the location is PL-room: it is very likely.

[parking ticket]
Does the player mean doing something with the parking ticket: it is very unlikely.

[concession stand]
does the player mean doing something with the machine: it is very unlikely.

Section 23 - Directions

Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

[concession stand]
instead of going when the location is the CS-room:
	if the current action is going northeast:
		continue the action;
	otherwise if the current action is going south:
		continue the action;
	otherwise if the current action is going west and the ferris wheel ridden is true:
		continue the action;
	otherwise:
		if Behind the Concession Stand is visited:
			say "There are exits to the west, south, and northeast.";
		otherwise:
			say "The only exits you can see are south and northeast of here.".
			
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

To display exits:
	let count of exits be the number of viable directions;
	if the count of exits is 0, say "You appear to be trapped in here." instead;
	if the count of exits is 1, say "From here, the only way out is [list of viable directions].";
	otherwise say "From here, the viable exits are [list of viable directions]."

[don't want to show "west from concession stand unless the player has ridden the ferris wheel]
Instead of going nowhere when the location is not the CS-room:
	display exits.
	
showing exits is an action out of world applying to nothing. Understand "show exits" as showing exits. Understand "exits" as showing exits.
carry out showing exits:
	display exits.
	
Chapter 6 - Figures

Figure of Hell Ride is the file "HellRide.png" ("The entrance to [story title]").

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

Figure of ControlPanelExit is the file "ControlPanelExit.png" ("Control panel displaying the [story title] Exit").

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

Figure of RideExit is the file "RideExit.png" ("The [story title] Exit").

Figure of MercuryDime is the file "MercuryDime.png" ("A Mercury dime").

Chapter 7 - RNG Seed, Money, Dimes, Sounds - Not for release

Include Object Response Tests by Juhana Leinonen.
			
When play begins:
	seed the random-number generator with 4321.
	
The price of the money is $35.00. 

Sound of Bell is the file "Silence.ogg" ("The sound of silence").

five dimes underlie the seat. 

The carrying capacity of the fanny pack is 50.

Whidbey on is an action out of world applying to nothing. Understand "whidbey on" as whidbey on.
carry out whidbey on:
	say "Whidbey walks!.";
	now whidbey walking is true.
	
Whidbey off is an action out of world applying to nothing. Understand "whidbey off" as whidbey off.
carry out whidbey off:
	say "Whidbey stands still.";
	now whidbey walking is false.
	
Janitor on is an action out of world applying to nothing. Understand "janitor on" as janitor on.
carry out janitor on:
	say "The janitor walks!.";
	now janitor walking is true.
	
Janitor off is an action out of world applying to nothing. Understand "janitor off" as janitor off.
carry out janitor off:
	say "The janitor stands still.";
	now janitor walking is false.

displaying total evidence is an action out of world applying to nothing. Understand "display total evidence" as displaying total evidence.
carry out displaying total evidence:
	say "Evidence acquired by asking the janitor about:[line break]";
	sort the Table of Janitor Conversation Responses in reverse weighting order;
	repeat through Table of Janitor Conversation Responses:
		if turn stamp entry is not -1 and the weighting entry is greater than 0:
			say "•	[description entry].[line break]";
	say "[line break]";
	say "Evidence acquired by showing something to the janitor:[line break]";
	sort the Table of Janitor Object Responses in reverse weighting order;
	repeat through Table of Janitor Object Responses:
		if turn stamp entry is not -1 and the weighting entry is greater than 0:
			say "•	[description entry][line break]";
	say "[line break]";
	say "Evidence acquired by asking Mr Whidbey about:[line break]";
	sort the Table of Whidbey Conversation Responses in reverse weighting order;
	repeat through Table of Whidbey Conversation Responses:
		if turn stamp entry is not -1  and the weighting entry is greater than 0:
			say "•	[description entry][line break]";
	say "[line break]";
	say "Evidence acquired by showing something to Mr Whidbey:[line break]";
	sort the Table of Whidbey Object Responses in reverse weighting order;
	repeat through Table of Whidbey Object Responses:
		if turn stamp entry is not -1 and the weighting entry is greater than 0:
			say "•	[description entry][line break]";

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

The price of the money is $25.00. 

Sound of Bell is the file "Bell.ogg" ("The sound of a bell").

three dimes underlie the seat.

The carrying capacity of the fanny pack is 20.

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

every electrical panel is unlocked by the knock-off Swiss Army knife. understand "screwdriver" as knock-off Swiss Army knife.

Definition: A thing is panel-fitted if it is incorporated by an electrical panel.

[This will allow us to refer to the "corresponding" socket, switch, or indicator; i.e. the one from the same panel. This particular phrase works because there is only ever one each of these in a panel. If we decide later to have, say, three sockets per panel, only this phrase will have to be changed -- using more complex logic -- but the rest of the code could be left as-is.]
To decide what thing is --/the corresponding (name of kind of value K) of --/the (PT - a panel-fitted thing):
	let H be the holder of PT;
	decide on a random K that is part of H.[<- there will only ever be one of these]

[The following won't actually give all the panel's components a color property matching the panel, but it will allow us to refer to a "shared color" of these components and get the desired result.]
To decide what color is --/the shared color of --/a/the (PT - a panel-fitted thing):
	decide on the color of the holder of PT.

After unlocking an electrical panel with something (this is the report unlocking an electrical panel rule):
	say "Using the screwdriver on the knock-off Swiss Army knife, you remove the screws holding the electrical panel shut.".

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
An indigo fuse called an fuse9 is in the safe. The fuse id of fuse9 is 9. The color of fuse9 is indigo. The description is "This is [an color of the item described] colored electrical fuse. It was strange to find the indigo fuse in the safe. How did it get there? Mr Whidbey?".
A khaki fuse called a fuse11 is in the trash can. The fuse id of fuse11 is 11. The color of fuse11 is khaki. 
A magenta fuse called a fuse13 is carried by the High Striker attendant. The fuse id of fuse13 is 13. The color of fuse13 is magenta. 
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

Electrical Room is a dark room.  The electrical room can be electromagnetic. The electrical room is electromagnetic. "The electrical room is small, hidden behind the carnival’s attractions. The air smells of overheated wires and metal.

A central breaker panel dominates one wall, with labels like 'Ferris Wheel Lights' and 'Carousel Motors.' Indicator lights blink intermittently. Thick cables hang from the ceiling, connected to the carnival’s power network.

A junction box spills wires, and a workbench holds tools and a smudged wiring diagram. The floor is scratched and stained. A faint vibration pulses in the air.

An emergency shutdown panel and fire extinguisher sit nearby. Fluorescent lights cast shifting shadows. The room is raw and essential, a behind-the-scenes look at the carnival’s power.

[if the location is electromagnetic]This room is oozing with electromagnetic energy. You can feel your hair stand on end and all your nerves twitching. This feels dangerous! There are exits in all directions.[otherwise]This room is eerily quiet, missing the ever present buzz of electricity. There are exits in all directions.[end if]".

Instead of going from the Electrical Room:
	if the big switch is switched on:
		now the player is in the generator room;
		say "The electromagnetic energy that this room creates leaves you confused. Instead of going [the noun], you find yourself back in the Generator Room.";
	otherwise:
		continue the action.

some metal panels are here. they are scenery. the description is "Some are polished, others are worn and streaked with grease.".
a central breaker panel is here. It is scenery. The description is "This breaker panel controls various portions of the carnival.".
some electrical cables are here. They are scenery. understand "bundles", and "wires" as the electrical cables. The description is "This is a junction box routing the various wires and electrical cables running through the back stage area.". The electrical cables are plural-named.
a junction box is here. It is scenery. The description is "This is a junction box routing the various wires and electrical cables running through the back stage area.".
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

Control Room is a dark room. "The backstage control room is a functional space with gray, scuffed walls. A large monitor shows live feeds while control panels with dials, buttons, and lights manage the rides and systems. The panels [if switch count is 6]are lit[otherwise]remain oddly dark[end if].

The hum of electronics is interrupted by a crackling radio: 'Maintenance to Bumper Cars - wrench needed!' Papers, tools, and coffee cups clutter the floor. A desk holds logs and schedules, and a corkboard displays charts and red-marked notes, including one that says 'Check Zipper circuit breakers.'

A single light casts harsh shadows, and the air smells of lubricant and burnt wires, mingling with dampness. The room is hidden but vital, keeping the carnival running. On one wall, a switch sparks with blue and white arcs.

On one wall is a large switch[if the big switch is switched on] with sparks arcing out from it[end if]." 

The metal door is an openable and lockable door. it is closed and locked. The description of the metal door is "This is the door into the Control Room. It has the words 'Employees Only' written on it. The door is [if the item described is open]open[otherwise]closed[end if]. It is [if the item described is locked]locked[otherwise]unlocked[end if].". The brass key unlocks it. The metal door is east of the Control Room and west of the Dark Hallway. 

A big switch is a device in the control room. The big switch is fixed in place. The big switch can be switched on or switched off. The big switch is switched on. 
"[if the big switch is switched on]Currently there are sparks arcing out from the switch. It looks dangerous.[end if]".
The description of the big switch is "This is a large switch. It[']s the kind Dr. Frankenstein might push to route the lightning to his creature. A label underneath the switch reads: 'Electrical Room'.".

there is a label in the control room. it is scenery. The description is "It reads, 'Electrical Room'.".

instead of switching off the big switch:
	if the player is wearing the pair of gloves:
		now the electrical room is not electromagnetic;
		continue the action;
	otherwise:
		say "There[']s a big arc flash as you reach for the switch with your bare hands. You can feel the electricity coursing through your body, electrocuting you on the spot.";
		end the story saying "You have died!".

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
	say "The [color of the holder of the noun] light is now on.[paragraph break]";
	now all buttons are switched off;
	now the noun is switched on;
	now the figure id of the monitor is N;
	if the color of the holder of the noun is indigo:
		now hell ride disabled is true;
		say "As you push the indigo button, the monitor switches to a view of the guillotine room. You still see the blade rising and falling over the cars. Suddenly, the blade starts slowing down, taking longer and longer to fall. Until it finally comes to a complete rest. 

The room is heavy with uneasy silence. [story title], once a thrilling spectacle, now looms motionless, as the guillotine blade is frozen halfway down its track. Moments ago, chaos erupted as the malfunctioning mechanism sent the blade crashing unpredictably, ripping through the roofs of cars on the track.

A single car, its roof gashed open, sits under the still blade — a grim reminder of the disaster narrowly averted. Above, a black crow lands on the guillotine’s frame, its sharp caw cutting through the murmurs of anger and fear.

Two mechanics climb the scaffolding with tools in hand, their appearance met with wary hope. A crowd has gathered and is watching, holding their breath, as the cursed ride[’]s fate hangs in the balance. After a moment, applause rises from the assembled crowd, cheering your accomplishment.

Mr. Whidbey, the Mayor, the Chief of Police, and the janitor arrive on the scene and extend their gratitude for saving the day, not to mention lives![paragraph break]";
		move Mr Whidbey to the Control Room;
		move the Chief of Police to the Control Room;
		move the Mayor to the Control Room;
		move the janitor to the Control Room;
		now whidbey walking is false;
		now janitor walking is false;
		say "'But wait', you say, 'There is more afoot here than meets the eye. I think we need to talk to Mr Whidbey some more... confront him about a few things. Accusations might be made.'

Mr Whidbey exclaims, 'Accusations? What accusations?

The Police Chief listens with interest to what you have to say.".
	
Mayor is a male person in the holding room. The description is "The Mayor is present and ready to award you the keys to the city for your service.".
Chief of Police is a male person in the holding room. The description is "The Chief of Police is here ready to investigate the problems with [story title].".

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

The monitor is in the Control Room. The monitor is scenery. Understand "screen" as monitor. The monitor has a number called the figure id. The figure id is 0. The description is "This is a monitor that displays the various scenes from [story title].".

instead of examining the monitor:
	let N be the figure id of the monitor;
	choose a row with a link number of N in the table of monitor descriptions;
	say "The monitor flickers for a second and the scene it displays changes to something different.";
	say "[description entry][line break]";
	now ControlPanelImage is figure choice entry;
	if show images is true, display ControlPanelImage.
	

Chapter 3 - The Midway

Section 1 - Parking Lot

When play begins:
	now show images is false;
	now playmode is 1;
	now the player is autonomous;
	say "Type [bold type]'HELP'[roman type] for hints about [story title] and general information about playing interactive fiction games. The art in this game was generated by ChatGPT. Images are off by default. Type [bold type]'IMAGES ON[roman type] to toggle image presentation.";
	display the figure of Hell Ride;
	say "You[']re a part-time reporter for The Tribune, the local newspaper. Earlier in the day, your editor called you and told you of a conversation he overheard between the Chief of Police and his Deputy about Whidbey Amusements. It seems there has been a rash of accidents and mishaps at the carnival. Sounds like there could be something suspicious going on. The editor wants you to collect evidence and write a hard hitting piece about this story. If you do a good job, maybe the paper will hire you on full-time.".

The PL-room is a room. The printed name is "Parking Lot". The PL-room is north of the TB-room. The PL-room is outdoors. "The lot stretches across an open field, gravel crunching under the tires of arriving cars. Floodlights and the carnival's colorful glow light the area, accompanied by distant laughter, music, and the hum of rides.

Cars park haphazardly, guided by makeshift signs and fluttering flags. Families and visitors mingle, some lingering in vehicles, preparing for the chilly evening ahead. Shadows from encroaching trees are pierced by the occasional flash of a flashlight. At the entrance, an attendant collects fees in a weathered booth, making change from a cash box.

Puddles from recent rain shimmer under the lights, while patches of mud cling to shoes. In the distance, RVs and trailers sit quietly, their occupants watching the Ferris wheel turn against the evening sky. The lot serves as a transition between the mundane and the magical world inside the carnival.

The midway is to the south. There is a blueberry bush here. [if blueberry bush contains blueberries]There are blueberries on the bush.[otherwise]The bush has been picked clean.[end if][paragraph break]Your car is here. It[']s a bit of a beater. Inside the car, you can see [the list of things which are part of the beater car].[if the parking attendant carries the parking ticket][paragraph break]The attendant has a parking ticket. The price of a parking is [the price of the parking ticket].[end if]"

The parking attendant is an attendant in the the PL-room. The parking attendant carries a parking ticket. The price of the parking ticket is $5.00. The description of the parking ticket is "This is your receipt for parking."

The parking stub is a thing in the holding room. The description of the parking stub is "This stub is meant to be placed on your dashboard to indicate you paid for parking.". Understand "stub" or "ticket stub" as the parking stub.

some parked cars are here. they are scenery. understand "vehicles" as parked cars. the description is "The cars are parked, filling the lot.".

The beater car is an open enterable unopenable container in the PL-room. The beater car is scenery. Understand "vehicle" and "car" as the beater car. The description of the beater car is "[if the player is in the beater car][bold type]Car Interior[roman type][line break][end if]This is your car. It[']s a 2002 Honda Civic and it[']s seen better days.[paragraph break][if the player is in the beater car]You[']re sitting inside your car. [end if]Although it[']s old, it feels like an old friend. From the faux leather seats to the crack in the windshield, it[']s familiar and comforting. There are old fast food wrappers on the floor, dirty clothes and text books in the back seat. [if the player does not carry the air freshener]There is an air freshener hanging from the rear view mirror.[end if]" 

a cash box is here. it is scenery. understand "drawer" as the cash box. the description is "The cash box is full of change and paper money.".

The puddles are here. The puddles are scenery. understand "mud" as the puddles. The description is "You carefully skirt the mud and puddles to avoid getting your feet wet.".

some parking lot signs are here. they are scenery. the description is "The signs are painted with arrows pointing the way to the parking spaces."

some parking lot flags are here. they are scenery. understand "pennants" as the parking lot flags. the description is "The flags are strung from saw horse to saw horse marking the space between rows.".

The wrappers are here. The wrappers are scenery. Understand "food wrappers" as wrappers. The description of the wrappers is "McDonald[']s, Burger King, Jack In The Box, Taco Bell, Carl[']s Jr., Five Guys... You[']re a regular equal opportunity garbage gut.". instead of taking wrappers, say "You decide to leave the trash for another day.".  The wrappers are plural-named.

The text books are here. The text books are scenery. Understand "books/intro/introduction/calculus/statistics/heart/darkness" and "heart of darkness" and "introduction to calculus" and "textbooks" as text books. The description of the text books is "The titles you see are Introduction to Calculus, Statistics, and Heart of Darkness here.". instead of taking text books, say "School is the last thing on your mind.". The text books are plural-named.

Your dirty clothes are here. Your dirty clothes are scenery. The description is "Your dirty clothes are strewn about. You really meant to do laundry days ago.". instead of taking your dirty clothes, say "You leave the dirty clothes in a pile. What would you do with them now anyway?". Your dirty clothes are plural-named.

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

A dashboard is part of the beater car. The dashboard is a supporter. Understand "dash/board" as the dashboard. The description of the dashboard is "[if the dashboard supports nothing]It looks like you could set something there.[end if]".

A seat is part of the beater car. The seat is a supporter. It is fixed in place. Understand "car seat" as seat. The description of the seat is "A faux leather seat that looked great when it was new." The plural of seat is seats.

Your keys underlie the seat. Understand "car key", "car keys", and "key" as your keys. The description is "These are your car keys. It[']s a wonder you could even find them, your house is such a mess."

instead of turning your keys, say "If you left now you would be abandoning your story. You want that fulltime position, don't you? You decide to stay and investigate the carnival after all." instead.

A glove box is part of the beater car. The glove box is a locked openable container. The description is "This glove box contains things like your registration and insurance information." Your keys unlock the glove box. Understand "glove compartment", "glovebox/compartment" as the glove box.

instead of opening the glove box:
	if your keys are in the ignition:
		say "Your keys are in the ignition. You should get them first.";
		stop the action;
	if the player does not carry your keys:
		say "Your keys must be around here somewhere.";
		stop the action;
	otherwise:
		continue the action.
	
instead of unlocking keylessly the glove box:
	if your keys are in the ignition:
		say "Your keys are in the ignition. You should get them first.";
		stop the action;
	if the player does not carry your keys:
		say "Your keys must be around here somewhere.";
		stop the action;
	otherwise:
		continue the action.

A pair of gloves are a thing. The pair of gloves are inside the glove box. The pair of gloves is wearable. The description of the pair of gloves is "A nice set of fur-lined leather gloves. They[']re very warm." The printed name of the pair of gloves is "pair of gloves".

Understand "exit [a direction]" as a mistake ("Please try [bold type]'go [noun]'[roman type] or just [bold type]'[noun]'[roman type] as a direction isn[']t necessarily an exit here.")

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

The cashier is an attendant in the TB-room. Understand "smiling/attendant" as cashier.

The description of the TB-room is "Painted in bright red and yellow stripes, the ticket kiosk stands at the entrance with flickering lights to draw attention. A smiling cashier hands out tickets, while the cash drawer jingles. A digital payment system sits in the corner. Too bad you don’t have a debit card.

To the right, a signboard displays ticket prices alongside illustrations of the rides. Pennant flags flutter and the air is filled with the scent of popcorn, pretzels, and grease.

The ground is worn from the steps of carnival goers eagerly waiting in line as they approach the midway.

The midway continues in all directions from here. There is a cashier here. A price list for attraction tickets is on the signboard. The cashier has [list of things carried by the cashier]."

a window is here. it is scenery. the description is "Behind the window is a cashier selling tickets to the various rides.".

some playful illustrations are here. they are scenery. the description is "You can see colorful illustrations of some of the rides: the Carousel, [story title], the Bumper Cars, and the Ferris Wheel.".

some pennant flags are here. they are scenery. the description is "Pennant flags flutter from the kiosk[’]s roof.".

some kiosk lights are here. they are scenery. the description is "Twinkling lights outline its edges, blinking rhythmically to draw attention.".

some rolls are here. they are scenery. understand "roll", "rolls of tickets", and "roll of tickets" as rolls. the description is "Neatly arranged rolls of colorful tickets are displayed behind the cashier.".

The ticket kiosk is a thing. It is in the TB-room. It is scenery. Understand "booth" as the ticket kiosk. The description of the ticket kiosk is "A single window serves visitors, where a smiling cashier dispenses colorful tickets from neatly arranged rolls. Beside the tickets, a cash drawer jingles as change is counted, and a digital payment system glows faintly for modern convenience. Too bad you don[']t have a debit card.

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

The CS-room is a room. The printed name is "Concession Stand". The CS-room is outdoors. The CS-Room is east of Behind the Concession Stand. "The concession stand is a destination for many along the midway. Twinkling lights frame the stand making it glow amid the carnival's buzz.

Behind the counter, popcorn churns in the machine, candy apples gleam, and cotton candy spins in clouds. Warm pretzels sit under a heat lamp, while sodas chill in a frosted cooler. The counter is cluttered with bags, napkins, and sprinkle cups. Kids tug at parents, teens share pretzels, and the crowd buzzes with energy.

There is a menu to the right of the window. You can see the treats inside the stand. [if Behind the Concession Stand is unvisited]There are exits to the south and northeast.[otherwise]There are exits to the south, west, and northeast.[end if]"

The concession attendant is an attendant in the CS-room. 

The concession stand is here. it is scenery. the description is "The Concession Stand, perched along the midway, is a colorful and bustling hub. Painted in bright reds, blues, and yellows, it features bold lettering announcing treats like 'SODA! POPCORN! CANDY APPLES!' Strings of twinkling lights frame the stand, making it a glowing beacon amid the carnival excitement."

some treats are here. Treats are scenery. Understand "treat/sweets/snacks/sugary/goodies" as treats. The description of treats is "There are a variety of things to eat here."

a menu is here.  Understand "sign/price/list/chalk/board/chalkboard" as menu. the Menu is fixed in place. The description of the menu is "It[']s a sign display the prices of the various concession items for sale."

a Drink is carried by the concession attendant. The price of a drink is $2.00. The description of the drink is "This soda is ice cold."

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

some Bubblegum is carried by the concession attendant. The price of bubblegum is $1.00. Understand "bubble/gum" as bubblegum. The description of the bubblegum is "This is a square of Bazooka Joe Bubblegum. Really now, is there any other?". the bubblegum can be unchewed or chewed. the bubblegum is unchewed.

a Bucket of Popcorn is carried by the concession attendant. The bucket of popcorn is edible. The price of a bucket of popcorn is $2.50. Understand "bucket", "buttered" as bucket of popcorn. The description of the bucket of popcorn is "The bucket of popcorn looks enormous!"

a Candy Apple is carried by the concession attendant. The candy apple is edible. The price of a candy apple is $1.50. understand "apples" and "caramel" as the candy apple. The description of the candy apple is "The candy apple is your typical caramel covered apple. It looks like it would get stuck in your teeth."

Cotton Candy is carried by the concession attendant. Cotton candy is edible. The price of cotton candy is $1.50. The description of cotton candy is "The cotton candy is a mixture of pink and blue floss."

a Soft Pretzel is carried by the concession attendant. The soft pretzel is edible. The price of the soft pretzel is $1.50. understand "pretzels" as soft pretzel. The description of the soft pretzel is "The soft pretzel is generously sprinkled with salt."

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

a messy desk is here. it is a scenery supporter. the description is "The desk is covered in stacks of paperwork, old receipts and faded carnival brochures.".

a gold key is a thing. the gold key is in the safe. the description is "This is a small gold key.".

an envelope is in the filing cabinet. the envelope is a closed openable container. the description is "This is an envelope with the name 'Fred Needleman' written on the outside.".

understand the command "check" as something new.
a cashier's check is a thing contained by the envelope. the description is "This cashier[']s check is made payable to 'Fred Needleman'. The amount is $10,000 and the memo line reads 'For services rendered.'". 

the filing cabinet is here. it is a closed locked openable lockable container. it is unlocked by the gold key. it is fixed in place. the description is "A locked cabinet, likely filled with old carnival financial records, is tucked away against one wall.".

some paperwork is on the messy desk. it is scenery. understand "stacks/piles/financial/statements/documents/receipts" as paperwork. the description is "Piles of receipts and old financial statements cover much of the desk, but the documents seem to be a mix of chaotic disorganization and purposeful concealment. Most of these are for the regular day to day expenses such as: paper goods, consumables, etc. Closer inspection shows a steadily declining volume of goods ordered. Almost as if the carnival couldn[']t afford the full cost. Some are marked paid and others are not. Some are marked 'Past Due'. I wonder if the carnival is in some kind of financial trouble."

an invoice is a kind of thing. 

a Cash 'N' Carry invoice is an invoice in the filing cabinet. the description is "The Cash [']N['] Carry invoice reads:[fixed letter spacing][paragraph break]
Cash [']N['] Carry.[line break]
121 Maple St[line break]
Stoneham, WA 98132[paragraph break]
2 cases of Soda Cups                   $82.50[line break]
1 case of Popcorn Buckets             $106.73[line break]
3 cases of Napkins                     $56.41[line break]
Total:                                $245.64[paragraph break]
After the 10th of the month, this invoice will be assessed a finance charge of 3.75% per month, We appreciate your prompt payment.[roman type]".

a Frank's Market invoice is an invoice in the filing cabinet. the description is "Frank[']s Market invoice reads:[fixed letter spacing][paragraph break]
Frank[']s Market Wholesale[line break]
1 Market Pl[line break]
Cambridge, WA 98325[paragraph break]
8 dozen lemons                                $85.00[line break]
10 bags of flour (50 pounds)                 $200.00[line break]
5 bags of sugar (50 pounds)                  $250.00[line break]
10 Cases of Coca-Cola                        $210.00[line break]
Total:                                       $745.00[paragraph break]
Notice: Your account has been closed. Kindly remit the balance due immediately![roman type]".

an Oriental Trading invoice is an invoice in the filing cabinet. the description is "The Oriental Trading invoice reads:[fixed letter spacing][paragraph break]
Oriental Trading Company[line break]
P.O. Box 2308[line break]
Omaha, NE 68103-2308[paragraph break]
Mega Bulk 1000 Pc. Multicolor Toy & Novelty Handout Assortment             $184.99[line break]
19' x 11' Bulk 500 Pc. Everyday Toy Treasure Chest Assortment              $119.98[line break]
7' Bulk 72 Pc. Mini Solid Color Plastic Outdoor Bubble Wands                $77.98[line break]
2' Bulk 100 Pc. Mega Everyday Fun Yellow Rubber Ducks Assortment            $44.99[line break]
Total:                                                                     $427.94[paragraph break]
Your account is past due. Please pay immediately![roman type]"

a Mystic Industries invoice is an invoice in the filing cabinet. the description is "The Mystic Industries invoice reads:[fixed letter spacing][paragraph break]
Mystic Industries, Inc.[line break]
40 Elm St[line break]
Medford, WA 98101[paragraph break]
For services rendered:[line break]
Repairs to the Stake Room in the [story title] Attraction after Fire			$22,500.00[paragraph break]
Please note that this invoice is overdue and will be assessed a finance charge of 2.5% per month, We appreciate your prompt payment.[roman type][line break]".

some carnival brochures are here. understand "brochure" as carnival brochures. they are scenery. the description is "The brochures are meant to be left at convenience stores restaurants, and other businesses as a way to attract visitors to the carnival." .

some knick-knacks are on the messy desk. they are scenery. understand "trinkets/knack/knick-knacks" or "knick knacks" as the knick-knacks. the description is "These are little bits of memorabilia from the carnival life. [if the mini ferris wheel is visible]There is a miniature Ferris wheel here.[end if][if the mini carousel is visible] You can also see a mini carousel here.".
a mini Ferris wheel is on the messy desk. the description is "This is a miniature reproduction of the Ferris wheel.". 
a mini carousel is on messy desk. the description is "This is a miniature replica of the Carousel.".

a office bulb is here. the printed name is "bulb". it is scenery. understand "lightbulb/lamp" or "desk lamp" or "light bulb" as office bulb. the description is "The flickering light from the lamps casts a yellow hue about the office.".

a framed photograph is here. understand "photo" as the framed photograph. the description is "This appears to be a photo of the carnival[']s opening night, a once proud moment lost in time. On the back reads a date: '03/22/62'.[if the maintenance office is visited] This looks like the same photo you found in the Maintenance Office.[end if]".

The sturdy door is an openable and lockable door. it is closed and locked . The description of sturdy door is "This is the door into the Carnival Office. It has the word 'Private' written on it. The door is [if the item described is open]open[otherwise]closed[end if] and [if the item described is locked]locked[otherwise]unlocked[end if].". The brass key unlocks it. The sturdy door is south of the CS-room and north of the Carnival Office. 

The initial appearance of a door is usually "Nearby [an item described] leads [if the other side of the item described is visited][direction of the item described from the location] to [the other side of the item described][otherwise][direction of the item described from the location][end if]."

an insurance policy is in the safe. the description is "This is an insurance policy on the Whidbey Amusements. It is for $1,000,000. That[']s an awfully high number and it was dated last month. It says here that insurance paid will be doubled for incidents involving bodily injury.".

the safe is in the carnival office. it is a closed locked, openable, lockable container. it is fixed in place. understand "small/heavy/knob/dial" as the safe. the description is "Next to the filing cabinet, there’s a small, heavy safe where the owner keeps more sensitive materials. There is a knob on the front of the safe".

The safe has a list of numbers called the current combination.
The safe has a list of numbers called the true combination. The true combination of the safe is {62, 22, 3}.

Instead of examining the safe:
	if the number of entries in the current combination of the safe is 0,
		say "You haven[']t turned the knob to any combination yet.";
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
			
Telephone Call AutoPlay is a scene. 
Telephone Call AutoPlay begins when the location is the Carnival Office and the Carnival Office is visited for the first time.
Telephone Call AutoPlay ends when the index is the number of rows in the Table of Whidbey Telephone Call plus 1.

When Telephone Call AutoPlay begins:
	now index is 1;
	say "As you enter the room, you see Mr Whidbey with his back to the door. He[']s talking on the telephone.";

When Telephone Call AutoPlay ends:
	now the player is in the CS-room;
	say "You suddenly find yourself escorted outside the Carnival Office unceremoniously only to find yourself in the Concession Stand.[paragraph break]";
	now index is 1.
	
Instead of doing something other than waiting, looking, listening, or smelling during Telephone Call AutoPlay:
	say "You[']re afraid if you move too much, Mr Whidbey will notice you!".
	
instead of listening during the Telephone Call Autoplay, say "You are completely focused on the conversation you are overhearing.".
	
every turn during Telephone Call AutoPlay:
	choose row index in the Table of Whidbey Telephone Call;
	say "[description entry][line break]";
	increment index;
	
every turn when Telephone Call AutoPlay is not happening and the location of the player is the carnival office and the location of mr whidbey is the location of the player:
	say "[Mr Whidbey] shouts, 'Hey! Get out of here! Can[']t you read the sign? Employees only!'";
	now the player is in the CS-room;
	say "You suddenly find yourself escorted outside the Carnival Office unceremoniously only to find yourself in the Concession Stand.[paragraph break]".
	

Section 7 - High Striker

Before going east when the location is the TB-room and the HS-room is unvisited:
	if show images is true, display Figure of HighStriker;
	continue the action.
	
Before looking when the location is the HS-room:
	if show images is true, display Figure of HighStriker.

[ this was a forward reference that Inform 7 couldn't resolve for some reason]
A room called the Pitchers Mound is southeast of the HS-room. 

The HS-room is a room. The printed name is "High Striker". The HS-room is west of the FW-room, southwest of the Dime Toss Game, and northwest of the Pitchers Mound. The printed name is "High Striker". The HS-room is outdoors. "A tall machine stands with bright red, yellow, and blue lights. A sign sits at the top reading 'Test Your Strength!' The base is dark, polished wood, with a sturdy metal pole and a bell at the top. Markings along the pole indicate strength. A smaller sign says, 'Buy a mallet, strike the bell, win a prize.' Spectators cheer as the sound of the mallet hitting the target fills the night.

The Ticket Kiosk is to the west. Other games are northeast and southeast of here. The Ferris Wheel lies to the east."

The markings are here. The markings are scenery. Understand "marking" and "sign", "signs", and "pole" as markings. The description of markings is "There are five levels marked on the pole: Weakling, Getting There, Average, Almost There, and Muscle Man."

The High Striker attendant is an attendant in the HS-room. 

after looking when the location is the HS-room:
	say "[if the High Striker attendant carries the mallet]The attendant is holding a mallet.[end if]";

after examining the High Striker attendant when the HighStrikerWin is true, show the high striker prizes. 
after looking when the HighStrikerWin is true and the location is the HS-room, show the high striker prizes.
	
instead of listening when the location is the HS-room, say "The sound of the mallet hitting the target is followed by the resonant clang of the bell ), alongside the buzz of carnival music in the background.".
	
The High Striker is in the HS-room. It is scenery. understand "machine", "wood", "polished" and "base" as High Striker. the description is "The High Striker is a tall, eye-catching machine adorned with bright, colorful lights. A large sign at the top reads 'Test Your Strength!'. The machine[’]s base is made of polished wood. At the center is a sturdy metal pole, with a large bell hanging at the top.".

The bell is here. The bell is scenery. The description of the bell is "This is the bell that will ring out when you prove to everyone that you[']re a 'Muscle Man'."

a High Striker sign is here. it is scenery. the description is "Buy a mallet, strike the bell, win a prize."

some High Striker spectators are here. they are scenery. understand "participants" as High Striker spectators. the description is "Spectators gather around, cheering on participants and offering lighthearted jabs and encouragement.".

A teddy bear is carried by the High Striker attendant. The description of the teddy bear is "This is a teddy bear like you had when you were a kid. Right down to the red bow around its neck." 

A knock-off Swiss Army knife is carried by the High Striker attendant. The description is "This is a knock-off Swiss Army knife. It has [a list of things which are part of the item described]."  The printed name of the knock-off Swiss Army knife is "knock-off Swiss Army knife". 

A screwdriver is part of the knock-off Swiss army knife. The description of the screwdriver is "It[']s a handy tool that[']s part of the knock-off Swiss Army knife."
An awl is part of the knock-off Swiss army knife. The description of the awl is "It[']s a handy tool that[']s part of the knock-off Swiss Army knife."
A fingernail clippers is part of the knock-off Swiss army knife. The description of the fingernail clippers is "It[']s a handy tool that[']s part of the knock-off Swiss Army knife."
A can opener is part of the knock-off Swiss army knife. The description of the can opener is "It[']s a handy tool that[']s part of the knock-off Swiss Army knife."
A corkscrew is part of the knock-off Swiss army knife. The description of the corkscrew is "It[']s a handy tool that[']s part of the knock-off Swiss Army knife."

instead of taking when the noun is part of the knock-off Swiss army knife, say "That[']s part of the knock-off Swiss Army knife. You can[']t take that!" instead.

clipping is an action applying to one thing. understand "clip [something]" as clipping. understand "trim [something]" as clipping. understand "cut [something]" as clipping.
instead of clipping fingernails, say "Your fingernails look much neater now that you[']ve trimmed them.".

biting is an action applying to one thing. understand "bite [something]" as biting.
instead of biting fingernails, say "That[']s a bad habit. You should really try to stop biting your fingernails."
	
A poster of Taylor Swift is carried by the High Striker attendant. The description of the poster of Taylor Swift is "This is a poster of America[']s sweetheart, Taylor Swift."

A lever is here. The lever is fixed in place. Understand "bullseye/striker/target/base" as lever. The description of the lever is "There is a bullseye on the base of the lever. I guess this is where you have to hit the mallet."

A mallet is carried by the High Striker attendant.  The price of the mallet is $2.00. Understand "hammer" as mallet. The description of the mallet is "The mallet is over sized, perhaps to give you an advantage in the Strong Man game."

A strength pattern is a kind of value. The strength patterns are Weakling, Getting Stronger, Average, Almost There, Muscle Man.

understand the command "punch" as something new.
piercing is an action applying to two things. Understand "pierce [something preferably held] with [something]" as punching.
punching is an action applying to two things. Understand "punch [something preferably held] with [something]" as punching.
instead of punching:
	say "You [if the second noun is not the awl or the noun is not the wallet]can[']t [end if]punch a hole in [the noun] with the [second noun].".
	
instead of asking the High Striker attendant about "mallet/lever/bullseye/striker/target", say "Use the mallet to strike the bullseye. Ring the bell to win a prize.".

understand the command "hit" as something new. understand the command "swing" as something new.
hitting it with relates one thing to one thing. The verb to hit means the hitting it with relation.
Hitting it with is an action applying to two visible things. 
Understand "hit [something] with [something preferably held]" as hitting it with.
Understand "strike [something] with [something preferably held]" as hitting it with.
Understand "swing [something preferably held] at [something]" as hitting it with (with nouns reversed).  

Rule for supplying a missing second noun when hitting:
	if the mallet is carried:
		now the second noun is the mallet;
	otherwise if the sledgehammer is carried:
		now the second noun is the sledgehammer;
	otherwise:
		say "You will have to specify what to hit [the noun] with."

Check hitting it with:
	if noun is an attendant:
		say "[The noun] blocks your swing and takes [the second noun] from you!";
		now the second noun is nowhere;
		stop the action;
	if noun is not lever, say "Nothing happens." instead;
	if the second noun is not mallet and the second noun is not the sledgehammer, say "You can[']t hit [the noun] with [the second noun]!" instead;
	if the player is not carrying the mallet and the player is not carrying the sledgehammer, say "You[']re not holding anything you can hit with." instead.
	
some High Striker prizes are here. understand "stuffie", "stuffed", "animals", "novelty", "toys", "quirky", and "trinkets" as high striker prizes. the description is "The prizes range from stuffed animals and novelty toys to shiny trinkets and quirky collectibles."

instead of taking the high striker prizes, say "I don[']t think you can just take the prizes.".

instead of examining the high striker prizes:
	say "The prizes are [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of High Striker Prizes:
		choose row N in the Table of High Striker prizes;
		if object entry is carried by the High Striker attendant:
			say "[description entry][if N < number of rows in the Table of High Striker Prizes], [end if][if N is the number of rows in the Table of High Striker Prizes - 1]and [end if][if N is the number of rows in the Table of High Striker Prizes].[end if]".

To show the High Striker prizes:
	say "[line break]Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of High Striker Prizes:
		choose row N in the Table of High Striker Prizes;
		if object entry is carried by the High Striker attendant:
			say "[N]) [description entry][if N < number of rows in the Table of High Striker Prizes], [otherwise]?[end if]".

Carry out hitting the lever with the mallet when the player is carrying the mallet:
	say "You lift the mallet high and bring it down on the lever with all your might! The striker rises towards the bell stopping at '[a random strength pattern between weakling and almost there]'.[line break] ";
	
after hitting the lever with the mallet for the fourth time:
	say "You can[']t be sure of it but it seems as if the mallet isn[']t heavy enough to ring the bell.".
after hitting the lever with the mallet for the seventh time:
	say "This mallet is definitely not heavy enough to ring the bell.".
	
HighStrikerWin is a truth state that varies. HighStrikerWin is false.
After hitting the lever with the sledgehammer:
	play the sound of Bell;
	now HighStrikerWin is true;
	say "As you swing, you feel the extra weight from the sledgehammer. As it comes down on the bullseye, you can[']t help but feel like the extra weight gives you an edge. The bell rings as the striker reaches the top of the pole. The attendant says, 'You[']re a Muscle Man. Here[']s a prize for you.'";
	show the high striker prizes.
	
check hitting the lever with the sledgehammer for the third time:
	say "[The High Striker attendant] takes the sledgehammer away from you exclaiming, 'Hey! What are you doing? I[']m not going to let you cheat again!'";
	now the sledgehammer is nowhere.

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

A room called the Dime Toss Game is northeast of the HS-room. "The booth is brightly colored with red-and-white stripes, twinkling lights, and a sign reading 'TOSS A DIME - WIN A PRIZE!' Prizes hang around the booth, from stuffed animals to shiny trinkets. Gleaming plates reflect the light, waiting for dimes. The 'ping' of dimes hitting plates is followed by the satisfying 'plop' when they land. Shouts of victory and playful groans mix with carnival music and laughter. The operator calls out, drawing in onlookers.

You[']re surprised to see that this game only costs a dime. The exit is to the southwest."

the Dime Toss booth is a thing in the Dime Toss Game. the Dime Toss booth is scenery. understand "game" as the dime toss booth. The description of the Dime Toss booth is "The game booth is adorned with vibrant colors — red-and-white striped awnings, twinkling lights, and eye-catching signage.". understand "awning", "awnings", "twinkling", and "lights" as the dime toss booth.

Tossing it on relates one thing to another.
The verb to toss means the tossing it on relation.

Tossing it on is an action applying to two things.
Understand "toss [something preferably held] at/on [something]" as tossing it on.
Understand "flip [something preferably held] at/on [something]" as tossing it on.
Understand "throw [a dime] at/on [something]" as tossing it on.
		
instead of tossing a dime on something when the location is the Dime Toss Game:
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

instead of taking the dime toss prizes, say "I don[']t think you can just take the prizes.".

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
		choose row N in Table of Dime Toss Prizes;
		say "[N]) [description entry][if N < number of rows in the Table of Dime Toss Prizes], [otherwise]?[end if]".

TossADimeWin is a truth state that varies. TossADimeWin is false.
instead of tossing a dime on plate when the player carries the noun:
	now the noun is nowhere;
	say "You toss the dime. [run paragraph on]";
	if the noun is the mercury dime:
		now TossADimeWin is true;
		say "The heavier Mercury dime hits the plate, starts to spins, and lands in the center of the plate. The attendant shouts out, 'Winner! Winner!'";
		show the Toss A Dime prizes;
	otherwise:
		let N be a random number between 1 and 3;
		if N is:
			-- 1: say "The dime hits the plate and bounces straight off.";
			-- 2: say "Like skipping a stone in water, the dime skitters off the plate.";
			-- 3: say "The dime lands on the edge of the plate. You watch in anticipation until the dime falls off the plate.";

after reading a command when the location is the Dime Toss Game and TossADimeWin is true:
	now prize table is Table of Dime Toss Prizes;
	receive a prize;
	if prize taken is true:
		now TossADimeWin is false;
		stop the action.
			
The plate is a supporter in the Dime Toss Game. Understand "plates" as plate. The description of the plate is "These are small, flat plates, almost saucers. You are meant to toss a dime on these plates to win a prize!"

The Dime Toss attendant is an attendant in the the Dime Toss Game. understand "operator" as dime toss attendant.

after examining the Dime Toss attendant when the TossADimeWin is true, show the toss a dime prizes. 
after looking when the TossADimeWin is true and the location is the Dime Toss Game, show the Toss A Dime prizes.

Section 9 - Pitchers Mound

Before going southeast when the location is the HS-room and the Pitchers Mound is unvisited:
	if show images is true, display Figure of MilkBottles;
	continue the action.
	
Before looking when the location is the Pitchers Mound:
	if show images is true, display Figure of MilkBottles.

A room called the Pitchers Mound is southeast of the HS-room. "The milk bottle toss is a classic game of skill and luck. A pyramid of colorful bottles sits on a sturdy platform – three on the bottom, two in the middle, and one at the top. Players throw baseballs to knock down the stack and win a prize. The booth is lively, with cheering and the clatter of falling bottles. The attendant calls, 'Step right up! Three balls for a dime!' Prizes from toys to stuffed animals hang nearby. With this carnival favorite, every toss is filled with suspense. [if a dime underlies the pitchers mound booth] You thought you caught a flash of something coming from the area of the booth.[end if]

You[']re surprised to see that this game only costs a dime. The High Striker is to the northwest.".

A small plush donkey is carried by the Pitchers Mound attendant. Understand "stuffie" and "stuffed" as small plush donkey. The description is "You feel rather underwhelmed as you look at the small plush donkey on a key chain."

A poster of Lourde is carried by the Pitchers Mound attendant. The description of the poster of Lourde is "This is a poster of Lourde. You love her music."

A goldfish is carried by the Pitchers Mound attendant. Understand "bowl" as goldfish. The description of the goldfish is "This is a small goldfish in a bowl. A pet is just what you need."

a baseball is a kind of thing. Understand "ball" as baseball.The Pitchers Mound attendant carries three baseballs. The description of a baseball is "This is a regulation MLB baseball."

some Pitchers Mound spectators are here. they are scenery. the description is "The satisfying clatter of falling bottles mixes with cheers and groans from players and spectators.".

the Pitchers Mound booth is here. it is scenery. the description is "With its colorful banners and flashing lights, the booth buzzes with energy, drawing a crowd. [if a dime underlies the pitchers mound booth] You can see something shiny on the ground under the booth.[end if].".

a Mercury dime is a dime. it underlies the pitchers mound booth. The description is "The Mercury dime is a ten-cent coin struck by the United States Mint from late 1916 to 1945. Designed by Adolph Weinman and also referred to as the Winged Liberty Head dime, it gained its common name because the obverse depiction of a young Liberty, identifiable by her winged Phrygian cap, was confused with the Roman god Mercury. It is 90% silver, 10% copper, and has a weight of 2.50 grams.".

before examining the mercury dime:
	if show images is true, display Figure of MercuryDime.

some banners are here. they are scenery. understand "flashing", and "lights" as the banners. the description is "The booth buzzes with energy, its colorful banners and flashing lights drawing a lively crowd.".

instead of listening when the location is the Pitchers Mound, say "The satisfying clatter of falling bottles mixes with cheers and groans from players and spectators.".

The futile to throw things at inanimate objects rule is not listed in the check throwing it at rules.

The block throwing at people rule is listed instead of the block throwing at rule in the check throwing it at rules.

This is the block throwing at people rule:
	if the second noun is a person, say "That might be construed as an attack." instead.

Understand "throw [something preferably held] at/on [something]" as throwing it at.

Instead of buying a baseball, say "You don[']t need to buy the baseballs. Just give the attendant a dime.".

some Pitchers Mound prizes are here. Understand "toys", "toy", "stuffed", "stuffie", "stuffed animal", "animal", "animals", and "prizes" as Pitchers Mound prizes. The description is "Prizes - ranging from small toys to giant stuffed animals - hang prominently.".

instead of taking the pitchers mound prizes, say "I don[']t think you can just take the prizes.".

instead of examining the Pitchers Mound prizes:
	say "The prizes are [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Pitchers Mound Prizes:
		choose row N in the Table of Pitchers Mound prizes;
		if object entry is carried by the Pitchers Mound attendant:
			say "[description entry][if N < number of rows in the Table of Pitchers Mound Prizes], [end if][if N is the number of rows in the Table of Pitchers Mound Prizes - 1]and [end if][if N is the number of rows in the Table of Pitchers Mound Prizes].[end if]".
		
To show the Pitchers Mound prizes:
	say "[line break]Which prize would you like? [run paragraph on]";
	repeat with N running from 1 to the number of rows in the Table of Pitchers Mound Prizes:
		choose row N in the Table of Pitchers Mound Prizes;
		if the object entry is carried by the Pitchers Mound attendant:
			say "[N]) [description entry][if N < number of rows in the Table of Pitchers Mound Prizes], [otherwise]?[end if]";
		
instead of giving a dime to the pitchers mound attendant:
	say "The attendant gives you three baseballs in return.";
	now the noun is nowhere;
	now the player carries every baseball;
	stop the action.
	
instead of giving a dime to the pitchers mound attendant for the second time:
	say "[The pitchers mound attendant] says, 'Sorry. You only get to play once.'";
	now the noun is nowhere;
	now every baseball is in the holding room;
	stop the action.

understand "throw [baseball] at [milk bottles]" as a mistake ("[bold type]THROW baseball at BOTTLE X[roman type] where X is the bottle number you want to hit. The bottles are numbered one to six'.")

instead of throwing a baseball at the milk bottles:
	if the player carries a baseball:
		say "[bold type]THROW baseball at BOTTLE X[roman type] where X is the bottle number you want to hit. The bottles are numbered one to six'.";
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
		now every baseball is in the holding room;
	otherwise:
		let N be a random number between 1 and 5;
		if N is:
			-- 1: say "You knocked over one bottle. You can do better than that.";
			-- 2: say "You knocked over two bottles. Too bad.";
			-- 3: say "You knocked over three bottles. So close.";
			-- 4: say "You knocked over four bottles. So sad.";
			-- 5: say "You knocked over five bottles. Better luck next time.";
		now the noun is in the holding room.

after reading a command when the location is the Pitchers Mound and PitchersMoundWin is true:
	now prize table is Table of Pitchers Mound Prizes;
	receive a prize;
	if prize taken is true:
		now PitchersMoundWin is false;
		stop the action.
			
The Pitchers Mound attendant is an attendant in the Pitchers Mound. 

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

SF-room is a room. SF-room is east of ST-room. The printed name is "Show Facade". SF-room is outdoors. "As you walk west through the midway, the lights fade to a soft glow, leading you to a tent. A sign reads 'Little Egypt Show - A Journey Into the Mysterious and Unknown!' The barker, wearing a fez and smiling, points to another sign: 'Little Egypt - Dime Admission.' The ticket kiosk is behind you to the east.

There is a stage in front of the tent. The Barker is encouraging you to step up and enjoy."

the facade is in the SF-room. it is scenery. the description is "You are standing in front of a dark and mysterious tent filled with illusions and mysterious performers. There is a stage in front of the tent. The Barker is encouraging you to step up, pay for, and enjoy the Little Egypt Show."

To say the barker's cry:
	say "In front of the tent, the barker gestures excitedly, calling out:[paragraph break]Ladies and gentlemen, boys and girls, gather [']round! [line break]Step right up and witness the spectacle that[’]s taken the world by storm! [line break]She walks, she talks, she crawls on her belly like a reptile. [line break]Behold the one, the only Little Egypt, performing her legendary Dance of the Pyramids — a dazzling display of mystery, grace, and allure! [line break]For just a dime, a mere one tenth of a dollar, prepare to be transported to the sands of Cairo, where enchantment and wonder await!"
	
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
	say "You hand over a dime, and the barker nods, waving you through. As you step up to the entrance, the air feels thicker and the sounds of the carnival fade away. You’ve entered an entirely different world now. Before you, there is a tent. Intrigued, you take your first step towards the Little Egypt Show. You can now head west into the show."
	
instead of listening when the location is the SF-room, say "You hear the low, hypnotic music of a faraway land.".
instead of smelling when the location is the SF-room, say "The smell of incense and spices wafts through the tent."

instead of asking the barker about a topic listed in the Table of Barker Conversation Responses:
	say "[response entry][paragraph break]";
	if the turn stamp entry is -1 and the subject entry is not "NA":
		now the turn stamp entry is the turn count;
		let S be the subject entry;
		let W be the weighting entry;
		choose a row with a category of S in Table of Notebook;
		now total entry is total entry plus W;
		now total evidence is total evidence plus W.
		
instead of showing something to the barker:
	if there is an object of the noun in the Table of Barker Object Responses:
		choose a row with an object of noun in the Table of Barker Object Responses;	
		say "[response entry][paragraph break]";
		let S be the subject entry;
		let W be the weighting entry;
		if the turn stamp entry is -1 and S is not "NA":
			now the turn stamp entry is the turn count;
			choose a row with an category of S in Table of Notebook;
			now total entry is total entry plus W;
			now total evidence is total evidence plus W.
		
instead of telling the barker about something: try asking the noun about it.

Section 11 - Show Tent	

Before going west when the location is the SF-room and the ST-room is unvisited and barker is carrying a dime:
	if show images is true, display Figure of LittleEgyptShow;
	continue the action.
	
Before looking when the location is the the ST-room:
	if show images is true, display Figure of LittleEgyptShow.		

The ST-room is a room. The printed name is "Show Tent". The ST-room is west of SF-room. "You are inside the Little Egypt Show. The attraction's facade is to the east. There are folding chairs standing vigil in neat in rows. The show should start soon."

Little Egypt is a woman. Little Egypt is in the ST-room. Little Egypt is scenery. The description of Little Egypt is "Little Egypt is a beautiful woman who is draped in flowing silk veils which she skillfully uses as part of the dance. Her attire consists of a sparkling, sequined bodice and a flowing skirt, adorned with jingling coin belts and jewelry that accentuate her movements.". understand "silk", "veils", "bodice", "sequined", "sequins", "flowing", "skirt", "jingling", "coins", "belts", "belt" and "jewelry" as Little Egypt.

A sheer veil is a wearable thing. understand "pink" as the sheer veil. The description of the Sheer Veil is "This is a sheer pink veil that Little Egypt wore (and removed) during her show. Your head swims as you smell the scent of her perfume on the veil: Pyramid Patchouli.".

instead of smelling the sheer veil, say "The smell of Pyramid Patchouli fills your head.".

after wearing the sheer veil, say "You wrap the veil around your head, shrouding your eyes. The world is a lovely color pink as you look through the veil while her perfume fills your nostrils in the most delightful way. You look pretty!"

the show tent is a thing in the ST-room. it is scenery. The description is "You are inside the Little Egypt Show. The attraction[']s facade is to the east. There are folding chairs organized neatly in rows.". 

The Stage is here. The Stage is scenery. understand "market", "palace" as the stage. The description of the Stage is "The stage is decorated to resemble an Middle Eastern palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Scents of incense waft through the air, enhancing the atmosphere of mystique. The canvas displays painted scenes of pyramids, desert landscapes, and domed structures to evoking a sense of being transported to the 'Middle East'."

some painted scenes are here. they are scenery. understand "pyramids", "pyramid", "desert", "landscapes", "domed", and "structures" as the painted scenes. the description is "The canvas displays painted scenes of pyramids, desert landscapes, and domed structures .".

some incense is here. they are scenery. the description is "The smell of incense and spices wafts through the tent.". understand "spices" as incense.
instead of smelling when the location is the ST-room, try examining the incense instead.

instead of listening when the location is the ST-room, say "The soft sounds of unfamiliar music fill the air.".

some fabric is here. they are scenery. understand "fabrics" as fabric. the description is "The linen and silk fabrics come in all different colors.".

some brass ornaments are here. they are scenery. the description is "There are highly polished incense holders and brass lanterns here.". understand "polished", "holders", "holder", and "brass" as brass ornaments.

The canvas display is here. It is scenery. understand "backdrop" as canvas display. The description of the canvas display is "Elegantly painted on linen, the backdrop shows scenes of Middle Eastern life.".

some finger cymbals are here. they are scenery. the description is "The cymbals are placed on the thumb and index finger of each hand. Tapping them together produces a ringing sound.".

The sword is here. It is scenery. The description is "This is a beautiful silver sword with a filigreed handle and blade.".

The wall is a scenery container. The wall is here. The description is "[if the wall contains the lantern]Hanging on the wall is a lantern.[otherwise]You see nothing special about the wall.[end if]". Understand "walls" as wall.

A lantern is an electric lamp. It is in the wall. Understand "lamp" and "lanterns" as the lantern. The description of the lantern is "This is a highly polished brass lantern.".

a  musical instrument is here. it is scenery. understand "instruments", "oud", "darbuka", and "zurna" as musical instrument. the description is "[The noun] is of traditional Middle Eastern origins.".

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

A room called the FW-room is outdoors. The printed name of the FW-room is "Ferris Wheel". The FW-room is east of the HS-room. "The Ferris wheel dominates the carnival, its bright lights visible from every corner. Its massive steel frame arches high, with colorful gondolas swaying as it turns. At night, flashing in bursts of red, green, and white, the wheel dazzles with lights. The air buzzes with the hum of the motor. The operator calls, 'Step right up! The best view of the carnival awaits!' From the top, riders get a panoramic view of the fairgrounds, with city lights stretching to the horizon."

The Ferris Wheel attendant is an attendant in the FW-room. 

instead of giving the Ferris wheel ticket to the Ferris wheel attendant:
	say "You give [the noun] to [the second noun].";
	choose a row with an object of the noun in the Table of Tickets;	
	now the price of the noun is the price entry;
	now the noun is carried by the cashier;
	now ferris wheel ridden is true;
	say "[line break]As you enter the gondola, the safety bar clicks into place, and the Ferris wheel begins its ascent. The sounds of the carnival fade, replaced by the hum of machinery and a soft breeze. At the peak, the carnival sprawls below, its lights twinkling against the twilight sky. The world falls quiet up here. The gondola sways gently, adding excitement to the serene view. From the top you can see something to the west of the concession stand. As you descend, the sounds of the carnival return, bringing you back to the fun."

a Ferris Wheel safety bar is here. it is scenery. the description is "The safety bar is locks into place ensuring you don[']t tumble out of the gondola.".
instead of examining the Ferris Wheel safety bar, say "The safety bar is locked in place.".

The gondola is here. it is scenery. understand "gondolas" as gondola. The description is "Each gondola, painted in bright hues like red, yellow, and blue, dangles from the wheel, swaying gently as it turns."

a view is here. it is scenery. the description is "From the peak of the Ferris Wheel., riders can see the entire fairground: the spinning lights of the rides, the colorful stripes of game booths, and the winding paths of visitors navigating the midway. Beyond the carnival, the view stretches to the horizon, with city lights adding to the magical experience. From the top you can see something to the west of the concession stand.".

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
	
The BC-room is a room. The printed name is "Bumper Cars". The BC-room is northwest of the TB-room. The BC-room is outdoors. "The bumper cars are a lively scene of flashing lights and vibrant decorations. The arena is surrounded by padded barriers, ensuring the rider[']s safety. Cars in faded reds, blues, yellows, and greens glide across the slick floor, each equipped with a steering wheel and padded bumper. Riders maneuver their cars with intensity, creating a din of bumps and laughter. Overhead, electric poles hum with energy. While onlookers cheer from the sidelines, the bumper cars offer playful competition and nostalgic fun for all. The Ticket Kiosk is southeast of here."

The Bumper Cars attendant is an attendant in the BC-room. 

instead of giving the bumper cars ticket to the bumper cars attendant:
	say "You give [the noun] to [the second noun].";
	choose a row with an object of the noun in the Table of Tickets;	
	now the price of the noun is the price entry;
	now the noun is carried by the cashier;
	say "[line break]You hand your ticket to the attendant and slide into the bucket seat, gripping the wheel as the arena comes alive with flashing lights and the hum of electric currents. Riders lock eyes, eager for the ride to begin.

The car jolts forward, and you steer into the fray. A sudden crash spins you around, but you recover and aim for a friend. Each collision is met with laughs as you dodge, swerve, and plot your next move in the chaos.

You find yourself giddy as you exit the ride."

A thing called the Bumper Cars are in the BC-room. The Bumper Cars are scenery. understand "car" as the bumper cars. The description of the Bumper Cars is "The Bumper Cars are small, colorful, electric-powered vehicles equipped with a padded outer rim to absorb impacts. This allows riders to safely bump into each other as part of the game. The ceiling has a conductive surface that powers the cars. Riders enjoy the challenge of maneuvering away from — or into — other drivers."

some padded barriers are here. they are scenery. the description is "The padded barriers ensure a safe experience for the riders. ".
some padded bumpers are here. they are scenery. the description is "The padded bumper on each car is designed to absorb the impact of collisions.".
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
	
FT-room is a room. The printed name is "Fortune Teller". The FT-room is outdoors. The FT-room is southeast of the TB-room. "Approaching the fortune teller's booth, you are drawn in by its mysterious allure and inky softness. Draped in deep purple curtains adorned with golden moons and stars, the booth is lit only with the flickering of candles. The air is heavy with the scent of incense, mingling with and then overpowering the ever-present sugary odor of carnival treats. A sign sways slightly in the evening breeze."

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

Esmeralda is a woman in the FT-room. Understand "mysterious/woman/esmerelda", and "fortune teller" as Esmeralda. The description of Esmeralda is "The fortune teller sits in a dimly lit booth, draped in rich fabrics of deep purple and gold adorned with celestial patterns of stars and moons. Her appearance is enigmatic, with piercing eyes that seem to look right through you and a knowing smile that hints at secrets yet untold. She wears flowing robes embellished with shimmering beads, and a jeweled headpiece catches the flickering light of nearby candles."

a thing called a fortune is here. it is scenery. the description is "You ponder the ramifications of having your fortune told.".

instead of giving the fortune teller ticket to Esmeralda:
	say "You give [the noun] to [the second noun].";
	choose a row with an object of the noun in the Table of Tickets;	
	now the price of the noun is the price entry;
	now Esmeralda carries the fortune teller ticket;
	say "[line break]Stepping inside, you’re greeted by Esmeralda, a figure cloaked in flowing robes with a jeweled headpiece catching the flickering light. Her piercing eyes seem to look right through you as they gesture for you to sit at a small round table. At its center rests a glowing crystal ball, surrounded by tarot cards and mysterious trinkets.

Esmeralda[’]s voice is low and melodic, weaving an air of intrigue as they ask you to focus on a question and offer you a tarot reading. The room seems to shrink, the bustling carnival outside fading into the background as she reveals your fate. Each card turned feels significant, as though unlocking a secret you didn’t know you carried."

instead of asking Esmeralda about "fortune", say "You[']ll need a ticket if you want me to reveal your future.".
instead of asking Esmeralda about "me", say "You[']ll need a ticket if you want me to reveal your future.".

Fortune Teller AutoPlay is a scene. 
Fortune Teller AutoPlay begins when Esmeralda carries the Fortune Teller ticket.
Fortune Teller AutoPlay ends when the index is 6.

last category is text that varies. last category is usually "".
last card is text that varies. last card is usually "".
last card description is text that varies. last card description is usually "".
tarot reading is a number that varies. tarot reading is usually 1;

When Fortune Teller AutoPlay begins:
	now tarot reading is a random number between 1 and 3;
	now index is 1.
	
Instead of doing something other than waiting, looking, listening, smelling, or examining during Fortune Teller AutoPlay:
	say "You[']re much too entranced by the tarot reading to do anything other than listen to Esmeralda!".
	
When Fortune Teller AutoPlay ends:
	say "As the reading concludes, Esmeralda gazes into your eyes with a cryptic smile and delivers their final words of wisdom: 'The order of things is important. Alphabetically and numerically; one follows another and provides the link between the two. If you will learn, think on this carefully. Also, don[']t trust Whidbey. He[']s up to something.' 

Whether you leave with a sense of wonder or unease, the encounter lingers with you — it[']s a touch of magic amid the bustling carnival, as if you’ve glimpsed something beyond the ordinary.";
	now the fortune teller ticket is carried by the cashier.

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

instead of asking Esmeralda about a topic listed in the Table of Esmeralda Conversation Responses:
	say "[response entry][paragraph break]";
	if the turn stamp entry is -1 and the subject entry is not "NA":
		now the turn stamp entry is the turn count;
		let S be the subject entry;
		let W be the weighting entry;
		choose a row with a category of S in Table of Notebook;
		now total entry is total entry plus W;
		now total evidence is total evidence plus W.
		
instead of showing something to Esmeralda:
	if there is an object of the noun in the Table of Esmeralda Object Responses:
		choose a row with an object of noun in the Table of Esmeralda Object Responses;	
		say "[response entry][paragraph break]";
		let S be the subject entry;
		let W be the weighting entry;
		if the turn stamp entry is -1 and S is not "NA":
			now the turn stamp entry is the turn count;
			choose a row with an category of S in Table of Notebook;
			now total entry is total entry plus W;
			now total evidence is total evidence plus W.
		
instead of telling Esmeralda about something: try asking the noun about it.

Section 15 - Carousel

After going northeast from the TB-room when the CR-room is unvisited:
	if show images is true, display Figure of Carousel;
	continue the action.
	
Before looking when the location is the CR-room:
	if show images is true, display Figure of Carousel.

The Carousel attendant is an attendant in the CR-room. 

The CR-room is a room. The CR-room is outdoors. The printed name is "Carousel". The CR-room is northeast of the TB-room. "The carousel radiates charm with its brightly painted horses, lights, and calliope music. The platform features a canopy of colors and decorative mirrors. Hand-carved animals, including horses, lions, tigers, and sea dragons, circle as the carousel spins. The animals rise and fall gently, adding to the charm. The music rises from the Carousel inviting riders of all ages to enjoy this most basic symbol of the carnival.

The Ticket Kiosk is back to the southwest; the way you came."

instead of giving the carousel ticket to the carousel attendant:
	say "You give [the noun] to [the second noun].";
	choose a row with an object of the noun in the Table of Tickets;	
	now the price of the noun is the price entry;
	now the noun is carried by the cashier;
	say "[line break]Stepping onto the carousel, you're surrounded by colorful beasts, glittering lights, and carved details. The cheerful calliope music fills the air as you choose your mount – a galloping horse, a snarling lion, or a graceful giraffe. Gripping the pole, you settle into the saddle as the carousel begins to spin.

As it speeds up, the world blurs in a swirl of colors, and the gentle rise and fall mimics a playful gallop. Laughter mixes with the music, creating a nostalgic atmosphere.

As the ride slows, you step off smiling, the music still echoing in your ears, and return to the bustling carnival."

Understand "merry-go-round" and "merry go round" as carousel.
A thing called the Carousel is in the CR-room. The Carousel is scenery. The description of the Carousel is "The carousel features intricately decorated, moving figures such as horses, chariots, and sea dragons, all mounted on poles. The figures move up and down in an endless chase accompaniment of cheerful, calliope music. Illuminated by bright, twinkling lights, the carousel creates a magical atmosphere.".

instead of listening when the location is the CR-room, say "The carousel[']s warm, playful tunes drift across the midway, inviting riders of all ages to enjoy its simple delight.".

the calliope is here. it is scenery. The description is "The sounds of the calliope fill the air with pleasant music.".
some mirrors are here. they are scenery. the description is "You gaze at yourself in the mirror and think you look pretty good.". Understand "mirror" as mirrors.
a thing called the animals are here. they are scenery. the description is "The carousel is populated with creatures like lions, tigers, and sea dragons, adding whimsy to the ride.". Understand "animal" as animals.
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

The Hell Ride attendant is an attendant in Head of the Line. 

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

Dark Passage is a room. Dark Passage is east of the Ride Entrance. "This room is backstage at the [story title] attraction. The room is littered with bags of trash, piles of junk, and dust bunnies so large they should be paying rent. There an exit to the south and west."

some dust bunnies are scenery. The dust bunnies are here. Understand "bunnies" as dust bunnies. The description of the dust bunnies is "These are some massive dust bunnies. Be careful, I[']ve heard they bite."

some bags of trash are scenery. The bags of trash are here. Understand "bags" and "trash" as bags of trash. The description of the bags of trash is "The bags of trash are piled in the corner."

A pile of junk is a scenery container. The pile of junk is in the dark passage. The pile of junk contains the flashlight. Understand "piles" and "junk" as pile of junk. The description of the pile of junk is "This is a pile of assorted flotsam and jetsam from the carnival. None of it looks very interesting."

instead of looking under when the noun is the pile of junk:
	try examining the pile of junk instead. 

The flashlight is an electric lamp. understand "light" and "torch" as flashlight. The description of the flashlight is "This is a flashlight. It[']s a nice one."

Section 3 - Maintenance Office

After going south from the dark passage when the Maintenance Office is unvisited and the the player carries a lit electric lamp:
	if show images is true, display Figure of MaintenanceOffice;
	continue the action.
			
Before looking when the location is the Maintenance Office and the the player carries a lit electric lamp:
	if show images is true, display Figure of MaintenanceOffice.

The Maintenance Office is a dark room. The maintenance office is south of the dark passage. "The maintenance office is a dim, cluttered space, filled with the smells of grease, sweat, and popcorn. Disorganized shelves are lined with tools and parts, while paint cans and grease jars clutter the workbenches. A battered desk holds wires, gears, and springs, with a bent piece of metal in a vise.

A flickering fluorescent light barely brightens the room. In one corner, a disassembled ride mechanism hangs with chains and pulleys. A greasy manual and a half-empty coffee mug sit on a nearby stool.

Faded safety posters and a worn photo of the carnival decorate the walls, along with a corkboard full of schedules and notes[if the worn photo is in the location], and a worn photo of the carnival in its prime[end if]. The floor is gritty with dust and scattered nails. Despite the mess, the room buzzes with purpose and keeps the carnival running, fueled by sweat and ingenuity.

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
a corkboard is here. it is scenery. The description is "The corkboard is covered with schedules and notes.".

instead of listening when the location is the maintenance office, say "You can hear a clock ticking softly nearby.".

The worn photo is here. Understand "picture" as the worn photo. The description of the worn photo is "This is a photo of the carnival in its heyday! A ragtag bunch of people are featured in the picture in front of the [story title] facade. On the back reads a date: '03/22/62'.[if the carnival office is visited] This looks like the same photo you found in the Carnival Office.[end if]"

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

some scissors are in the drawer. The description is "This is a sharp pair of office scissors.". The scissors are plural-named.
A stapler is in the drawer. The description is "This is a red stapler." 
A ballpoint pen is in the drawer. The description is "Your standard ballpoint pen. It says Bic on the side." 
A pad of paper is in the drawer. The description is "This is a pad of lined paper."

An aqua colored door is a wooden door. The color of the aqua colored door is aqua.The description of the aqua colored door is "It[']s [printed name of item described]. It has the word 'Stocks' written on it." The silver key unlocks it. the aqua colored door is west of the Maintenance Office and east of the Stocks Room. 

The ladder is an open door. A ladder is up from the Maintenance Office and down from the Dark Hallway.The description of the Ladder is "It[']s a typical 10 foot ladder."

Instead of climbing a ladder:
	try entering the noun.

Section 4 - Crawl Space

The Crawl Space is a dark room. The Crawl Space is south of Maintenance Office. "The crawl space beneath the ride is cramped and dark, filled with the hum of machinery above. The air is thick with oil and rust. Sounds echo — groaning steel, clanking chains, and the rhythmic thrum of motors.

The ground is uneven, a mix of dirt, gravel, and scattered tools. Pipes overhead are wrapped in fraying insulation, crackling as you move. Small puddles of murky water collect.

The backstage area continues north and south."

A crimson colored door is a wooden door. The color of crimson colored door is crimson. The description of crimson colored door is "It[']s [printed name of item described]. It has the word 'Gallows' written on it." The silver key unlocks it. crimson colored door is west of the Crawl Space and east of the Gallows Room. 

some tangled wires are here. they are scenery. the description is "Scattered on the floor are some hopelessly tangled wires.". the tangled wires are plural-named.
some forgotten tools are here. they are scenery. the description is "Scattered on the floor are some long forgotten tools.".
some gravel is here. it is scenery. understand "dirt" as gravel. the description is "The dirt and gravel digs into your clothes and through to your skin. You hope you don[']t ruin your clothes.".
the network of pipes is here. The network of pipes are scenery. The description of the network of pipes is "The pipes head in every direction.".
The insulation is here. The insulation is scenery. The description of the insulation is "The insulation is ratty and not doing much good to protect the cables and pipes.".
some small puddles are here. they are scenery. the description is "You move gingerly to avoid the puddles. It[']s much more pleasant to be dry.".
some scraps of metal are here. they are scenery. the description is "These scraps are mostly angle iron and scaffolding.".

instead of listening when the location is the crawl space, say "You can hear the hum of the machinery above.".
instead of smelling when the location is the crawl space, say "The air is stale and heavy, carrying the sharp metallic scent of oil and the faint tang of rust.".

Section 5 - Mechanical Room North

The Mechanical Room North is a dark room. The Mechanical Room North is south of the Crawl Space. "The north mechanical room is compact, housing auxiliary systems for the ride. A soft hum of capacitors and relays fills the space, interrupted only by the occasional hissing of hydraulic fluid.

Circuit breaker panels line the walls, labeled for different functions. Cables and conduits connect the systems to the main hub. Flickering with gauges, a hydraulic pump in the corner manages lifting arms and platforms.

A small workbench is cluttered with parts, while shelves above hold spare parts like cables and hydraulic tubing. A faded ride diagram with red annotations is pinned nearby. Dimly lit, the room feels cool and damp.

There are exists north and south." 

The toolbox is a closed openable container in the Mechanical Room North. The toolbox is fixed in place. Understand "tool", "box", and "tool box" as toolbox. The description of the toolbox is "This is a toolbox. I bet it contains tools."

an adjustable wrench is in the toolbox. The description of the adjustable wrench is "Just one of the many tools used to maintain the carnival.".
some channel locks are in the toolbox. The description of the channel locks is "Just one of the many tools used to maintain the carnival.".
a hammer is in the toolbox. The description of the hammer is "Just one of the many tools used to maintain the carnival.".
a sledgehammer is here. understand "sledge" as sledgehammer. The description of the sledgehammer is "This is an eight pound sledgehammer. Feels really hefty.".

instead of listening when the location is the mechanical room north, say "You hear the subdued hum of capacitors and relays.".

some capacitors are here. they are scenery. understand "capacitor", "relay", and "relays" as the capacitors. the description is "The subdued hum of capacitors and relays fills the air.".
some mechanical cables are here. they are scenery. understand "wires" as the mechanical cables. the description is "The cables snake along the walls.".
some circuit breaker panels are here. understand "breakers" as the circuit breaker panels. they are scenery. the description is "These are electrical panels for other parts of the carnival.".
a mechanical bulb is here. the printed name is "bulb". it is scenery. The description is "This single bulb is feebly trying to light the room.".
a hydraulic pump is here. It is scenery. The description is "This is some of the equipment that keeps the carnival running smoothly.".
some gauges are here. They are scenery. The description is "The room is full of gauges reporting on the condition of the carnival.".
some tools are here. They are scenery. The description is "Just some of the many tools used to maintain the carnival.".
a mechanical workbench is here. It is scenery. Understand "work", "bench" as the mechanical workbench. The description is "The workbench is covered in all manner of things.".
hydraulic tubing is here. It is scenery. understand "spare" and "parts" as hydraulic tubing. The description is "Wires, spare parts, and hydraulic tubing is here.".
a diagram is here. It is scenery. The description is "This is an electrical diagram for something.".

An emerald colored door is a wooden door. The color of emerald colored door is emerald. The description of emerald colored door is "It[']s [printed name of item described]. It has the word 'Stake' written on it." The silver key unlocks it. emerald colored door is west of the Mechanical Room North and east of the Stake Room. 

Section 6 - Mechanical Room South

The Mechanical Room South is a dark room. The Mechanical Room South is south of the Mechanical Room North. "The south mechanical room is the heart of the ride, with a massive motor powering the thick belts, pulleys, and gears. Electrical panels line the walls, flashing 'High Voltage' and colorful indicator lights.

Conduits and wires snake across the ceiling, connecting systems. A cluttered table holds tools, spare parts, and maintenance logs stained with grease. The air smells of oil, metal, and ozone.

A cooling fan struggles to cut the warmth as the hum of machinery mixes with the hiss of hydraulics and clinking chains. The floor is a patchwork of metal grates and worn concrete. Fluorescent lights illuminate the room, where every movement is precise and controlled.

You can travel north and south from here." 

some panels are here. they are scenery. understand "electrical panel" and "panel" as the panels. the description is "These are electrical panels controlling other parts of the carnival.".
some conduit wires are here. they are scenery. the description is "The wires snake across the ceiling, in and out of the conduits.".
some conduits are here. they are scenery. the description is "The labeled conduits and wires snake across the ceiling.".
some thick belts are here. They are scenery. understand "pulleys", "gears", and "lights" as thick belts. The description is "The table is covered with belts, lubricants, gears, pulleys, gears and bolts.".
a cluttered table is here. It is scenery. understand "bolts" and "lubricants" as the cluttered table. The description is "The table is covered with belts, lubricants, gears, pulleys, gears and bolts.".
a cooling fan is here. It is scenery. The description is "This is an overworked fan.".
some mechanical room chains are here. they are scenery. the description is "The chains clink as they sway against the vibrations of the machinery.".
some machinery is here. they are scenery. understand "machines", "equipment", and "motor" as machinery. the description is "There is all manner of unidentifiable equipment here.".
some maintenance logs are here. they are scenery. the description is "These logs record the dates, times, and repairs made for the carnival rides. You notice that [story title] is conspicuously missing from the logs. One week, the bumper cars were missing from the schedule.".
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
		otherwise if (the noun is the bubblegum or the second noun is the bubblegum) and the bubblegum is not chewed:
			say "It[']s a hard square of bubblegum and won[']t stick to the fuse.";
		otherwise:
			say "Nothing happens.".

instead of taking when the noun is contained by the grate, say "Your fingers won[']t fit inside the grate. You can[']t reach [the noun].[if fuse5 is contained by the grate] If only you could grab [the noun] with something.[end if]".

A gray colored door is a wooden door. The color of gray colored door is gray. understand "door" as gray colored door. The description of gray colored door is "It[']s [printed name of item described]. It has the word 'Dungeon' written on it." The silver key unlocks it. gray colored door is west of the Mechanical Room South and east of the Dungeon. 

Section 7 - Generator Room

The Generator Room is a dark room. The Generator Room is south of the Mechanical Room South. "The generator room is small, with concrete walls stained by oil and grime. The air smells of diesel, metal, and damp earth.

The main generator hums, connected by thick cables to circuit breakers and a cluttered panel with switches and gauges. A flickering display shows power levels.
The cracked floor is littered with puddles. Shelves hold spare parts and manuals, and a workbench sits next to a grease canister.

The room is the carnival's power source, hidden but essential.

The backstage area continues north and south of here." 

a workbench is here. it is scenery. the description is "This is a work bench. For working on things.".
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

The Storage Room is a dark room. The Storage Room is south of the Electrical Room. "The storage room is cramped and hidden, with rusted walls and peeling wood. The air smells of dust, damp canvas, and stale popcorn.

Shelves are packed with light bulbs, wire, and old ride parts. Flags, lights, and crates of toys clutter the space. In one corner, tarps and tent poles are stacked.

Spare ride seats and an old carousel horse sit under tarps in the center. A cluttered desk holds schedules and coffee cups, with a bulletin board full of flyers. A flickering bulb casts uneven shadows.

The concrete floor is littered with scraps and dirt. Rats scurry and cobwebs move. This forgotten room stores the remnants of the carnival, waiting to be revived.

There is an exit to the north."

some empty coffee cups are here. they are scenery. the description is "People just use the desk as a trash can.".
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
When Hell Ride AutoPlay ends:
	end the story saying "You have died!".
	
Instead of doing something other than waiting, looking, listening, smelling or examining during Hell Ride AutoPlay:
	say "You[']re enjoying the ride so much that you don[']t want to do anything but sit and watch the ride go by."
	
index is a number that varies. index is usually 1.		
every turn during Hell Ride AutoPlay:
	if index is not the number of rows in the Table of Hell Ride Events:
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
some grotesque shapes are here. understand "shadowy" and "figures" as grotesque shapes. they are scenery. the description is "Shadowy figures in the shape of demons can be seen through the door.". The grotesque shapes are plural-named.
some twisted paths are here. they are scenery. the description is "The paths lead through the darkness into [story title].". The twisted paths are plural-named.
some flashes of light are here. they are scenery. the description is "Flashes of sickly green light reveal twisted paths and grotesque shapes in the dark of the ride.". The flashes of light are plural-named.

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
After going north from the Gallows Room when the Stocks Room is unvisited:
	if show images is true, display Figure of RideStocks;
	continue the action.
	
Before looking when the location is the Stocks Room:
	if show images is true, display Figure of RideStocks.

Stocks Room is south of the Ride Entrance. "[description corresponding to the locale of Stocks Room in the Table of Hell Ride Events]"

The wooden stocks are a supporter in the Stocks Room. The wooden stocks are fixed in place. understand "beams" as wooden stocks. The description of the wooden stocks is "At the square[']s center stand a row of crude wooden stocks, their heavy beams stained from years of weather and use. Iron clasps hold the unfortunate captives by their wrists and necks, their bodies forced into unnatural, humiliating postures.".
the stocks public square is here. it is scenery. the description is "The public square is a cobblestone expanse bordered by weathered timber-framed buildings.".
some animatronics are here. they are scenery. understand "wax", and "figures" as animatronics. the description is "The animatronics and wax figures are extremely life like. [story title] sure lives up to its name.".
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
After going north from the Stake Room when the Gallows Room is unvisited:
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
After going north from the Dungeon when the Stake Room is unvisited:
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
After going north from the Guillotine Room when the Dungeon is unvisited:
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
After going north from the Ride Exit when the Guillotine Room is unvisited:
	if show images is true, display Figure of RideGuillotine;
	continue the action.
	
Before looking when the location is the Guillotine Room:
	if show images is true, display Figure of RideGuillotine.
	
after going south from the dungeon:
	if the guillotine room is unvisited:
		say "As you enter the room, you can see Mr Whidbey across the way. He seems to be doing something around the guillotine platform. You walk closer to see what he is doing and startle him. Mr Whidbey spins around and glares at you. As he turns and walks out of the room, you think you saw him drop something.";
	continue the action.

after going north from the ride exit:
	if the guillotine room is unvisited:
		say "As you enter the room, you can see Mr Whidbey across the way. He seems to be doing something around the guillotine platform. You walk closer to see what he is doing and startle him. Mr Whidbey spins around and glares at you. As he turns and walks out of the room, you think you saw him drop something.";
	continue the action.

The Guillotine Room is south of the Dungeon. "[description corresponding to the locale of Guillotine Room in the Table of Hell Ride Events]"

The guillotine platform is in the Guillotine Room. The guillotine platform is a supporter. Understand "scaffold" as guillotine platform. The description of the guillotine platform is "At the center of the square stands a raised wooden platform, stark and imposing, where the grim sentence is to be carried out. You can just make out something underneath the platform in the dark." 

some pliers underlie the guillotine platform. The description of the pliers is "It[']s an ordinary pair of pliers but you can[']t help but wonder why they are in the guillotine room and not in a tool box somewhere.".

a thing called a guillotine is here. it is scenery. The description is "The guillotine looms over the public square, its blade gleaming faintly in the dim light.".

a lone figure is here. it is scenery. understand "condemned/man" as the lone figure. the description is "A lone figure stands on the scaffold, bound hands behind their back and head bowed low, avoiding the crowd[']s gaze.".

a guillotine executioner is here. it is scenery. the description is "The executioner - a hooded figure in black - stands ready beside the guillotine."

the town crier is here. it is scenery. the description is "The town crier proclaims the crime: 'High treason against the crown. Let this be a warning to all who defy the realm!'".

the guillotine crowd is here. it is scenery. understand "children" as the guillotine crowd. the description is "The crowd encircles the platform, emotions ranging from jeers and curses to silent, grim observation. Children sit on shoulders, their curious eyes unaware of the event[']s gravity.".

a crow is here. it is scenery. the description is "The crow sits, sleek and black, on a nearby rooftop."

a thing called the guillotine cars are here. understand "car/hell/ride" or "hell ride cars" as guillotine cars. the printed name is "[story title] cars". they are scenery. the description is "The cars keep coming and move under the malfunctioning guillotine. You shudder at just the thought of it".


Section 8 - Ride Exit

After going south from the Guillotine Room when the Ride Exit is unvisited:
	if show images is true, display Figure of RideExit;
	continue the action.
	
Before looking when the location is the Ride Exit:
	if show images is true, display Figure of RideExit.

The Ride Exit is south of the Guillotine Room. "[description corresponding to the locale of Ride Exit in the Table of Hell Ride Events]"

The merchandise attendant is an attendant in the ride exit.

The merchandise stand is scenery in the Ride Exit. The merchandise stand is a container. Understand "display" as merchandise stand. The description of the merchandise stand is "The stand is bathed in red light, adding to the ominous mood." 

some Plastic Bones are in the merchandise stand. The price of the plastic bones is $1.00. The description is "This is a collection of plastic bones meant to decorate your yard."

some Devil Horns are in the merchandise stand. The price of the devil horns is $2.00. The description is "The devil horns tie to your head."

some Key Chains are in the merchandise stand. The price of the key chains is $2.00. The description is "The key chains say 'I Survived [story title]!'"

some T-Shirts are in the merchandise stand. The price of the t-shirts is $7.50. Understand "t-shirt" as t-shirts. The description is "These are black t-shirt with the caption 'I Survived [story title]!'"

There is a price list in the Ride Exit. The price list is scenery. Understand "sign" as price list. The description of the price list is "It[']s a sign displaying the prices of the merchandise.".

instead of reading or examining the price list:
	now sign table is Table of Merchandise;
	show a sign table.
	
the cash register is here. it is scenery. the description is "The cash register accommodates both cash and electronic payments. Too bad you don[']t have a debit card.".
some gift shop walls are here. they are scenery. understand "wall", "flickering", "lights", "erratic", and "shadows" as gift shop walls. The description is "Leading out of the ride a dark corridor with peeling black and red-streaked walls, flickering lights cast erratic shadows on the uneven floor.".
some riders are here. they are scenery. the description is "The riders exit [story title]. Some are laughing while others look rather upset.".
some carnival workers are here. they are scenery. understand "actors" as carnival workers. the description is "The actors are here dressed in their tattered costumes muttering things like 'You made it!'".
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
"Boston"	"More Than A Feeling"	false
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
11	Figure of ControlPanelExit		"The monitor shows the gift shop located at the [story title] exit."

Section 4 - Table of High Striker Prizes

Table of High Striker Prizes
txtindex (text)	object (an object)	description (text)
"1"	teddy bear	"a teddy bear"
"2"	knock-off Swiss army knife	"a knock-off Swiss Army knife"
"3"	fuse13	"a [printed name of fuse13]"
"4"	poster of Taylor Swift	"a poster of Taylor Swift"


Section 5 - Table of Dime Toss Prizes

Table of Dime Toss Prizes
txtindex (text)	object (an object)	description (text)
"1"	small plush monkey	"a stuffed monkey"
"2"	fuse15	"an [printed name of fuse15]"
"3"	poster of Billie Eilish	"a poster of Billie Eilish"
"4"	horseshoe magnet	"a horseshoe magnet"

Section 6 - Table of Pitchers Mound Prizes

Table of Pitchers Mound Prizes
txtindex (text)	object (an object)	description (text)
"1"	fuse3	"a [printed name of fuse3]"
"2"	small plush donkey	"a plush donkey"
"3"	goldfish	"a goldfish in a bowl"
"4"	poster of Lourde	"a poster of Lourde"

Section 7 - Table of Tickets

sign table is a table name that varies. The sign table is Table of Tickets.
To show a sign table:
	repeat through a sign table:
		let T be "[object entry]";
		say "[price entry] [T in title case][if the player carries the object entry] (purchased)[end if][line break]".
		
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
Ride Entrance	"Ride Entrance"	figure of Hell Ride	"The cars for Hell Ride stop here, and the safety bar clicks into place as riders board the cars. Ahead, the grotesque entrance looms — a twisted metal archway adorned with spikes, skulls, and flickering blood-red lights. A faint sulfuric smell mixes with the scent of popcorn.

The 'HELL RIDE' sign pulses above the door, while demon statues with clawed hands seem to beckon. The entrance is shrouded in darkness, broken only by eerie green flashes that reveal twisted paths. Faint whispers and distant organ music grow louder. To one side, the darkness looks a little bit darker than the rest of the room."
Stocks Room	"Stocks Room"		figure of RideStocks	"The public square is a cobblestone stretch surrounded by weathered buildings. The air smells of smoke, damp earth, and a nearby smithy. At the center, old stocks stand with iron clasps holding captives in shameful positions. Their tattered clothes offer little against the cold wind.

The animatronics are lifelike, enhancing the grim atmosphere. The crowd mocks the prisoners, hurling insults and rotten food. Jeers mix with their laughter. The square hums with noise. Unnoticed by the crowd, the sky darkens as the spectacle continues."
Gallows Room	"Gallows Room"	figure of RideGallows	"The public square, wet from morning drizzle, lies under a dark sky. At its center, the gallows loom, ropes swaying. Their eyes fixed on the scene, the crowd stands in silence.

A hooded executioner, cold and focused, adjusts the noose. Pale and bound, the condemned man trembles as his eyes dart around the crowd. Sweat and rain mix on his face as he breathes shallowly.

Vendors shout, children push forward, and an old man whispers prayers. Above, the bell tolls, marking the man’s final moments. A raven watches from the gallows beam. The air is heavy as distant thunder rumbles."
Stake Room	"Stake Room"	figure of RideStake	"The public square is silent, broken only by crackling flames. At its center, three women are bound to wooden stakes, their faces showing defiance, resignation, and terror.

A crowd watches, some jeering, others praying or looking away. Torch in hand, the executioner steps forward igniting the pyre. Flames roar as the women cry out, their voices lost in the heat.

Gray clouds loom above as a raven caws. Church bells toll, marking the tragedy. Some onlookers stay, others quietly leave."
Dungeon	"Dungeon"		figure of RideDungeon	"The dungeon is dark and damp, the air thick with sweat, blood, and mildew. Lanterns flicker on rusted sconces, casting twisted shadows.

Chains rattle, mixed with distant moans and screams. Water drips from a cracked ceiling, pooling on the blood-dark floor.

Instruments of torture clutter the room: a broken rack, a brazier with bloodstained tools, and a spiked chair. Prisoners endure all these things, bound or writhing in agony.

The torturer moves with cold precision, ignoring the suffering. Above, rats scurry in the shadows, and the heavy, oppressive air thickens with despair."
Guillotine Room	"Guillotine Room"		figure of RideGuillotine	"The public square hums with tension under gray skies. A wooden platform stands at the center, a grim focal point.

A lone figure, hands bound and head bowed, stands on the scaffold. Their tattered clothes reveal a once-gilded past.

The crowd jeers while children watch wide-eyed. The town crier proclaims, 'High treason against the crown!'

The condemned remains silent as the executioner, robed in black, stands beside the guillotine. The blade gleams in the dim light. The crowd’s murmurs die, replaced by silence.

As the condemned approaches, the guillotine’s timing falters. Instead of falling on the scaffold, the blade swings over the cars, threatening any unlucky passenger who passes beneath.

[if hell ride disabled is true]
The guillotine is now completely still. You have managed to disable it before anyone was seriously injured. The authorities are most grateful and cheer your heroics.
[otherwise if the player is not in the hell ride car]There is just one problem: the guillotine is being raised and lowered by some mechanism. It appears that the timing of the guillotine is off and it is being lowered onto the cars instead of between them. If a person were to be in a car as it passed under the guillotine, they would be seriously injured. 

You[']re glad you[']re not in one of those cars now. You must do something to stop it before someone gets hurt!
[otherwise ]Looks like your goose is cooked. Say 'Goodnight, Gracie!' 

You are stupefied as you sit watching guillotine rising and falling, dropping like a stone on the cars in front of you. Thank goodness they are empty. As your turn comes, you raise your hands in a feeble attempt to stop the inevitable.

As you perish, you can see...[end if]"
Ride Exit	"Ride Exit"	figure of RideExit	"The exit of Hell Ride leaves you unsettled. You emerge from a dark corridor, the walls peeling and streaked with black and red. Flickering lights cast shifting shadows on the sloped floor, and the air is damp with a metallic tang. Whispers and distant screams echo softly in the background.

In a small courtyard, a rusted fence draped with cobwebs and plastic bones encloses the area. A worn sign reads, 'You’ve Survived? For Now.' Nearby, carnival workers in tattered costumes watch quietly, muttering, 'Not everyone makes it out.'

The nearby gift shop glows red. The bright lights and sounds of the carnival feel distant and jarring after the oppressive atmosphere of the ride.

The exit ensures [story title] isn’t just an experience — it lingers, blurring the line between thrill and fear.

There is a price list next to the cash register. An attendant is here to assist you with your purchases. The stand has [list of things contained by the merchandise stand] for sale."

Section 11 - Table of Little Egypt Events

Table of Little Egypt Events
description
"The tent is dimly lit, the stage is a fully decorated representation of some Middle Eastern palace, featuring rich, colorful fabrics, brass ornaments, and lanterns casting a warm, flickering glow. Heady incense wafts through the air, softening everything around the edges. Enhancing the mystique, the backdrop displays painted scenes of pyramids, desert landscapes, and domed structures. The colorful onion topped buildings and jewel tones set to the sepia colored landscape have you transported far away."
"Little Egypt emerges, draped in flowing silken veils. Skillfully she twirls using them as part of the dance. A sparkling, sequined bodice opens into a gauze skirt, adorned with jingling coin belts and jewelry that accentuate her dance."
"The performance begins with slow, undulating movements, drawing you into the rhythm of the music. Traditional instruments like the oud, darbuka, or zurna are an accompanying chorus. As the tempo builds, her hips, torso, and hands twist in an intricate and mesmerizing pattern. Little Egypt demonstrates remarkable control and fluidity. She dramatically spins, drops, and shimmies, often punctuating the beat with a quick jingle of her coin belt."
"Little Egypt makes eye contact with you and smiles enigmatically. In her performance she balances a fine silver sword on her head and accents her dance with tinkling finger cymbals."
"The music oscillates between hauntingly slow melodies and rapid, energetic drum beats, a roller coaster of emotion that leaves you entranced. Little Egypt relies on the music's dynamic changes to tell a story with movements reflecting joy, sorrow, seduction, and celebration."
"The performance concludes with a dramatic flourish, an energetic shimmy, a bold spin, and Little Egypt casts off her veils. The dancer takes a bow to thunderous applause, leaving you spellbound by the sensual display."

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

Section 13 - Table of Whidbey Telephone Call

Table of Whidbey Telephone Call
description
"'Hello? Oh, it[']s you.' says Mr. Whidbey."
"Mr. Whidbey listens to the other end of the conversation."
"'I know, I know, but what am I supposed to do. We have to get that Needleman kid more money. Another $15,000 ought to do it.'"
"Isn[']t this why I buy insurance? Don[']t worry. You'll get your piece. Everyone will get their piece."
"Mr. Whidbey says 'I need that money in a hurry though before anyone gets suspicious. If anything happens then you[']ll go down too.'"
"'Ok, I[']ll try to stall for a bit but I won[']t be able to do it for long.'"
"'Hey! What are you doing here? This is area is for employees only,' Mr. Whidbey shouts at you. 'Get out of here. Now!'"

Section 14 - Table of Attendant Conversation Responses

Table of Attendant Conversation Responses
topic	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
"attendant/themselves/himself/herself"	"Attendant"	"NA"	-1	0	"[one of]Oh, you know. I[']m just trying to get through school, make a few bucks, and marry my sweetie.[or]I get a job with the carnival everytime it[']s in town.[or]I should be studying for my SATs but my mom made me get this job.[or]I hope I don[']t have to work Friday night. That[']s when the big game is.[or]I hate this stupid uniform![or]I[']m just waiting for lunch. I[']m starving![at random]"
"hell/ride" or "hell ride"	"Hell Ride"	"Accidents"	-1	3	"[one of][story title] is scary. You won[']t catch me on it![or]Last time I rode [story title], I heard strange noises.[or][story title] is so old that It[']s falling apart. I wouldn[']t ride it.[or][story title] is behind on its maintenance schedule. Might want to skip that one.[at random]"
"carousel/merry/go/round" or "merry-go-round" or "the carousel" or "the merry-go-round"	"Carousel"	"NA"	-1	0	"[one of]I[']ve loved the carousel ever since I was a little kid![or]The lions are my favorite![or]I get dizzy when I ride the Merry Go Round[at random]"
"bumper/car/cars" or "bumper cars" or "bumper car" or "the bumper cars" or "the bumper car"	"Bumper Cars"	"NA"	-1	0	"[one of]The bumper cars are so much fun. You[']re heading for someone[']s car and bam! you get hit instead![or]Last time I was on the bumper cars, I nailed everyone there![or]It[']s fun to knock other people[']s cars around![at random]"
"Ferris/wheel" or "Ferris wheel" or "the Ferris wheel" or "the wheel"	"Ferris Wheel"	"NA"	-1	0	"[one of]Isn[']t the Ferris wheel so romantic? I sure think so![or]Are you and your sweetie going to ride the Ferris wheel?[or]You can see the whole carnival from up there![at random]"
"fortune/teller/Esmeralda/mysterious/woman" or "fortune teller" or "the fortune teller"	"Esmeralda"	"NA"	-1	0	"[one of]Esmeralda? She[']s down-right spooky. I asked her for a tarot reading, and boy, the things she told me![or]Esmeralda? She read my palm. I don[']t know how she knew the things she told me.[or]Esmeralda? She[']s been with the carnival for so long that no one knows how old she is, and yet, she looks so young. She[']s been here forever![at random]"
"high/striker" or "high striker" or "the high striker"	"High Striker"	"NA"	-1	0	"[one of]You[']re a strong guy. Go for it![or]Win a prize for your sweetie![or]Swing the mallet and ring the bell![at random]"
"dime/toss" or "dime toss" or "the dime toss"	"Dime Toss"	"NA"	-1	0	"[one of]Careful now! Don[']t want it skidding off the other side.[or]It[']s just like skipping a stone.[or]Aim carefully and you should get it.[at random]"
"pitchers/mound" or "pitchers mound"	"Pitchers Mound"	"NA"	-1	0	"[one of]Batter, batter, batter, swing batter![or]Pretend you[']re pitching for the Red Sox.[or]Knock [']em down and win a prize![at random]"
"Hell Ride Ticket" or "Carousel Ticket" or "Bumper Cars Ticket" or "Ferris Wheel Ticket" or "Fortune Teller Ticket" or "ticket"	"Tickets"	"NA"	-1	0	"[The noun] says, 'You need to buy a ticket in order to ride the attractions.'"
"parking" or "the parking ticket" or "parking ticket"	"Parking Ticket"	"NA"	-1	0	"[The noun] says, 'You need a parking ticket to leave your car here.'"
"/fuse/fuses/aqua/crimson/emerald/gray/indigo/khaki/magenta/orange/quartz" or "aqua fuse " or "crimson fuse" or "emerald fuse" or "gray fuse" or "indigo fuse" or "khaki fuse" or "magenta fuse" or "orange fuse" or "quartz fuse" 	"Fuses"	"Fuses"	-1	1	"[if the player is carrying a fuse]'That looks like a fuse. Perhaps there[']s an electrical panel where it fits.'[otherwise]'What fuse?'[end if] says [the noun]"
"movies/cinema/theater"	"Movies"	"NA"	-1	0	"[The noun] says, 'There[']s a new horror movie opening on Friday. I want to take my sweetie. Perhaps they[']ll cling to me because they[']re scared.'"
"brewski/brew/beer"	"Beer"	"NA"	-1	0	"'A nice cold Coors Light would taste good about now', [the noun] replies"
"big/game/football/soccer/basketball/hockey/baseball"	"Game"	"NA"	-1	0	"[The noun] says, 'Friday night is the league championship. I hope we win!'"
"SAT/scores/college" or "SAT scores"	"SAT Scores"	"NA"	-1	0	"[The noun] says, 'I hope I get accepted. I want to go to school on a football scholarship.'"
"cheeseburger/lunch"	"Lunch"	"NA"	-1	0	"[The noun] replies, 'I skipped breakfast this morning. Boy, am I hungry!'"
"uniform"	"Uniform"	"NA"	-1	0	"Wearing blue pants and a pink shirt, [the noun] says, 'This is just awful! I look like a lollipop.'"
"little/egypt" or "little egypt"	"Little Egypt"	"NA"	-1	0	"[one of]Little Egypt is so beautiful. She[']s a wonderful dancer too.[or]Did you know Little Egypt really IS from Egypt?[or]Maybe she[']d like to date you.[at random]"
"popcorn/bucket/buttered" or "bucket of popcorn" or "buttered popcorn"	"Concessions"	"NA"	-1	0	"[The noun] says, 'The popcorn is really good. It[']s hot and fresh.'"
"bubblegum/bubble/gum"	"Concessions"	"NA"	-1	0	"'It[']s Bazooka Joe! My favorite!', [the noun] says."
"candy/apple/apples" or "candy apple" or "candy apples"	"Concessions"	"NA"	-1	0	"[The noun] says, 'I can[']t eat these. They get stuck in my braces.'"
"cotton/candy" or "cotton candy"	"Concessions"	"NA"	-1	0	"'I love the way cotton candy melts in my mouth', says [the noun]."
"pretzel/pretzels/soft" or "soft pretzel" or "soft pretzels"	"Concessions"	"NA"	-1	0	"[The noun] says, 'I prefer to eat my pretzels with mustard.'"
"mr/owner/Whidbey"	"Invoices"	"Invoices"	-1	1	"[The noun] says , 'Mr. Whidbey? I guess he[']s alright. He[']s not in any trouble is he?'"
"invoices/receipts/paperwork"	"'Oh, I don[']t know what any of that mumbo jumbo means', says [the noun]."
"insurance/policy" or "insurance policy"	"Insurance Policy"	"Insurance"	-1	0	"'Gosh, I wish I had a million dollars!', [the noun] says."
"accidents/mishaps" or "the accidents"	"Accidents"	"Accidents"	-1	3	 "[The noun] says 'The fire, the Ferris wheel, the Bumper Cars... That seems like a lot!'"
"rides/attractions" or "the attractions"	"Attractions"	"Accidents"	-1	1	"'Almost every ride is falling apart. Honestly, it[']s kind of scary.' says [the noun]."

Section 15 - Table of Notebook

evidence is a kind of thing. evidence has a number called weighting. 

Table of Notebook
category (text)	total (number)	response (text)
"Accidents"	0	"Evidence concerning accidents with the attractions"
"Invoices"	0	"Evidence concerning past due invoices"
"Whidbey"	0	"Evidence concerning Mr Whidbey"
"Insurance"	0	"Evidence concerning insurance"
"Fuses"	0	"Evidence concerning fuses"

Section 16 - Table of Janitor Conversation Responses

Table of Janitor Conversation Responses
topic	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
"janitor/themselves/himself/herself"	"Janitor"	"NA"	-1	0	"I[']m the maintenance engineer for the carnival. I[']ve been working here for the past four years."
"hell/ride/guillotine" or "hell ride"	"Hell Ride"	"Accidents"	-1	5	"'[story title] is a finicky ride. I[']m fixing something there every week. Last week, Mr. Whidbey asked me to skip [story title][']s maintenance slot. There was a real fire in the Stakes Room last month. And just yesterday I caught him creeping around the guillotine room' says [the janitor]."
"owner/Whidbey/mister/mr" or "Mr Whidbey"	"Mr Whidbey"	"Whidbey"	-1	5	"[The noun] says , 'Mr. Whidbey? He creeps me out. It always seems like he[']s hiding something. Just yesterday I caught him sneaking around the guillotine room in [story title].'"
"invoices/receipts/paperwork"or "the invoices"	"Invoices"	"Invoices"	-1	1	"[The noun] says, 'Wow! This doesn[']t look good. It looks like the carnival owes a lot of money! Cash [']N['] Carry provides every day supplies. Why is this overdue? I hope I don[']t lose my job!'"
"insurance/policy" or "insurance policy"or "the insurance policy"	"Insurance Policy"	"Insurance"	-1	3	"'An insurance policy? For a million bucks? Maybe that fire last month wasn[']t an accident' [the noun] remarks."
"carnival"	"Carnival" or "the carnival"	"Whidbey"	-1	1	"'[one of]The Whidbey family has owned this carnival since the 1950[']s[or]Mr. Whidbey is the last of his line. He has no one to leave the carnival to[or]This once proud carnival has seen better days[cycling]' says [the noun]."
"ferris/wheel" or "ferris wheel" or "the ferris wheel"	"Ferris Wheel"	"Accidents"	-1	5	"[The noun] remarks, 'The other day, I found a bolt on one of the gondolas so loose it had almost come off. That would have been a tragedy!'"
"bumper/car/cars" or "bumper cars" or "bumper car" or "the bumper cars"	"Bumper Cars"	"Accidents"	-1	5	"[The noun] says, 'That reminds me. Not long ago, one of the bumper cars was shorting out and electrifying the car. A visitor got hurt. A young lad, what was his name? Fred something, I think.'"
"fred/needleman/visitor" or "fred needleman"	"Bumper Cars"	"Accidents"	-1	5	"[The noun] says, 'That was the kid that got hurt on the bumper cars. It[']s a wonder he didn't sue the carnival for that.'"
"fortune/teller/esmeralda/esmerelda/mysterious" or "fortune teller" or "the fortune teller"	"Esmeralda"	"NA"	-1	0	"'Her fortunes are always crazy accurate. She[']s spooky and so pretty. I wonder if I should ask her out on a date?' [the noun] asks." 
"carousel/merry/go/round" or "the carousel" or "merry go round" or "the merry go round" or "merry-go-round" or "the merry-go-round"	"Carousel"	"NA"	-1	0	"'The carousel is hard to maintain because of all the animals moving up and down. There[']s a lot of moving parts in that one', says [the noun]."
"dime/toss/plate" or "dime toss"or "the dime toss"	"Dime Toss"	"NA"	-1	0	"[The noun] says, 'The problem with that one is that a modern dime weighs 2.268 grams and isn[']t heavy enough to land on the plate. The trick with that one is to find a Mercury dime. It weighs 2.50 grams.'"
"pitchers/mound/milk/bottles" or "pitchers mound" or "milk bottles" or "the pitcher's mound" or "pitchers mound" or "the pitchers mound" or "the milk bottles"	"Pitcher[']s Mound"	"NA"	-1	0	"[The noun] says 'That[']s a tricky one. You have to aim at just the right bottle. Throw the baseball at bottle 5.'"
"high/striker/strongman" or "high striker" or "strong man" or "the high striker" or "the strong man"	"High Striker"	"NA"	-1	0	"'Another rigged game. The mallet isn[']t heavy enough to strike the bell. Find something heavier' says [the noun]."
"fuse/fuses/aqua/crimson/emerald/gray/indigo/khaki/magenta/orange/quartz" or "aqua fuse " or "crimson fuse" or "emerald fuse" or "gray fuse" or "indigo fuse" or "khaki fuse" or "magenta fuse" or "orange fuse" or "quartz fuse" 	"Fuses"	"Fuses"	-1	0	"[The noun] says 'Funny thing about that. The fuses that belong in the electrical panels in the electrical area of backstage seem to be missing. Finding them might help with disabling [story title].'"
"fire"or "the fire"	"The Stake Room Fire"	"Accidents"	-1	3	"'The very real fire in the Stakes Room in [story title] was a scary event. I couldn[']t put it out with a fire extinguisher. We had to wait for the fire department and by then there was a lot of damage done' says [the noun]."
"accidents/mishaps" or "the accidents"	"Accidents"	"Accidents"	-1	3	 "[The noun] says 'The fire, the Ferris wheel, the Bumper Cars... That[']s a lot of suspicious accidents.'"
"rides/attractions" or "the attractions"	"Attractions"	"Accidents"	-1	1	"'Almost every ride is falling apart. I do what I can to keep things in good repair but it[']s a lot of work' says [the noun]."
"games/carnival" or "the carnival games"	"Carnival Games"	"NA"	-1	0	"'Crooked! Everyone of them. There[']s a secret to each one of them' [the noun] says."
"pliers"	"Accidents"	"Accidents"	-1	1	"'My pliers have been missing. Thanks for finding them.' [the noun] says."
"flashlight" or "flash light"	"Accidents"	"Accidents"	-1	1	"'My flashlight! Where did you find it?' [the noun] exclaims."

Section 17 - Table of Janitor Object Responses

Table of Janitor Object Responses
object (object)	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
Cash 'N' Carry invoice	"Cash [']N['] Carry Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Man, this doesn[']t look good for the carnival.'"
Frank's Market invoice	"Frank[']s Market Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Looks like the carnival is in some financial trouble.'"
Oriental Trading  invoice	"Oriental Trading Invoice"	"Invoices"	-1	1	"[The second noun] says, 'These prizes are cheaper and flimsier than usual.'"
Mystic Industries invoice	"Mystic Industries Invoice"	"Accidents"	-1	3	"[The second noun] says, That fire in [story title] was really bad. It took almost two weeks to get it fully repaired. But it shouldn't have cost this much. I think Mr Whidbey got ripped off. Or, he got it fixed on the cheap and pocketed the rest.'"
paperwork	"Paperwork"	"Invoices"	-1	1	"[The second noun] says, 'This all points the finger at mismanagement. I sure hope Mr Whidbey has a plan.'"
insurance policy	"Insurance Policy"	"Insurance"	-1	3	"'An insurance policy? For a million dollars? Something is fishy for sure!' [the second noun] says."
pliers	"The Pliers"	"Accidents"	-1	5	"'I[']ve been missing those. Where did you find them?' asks [the second noun]."
cashier's check	"Cashier's Check"	"Insurance"	-1	5	"[The second noun] says 'What?! That[']s the name of the kid who got hurt in the Bumper Cars incident.'"
fuse1	"Aqua Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse3	"Crimson Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse5	"Emerald Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse7	"Gray Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse9	"Indigo Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel' [the second noun] asks."
fuse11	"Khaki Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse13	"Magenta Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse15	"Orange Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."
fuse17	"Quartz Fuse"	"Fuses"	-1	1	"'Hey! That[']s important. It should be in an electrical panel', [the second noun] says."

Section 18 - Table of Esmeralda Conversation Responses

Table of Esmeralda Conversation Responses
topic	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
"Esmeralda/themselves/herself"	"Esmeralda"	"NA"	-1	0	"Me? I have studied the ancient mysteries and I[']m willing to share them with you. For a ticket, of course."
"hell/ride/guillotine" or "hell ride"	"Hell Ride"	"Accidents"	-1	1	"'[story title] is the flagship ride at Whidbey Amusements. It[']s always made me feel nervous,' says [the noun]."
"owner/Whidbey/mister/mr" or "Mr Whidbey"	"Mr Whidbey"	"Whidbey"	-1	1	"[The noun] says , 'Mr. Whidbey? He creeps me out. He[']s up to something.'"
"invoices/receipts/paperwork"or "the invoices"	"Invoices"	"Invoices"	-1	1	"[The noun] says, 'I knew Whidbey was driving this carnival into the ground. Looks like we[']re all going to have to pay for it now.'"
"insurance/policy" or "insurance policy"or "the insurance policy"	"Insurance Policy"	"Insurance"	-1	1	"'An insurance policy? Looks like Mr Whidbey is up to no good,' [the noun] remarks."
"bumper/car/cars" or "bumper cars" or "bumper car" or "the bumper cars"	"Bumper Cars"	"Accidents"	-1	5	"[The noun] says, 'There was an accident on the bumper cars a couple of weeks ago. One of the riders got a good shock.'"
"fire"or "the fire"	"The Stake Room Fire"	"Accidents"	-1	3	"'There was a fire in one of the rooms in [story title],' says [the noun]."
"accidents/mishaps" or "the accidents"	"Accidents"	"Accidents"	-1	3	 "[The noun] says 'Things sure seem vulnerable at this time.'"
"rides/attractions" or "the attractions"	"Attractions"	"Accidents"	-1	1	"'This carnival seems cursed with bad luck when it comes to the rides,' says [the noun]."

Section 19 - Table of Esmeralda Object Responses

Table of Esmeralda Object Responses
object (object)	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
Cash 'N' Carry invoice	"Cash [']N['] Carry Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially.'"
Frank's Market invoice	"Frank[']s Market Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially.'"
Oriental Trading  invoice	"Oriental Trading Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially..'"
Mystic Industries invoice	"Mystic Industries Invoice"	"Accidents"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially.'"
insurance policy	"Insurance Policy"	"Insurance"	-1	3	"'An insurance policy? For a million dollars? Something is fishy for sure!' [the second noun] says."
cashier's check	"Cashier's Check"	"Insurance"	-1	0	"[The second noun] says 'I know nothing about that.'"

Section 20 - Table of Barker Conversation Responses

Table of Barker Conversation Responses
topic	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
"barker/themselves/himself/herself"	"Barker"	"NA"	-1	0	"I[']ve been the front man for the show ever since Little Egypt and I hired on with the carnival."
"hell/ride/guillotine" or "hell ride"	"Hell Ride"	"Accidents"	-1	1	"'[story title] is our most popular attraction but there always seems to be something wrong with it,' says [the noun]."
"owner/Whidbey/mister/mr" or "Mr Whidbey"	"Mr Whidbey"	"Whidbey"	-1	0	"[The noun] says , 'Mr. Whidbey? He[']s always done right by me.'"
"invoices/receipts/paperwork"or "the invoices"	"Invoices"	"Invoices"	-1	1	"[The noun] says, 'These are pretty disturbing. I wonder if the carnival will close.'"
"insurance/policy" or "insurance policy"or "the insurance policy"	"Insurance Policy"	"Insurance"	-1	1	"What[']s that? An insurance policy? That seems suspicious to me,' [the noun] remarks."
"bumper/car/cars" or "bumper cars" or "bumper car" or "the bumper cars"	"Bumper Cars"	"Accidents"	-1	5	"[The noun] says, 'There was an unfortunate accident on the bumper cars a couple of weeks ago.'"
"fire"or "the fire"	"The Stake Room Fire"	"Accidents"	-1	3	"'There was a fire in one of the rooms in [story title],' says [the noun]."
"accidents/mishaps" or "the accidents"	"Accidents"	"Accidents"	-1	3	 "[The noun] says 'Things sure seem vulnerable at this time.'"
"rides/attractions" or "the attractions"	"Attractions"	"Accidents"	-1	1	"'This carnival seems cursed with bad luck when it comes to the rides,' says [the noun]."

Section 21 - Table of Barker Object Responses

Table of Barker Object Responses
object (object)	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
Cash 'N' Carry invoice	"Cash [']N['] Carry Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially.'"
Frank's Market invoice	"Frank[']s Market Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially.'"
Oriental Trading  invoice	"Oriental Trading Invoice"	"Invoices"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially..'"
Mystic Industries invoice	"Mystic Industries Invoice"	"Accidents"	-1	1	"[The second noun] says, 'Seems like the carnival is in trouble financially.'"
insurance policy	"Insurance Policy"	"Insurance"	-1	3	"'An insurance policy? For a million dollars? Something is fishy for sure!' [the second noun] says."
cashier's check	"Cashier's Check"	"Insurance"	-1	0	"[The second noun] says 'I know nothing about that.'"

Section 22 - Table of Whidbey Conversation Responses

Table of Whidbey Conversation Responses
topic	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
"Mr Whidbey/themselves/himself/herself"	"Mr Whidbey"	"NA"	-1	0	"I[']ve been at the helm of Whidbey Amusements since 1991. We[']ve seen a lot of changes in that time."
"hell/ride/guillotine" or "hell ride"	"Hell Ride"	"NA"	-1	2	"'[story title] is the premier attraction here at Whidbey Amusements. It[']s both spooky and fun! The visitors love it! The fire last month was unfortunate and expensive' says [the noun]."
"invoices/receipts/paperwork" or "the invoices" or "the receipts" or "the paperwork"	"Invoices"	"Invoices"	-1	3	"[The noun] says, 'I know this doesn[']t look good but the cost of consumables go up every week and attendance is down. I have to pinch pennies somehow, don[']t I? And that fire was very expensive to repair.'"
"insurance/policy" or "insurance policy" or "the insurance policy"	"Insurance Policy"	"Insurance"	-1	1	"'An insurance policy? Of course, all reputable businesses have insurance. Even small time carnivals' [the noun] stammers."
"carnival" or "the carnival"	"Carnival"	"Whidbey"	-1	1	"'The Whidbey family has owned this carnival since the 1957', [the noun] says. 'Unfortunately, I am an only child and never married. Alas, the carnival will close when I am gone. But for now, it[']s making a comeback!'"
"ferris/wheel" or "ferris wheel" or "the ferris wheel"	"Ferris Wheel"	"NA"	-1	0	"[The noun] says 'The Ferris Wheel is my favorite ride. It[']s always relaxing and romantic.'"
"bumper/car/cars" or "bumper cars" or "bumper car" or "the bumper cars" or "the bumper car"	"Bumper Cars"	"Accidents"	-1	3	"'That incident the other week with that Needleman kid was unfortunate' says [the noun]."
"fortune/teller/esmeralda/esmerelda/mysterious" or "fortune teller" or "the fortune teller" or "esmeralda"	"Esmeralda"	"NA"	-1	0	"[The noun] says 'I see her regularly to have my fortune told. We[']re lucky to have her here. She[']s very beautiful. It[']s a wonder she[']s never been married.'"
"carousel/merry/go/round/merry-go-round" or "the carousel" or "the merry-go-round" or "the merry go round"	"Carousel"	"NA"	-1	0	"'The carousel is just one of the many rides that thrill and delight our visitors every day,' says [the noun]"
"dime/toss/plate" or "dime toss" or "the dime toss"  or "the plate"	"Dime Toss"	"NA"	-1	0	"'The Dime Toss is is one of the many games that thrill and delight our visitors every day!' says [the noun]."
"pitchers/mound/milk/bottles" or "pitchers mound" or "milk bottles" or "pitcher's mound" or "the pitchers mound" or "the milk bottles" or "the pitcher's mound"	"Pitcher's Mound"	"NA"	-1	0	"'The Pitchers Mound is is one of the many games that thrill and delight our visitors every day!' says [the noun]."
"high/striker/strongman" or "high striker" or "strong man" or "the high striker" or "the strongman" or "the strong man"	"High Striker"	"NA"	-1	0	"'The High Striker is is one of the many games that thrill and delight our visitors every day!' says [the noun]."
"fuse/fuses/aqua/crimson/emerald/gray/khaki/magenta/orange/quartz" or "aqua fuse " or "crimson fuse" or "emerald fuse" or "gray fuse" or "khaki fuse" or "magenta fuse" or "orange fuse" or "quartz fuse" 	"Fuses"	"NA"	-1	0	"'I know nothing about fuses', [the noun] says."
"indigo" or "indigo fuse" or "the indigo fuse" 	"The Indigo Fuse"	"Fuses"	-1	5	"'Where did you get that?' [the noun] asks."
"fire" or "the fire"	"The Stake Room Fire"	"Accidents"	-1	5	"The fire was most unfortunate. It put [story title] out of commission for two weeks. Not only did it cost me $22,500 to repair but I lost revenue while it was closed."
"accidents/mishaps" or "the accidents"	"Accidents"	"Accidents"	-1	1	"[The noun] says, 'Oh, that[']s nothing to worry about. Little things happen all the time, right?'"
"rides/attractions"	"Accidents"	"Accidents"	-1	1	"[The noun] says, 'Oh, that[']s nothing to worry about. Little things happen all the time, right?'"
"pliers"or "the pliers"	"The Pliers"	"Accidents"	-1	3	"'Oh! I thought I lost... um, those belong to the janitor. Where did you find them?' asks [the noun]."
"cashier's/check/fred/needleman" or "fred needleman" or "the check" or "the cashier's check"	"Fred Needleman"	"Insurance"	-1	3	"[The noun] says 'Uh, Fred is a special... contractor... We paid him. For services rendered.'"
"services/rendered/special" or "services rendered"	"Services Rendered"	"Insurance"	-1	1	"'Fred did some work over at the bumper cars' says [the noun]."

Section 23 - Table of Whidbey Object Responses

Table of Whidbey Object Responses
object (object)	description (text)	subject (text)	turn stamp (number)	weighting (number)	response (text)
Cash 'N' Carry invoice	"Cash [']N['] Carry Invoice"	"Invoices"	-1	3	"[The second noun] says, 'Money[']s a little tight. The cost of consumables go up every week.'"
Frank's Market invoice	"Frank[']s Market Invoice"	"Invoices"	-1	3	"[The second noun] says, 'I can[']t keep up with the cost of ingredients. Everything costs so much!'"
Oriental Trading  invoice	"Oriental Trading Invoice"	"Invoices"	-1	3	"[The second noun] says, 'There must be prizes for the games otherwise visitors wouldn[']t play them. Maybe people won[']t win so often.'"
Mystic Industries invoice	"Mystic Industries Invoice"	"Accidents"	-1	5	"[The second noun] says, That fire in [story title] was very expensive to repair. And it put the ride out of commission for two weeks.'"
paperwork	"Paperwork"	"Invoices"	-1	3	"[The second noun] says, 'I know this doesn[']t look good but the cost of consumables go up every week and attendance is down. I have to pinch pennies somehow, don[']t I? And that fire was very expensive to repair.'"
insurance policy	"Insurance Policy"	"Insurance"	-1	5	"'An insurance policy? Of course, all reputable business have insurance. Even small time carnivals', [the second noun] stammers."
pliers	"The Pliers"	"Accidents"	-1	5	"'Oh! I thought I lost... I mean those belong to the janitor. Where did you find them?' asks [the second noun]."
cashier's check	"Cashier's Check"	"Insurance"	-1	5	"[The second noun] says 'Uh, Fred is a special... contractor... We paid him. For services rendered.'"
fuse1	"Aqua Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse3	"Crimson Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse5	"Emerald Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse7	"Gray Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse9	"Indigo Fuse"	"NA"	-1	5	"'Oh, um, where did you get that?' [the second noun] asks."
fuse11	"Khaki Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse13	"Magenta Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse15	"Orange Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."
fuse17	"Quartz Fuse"	"NA"	-1	0	"'I know nothing about fuses', [the second noun] says."

Section 24 - Table of Confrontation

Table of Confrontation
topic	turn stamp (number)	accusation weight (number)	response (text)
"insurance/fraud/policy/corruption/embezzlement" or "insurance fraud" or "insurance policy"	-1	5	"[if total evidence is less than 36]'You have nothing on me', says [the noun].[otherwise if total evidence is less than 76][The noun] says, 'OK, maybe there[']s enough evidence to have me charged with [the topic understood] but you[']ll never make it stick.'[otherwise ]'Ok, I guess you got me. The carnival was losing money and we were going to go out of business. I was desperate to turn things around. 

Then that Needleman kid got hurt on the bumper cars. We filed an insurance claim for it. When he got paid, Needleman asked if we could get more and split it. 

It seemed like a good idea at the time. I could get some extra cash to pay the carnival[']s bills. Then the thought of the money got overwhelming and I thought, 'What if there was a fire and the estimate for repairs was, let[']s shall we say, generous. We could take the extra money, pay bills, and pocket the rest.[end if]"

Section 25 - Table of Janitor Movements

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

Section 26 - Table of Whidbey Movements

Table of Whidbey Movements
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

Section 27 - Introduction to Hell Ride

When play begins:
	choose row 1 in Table of Help Options;
	now description entry is "[story title] - A ride to remember...

You[']re a part-time reporter for The Tribune, the local newspaper. Earlier in the day, your editor called you and told you of a conversation he overheard between the Chief of Police and his Deputy about Whidbey Amusements. It seems there has been a rash of accidents and mishaps at the carnival. Sounds like there could be something suspicious going on. The editor wants you to collect evidence and write a hard hitting piece about this story. If you do a good job, maybe the paper will hire you on full-time.

As you explore the carnival, you learn (the hard way) that the [story title] attraction is malfunctioning with the potential for serious injuries to the riders. You must disable the ride and prevent any loss of life... including your own."

Section 28 - Hell Ride Origins

When play begins:
	 choose row 2 in Table of Help Options;
	 now description entry is "[story title] - A ride to remember...

In the early 1980[']s, I had an Apple [close bracket][bracket]  Plus computer with 64K of RAM, dual 5.25[quotation mark] floppy disks, and a color monitor as big as a television. And the very first game I ever bought was Infocom[']s Zork I: The Great Underground Empire. This was cool. It was all text-based. The game described your surroundings and you interacted with commands that say what you wanted to do. This 'Interactive Fiction' really evoked in a game what I appreciated most about reading: rich descriptions, colorful characters, and the like. After Zork I, there was Zork II and III. Enchanter, Moonmist, Suspect, and so many 
more. I played them all with my best friend Andy.

Andy and I were software developers at the time and we thought, 'We can do this!' So we set out to do this. We developed a game engine with a natural language parser. And it was pretty good. We could support most of the kinds of things they did, certainly less graceful but pretty good. In fact, our parser was better than Infocom[']s in one case where the sentence was ambiguous. e.g. 'Walk into the room with the lamp.' Is the player carrying the lamp? Or is the lamp in the room? 

For fun, we reverse engineered parts of Infocom[']s game format. We found the dictionary, certain text tokens used for text substitution, the game text. We also discovered the first example of compression I had ever seen and it just about made my head explode. They stored all ASCII characters in five bits! Pow! Mind blown. I had never considered anything like that. Just another hook.

We developed two prototypes: Diner and Hell Ride. Diner was about bank robbers coming into the diner where you are a short order cook and you have to save the day. Hell Ride was pretty close to what you find here. I decided to implement it using modern tools. It[']s pretty good. Maybe.

I hope you enjoy it.

d.[line break]
(dmontgom22@gmail.com)"

Section 29 - Credits

Crediting is an action applying to nothing. Understand "Credits" as crediting.
instead of crediting:
	say "[story title], Copyright 2025, Dana Montgomery.[paragraph break]";
	say "Caitlyn Caluya-Bilbruck for her editing and proofreading super powers.[paragraph break]";
	say "The following awesome individuals for their beta testing, excellent feedback, and ideas:[line break]";
	say "Joey Acrimonious[line break]";
	say "Ryan Allocco[line break]";
	say "Andy Broding[line break]";
	say "Drew Cook[line break]";
	say "Max Fog[line break]";
	say "RJ Kowalski[line break]";
	say "John Montgomery[line break]";
	say "Andrew Schultz[paragraph break]";
	say "Additional Credits:[line break]";
	say "The amazing Inform community over at https://IntFiction.org[paragraph break]";
	say "Extensions used in [story title]:[line break]";
	say "[complete list of extension credits][line break]";
	say "The images were generated using ChatGPT.[line break]"
	
Part 5 - Unit Tests

Chapter 1 - Parking Lot

Test Parking with "brief / get blueberries / eat blueberries / give coupon to operator / buy ticket / ask attendant about the ticket stub/ tell attendant about stub / show the stub to the attendant / talk to attendant / l at attendant  / kiss attendant / smell attendant / listen to attendant / touch attendant / taste attendant / screw attendant / darn / damn / get in car / look / l at seat / l under seat / get all dimes / get keys / open glove box / get string / get gloves / wear gloves / set stub on the dashboard / l at the dashboard / get air freshener / look at it / put keys in ignition / turn keys / exit".

Test ToadAway with "brief / test parking / get parking stub / test games / z"

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
Test b1 with "brief / s / s /  s / e / s / turn on radio / u / w / flip switch / push switch / push switch / e / d / l at desk / open drawer / s / s / s / chew bubblegum / tie bubblegum to string / put bubblegum in grate / s / s / ne / drop mallet / get silver key / l at panel / open panel / l at socket / sw / n / n / n / n / n / i"

[get the fuses]
Test b2 with "w / e / s / w / e / s / w / l in pyre / get fuse / e / s / w / e / s / w /  e / s / s / w / l in stand / buy aqua fuse / e / n"

[fill the sockets]
Test b3 with "ne / open panel / put aqua fuse in socket / flip switch / sw / e / open panel / put crimson fuse in socket / flip switch / w / se / open panel / put emerald fuse in socket / toggle switch / nw / sw / open panel / put gray fuse in socket / toggle switch / ne / w / open panel / put indigo fuse in socket / push switch / e / nw / l at panel / unlock panel with knife / l at panel / open  panel / l at panel / l at switch. / l at indicator / l at socket / put khaki fuse in socket / push switch / l at socket / se"

[turn the dials]
test b4 with "n / n / n / n / n / climb ladder / w / l at control panel 1 / turn aqua dial to 1 / turn crimson dial to three / turn emerald dial to 5 / turn gray dial to seven / turn indigo dial to 9 / turn khaki dial to eleven / push aqua button / l at control panel 1 / push crimson button / l at control panel  3 / push emerald button / l at control panel 5 / push gray button / l at control panel 11 / push khaki button"

Test Backstage with "test b1 / test b2 / test b3 / test b4"

Chapter 5 - Concession Stand

Test Concession with "brief / s / steal brass ring / z / z / steal brass key / sw / l at treats / read menu / buy cola / buy popcorn / buy candy apple / buy cotton candy / buy pretzel / buy bubblegum / drink soda / g / g / g / g / w / open trash can / get khaki fuse / e / s / x photo / x safe / turn dial to 62 / turn dial to 22 / turn dial to 3 / open safe / s / open safe / get indigo fuse / n / ne / n / i / score / ".

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
	say "Sometimes the temptation to rely on hints becomes overwhelming, and you may prefer to turn off hints now. If you do so, the hints will be removed from the help menu. Turn off hints? >";
	if player consents:
		now hint usage is denied;
		repeat with N running from 6 to the number of rows in the Table of Help Options:
			choose row N in the Table of Help Options;
			blank out the whole row;
		try asking for help.
	
when play begins:
	 now mn_master_table is the Table of Help Options.
	
[build points awarded text]
when play begins:
	let T be "[fixed letter spacing]Note that not all of these points are awarded. Some are mutually exclusive of others.[paragraph break]";
	repeat through Table of Scored Circumstances:
		let T be "[T][if point value entry is less than 10]  [end if][point value entry] - [description entry][line break]";
	choose row 17 from Table of Help Options;
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
		
[story mode]
This is the story mode status rule:
	if playmode is 2:
		now playmode is 1;
		now the player is autonomous;
	otherwise:
		now playmode is 2;
		now the player is guided.

Table of Setting Options (continued)
title (text)	toggle(rule)
"Image presentation is currently [if show images is true]ON[otherwise]OFF[end if]"	image presentation status rule
"Transcript is currently [if transcript mode is true]ON[otherwise]OFF[end if]"	switch transcript status rule
"Story mode is currently [if playmode is 2]ON[otherwise]OFF[end if]"	story mode status rule

Chapter 2 - Help Options

Table of Help Options
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Introduction to [story title]"	--	""
"[story title] Origins"	--	""
"Introduction to Interactive Fiction"	Table of IF Introduction	--
"Settings"	Table of Setting Options	--	
"Credits"	--	"[story title], Copyright 2025, Dana Montgomery.[paragraph break]Caitlyn Caluya-Bilbruck for her editing and proofreading super powers.[paragraph break]The following awesome individuals for their beta testing, excellent feedback, and ideas:[line break]Joey Acrimonious[line break]Ryan Allocco[line break]Andy Broding[line break]Drew Cook[line break]Max Fog[line break]RJ Kowalski[line break]John Montgomery[line break]Andrew Schultz[paragraph break]Additional Credits:[line break]The amazing Inform community over at https://IntFiction.org.[line break][line break]Extensions used in [story title]:[line break][complete list of extension credits][line break]The images were generated using ChatGPT.[line break]"
"----- The Hints Below Contain Out Right Solutions -----"	--	"Part of the enjoyment of Interactive Fiction comes from the solving of the puzzles. For the most part all [story title] puzzles are solved within these hints. The hints are often blunt, especially at the end of a topic. I would, however, encourage you to play for the fun of it and reserve the hints for when you[']re truly stuck."
"The Parking Lot"	Table of Parking Lot Hints	--
"The Attractions"	Table of Attractions Hints	--
"The Games"	Table of Games Hints	--
"The Carnival Office"	Table of Carnival Office Hints	--
"Back Stage"	Table of Back Stage Hints	--
"Hell Ride"	Table of Hell Ride Hints	--
"The Electrical Area"	Table of Electrical Area Hints	--
"Where Are The Fuses?"	Table of Fuse Hints	--
"The Control Room"	Table of Control Room Hints	--
"Collecting Evidence"	Table of Evidence Hints	--
"How Points Are Awarded (Spoilers)"	--	""

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
"hint"	--	"What about the parking stub?"	
"hint"	--	"The parking attendant knows something about the stub."
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
"hint"	--	"Have you ridden [story title]?"
"The Carousel"	table of hinting	"What a wonderful childhood memory!"
"hint"	--	"What animal did you choose to ride?"
"hint"	--	"Sometimes I get dizzy on the merry-go-round."
"The Bumper Cars"	table of hinting	"The bumper cars are a great way to get your aggression out."
"hint"	--	"Great fun crashing into others."
"hint"	--	"And getting hit by others."
"hint"	--	"Just enjoy yourself"
"The Ferris Wheel"	table of hinting	"Such a relaxing and romantic ride!"
"hint"	--	"You can see the entire carnival from here."
"hint"	--	"Do you see anything from the top of the Ferris wheel?"
"hint"	--	"There is a hidden area in the carnival."
"hint"	--	"It[']s to the west behind the Concession Stand."
"Fortune Teller"	table of hinting	"Esmeralda the Fortune Teller is our most popular attraction after [story title]."
"hint"	--	"You can buy a ticket at the ticket booth."
"hint"	-- 	"Get a tarot reading and learn you fortune."
"hint"	--	"Pay attention to any advice she may give you."

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
"hint"	--	"I know! Go figure."
"The Pitcher[']s Mound"	table of hinting	"You have to choose which bottle to aim at."
"hint"	--	"The bottles are weighted in such a way as to make you lose."
"hint"	--	"You have to throw the baseball at the right bottle."
"hint"	--	"Throw the baseball at bottle 5."

Chapter 6 - Carnival Office

Table of Carnival Office Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"What about the Invoices?"	table of hinting	"These are outstanding bills for services rendered and supplies ordered."
"hint"	--	"Many are marked overdue while a smaller number are stamped 'Paid'."
"hint"	--	"Looks like the Whidbey Amusements might be in some financial trouble."
"What about the Filing Cabinet?"	table of hinting	"You need a key to get into it."
"hint"	--	"The key is in the safe."
"hint"	-- 	"There is evidence in the filing cabinet. You should probably examine it."
"What about the Safe?"	table of hinting	"It[']s locked."
"hint"	--	"Looks like it needs a three number combination."
"hint"	--	"Have you seen three numbers around anywhere?"
"hint"	--	"Maybe a date"
"hint"	--	"Look at the photo."
"hint"	--	"The combination is the date backwards."

Chapter 7 - Back Stage 

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

Chapter 8 - Hell Ride Hints

Table of Hell Ride Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Why do I die?"	table of hinting	"Everybody dies."
"hint"	--	"So, you[']ve ridden [story title], huh?"
"hint"	--	"Aren[']t the animatronics and wax figures amazing?"
"hint"	--	"Did you notice the guillotine rising and falling?"
"hint"	--	"Did you notice it chop you in half?"
"hint"	--	"You have to disable [story title]"
"What about the different rooms"	table of hinting	"Everything sure looks realistic."	
"hint"	--	"Aren[']t the animatronics and wax figures amazing?"
"hint"	--	"Each room shows a different manner of punishment."
"hint"	--	"There[']s the Stocks, the Gallows, the Stake, the Dungeon, and the Guillotine."
"hint"	--	"Just your typical ride in the dark."

Chapter 9 - The Electrical Area Hints

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

Chapter 10 - Fuse Hints

Table of Fuse Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Where[']s the Aqua fuse?"	table of hinting	"It[']s in the [story title] Exit."
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

Chapter 11 - The Control Room Hints

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
"hint"	--	"The colors correspond to the scenes in [story title]."
"hint"	--	"Push the indigo button."

Chapter 12 - Table of Evidence Hints

Table of Evidence Hints
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Show Evidence"	--	"Type SHOW EVIDENCE  or READ NOTEBOOK to see the evidence collected so far."
"How is evidence calculated?"	table of hinting	"Each piece of evidence is weighted according to its importance."
"hint"	--	"The weights are added together to get the total evidence."
"hint"	--	"If the total evidence is 0 to 30 then you don['] have enough evidence for an arrest."
"hint"	--	"If the total evidence is 31 to 75 then you have enough evidence to press charges and go to trial."
"hint"	--	"If the total evidence is greater than or equal to 76 then you have enough evidence for a conviction."
"How to make an arrest"	--	"An opportunity to make accusations and confront people will present itself."
"Evidence regarding Accidents"	--	"Ask people about the attractions to learn about accidents and mishaps around the carnival."
"Evidence regarding Mr Whidbey"	--	"Ask people about Mr Whidbey to learn more. Listen to Mr Whidbey[']s telephone conversation."
"Evidence regarding Past Due Invoices"	--	"Ask about or show people the past due invoices."
"Evidence regarding Fuses"	--	"Ask about or show people the fuses."
"Evidence regarding Insurance"	--	"Ask about or show people the insurance policy and cashier[']s check."

Chapter 13 - Table of IF Introduction

Table of IF Introduction
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"About Interactive Fiction"	--	"The game you are playing is a work of Interactive Fiction. In interactive fiction you play the main character of a story. You type commands which determine the actions of the character and the flow of the plot. Some IF games include graphics, but most do not: the imagery is provided courtesy of your imagination. On the other hand, there[']s a wide range of action available: whereas in other games you may be restricted to shooting, movement, or searching items you can click on with a mouse, IF allows you a wide range of verbs."
"What to do with >"	--	"The > sign is where the game says, 'Okay, what do you want to do now?' You may respond by typing an instruction -- usually an imperative verb, possibly followed by prepositions and objects. So, for instance, LOOK, LOOK AT FISH, TAKE FISH."
"Getting Started"	--	"The first thing you want to do when starting a game is acquaint yourself with your surroundings and get a sense of your goal. To this end, you should read the introductory text carefully. Sometimes it contains clues. You will also want to look at the room you are in. Notice where the exits from the room are, and what objects are described here. If any of these seem interesting, you may want to EXAMINE them. (You can abbreviate the EXAMINE command to just X, if you want.)

You might also want to examine yourself (EXAMINE ME or X ME) to see whether the author has left you any clues about your character. INVENTORY (I for short) will tell you what you[']re carrying, as well.

Once you[']ve gotten your bearings, you may want to explore. Move from room to room, and check out every location available."
"Rooms and Travel"	--	"At any given time, you are in a specific location, or room. When you go into a room, the game will print a description of what you can see there. This description will contain two vital kinds of information: things in the room you can interact with or take, and a list of exits, or ways out. If you want to see the description again, you may just type LOOK (L for short). 

When you want to leave a location and go to another one, you may communicate this to the game using compass directions: e.g., GO NORTH. For simplicity[']s sake, you are allowed to omit the word GO, and to abbreviate the compass directions. So you may use NORTH, SOUTH, EAST, WEST, NORTHEAST, SOUTHEAST, NORTHWEST, SOUTHWEST, UP, and DOWN, or in short form N, S, E, W, NE, SE, NW, SW, U, and D.

In some locations, IN and OUT will also be useful."
"Objects"	--	"Throughout the game there will be assorted objects that you can do things with. Most importantly, you may TAKE or GET items, and (when you are tired of them) DROP them again. INVENTORY (abbreviated I) will list the items you are currently holding. 

There are usually assorted things you may do with these objects. OPEN, CLOSE, WEAR, EAT, LOCK, and UNLOCK are especially common.

Occasionally, you will find that the game does not recognize the name of an object even though it has been described as being in the room with you. If this is the case, the object is just there for scenery, and you may assume that you do not need to interact with it."
"Controlling the Game"	--	"There are a few simple commands for controlling the game itself. These are: 

SAVE saves a snapshot of the game as it is now. 
RESTORE puts the game back to a previous saved state. You may keep as many saved games as you like. 
RESTART puts the game back to the way it was at the beginning. 
QUIT ends the game."
"How the World is Assembled"	table of world assembly	--
"If You Get Stuck"	table of stuck	--

Chapter 14 - How the World is Assembled

Table of World Assembly
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Space"	--	"Most IF games are set in a world made up of rooms without internal division. Movement between rooms is possible, but movement within a room does not always amount to anything. >WALK OVER TO THE DESK is rarely a useful sort of command. On the other hand, if something is described as being high or out of reach, it is sometimes relevant to stand on an object to increase your height. This kind of activity tends to be important only if prompted by the game text."
"Containment"	--	"One thing that IF does tend to model thoroughly is containment. Is something in or on something else? The game keeps track of this, and many puzzles have to do with where things are -- in the player[']s possession, lying on the floor of the room, on a table, in a box, etc."
"Types of Actions"	--	"Most of the actions you can perform in the world of IF are brief and specific. >WALK WEST or >OPEN DOOR are likely to be provided. >TAKE A JOURNEY or >BUILD A TABLE are not. Things like >GO TO THE HOTEL are on the borderline: some games allow them, but most do not. In general, abstract, multi-stage behavior usually has to be broken down in order for the game to understand it."
"Other Characters"	--	"Other characters in IF games are sometimes rather limited. On the other hand, there are also games in which character interaction is the main point of the game. You should be able to get a feel early on for the characters -- if they seem to respond to a lot of questions, remember what they[']re told, move around on their own, etc., then they may be fairly important. If they have a lot of stock responses and don[']t seem to have been the game designer[']s main concern, then they are most likely present either as local color or to provide the solution to a specific puzzle or set of puzzles. Characters in very puzzle-oriented games often have to be bribed, threatened, or cajoled into doing something that the player cannot do -- giving up a piece of information or an object, reaching something high, allowing the player into a restricted area, and so on."

Chapter 15 - If You Get Stuck

Table of Stuck
title (text)	subtable (table name)	description (text)	toggle (rule)	used (number)	bookpage (number)	localpage (number)
"Explore"	--	"Examine every object and look at everything in your inventory. Open all the doors you can find, and go through them. Look inside all closed containers. Make sure you[']ve exhausted all the options in your environment. 

Try out all your senses. If the game mentions texture, odor, or sound, try touching, smelling, listening to, or tasting objects.

Be thorough. If you still can[']t figure out what to do, try opening windows, looking under beds, etc. Sometimes objects are well-hidden."
"Read Carefully"	--	"Reread. Look back at things you[']ve already looked at. Sometimes this will trigger an idea you hadn[']t thought of. 

Take hints from the prose of the game. Things that are described in great detail are probably more important than things that are given one-liners. Play with those objects. If a machine is described as having component parts, look at the parts, and try manipulating them. Likewise, notice the verbs that the game itself uses. Try using those yourself. Games often include special verbs -- the names of magic spells, or other special commands. There[']s no harm in attempting something if the game mentions it.

Check the whole screen. Are there extra windows besides the main window? What[']s going on in those? Check out the status window, if there is one -- it may contain the name of the room you[']re in, your score, the time of day, your character[']s state of health, or some other important information. If there[']s something up there, it[']s worth paying attention to that, too. When and where does it change? Why is it significant? If the bar is describing your character[']s health, you can bet there is probably a point at which that will be important."
"Be Creative"	--	"Rephrase. If there[']s something you want to do, but the game doesn[']t seem to understand you, try alternative wordings. 

Try variations. Sometimes an action doesn[']t work, but does produce some kind of unusual result. These are often indications that you[']re on the right track, even if you haven[']t figured out quite the right approach yet. Pressing the red button alone may only cause a grinding noise from inside the wall, so perhaps pressing the blue and then the red will open the secret door.

Consider the genre of the game. Mysteries, romances, and thrillers all have their own types of action and motivation. What are you trying to do, and how do conventional characters go about doing that? What[']s the right sort of behavior for a detective/romance heroine/spy?"
"Cooperate"	--	"Play with someone else. Two heads are often better than one. If that doesn[']t work, try emailing the author or (better yet) posting a request for hints on the 'Game Discussion, Hints and Reviews' forum at https://www.intfiction.org/forum/. For best results, put the name of the game you want help with in the subject line and describe your problem as clearly as possible in your post. Enclose the problem in the available spoiler tags (highlight the text and click the 'spoiler' button) so that no one will read about how you got to where you are in the game by accident. Someone on the forum will probably be able to tell you how to solve your problem or offer suggestions."

Part 7 - Walkthrough

Chapter 1 - Table of Story Steps 

table of story steps (continued) 
index	input  
--	"eat blueberries"
--	"look under seat"
--	"get dimes, keys"
--	"open glove box"
--	"get all from glove compartment"
--	"wear gloves"
--	"give coupon to attendant"
--	"buy ticket"
--	"put stub on dashboard"
--	"south"
--	"buy tickets"
--	"east"
--	"examine prizes"
--	"buy mallet"
--	"hit bullseye with mallet"
--	"again"
--	"again"
--	"again"
--	"southeast"
--	"look under booth"
--	"get mercury dime"
--	"northwest"
--	"northeast"
--	"flip mercury dime on plate"
--	"4"
--	"southwest"
--	"southeast"
--	"give dime to attendant"
--	"throw baseball at bottle 5"
--	"1"
--	"give dime to attendant"
--	"northwest"
--	"east"
--	"give ticket to attendant"
--	"west"
--	"west"
--	"steal brass ring"
--	"steal brass ring"
--	"steal brass ring"
--	"east"
--	"steal brass ring"
--	"steal brass ring"
--	"west"
--	"southwest"
--	"buy bubblegum"
--	"west"
--	"open trash can"
--	"get khaki fuse"
--	"east"
--	"south"
--	"wait"
--	"listen"
--	"wait"
--	"wait"
--	"north"
--	"wait"
--	"south"
--	"turn dial to 62"
--	"turn dial to 22"
--	"turn dial to 3"
--	"open safe"
--	"get all from safe"
--	"open filing cabinet"
--	"get all invoices"
--	"get envelope"
--	"open envelope"
--	"get check"
--	"examine check"
--	"north"
--	"northeast"
--	"west"
--	"give dime to barker"
--	"west"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wait"
--	"wear veil"
--	"get lantern"
--	"turn it on"
--	"east"
--	"east"
--	"south"
--	"give hell ride ticket to attendant"
--	"south"
--	"east"
--	"examine piles of junk"
--	"get flashlight"
--	"turn it on"
--	"west"
--	"north"
--	"north"
--	"east"
--	"east"
--	"examine janitor"
--	"give flashlight to janitor"
--	"west"
--	"west"
--	"south"
--	"south"
--	"east"
--	"south"
--	"up"
--	"west"
--	"flip switch"
--	"east"
--	"down"
--	"south"
--	"south"
--	"open tool box"
--	"get wrench"
--	"get sledgehammer"
--	"north"
--	"north"
--	"north"
--	"west"
--	"north"
--	"north"
--	"northwest"
--	"give wrench to attendant"
--	"southeast"
--	"east"
--	"hit bullseye with sledgehammer"
--	"2"
--	"hit target with sledge"
--	"3"
--	"west"
--	"south"
--	"south"
--	"east"
--	"south"
--	"south"
--	"south"
--	"south"
--	"chew bubblegum"
--	"tie string to bubblegum"
--	"put bubblegum in grate"
--	"south"
--	"south"
--	"northeast"
--	"put all invoices in fanny pack"
--	"get key"
--	"southwest"
--	"south"
--	"west"
--	"buy aqua fuse"
--	"north"
--	"look under platform"
--	"get pliers"
--	"north"
--	"east"
--	"south"
--	"south"
--	"northeast"
--	"open panel"
--	"put aqua fuse in socket"
--	"flip switch"
--	"southwest"
--	"east"
--	"open panel"
--	"put crimson fuse in socket"
--	"flip switch"
--	"west"
--	"southeast"
--	"open panel"
--	"put emerald fuse in socket"
--	"flip switch"
--	"northwest"
--	"southwest"
--	"open panel"
--	"put gray fuse in socket"
--	"flip switch"
--	"northeast"
--	"west"
--	"open panel"
--	"put indigo fuse in socket"
--	"flip switch"
--	"east"
--	"northwest"
--	"open panel"
--	"put khaki fuse in socket"
--	"flip switch"
--	"southeast"
--	"north"
--	"north"
--	"north"
--	"north"
--	"north"
--	"up"
--	"west"
--	"spin aqua dial to 1"
--	"set crimson dial to 3"
--	"set emerald dial to 5"
--	"turn gray dial to 7"
--	"turn indigo dial to 9"
--	"turn khaki dial to 11"
--	"push indigo button"
--	"look"
--	"ask whidbey about indigo fuse"
--	"show the insurance policy to whidbey"
--	"ask whidbey about insurance"
--	"ask whidbey about cash [']n['] carry"
--	"ask whidbey about invoices"
--	"show cash [']n['] carry to whidbey"
--	"show frank's market to whidbey"
--	"show oriental trading to whidbey"
--	"show mystic industries to whidbey"
--	"show evidence"
--	"show mystic industries invoice to janitor"
--	"show insurance policy to janitor"
--	"show check to janitor"
--	"ask janitor about hell ride"
--	"ask janitor about bumper cars"
--	"ask janitor about ferris wheel"
--	"ask janitor about Mr Whidbey"
--	"show pliers to whidbey"
--	"show pliers to janitor"
--	"show oriental trading to whidbey"
--	"show oriental trading to janitor"
--	"show check to whidbey"
--	"ask whidbey about needleman"
--	"accuse whidbey of insurance fraud"
