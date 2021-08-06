Use MAX_STATIC_DATA of 500000.
When play begins, seed the random-number generator with 1234.

container is a kind of thing.
door is a kind of thing.
ingredient-like is a kind of thing.
object-like is a kind of thing.
supporter is a kind of thing.
oven-like is a kind of container.
toaster-like is a kind of container.
food is a kind of object-like.
key is a kind of object-like.
cloth-like is a kind of object-like.
text-like is a kind of object-like.
stove-like is a kind of supporter.
meal-like is a kind of food.
A recipe-like is a kind of thing. A recipe-like has a list of ingredient-like called ingredients. A recipe-like has a thing called meal. A recipe-like has a room called cooking location.
a thing can be drinkable. a thing is usually not drinkable. a thing can be cookable. a thing is usually not cookable. a thing can be damaged. a thing is usually not damaged. a thing can be sharp. a thing is usually not sharp. a thing can be cuttable. a thing is usually not cuttable. a thing can be a source of heat. Type of cooking is a kind of value. The type of cooking are raw, grilled, roasted and fried. a thing can be needs cooking. Type of cutting is a kind of value. The type of cutting are uncut, sliced, diced and chopped.
containers are openable, lockable and fixed in place. containers are usually closed.
door is openable and lockable.
ingredient-like has a thing called base. ingredient-like has a type of cooking. ingredient-like has a type of cutting.
object-like is portable.
supporters are fixed in place.
oven-like is a source of heat.
toaster-like is a source of heat.
food is usually edible. food is cookable. food has a type of cooking. food has a type of cutting. food can be cooked. food can be burned. food can be consumed. food is usually not consumed. food is usually cuttable.
cloth-like are wearable. cloth-like can be either clean or dirty. cloth-like are usually clean. cloth-like can be either worn in or worn out. cloth-like are usually worn out.
A text-like can be either read or unread. A text-like is usually unread.
stove-like is a source of heat.
A room has a text called internal name.


Understand the command "wear" as something new. 
Understand "wear [something]" as _wearing. 
_wearing is an action applying to a thing.  

Carry out _wearing: 
	if a cloth-like (called cl) is worn out:                     
		Now the cl is worn in;                                                                       
	otherwise:
		Say "You have this cloth on.". 


[Drinking liquid]
Drinking carried thing is an action applying to one carried thing.
The block drinking rule is not listed in any rulebook.
Understand nothing as drinking.
Understand "drink [something]" as drinking carried thing.

After drinking carried thing:
	Now the noun is consumed;
	Continue the action.

Check an actor drinking carried thing (this is the can’t drink unless drinkable rule):
	if the noun is not a thing or the noun is not drinkable:
		say "You cannot drink [the noun].";
		rule fails;

Carry out an actor drinking carried thing (this is the drinking rule):
	remove the noun from play.

Report an actor drinking carried thing (this is the report drinking rule):
	if the actor is the player:
		say "You drink [the noun]. Not bad.";
	otherwise:
		say "[The person asked] just drunk [the noun].".

[Eating food]
After eating a food (called target):
	Now the target is consumed;
	Continue the action.

Check eating inedible food (called target):
	if target is needs cooking:
		say "You should cook [the target] first.";
		rule fails.

[Understanding things by their properties - http://inform7.com/learn/man/WI_17_15.html]
Understand the type of cutting property as describing food.
Understand the type of cooking property as describing food.

[Processing food]
Understand the commands  "slice", "prune" as something new.
The block cutting rule is not listed in any rulebook.
Dicing it with is an action applying to two carried things.
Slicing it with is an action applying to two carried things.
Chopping it with is an action applying to two carried things.

Slicing something with something is a cutting activity.
Dicing something with something is a cutting activity.
Chopping something with something is a cutting activity.

Does the player mean slicing something with something carried (called target):
	if target is not sharp:
		it is very unlikely;

Does the player mean chopping something with something carried (called target):
	if target is not sharp:
		it is very unlikely;

Does the player mean dicing something with something carried (called target):
	if target is not sharp:
		it is very unlikely;

Check an actor cutting (this is the generic cut is now allowed rule):
	say "You need to specify how you want to cut [the noun]. Either slice, dice, or chop it.";
	rule fails.

Before a cutting activity when the noun is not cuttable:
	say "Can only cut cuttable food.";
	rule fails.

Before a cutting activity when the noun is cuttable and the noun is not uncut:
	say "[The noun] is already [type of cutting of the noun].";
	rule fails.

Before a cutting activity when the second noun is not sharp:
	say "Cutting something requires a knife.";
	rule fails.

Before printing the name of a food (called the food item) which is not uncut while looking, examining, listing contents or taking inventory:
	say "[type of cutting of food item] ".

[Slicing food]
Carry out slicing a carried food (called the food item) with a thing (called the tool):
	if the food item is not uncut:
		say "[The food item] is already [type of cutting of the food item].";
		stop;
	Now the food item is sliced;
	say "You slice the [food item].".

Understand "slice [something] with/using [something]" as slicing it with.

[Dicing food]
Carry out dicing a carried food (called the food item) with a thing (called the tool):
	if the food item is not uncut:
		say "The [food item] has already been cut.";
		stop;
	Now the food item is diced;
	say "You dice the [food item].".

Understand "dice [something] with/using [something]" as dicing it with.

[Chopping food]
Carry out chopping a carried food (called the food item) with a thing (called the tool):
	if the food item is not uncut:
		say "The [food item] has already been cut.";
		stop;
	Now the food item is chopped;
	say "You chop the [food item].".

Understand the command "chop" as something new. [Remove its association with slicing]
Understand "chop [something] with/using [something]" as chopping it with.

[Cooking food]
Cooking it with is an action applying to one carried thing and one thing.

Does the player mean cooking something with something carried:
	it is very unlikely;

Check cooking something not cookable with something (this is the cook only cookable things rule):
	say "Can only cook food." instead.

Check cooking something cookable with something not a source of heat (this is the cooking requires a source of heat rule):
	say "Cooking requires a source of heat." instead.

Carry out cooking a carried food (called the food item) with a thing (called a the source of heat):
	if the food item is cooked:
		Now the food item is burned;
		Now the food item is not edible;
		say "You burned the [food item]!";
		stop;
	otherwise:
		Now the food item is cooked;
	if the food item is needs cooking:
		Now the food item is edible;
		Now the food item is not needs cooking;
	if the source of heat is a stove-like:
		Now the food item is fried;
		say "You fried the [food item].";
	else if the source of heat is a oven-like:
		Now the food item is roasted;
		say "You roasted the [food item].";
	else if the source of heat is a toaster-like:
		Now the food item is grilled;
		say "You grilled the [food item].".

Understand "cook [something] with/in/on/using [something]" as cooking it with.

Before printing the name of a food (called the food item) while looking, examining, listing contents or taking inventory:
	if the food item is needs cooking:
		say "raw ";
	else if the food item is burned:
		say "burned ";
	else if the food item is not raw:
		say "[type of cooking of food item] ".



[Ingredient]
Rule for printing the name of an ingredient-like (called I):
	if type of cutting of I is not uncut:
		say  "[type of cutting of I] ";
	if type of cooking of I is not raw:
		say  "[type of cooking of I] ";
	say  "[base of I]";

[Preparing a meal]
Preparing meal is an action applying to nothing.
Before preparing meal:
	if location is not the cooking location of the recipe:
		say "Can only prepare meal in the [cooking location of the recipe].";
		rule fails;
	Repeat with ingredient running through the ingredients of the recipe:
		let F be the base of the ingredient;
		if player does not carry the F:
			[say "The recipe requires [a ingredient].";]
			say "You still miss something.";
			rule fails;
		if type of cooking of F is not type of cooking of ingredient:
			[say "The recipe requires [a ingredient].";]
			say "Something still needs to be cooked.";
			rule fails;
		if type of cutting of F is not type of cutting of ingredient:
			[say "The recipe requires [a ingredient].";]
			say "Something still needs to be cut.";
			rule fails;

Carry out preparing meal:
	say "Adding the meal to your inventory.";
	Repeat with ingredient running through the ingredients of recipe:
		now the base of the ingredient is nowhere;
	now the player carries the meal of the recipe;
	set pronouns from the meal of the recipe.

Understand "prepare meal" as preparing meal.


Understand the command "read" as something new. 
Understand "read [something]" as _reading. 
_reading is an action applying to a thing. 

Carry out _reading: 
	if a text-like (called tx) is unread: 
		Say "You read the book and realized about that crucial hint.";
		Now the tx is read; 


The r_0 and the r_1 and the r_2 and the r_3 and the r_4 and the r_6 and the r_8 and the r_5 and the r_7 and the r_9 are rooms.

Understand "checkout" as r_0.
The internal name of r_0 is "checkout".
The printed name of r_0 is "-= Checkout =-".
The checkout part 0 is some text that varies. The checkout part 0 is "Guess what, you are in a place we're calling a checkout.

 You can see a basket.[if c_0 is open and there is something in the c_0] The basket contains [a list of things in the c_0].[end if]".
The checkout part 1 is some text that varies. The checkout part 1 is "[if c_0 is open and the c_0 contains nothing] What a letdown! The basket is empty![end if]".
The checkout part 2 is some text that varies. The checkout part 2 is " You can make out [if c_1 is locked]a locked[else if c_1 is open]an opened[otherwise]a closed[end if]".
The checkout part 3 is some text that varies. The checkout part 3 is " conventional looking fridge close by.[if c_1 is open and there is something in the c_1] The fridge contains [a list of things in the c_1].[end if]".
The checkout part 4 is some text that varies. The checkout part 4 is "[if c_1 is open and the c_1 contains nothing] What a letdown! The fridge is empty![end if]".
The checkout part 5 is some text that varies. The checkout part 5 is " You make out a donation box.[if c_5 is open and there is something in the c_5] The donation box contains [a list of things in the c_5].[end if]".
The checkout part 6 is some text that varies. The checkout part 6 is "[if c_5 is open and the c_5 contains nothing] The donation box is empty! What a waste of a day![end if]".
The checkout part 7 is some text that varies. The checkout part 7 is " You can see a counter. The counter is high-tech.[if there is something on the s_0] On the counter you see [a list of things on the s_0], so there's that.[end if]".
The checkout part 8 is some text that varies. The checkout part 8 is "[if there is nothing on the s_0] But the thing hasn't got anything on it.[end if]".
The checkout part 9 is some text that varies. The checkout part 9 is " You see a shelf. The shelf is wooden.[if there is something on the s_1] On the shelf you see [a list of things on the s_1].[end if]".
The checkout part 10 is some text that varies. The checkout part 10 is "[if there is nothing on the s_1] But the thing hasn't got anything on it.[end if]".
The checkout part 11 is some text that varies. The checkout part 11 is " You can see a showcase. [if there is something on the s_2]You see [a list of things on the s_2] on the showcase, so there's that.[end if]".
The checkout part 12 is some text that varies. The checkout part 12 is "[if there is nothing on the s_2]Looks like someone's already been here and taken everything off it, though.[end if]".
The checkout part 13 is some text that varies. The checkout part 13 is "

You don't like doors? Why not try going east, that entranceway is not blocked by one. There is an exit to the south. Don't worry, there is no door. There is an exit to the west. Don't worry, there is no door.".
The description of r_0 is "[checkout part 0][checkout part 1][checkout part 2][checkout part 3][checkout part 4][checkout part 5][checkout part 6][checkout part 7][checkout part 8][checkout part 9][checkout part 10][checkout part 11][checkout part 12][checkout part 13]".

The r_1 is mapped west of r_0.
The r_4 is mapped south of r_0.
The r_2 is mapped east of r_0.
Understand "vegetables" as r_1.
The internal name of r_1 is "vegetables".
The printed name of r_1 is "-= Vegetables =-".
The vegetables part 0 is some text that varies. The vegetables part 0 is "You find yourself in a vegetables. An ordinary one. I guess you better just go and list everything you see here.

 You make out a veg fridge.[if c_11 is open and there is something in the c_11] The veg fridge contains [a list of things in the c_11].[end if]".
The vegetables part 1 is some text that varies. The vegetables part 1 is "[if c_11 is open and the c_11 contains nothing] What a letdown! The veg fridge is empty![end if]".
The vegetables part 2 is some text that varies. The vegetables part 2 is " You can see [if c_2 is locked]a locked[else if c_2 is open]an opened[otherwise]a closed[end if]".
The vegetables part 3 is some text that varies. The vegetables part 3 is " red veg basket.[if c_2 is open and there is something in the c_2] The red veg basket contains [a list of things in the c_2]![end if]".
The vegetables part 4 is some text that varies. The vegetables part 4 is "[if c_2 is open and the c_2 contains nothing] The red veg basket is empty, what a horrible day![end if]".
The vegetables part 5 is some text that varies. The vegetables part 5 is " You can see [if c_3 is locked]a locked[else if c_3 is open]an opened[otherwise]a closed[end if]".
The vegetables part 6 is some text that varies. The vegetables part 6 is " green veg basket.[if c_3 is open and there is something in the c_3] The green veg basket contains [a list of things in the c_3].[end if]".
The vegetables part 7 is some text that varies. The vegetables part 7 is "[if c_3 is open and the c_3 contains nothing] The green veg basket is empty! What a waste of a day![end if]".
The vegetables part 8 is some text that varies. The vegetables part 8 is " You can make out [if c_6 is locked]a locked[else if c_6 is open]an opened[otherwise]a closed[end if]".
The vegetables part 9 is some text that varies. The vegetables part 9 is " orange basket.[if c_6 is open and there is something in the c_6] The orange basket contains [a list of things in the c_6]. The light flickers for a second, but nothing else happens.[end if]".
The vegetables part 10 is some text that varies. The vegetables part 10 is "[if c_6 is open and the c_6 contains nothing] What a letdown! The orange basket is empty![end if]".
The vegetables part 11 is some text that varies. The vegetables part 11 is " Hey, want to see a veg basket? Look over there, a veg basket. Wow, isn't TextWorld just the best?[if c_9 is open and there is something in the c_9] The veg basket contains [a list of things in the c_9]. Huh, weird.[end if]".
The vegetables part 12 is some text that varies. The vegetables part 12 is "[if c_9 is open and the c_9 contains nothing] What a letdown! The veg basket is empty![end if]".
The vegetables part 13 is some text that varies. The vegetables part 13 is "

There is an exit to the east. Don't worry, there is no door.".
The description of r_1 is "[vegetables part 0][vegetables part 1][vegetables part 2][vegetables part 3][vegetables part 4][vegetables part 5][vegetables part 6][vegetables part 7][vegetables part 8][vegetables part 9][vegetables part 10][vegetables part 11][vegetables part 12][vegetables part 13]".

The r_0 is mapped east of r_1.
Understand "fruits" as r_2.
The internal name of r_2 is "fruits".
The printed name of r_2 is "-= Fruits =-".
The fruits part 0 is some text that varies. The fruits part 0 is "You arrive in a fruits. A typical kind of place. Okay, just remember what you're here to do, and everything will go great.

 As if things weren't amazing enough already, you can even see a red fruit basket. You idly wonder how they came up with the name TextWorld for this place. It's pretty fitting.[if c_10 is open and there is something in the c_10] The red fruit basket contains [a list of things in the c_10]. You idly wonder how they came up with the name TextWorld for this place. It's pretty fitting.[end if]".
The fruits part 1 is some text that varies. The fruits part 1 is "[if c_10 is open and the c_10 contains nothing] The red fruit basket is empty, what a horrible day![end if]".
The fruits part 2 is some text that varies. The fruits part 2 is " You can see a fruit basket.[if c_12 is open and there is something in the c_12] The fruit basket contains [a list of things in the c_12].[end if]".
The fruits part 3 is some text that varies. The fruits part 3 is "[if c_12 is open and the c_12 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The fruits part 4 is some text that varies. The fruits part 4 is " You see a green fruit basket.[if c_13 is open and there is something in the c_13] The green fruit basket contains [a list of things in the c_13].[end if]".
The fruits part 5 is some text that varies. The fruits part 5 is "[if c_13 is open and the c_13 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The fruits part 6 is some text that varies. The fruits part 6 is " You lean against the wall, inadvertently pressing a secret button. The wall opens up to reveal a yellow basket. You check the price tag that hangs off the yellow basket. 75 bucks? What a deal! You'll have to ask where they got this![if c_4 is open and there is something in the c_4] The yellow basket contains [a list of things in the c_4].[end if]".
The fruits part 7 is some text that varies. The fruits part 7 is "[if c_4 is open and the c_4 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The fruits part 8 is some text that varies. The fruits part 8 is " You can see a fruits fridge.[if c_8 is open and there is something in the c_8] The fruits fridge contains [a list of things in the c_8].[end if]".
The fruits part 9 is some text that varies. The fruits part 9 is "[if c_8 is open and the c_8 contains nothing] The fruits fridge is empty, what a horrible day![end if]".
The fruits part 10 is some text that varies. The fruits part 10 is "

 There is [if d_2 is open]an open[otherwise]a closed[end if]".
The fruits part 11 is some text that varies. The fruits part 11 is " screen door leading south. You need an exit without a door? You should try going east. You need an exit without a door? You should try going west.".
The description of r_2 is "[fruits part 0][fruits part 1][fruits part 2][fruits part 3][fruits part 4][fruits part 5][fruits part 6][fruits part 7][fruits part 8][fruits part 9][fruits part 10][fruits part 11]".

The r_0 is mapped west of r_2.
south of r_2 and north of r_9 is a door called d_2.
The r_3 is mapped east of r_2.
Understand "clothing" as r_3.
The internal name of r_3 is "clothing".
The printed name of r_3 is "-= Clothing =-".
The clothing part 0 is some text that varies. The clothing part 0 is "You've just sauntered into a clothing. You begin to take stock of what's here.

 If you haven't noticed it already, there seems to be something there by the wall, it's a clothing showcase. You wonder idly who left that here. [if there is something on the s_9]You see [a list of things on the s_9] on the clothing showcase.[end if]".
The clothing part 1 is some text that varies. The clothing part 1 is "[if there is nothing on the s_9]The clothing showcase appears to be empty.[end if]".
The clothing part 2 is some text that varies. The clothing part 2 is "

There is an exit to the west.".
The description of r_3 is "[clothing part 0][clothing part 1][clothing part 2]".

The r_2 is mapped west of r_3.
Understand "meats" as r_4.
The internal name of r_4 is "meats".
The printed name of r_4 is "-= Meats =-".
The meats part 0 is some text that varies. The meats part 0 is "You're now in a meats.

 You see [if c_14 is locked]a locked[else if c_14 is open]an opened[otherwise]a closed[end if]".
The meats part 1 is some text that varies. The meats part 1 is " meats fridge close by.[if c_14 is open and there is something in the c_14] The meats fridge contains [a list of things in the c_14].[end if]".
The meats part 2 is some text that varies. The meats part 2 is "[if c_14 is open and the c_14 contains nothing] The meats fridge is empty! What a waste of a day![end if]".
The meats part 3 is some text that varies. The meats part 3 is " Hey, want to see a meats showcase? Look over there, a meats showcase. The meats showcase is metallic.[if there is something on the s_6] On the meats showcase you make out [a list of things on the s_6].[end if]".
The meats part 4 is some text that varies. The meats part 4 is "[if there is nothing on the s_6] Looks like someone's already been here and taken everything off it, though.[end if]".
The meats part 5 is some text that varies. The meats part 5 is "

 There is [if d_0 is open]an open[otherwise]a closed[end if]".
The meats part 6 is some text that varies. The meats part 6 is " sliding patio door leading west. There is an exit to the north. Don't worry, there is no door. You need an exit without a door? You should try going south.".
The description of r_4 is "[meats part 0][meats part 1][meats part 2][meats part 3][meats part 4][meats part 5][meats part 6]".

west of r_4 and east of r_6 is a door called d_0.
The r_5 is mapped south of r_4.
The r_0 is mapped north of r_4.
Understand "stationery" as r_6.
The internal name of r_6 is "stationery".
The printed name of r_6 is "-= Stationery =-".
The stationery part 0 is some text that varies. The stationery part 0 is "You find yourself in a stationery. A typical kind of place. You decide to just list off a complete list of everything you see in the room, because hey, why not?

 You see a stationery shelf. [if there is something on the s_10]On the stationery shelf you make out [a list of things on the s_10].[end if]".
The stationery part 1 is some text that varies. The stationery part 1 is "[if there is nothing on the s_10]However, the stationery shelf, like an empty stationery shelf, has nothing on it.[end if]".
The stationery part 2 is some text that varies. The stationery part 2 is "

 There is [if d_0 is open]an open[otherwise]a closed[end if]".
The stationery part 3 is some text that varies. The stationery part 3 is " sliding patio door leading east. There is [if d_1 is open]an open[otherwise]a closed[end if]".
The stationery part 4 is some text that varies. The stationery part 4 is " sliding glass door leading west. You don't like doors? Why not try going south, that entranceway is not blocked by one.".
The description of r_6 is "[stationery part 0][stationery part 1][stationery part 2][stationery part 3][stationery part 4]".

west of r_6 and east of r_8 is a door called d_1.
The r_7 is mapped south of r_6.
east of r_6 and west of r_4 is a door called d_0.
Understand "hygiene" as r_8.
The internal name of r_8 is "hygiene".
The printed name of r_8 is "-= Hygiene =-".
The hygiene part 0 is some text that varies. The hygiene part 0 is "You're now in the hygiene. Okay, just remember what you're here to do, and everything will go great.

 You see a hygiene showcase. You shudder, but continue examining the hygiene showcase. The hygiene showcase is metallic.[if there is something on the s_12] On the hygiene showcase you see [a list of things on the s_12].[end if]".
The hygiene part 1 is some text that varies. The hygiene part 1 is "[if there is nothing on the s_12] But there isn't a thing on it. Aw, here you were, all excited for there to be things on it![end if]".
The hygiene part 2 is some text that varies. The hygiene part 2 is " You see a hygiene shelf. [if there is something on the s_13]You see [a list of things on the s_13] on the hygiene shelf.[end if]".
The hygiene part 3 is some text that varies. The hygiene part 3 is "[if there is nothing on the s_13]But the thing is empty, unfortunately.[end if]".
The hygiene part 4 is some text that varies. The hygiene part 4 is "

 There is [if d_1 is open]an open[otherwise]a closed[end if]".
The hygiene part 5 is some text that varies. The hygiene part 5 is " sliding glass door leading east.".
The description of r_8 is "[hygiene part 0][hygiene part 1][hygiene part 2][hygiene part 3][hygiene part 4][hygiene part 5]".

east of r_8 and west of r_6 is a door called d_1.
Understand "ingredients" as r_5.
The internal name of r_5 is "ingredients".
The printed name of r_5 is "-= Ingredients =-".
The ingredients part 0 is some text that varies. The ingredients part 0 is "Wow! You're in an ingredients.

 You can make out [if c_15 is locked]a locked[else if c_15 is open]an opened[otherwise]a closed[end if]".
The ingredients part 1 is some text that varies. The ingredients part 1 is " ingredients fridge.[if c_15 is open and there is something in the c_15] The ingredients fridge contains [a list of things in the c_15]. Something scurries by right in the corner of your eye. Probably nothing.[end if]".
The ingredients part 2 is some text that varies. The ingredients part 2 is "[if c_15 is open and the c_15 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The ingredients part 3 is some text that varies. The ingredients part 3 is " You can make out an ingreditents showcase. [if there is something on the s_14]On the ingreditents showcase you can see [a list of things on the s_14].[end if]".
The ingredients part 4 is some text that varies. The ingredients part 4 is "[if there is nothing on the s_14]But the thing is empty, unfortunately. It would have been so cool if there was stuff on the ingreditents showcase.[end if]".
The ingredients part 5 is some text that varies. The ingredients part 5 is " You see an ingredients shelf. [if there is something on the s_3]On the ingredients shelf you see [a list of things on the s_3].[end if]".
The ingredients part 6 is some text that varies. The ingredients part 6 is "[if there is nothing on the s_3]But the thing is empty. It would have been so cool if there was stuff on the ingredients shelf.[end if]".
The ingredients part 7 is some text that varies. The ingredients part 7 is "

You need an exit without a door? You should try going north.".
The description of r_5 is "[ingredients part 0][ingredients part 1][ingredients part 2][ingredients part 3][ingredients part 4][ingredients part 5][ingredients part 6][ingredients part 7]".

The r_4 is mapped north of r_5.
Understand "hardware" as r_7.
The internal name of r_7 is "hardware".
The printed name of r_7 is "-= Hardware =-".
The hardware part 0 is some text that varies. The hardware part 0 is "You arrive in a hardware. A standard kind of place.

 You make out a hardware shelf. The hardware shelf is wooden.[if there is something on the s_5] On the hardware shelf you make out [a list of things on the s_5].[end if]".
The hardware part 1 is some text that varies. The hardware part 1 is "[if there is nothing on the s_5] But oh no! there's nothing on this piece of junk.[end if]".
The hardware part 2 is some text that varies. The hardware part 2 is "

You need an exit without a door? You should try going north.".
The description of r_7 is "[hardware part 0][hardware part 1][hardware part 2]".

The r_6 is mapped north of r_7.
Understand "restaurant" as r_9.
The internal name of r_9 is "restaurant".
The printed name of r_9 is "-= Restaurant =-".
The restaurant part 0 is some text that varies. The restaurant part 0 is "Well, here we are in the restaurant.

 Oh wow! Is that what I think it is? It is! It's a tips box. You shudder, but continue examining the room.[if c_7 is open and there is something in the c_7] The tips box contains [a list of things in the c_7]. Make a note of this, you might have to put stuff on or in it later on.[end if]".
The restaurant part 1 is some text that varies. The restaurant part 1 is "[if c_7 is open and the c_7 contains nothing] What a letdown! The tips box is empty![end if]".
The restaurant part 2 is some text that varies. The restaurant part 2 is " Oh, great. Here's a toilet. The toilet is white.[if there is something on the s_11] On the toilet you can see [a list of things on the s_11]. Huh, weird.[end if]".
The restaurant part 3 is some text that varies. The restaurant part 3 is "[if there is nothing on the s_11] Unfortunately, there isn't a thing on it. Hm. Oh well[end if]".
The restaurant part 4 is some text that varies. The restaurant part 4 is " You see a restaurant chair. [if there is something on the s_4]On the restaurant chair you make out [a list of things on the s_4].[end if]".
The restaurant part 5 is some text that varies. The restaurant part 5 is "[if there is nothing on the s_4]But the thing is empty, unfortunately.[end if]".
The restaurant part 6 is some text that varies. The restaurant part 6 is " You can make out a sofa. [if there is something on the s_7]On the sofa you make out [a list of things on the s_7]. You can't wait to tell the folks at home about this![end if]".
The restaurant part 7 is some text that varies. The restaurant part 7 is "[if there is nothing on the s_7]But oh no! there's nothing on this piece of junk. Aw, here you were, all excited for there to be things on it![end if]".
The restaurant part 8 is some text that varies. The restaurant part 8 is " You see a gleam over in a corner, where you can see a restaurant table. The restaurant table is stylish.[if there is something on the s_8] On the restaurant table you can make out [a list of things on the s_8].[end if]".
The restaurant part 9 is some text that varies. The restaurant part 9 is "[if there is nothing on the s_8] But oh no! there's nothing on this piece of trash.[end if]".
The restaurant part 10 is some text that varies. The restaurant part 10 is " You scan the room, seeing a BBQ.[if toaster_0 is open and there is something in the toaster_0] The BBQ contains [a list of things in the toaster_0].[end if]".
The restaurant part 11 is some text that varies. The restaurant part 11 is "[if toaster_0 is open and the toaster_0 contains nothing] The BBQ is empty! What a waste of a day![end if]".
The restaurant part 12 is some text that varies. The restaurant part 12 is "

 There is [if d_2 is open]an open[otherwise]a closed[end if]".
The restaurant part 13 is some text that varies. The restaurant part 13 is " screen door leading north.".
The description of r_9 is "[restaurant part 0][restaurant part 1][restaurant part 2][restaurant part 3][restaurant part 4][restaurant part 5][restaurant part 6][restaurant part 7][restaurant part 8][restaurant part 9][restaurant part 10][restaurant part 11][restaurant part 12][restaurant part 13]".

north of r_9 and south of r_2 is a door called d_2.

The RECIPE are recipe-likes.
The RECIPE are privately-named.
The c_0 and the c_1 and the c_10 and the c_11 and the c_12 and the c_13 and the c_14 and the c_15 and the c_2 and the c_3 and the c_4 and the c_5 and the c_6 and the c_7 and the c_8 and the c_9 are containers.
The c_0 and the c_1 and the c_10 and the c_11 and the c_12 and the c_13 and the c_14 and the c_15 and the c_2 and the c_3 and the c_4 and the c_5 and the c_6 and the c_7 and the c_8 and the c_9 are privately-named.
The d_2 and the d_0 and the d_1 are doors.
The d_2 and the d_0 and the d_1 are privately-named.
The f_0 and the f_1 are foods.
The f_0 and the f_1 are privately-named.
The ingredient_0 are ingredient-likes.
The ingredient_0 are privately-named.
The meal_0 are meal-likes.
The meal_0 are privately-named.
The o_0 are object-likes.
The o_0 are privately-named.
The r_0 and the r_1 and the r_2 and the r_3 and the r_4 and the r_6 and the r_8 and the r_5 and the r_7 and the r_9 are rooms.
The r_0 and the r_1 and the r_2 and the r_3 and the r_4 and the r_6 and the r_8 and the r_5 and the r_7 and the r_9 are privately-named.
The s_0 and the s_1 and the s_10 and the s_11 and the s_12 and the s_13 and the s_14 and the s_2 and the s_3 and the s_4 and the s_5 and the s_6 and the s_7 and the s_8 and the s_9 are supporters.
The s_0 and the s_1 and the s_10 and the s_11 and the s_12 and the s_13 and the s_14 and the s_2 and the s_3 and the s_4 and the s_5 and the s_6 and the s_7 and the s_8 and the s_9 are privately-named.
The toaster_0 are toaster-likes.
The toaster_0 are privately-named.

The description of d_2 is "It is what it is, a [noun]. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of d_2 is "screen door".
Understand "screen door" as d_2.
Understand "screen" as d_2.
Understand "door" as d_2.
The d_2 is open.
The description of d_0 is "It's a towering [noun] [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to crack open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of d_0 is "sliding patio door".
Understand "sliding patio door" as d_0.
Understand "sliding" as d_0.
Understand "patio" as d_0.
Understand "door" as d_0.
The d_0 is open.
The description of d_1 is "It's an imposing [noun] [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to break open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of d_1 is "sliding glass door".
Understand "sliding glass door" as d_1.
Understand "sliding" as d_1.
Understand "glass" as d_1.
Understand "door" as d_1.
The d_1 is open.
The description of c_0 is "The [noun] looks ominous. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_0 is "basket".
Understand "basket" as c_0.
The c_0 is in r_0.
The c_0 is open.
The description of c_1 is "The [noun] looks stuffy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to crack open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_1 is "fridge".
Understand "fridge" as c_1.
The c_1 is in r_0.
The c_1 is open.
The description of c_10 is "The [noun] looks durable. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to force open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_10 is "red fruit basket".
Understand "red fruit basket" as c_10.
Understand "red" as c_10.
Understand "fruit" as c_10.
Understand "basket" as c_10.
The c_10 is in r_2.
The c_10 is open.
The description of c_11 is "The [noun] looks sturdy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to force open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_11 is "veg fridge".
Understand "veg fridge" as c_11.
Understand "veg" as c_11.
Understand "fridge" as c_11.
The c_11 is in r_1.
The c_11 is open.
The description of c_12 is "The [noun] looks well-built. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to force open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_12 is "fruit basket".
Understand "fruit basket" as c_12.
Understand "fruit" as c_12.
Understand "basket" as c_12.
The c_12 is in r_2.
The c_12 is open.
The description of c_13 is "The [noun] looks grand. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_13 is "green fruit basket".
Understand "green fruit basket" as c_13.
Understand "green" as c_13.
Understand "fruit" as c_13.
Understand "basket" as c_13.
The c_13 is in r_2.
The c_13 is open.
The description of c_14 is "The [noun] looks hefty. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to bash open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_14 is "meats fridge".
Understand "meats fridge" as c_14.
Understand "meats" as c_14.
Understand "fridge" as c_14.
The c_14 is in r_4.
The c_14 is open.
The description of c_15 is "The [noun] looks sturdy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to break open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_15 is "ingredients fridge".
Understand "ingredients fridge" as c_15.
Understand "ingredients" as c_15.
Understand "fridge" as c_15.
The c_15 is in r_5.
The c_15 is open.
The description of c_2 is "The [noun] looks robust. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_2 is "red veg basket".
Understand "red veg basket" as c_2.
Understand "red" as c_2.
Understand "veg" as c_2.
Understand "basket" as c_2.
The c_2 is in r_1.
The c_2 is open.
The description of c_3 is "The [noun] looks durable. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_3 is "green veg basket".
Understand "green veg basket" as c_3.
Understand "green" as c_3.
Understand "veg" as c_3.
Understand "basket" as c_3.
The c_3 is in r_1.
The c_3 is open.
The description of c_4 is "The [noun] looks ominous. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to break open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_4 is "yellow basket".
Understand "yellow basket" as c_4.
Understand "yellow" as c_4.
Understand "basket" as c_4.
The c_4 is in r_2.
The c_4 is open.
The description of c_5 is "The [noun] looks towering. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_5 is "donation box".
Understand "donation box" as c_5.
Understand "donation" as c_5.
Understand "box" as c_5.
The c_5 is in r_0.
The c_5 is open.
The description of c_6 is "The [noun] looks commanding. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to force open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_6 is "orange basket".
Understand "orange basket" as c_6.
Understand "orange" as c_6.
Understand "basket" as c_6.
The c_6 is in r_1.
The c_6 is open.
The description of c_7 is "The [noun] looks grand. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to crack open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_7 is "tips box".
Understand "tips box" as c_7.
Understand "tips" as c_7.
Understand "box" as c_7.
The c_7 is in r_9.
The c_7 is open.
The description of c_8 is "The [noun] looks hefty. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to force open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_8 is "fruits fridge".
Understand "fruits fridge" as c_8.
Understand "fruits" as c_8.
Understand "fridge" as c_8.
The c_8 is in r_2.
The c_8 is open.
The description of c_9 is "The [noun] looks noble. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_9 is "veg basket".
Understand "veg basket" as c_9.
Understand "veg" as c_9.
Understand "basket" as c_9.
The c_9 is in r_1.
The c_9 is open.
The description of s_0 is "The [noun] is unstable.".
The printed name of s_0 is "counter".
Understand "counter" as s_0.
The s_0 is in r_0.
The description of s_1 is "The [noun] is solid.".
The printed name of s_1 is "shelf".
Understand "shelf" as s_1.
The s_1 is in r_0.
The description of s_10 is "The [noun] is an unstable piece of garbage.".
The printed name of s_10 is "stationery shelf".
Understand "stationery shelf" as s_10.
Understand "stationery" as s_10.
Understand "shelf" as s_10.
The s_10 is in r_6.
The description of s_11 is "The [noun] is an unstable piece of trash.".
The printed name of s_11 is "toilet".
Understand "toilet" as s_11.
The s_11 is in r_9.
The description of s_12 is "The [noun] is balanced.".
The printed name of s_12 is "hygiene showcase".
Understand "hygiene showcase" as s_12.
Understand "hygiene" as s_12.
Understand "showcase" as s_12.
The s_12 is in r_8.
The description of s_13 is "The [noun] is solid.".
The printed name of s_13 is "hygiene shelf".
Understand "hygiene shelf" as s_13.
Understand "hygiene" as s_13.
Understand "shelf" as s_13.
The s_13 is in r_8.
The description of s_14 is "The [noun] is an unstable piece of junk.".
The printed name of s_14 is "ingreditents showcase".
Understand "ingreditents showcase" as s_14.
Understand "ingreditents" as s_14.
Understand "showcase" as s_14.
The s_14 is in r_5.
The description of s_2 is "The [noun] is shaky.".
The printed name of s_2 is "showcase".
Understand "showcase" as s_2.
The s_2 is in r_0.
The description of s_3 is "The [noun] is wobbly.".
The printed name of s_3 is "ingredients shelf".
Understand "ingredients shelf" as s_3.
Understand "ingredients" as s_3.
Understand "shelf" as s_3.
The s_3 is in r_5.
The description of s_4 is "The [noun] is shaky.".
The printed name of s_4 is "restaurant chair".
Understand "restaurant chair" as s_4.
Understand "restaurant" as s_4.
Understand "chair" as s_4.
The s_4 is in r_9.
The description of s_5 is "The [noun] is stable.".
The printed name of s_5 is "hardware shelf".
Understand "hardware shelf" as s_5.
Understand "hardware" as s_5.
Understand "shelf" as s_5.
The s_5 is in r_7.
The description of s_6 is "The [noun] is solidly built.".
The printed name of s_6 is "meats showcase".
Understand "meats showcase" as s_6.
Understand "meats" as s_6.
Understand "showcase" as s_6.
The s_6 is in r_4.
The description of s_7 is "The [noun] is balanced.".
The printed name of s_7 is "sofa".
Understand "sofa" as s_7.
The s_7 is in r_9.
The description of s_8 is "The [noun] is wobbly.".
The printed name of s_8 is "restaurant table".
Understand "restaurant table" as s_8.
Understand "restaurant" as s_8.
Understand "table" as s_8.
The s_8 is in r_9.
The description of s_9 is "The [noun] is wobbly.".
The printed name of s_9 is "clothing showcase".
Understand "clothing showcase" as s_9.
Understand "clothing" as s_9.
Understand "showcase" as s_9.
The s_9 is in r_3.
The description of toaster_0 is "Useful for grilling things.".
The printed name of toaster_0 is "BBQ".
Understand "BBQ" as toaster_0.
The toaster_0 is in r_9.
The description of f_0 is "You couldn't pay me to eat that [noun].".
The printed name of f_0 is "salt".
Understand "salt" as f_0.
The base of ingredient_0 is f_0.
The f_0 is cooked.
The f_0 is edible.
The f_0 is on the s_3.
The description of f_1 is "The [noun] looks tasty.".
The printed name of f_1 is "flour".
Understand "flour" as f_1.
The f_1 is edible.
The f_1 is on the s_3.
The description of meal_0 is "".
The printed name of meal_0 is "items".
Understand "items" as meal_0.
The meal_0 is edible.
The meal of the RECIPE is the meal_0..
The description of ingredient_0 is "".
The printed name of ingredient_0 is "".
When play begins, add ingredient_0 to the ingredients of the RECIPE.
The ingredient_0 is raw.
The ingredient_0 is uncut.
The description of RECIPE is "".
The printed name of RECIPE is "".
The description of o_0 is "You examine the shopping list and start reading:[line break][line break]Shopping list #1[line break]---------[line break]Gather all following items and follow the directions to enjoy a wonderful and hassle-free day of shopping.[line break][line break]Items:[line break]salt[line break][line break]Directions:[line break]Gather all above items and enjoy![line break]".
The printed name of o_0 is "shopping list".
Understand "list" as o_0.
Understand "shopping list" as o_0.
Understand "shopping" as o_0.
Understand "list" as o_0.
The o_0 is on the s_0.


The player is in r_5.

The quest0 completed is a truth state that varies.
The quest0 completed is usually false.
Every turn:
	if quest0 completed is true:
		do nothing;
	else if The f_0 is burned:
		end the story; [Lost]

The quest1 completed is a truth state that varies.
The quest1 completed is usually false.

Test quest1_0 with "go north / go north / examine shopping list / go south / go south / take salt from ingredients shelf"

Every turn:
	if quest1 completed is true:
		do nothing;
	else if The player carries the f_0:
		increase the score by 1; [Quest completed]
		Now the quest1 completed is true;

The quest2 completed is a truth state that varies.
The quest2 completed is usually false.
Every turn:
	if quest2 completed is true:
		do nothing;
	else if The f_0 is consumed:
		end the story; [Lost]
	else if The f_0 is roasted:
		end the story; [Lost]
	else if The f_0 is grilled:
		end the story; [Lost]
	else if The f_0 is fried:
		end the story; [Lost]

The quest3 completed is a truth state that varies.
The quest3 completed is usually false.
Every turn:
	if quest3 completed is true:
		do nothing;
	else if The f_0 is consumed:
		end the story; [Lost]
	else if The f_0 is sliced:
		end the story; [Lost]
	else if The f_0 is chopped:
		end the story; [Lost]
	else if The f_0 is diced:
		end the story; [Lost]

Use scoring. The maximum score is 1.
This is the simpler notify score changes rule:
	If the score is not the last notified score:
		let V be the score - the last notified score;
		say "Your score has just gone up by [V in words] ";
		if V > 1:
			say "points.";
		else:
			say "point.";
		Now the last notified score is the score;
	if score is maximum score:
		end the story finally; [Win]

The simpler notify score changes rule substitutes for the notify score changes rule.

Rule for listing nondescript items:
	stop.

Rule for printing the banner text:
	say "[fixed letter spacing]";
	say "                    ________  ________  __    __  ________        [line break]";
	say "                   |        \|        \|  \  |  \|        \       [line break]";
	say "                    \$$$$$$$$| $$$$$$$$| $$  | $$ \$$$$$$$$       [line break]";
	say "                      | $$   | $$__     \$$\/  $$   | $$          [line break]";
	say "                      | $$   | $$  \     >$$  $$    | $$          [line break]";
	say "                      | $$   | $$$$$    /  $$$$\    | $$          [line break]";
	say "                      | $$   | $$_____ |  $$ \$$\   | $$          [line break]";
	say "                      | $$   | $$     \| $$  | $$   | $$          [line break]";
	say "                       \$$    \$$$$$$$$ \$$   \$$    \$$          [line break]";
	say "              __       __   ______   _______   __        _______  [line break]";
	say "             |  \  _  |  \ /      \ |       \ |  \      |       \ [line break]";
	say "             | $$ / \ | $$|  $$$$$$\| $$$$$$$\| $$      | $$$$$$$\[line break]";
	say "             | $$/  $\| $$| $$  | $$| $$__| $$| $$      | $$  | $$[line break]";
	say "             | $$  $$$\ $$| $$  | $$| $$    $$| $$      | $$  | $$[line break]";
	say "             | $$ $$\$$\$$| $$  | $$| $$$$$$$\| $$      | $$  | $$[line break]";
	say "             | $$$$  \$$$$| $$__/ $$| $$  | $$| $$_____ | $$__/ $$[line break]";
	say "             | $$$    \$$$ \$$    $$| $$  | $$| $$     \| $$    $$[line break]";
	say "              \$$      \$$  \$$$$$$  \$$   \$$ \$$$$$$$$ \$$$$$$$ [line break]";
	say "[variable letter spacing][line break]";
	say "[objective][line break]".

Include Basic Screen Effects by Emily Short.

Rule for printing the player's obituary:
	if story has ended finally:
		center "*** The End ***";
	else:
		center "*** You lost! ***";
	say paragraph break;
	say "You scored [score] out of a possible [maximum score], in [turn count] turn(s).";
	[wait for any key;
	stop game abruptly;]
	rule succeeds.

Rule for implicitly taking something (called target):
	if target is fixed in place:
		say "The [target] is fixed in place.";
	otherwise:
		say "You need to take the [target] first.";
		set pronouns from target;
	stop.

Does the player mean doing something:
	if the noun is not nothing and the second noun is nothing and the player's command matches the text printed name of the noun:
		it is likely;
	if the noun is nothing and the second noun is not nothing and the player's command matches the text printed name of the second noun:
		it is likely;
	if the noun is not nothing and the second noun is not nothing and the player's command matches the text printed name of the noun and the player's command matches the text printed name of the second noun:
		it is very likely.  [Handle action with two arguments.]

Printing the content of the room is an activity.
Rule for printing the content of the room:
	let R be the location of the player;
	say "Room contents:[line break]";
	list the contents of R, with newlines, indented, including all contents, with extra indentation.

Printing the content of the world is an activity.
Rule for printing the content of the world:
	let L be the list of the rooms;
	say "World: [line break]";
	repeat with R running through L:
		say "  [the internal name of R][line break]";
	repeat with R running through L:
		say "[the internal name of R]:[line break]";
		if the list of things in R is empty:
			say "  nothing[line break]";
		otherwise:
			list the contents of R, with newlines, indented, including all contents, with extra indentation.

Printing the content of the inventory is an activity.
Rule for printing the content of the inventory:
	say "You are carrying: ";
	list the contents of the player, as a sentence, giving inventory information, including all contents;
	say ".".

The print standard inventory rule is not listed in any rulebook.
Carry out taking inventory (this is the new print inventory rule):
	say "You are carrying: ";
	list the contents of the player, as a sentence, giving inventory information, including all contents;
	say ".".

Printing the content of nowhere is an activity.
Rule for printing the content of nowhere:
	say "Nowhere:[line break]";
	let L be the list of the off-stage things;
	repeat with thing running through L:
		say "  [thing][line break]";

Printing the things on the floor is an activity.
Rule for printing the things on the floor:
	let R be the location of the player;
	let L be the list of things in R;
	remove yourself from L;
	remove the list of containers from L;
	remove the list of supporters from L;
	remove the list of doors from L;
	if the number of entries in L is greater than 0:
		say "There is [L with indefinite articles] on the floor.";

After printing the name of something (called target) while
printing the content of the room
or printing the content of the world
or printing the content of the inventory
or printing the content of nowhere:
	follow the property-aggregation rules for the target.

The property-aggregation rules are an object-based rulebook.
The property-aggregation rulebook has a list of text called the tagline.

[At the moment, we only support "open/unlocked", "closed/unlocked" and "closed/locked" for doors and containers.]
[A first property-aggregation rule for an openable open thing (this is the mention open openables rule):
	add "open" to the tagline.

A property-aggregation rule for an openable closed thing (this is the mention closed openables rule):
	add "closed" to the tagline.

A property-aggregation rule for an lockable unlocked thing (this is the mention unlocked lockable rule):
	add "unlocked" to the tagline.

A property-aggregation rule for an lockable locked thing (this is the mention locked lockable rule):
	add "locked" to the tagline.]

A first property-aggregation rule for an openable lockable open unlocked thing (this is the mention open openables rule):
	add "open" to the tagline.

A property-aggregation rule for an openable lockable closed unlocked thing (this is the mention closed openables rule):
	add "closed" to the tagline.

A property-aggregation rule for an openable lockable closed locked thing (this is the mention locked openables rule):
	add "locked" to the tagline.

A property-aggregation rule for a lockable thing (called the lockable thing) (this is the mention matching key of lockable rule):
	let X be the matching key of the lockable thing;
	if X is not nothing:
		add "match [X]" to the tagline.

A property-aggregation rule for an edible off-stage thing (this is the mention eaten edible rule):
	add "eaten" to the tagline.

The last property-aggregation rule (this is the print aggregated properties rule):
	if the number of entries in the tagline is greater than 0:
		say " ([tagline])";
		rule succeeds;
	rule fails;

The objective part 0 is some text that varies. The objective part 0 is "You are eager to shop! Let's get you sorted to quench your desire. Check the shopping list in the checkout for the items needed and directions. Once done, enjoy your items!".

An objective is some text that varies. The objective is "[objective part 0]".
Printing the objective is an action applying to nothing.
Carry out printing the objective:
	say "[objective]".

Understand "goal" as printing the objective.

The taking action has an object called previous locale (matched as "from").

Setting action variables for taking:
	now previous locale is the holder of the noun.

Report taking something from the location:
	say "You pick up [the noun] from the ground." instead.

Report taking something:
	say "You take [the noun] from [the previous locale]." instead.

Report dropping something:
	say "You drop [the noun] on the ground." instead.

The print state option is a truth state that varies.
The print state option is usually false.

Turning on the print state option is an action applying to nothing.
Carry out turning on the print state option:
	Now the print state option is true.

Turning off the print state option is an action applying to nothing.
Carry out turning off the print state option:
	Now the print state option is false.

Printing the state is an activity.
Rule for printing the state:
	let R be the location of the player;
	say "Room: [line break] [the internal name of R][line break]";
	[say "[line break]";
	carry out the printing the content of the room activity;]
	say "[line break]";
	carry out the printing the content of the world activity;
	say "[line break]";
	carry out the printing the content of the inventory activity;
	say "[line break]";
	carry out the printing the content of nowhere activity;
	say "[line break]".

Printing the entire state is an action applying to nothing.
Carry out printing the entire state:
	say "-=STATE START=-[line break]";
	carry out the printing the state activity;
	say "[line break]Score:[line break] [score]/[maximum score][line break]";
	say "[line break]Objective:[line break] [objective][line break]";
	say "[line break]Inventory description:[line break]";
	say "  You are carrying: [a list of things carried by the player].[line break]";
	say "[line break]Room description:[line break]";
	try looking;
	say "[line break]-=STATE STOP=-";

Every turn:
	if extra description command option is true:
		say "<description>";
		try looking;
		say "</description>";
	if extra inventory command option is true:
		say "<inventory>";
		try taking inventory;
		say "</inventory>";
	if extra score command option is true:
		say "<score>[line break][score][line break]</score>";
	if extra score command option is true:
		say "<moves>[line break][turn count][line break]</moves>";
	if print state option is true:
		try printing the entire state;

When play ends:
	if print state option is true:
		try printing the entire state;

After looking:
	carry out the printing the things on the floor activity.

Understand "print_state" as printing the entire state.
Understand "enable print state option" as turning on the print state option.
Understand "disable print state option" as turning off the print state option.

Before going through a closed door (called the blocking door):
	say "You have to open the [blocking door] first.";
	stop.

Before opening a locked door (called the locked door):
	let X be the matching key of the locked door;
	if X is nothing:
		say "The [locked door] is welded shut.";
	otherwise:
		say "You have to unlock the [locked door] with the [X] first.";
	stop.

Before opening a locked container (called the locked container):
	let X be the matching key of the locked container;
	if X is nothing:
		say "The [locked container] is welded shut.";
	otherwise:
		say "You have to unlock the [locked container] with the [X] first.";
	stop.

Displaying help message is an action applying to nothing.
Carry out displaying help message:
	say "[fixed letter spacing]Available commands:[line break]";
	say "  look:                describe the current room[line break]";
	say "  goal:                print the goal of this game[line break]";
	say "  inventory:           print player's inventory[line break]";
	say "  go <dir>:            move the player north, east, south or west[line break]";
	say "  examine ...:         examine something more closely[line break]";
	say "  eat ...:             eat edible food[line break]";
	say "  open ...:            open a door or a container[line break]";
	say "  close ...:           close a door or a container[line break]";
	say "  drop ...:            drop an object on the floor[line break]";
	say "  take ...:            take an object that is on the floor[line break]";
	say "  put ... on ...:      place an object on a supporter[line break]";
	say "  take ... from ...:   take an object from a container or a supporter[line break]";
	say "  insert ... into ...: place an object into a container[line break]";
	say "  lock ... with ...:   lock a door or a container with a key[line break]";
	say "  unlock ... with ...: unlock a door or a container with a key[line break]";

Understand "help" as displaying help message.

Taking all is an action applying to nothing.
Check taking all:
	say "You have to be more specific!";
	rule fails.

Understand "take all" as taking all.
Understand "get all" as taking all.
Understand "pick up all" as taking all.

Understand "take each" as taking all.
Understand "get each" as taking all.
Understand "pick up each" as taking all.

Understand "take everything" as taking all.
Understand "get everything" as taking all.
Understand "pick up everything" as taking all.

The extra description command option is a truth state that varies.
The extra description command option is usually false.

Turning on the extra description command option is an action applying to nothing.
Carry out turning on the extra description command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra description command option is true.

Understand "tw-extra-infos description" as turning on the extra description command option.

The extra inventory command option is a truth state that varies.
The extra inventory command option is usually false.

Turning on the extra inventory command option is an action applying to nothing.
Carry out turning on the extra inventory command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra inventory command option is true.

Understand "tw-extra-infos inventory" as turning on the extra inventory command option.

The extra score command option is a truth state that varies.
The extra score command option is usually false.

Turning on the extra score command option is an action applying to nothing.
Carry out turning on the extra score command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra score command option is true.

Understand "tw-extra-infos score" as turning on the extra score command option.

The extra moves command option is a truth state that varies.
The extra moves command option is usually false.

Turning on the extra moves command option is an action applying to nothing.
Carry out turning on the extra moves command option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the extra moves command option is true.

Understand "tw-extra-infos moves" as turning on the extra moves command option.

To trace the actions:
	(- trace_actions = 1; -).

Tracing the actions is an action applying to nothing.
Carry out tracing the actions:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	trace the actions;

Understand "tw-trace-actions" as tracing the actions.

The restrict commands option is a truth state that varies.
The restrict commands option is usually false.

Turning on the restrict commands option is an action applying to nothing.
Carry out turning on the restrict commands option:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	Now the restrict commands option is true.

Understand "restrict commands" as turning on the restrict commands option.

The taking allowed flag is a truth state that varies.
The taking allowed flag is usually false.

Before removing something from something:
	now the taking allowed flag is true.

After removing something from something:
	now the taking allowed flag is false.

Before taking a thing (called the object) when the object is on a supporter (called the supporter):
	if the restrict commands option is true and taking allowed flag is false:
		say "Can't see any [object] on the floor! Try taking the [object] from the [supporter] instead.";
		rule fails.

Before of taking a thing (called the object) when the object is in a container (called the container):
	if the restrict commands option is true and taking allowed flag is false:
		say "Can't see any [object] on the floor! Try taking the [object] from the [container] instead.";
		rule fails.

Understand "take [something]" as removing it from.

Rule for supplying a missing second noun while removing:
	if restrict commands option is false and noun is on a supporter (called the supporter):
		now the second noun is the supporter;
	else if restrict commands option is false and noun is in a container (called the container):
		now the second noun is the container;
	else:
		try taking the noun;
		say ""; [Needed to avoid printing a default message.]

The version number is always 1.

Reporting the version number is an action applying to nothing.
Carry out reporting the version number:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	say "[version number]".

Understand "tw-print version" as reporting the version number.

Reporting max score is an action applying to nothing.
Carry out reporting max score:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	say "[maximum score]".

Understand "tw-print max_score" as reporting max score.

To print id of (something - thing):
	(- print {something}, "^"; -).

Printing the id of player is an action applying to nothing.
Carry out printing the id of player:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	print id of player.

Printing the id of EndOfObject is an action applying to nothing.
Carry out printing the id of EndOfObject:
	Decrease turn count by 1;  [Internal framework commands shouldn't count as a turn.]
	print id of EndOfObject.

Understand "tw-print player id" as printing the id of player.
Understand "tw-print EndOfObject id" as printing the id of EndOfObject.

There is a EndOfObject.

