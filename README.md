# HellRide
 Hell Ride - A Ride to remember...
 
In the early 1980's, I had an Apple II Plus. And the very first game I ever 
bought was Infocom's Zork I: The Great Underground Empire. This was cool. It was all 
text-based. The game described your surroundings and you interacted with commands that 
say what you want to do. This "Interactive Fiction" really evoked in a game what I 
appreciate about reading: rich descriptions, colorful characters, and the like. 
After Zork I, there was Zork II and III. Enchanter, Moonmist, Suspect, and so many 
more. I played them all with my best friend Andy.

Andy and I were software developers at the time and we thought, "We can do this!" So 
we set out to do this. We developed a game engine with a natural language parser And
it was pretty good. We could support most of the kinds of things they did, certainly
less graceful but pretty good. In fact, our parser was better than there's in a case
where the sentence was ambiguous. e.g. "Walk into the room with the lamnp." Is the
player carrying the lamp? Or is the lamp in the room? 

For fun, we reverse engineered parts of Infocom's game format. We found the dictionary,
certain text tokens use for text substitution, the game text. We also discovered the
first example of compression I had ever seen and it just about made my head explode.
They stored all ASCII characters in five bits! Pow! Mind blown. I had never considered
anything like that. Just another hook.

We developed two prototypes: Diner and Hell Ride. Diner was about bank robbers coming 
into the diner where you are a short order cook and have to save the day. Hell Ride
was pretty close to what you find here. I decided to implement it using modern tools.
It's pretty good.
