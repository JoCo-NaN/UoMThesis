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


The r_0 and the r_1 and the r_2 and the r_3 and the r_4 and the r_5 are rooms.

Understand "checkout" as r_0.
The internal name of r_0 is "checkout".
The printed name of r_0 is "-= Checkout =-".
The checkout part 0 is some text that varies. The checkout part 0 is "You're not going to believe this, but you've just entered a checkout. You begin to take stock of what's in the room.

 Look out! It's a- oh, never mind, it's just a basket.[if c_0 is open and there is something in the c_0] The basket contains [a list of things in the c_0]. I mean, just wow! Isn't TextWorld just the best?[end if]".
The checkout part 1 is some text that varies. The checkout part 1 is "[if c_0 is open and the c_0 contains nothing] The basket is empty, what a horrible day![end if]".
The checkout part 2 is some text that varies. The checkout part 2 is " You make out a fridge.[if c_1 is open and there is something in the c_1] The fridge contains [a list of things in the c_1].[end if]".
The checkout part 3 is some text that varies. The checkout part 3 is "[if c_1 is open and the c_1 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The checkout part 4 is some text that varies. The checkout part 4 is " You make out a donation box.[if c_8 is open and there is something in the c_8] The donation box contains [a list of things in the c_8].[end if]".
The checkout part 5 is some text that varies. The checkout part 5 is "[if c_8 is open and the c_8 contains nothing] The donation box is empty, what a horrible day![end if]".
The checkout part 6 is some text that varies. The checkout part 6 is " You can see an oven.[if oven_0 is open and there is something in the oven_0] The oven contains [a list of things in the oven_0].[end if]".
The checkout part 7 is some text that varies. The checkout part 7 is "[if oven_0 is open and the oven_0 contains nothing] The oven is empty! This is the worst thing that could possibly happen, ever![end if]".
The checkout part 8 is some text that varies. The checkout part 8 is " Look over there! a counter. [if there is something on the s_0]On the counter you make out [a list of things on the s_0].[end if]".
The checkout part 9 is some text that varies. The checkout part 9 is "[if there is nothing on the s_0]Looks like someone's already been here and taken everything off it, though. You think about smashing the counter to bits, throwing the bits into a pit, etc, until you get bored and decide to move on.[end if]".
The checkout part 10 is some text that varies. The checkout part 10 is " Look out! It's a- oh, never mind, it's just a shelf. [if there is something on the s_1]On the shelf you make out [a list of things on the s_1].[end if]".
The checkout part 11 is some text that varies. The checkout part 11 is "[if there is nothing on the s_1]But the thing is empty.[end if]".
The checkout part 12 is some text that varies. The checkout part 12 is " You make out a showcase. The showcase is metallic.[if there is something on the s_2] On the showcase you make out [a list of things on the s_2].[end if]".
The checkout part 13 is some text that varies. The checkout part 13 is "[if there is nothing on the s_2] The showcase appears to be empty.[end if]".
The checkout part 14 is some text that varies. The checkout part 14 is " You smell an interesting smell, and follow it to a stove. Wow, isn't TextWorld just the best? The stove is conventional.[if there is something on the stove_0] On the stove you can see [a list of things on the stove_0].[end if]".
The checkout part 15 is some text that varies. The checkout part 15 is "[if there is nothing on the stove_0] But the thing hasn't got anything on it. What, you think everything in TextWorld should have stuff on it?[end if]".
The checkout part 16 is some text that varies. The checkout part 16 is "

You need an exit without a door? You should try going east. You don't like doors? Why not try going north, that entranceway is not blocked by one.".
The description of r_0 is "[checkout part 0][checkout part 1][checkout part 2][checkout part 3][checkout part 4][checkout part 5][checkout part 6][checkout part 7][checkout part 8][checkout part 9][checkout part 10][checkout part 11][checkout part 12][checkout part 13][checkout part 14][checkout part 15][checkout part 16]".

The r_4 is mapped north of r_0.
The r_1 is mapped east of r_0.
Understand "fruitssection" as r_1.
The internal name of r_1 is "fruitssection".
The printed name of r_1 is "-= Fruitssection =-".
The fruitssection part 0 is some text that varies. The fruitssection part 0 is "You find yourself in a fruitssection. An ordinary one.

 [if c_10 is locked]A locked[else if c_10 is open]An open[otherwise]A closed[end if]".
The fruitssection part 1 is some text that varies. The fruitssection part 1 is " green fruit basket, which looks woven, is here.[if c_10 is open and there is something in the c_10] The green fruit basket contains [a list of things in the c_10]. Wow, isn't TextWorld just the best?[end if]".
The fruitssection part 2 is some text that varies. The fruitssection part 2 is "[if c_10 is open and the c_10 contains nothing] The green fruit basket is empty! What a waste of a day![end if]".
The fruitssection part 3 is some text that varies. The fruitssection part 3 is " You make out a yellow basket.[if c_2 is open and there is something in the c_2] The yellow basket contains [a list of things in the c_2].[end if]".
The fruitssection part 4 is some text that varies. The fruitssection part 4 is "[if c_2 is open and the c_2 contains nothing] What a letdown! The yellow basket is empty![end if]".
The fruitssection part 5 is some text that varies. The fruitssection part 5 is " You can see [if c_4 is locked]a locked[else if c_4 is open]an opened[otherwise]a closed[end if]".
The fruitssection part 6 is some text that varies. The fruitssection part 6 is " fruits fridge.[if c_4 is open and there is something in the c_4] The fruits fridge contains [a list of things in the c_4]![end if]".
The fruitssection part 7 is some text that varies. The fruitssection part 7 is "[if c_4 is open and the c_4 contains nothing] The fruits fridge is empty, what a horrible day![end if]".
The fruitssection part 8 is some text that varies. The fruitssection part 8 is " You can see [if c_6 is locked]a locked[else if c_6 is open]an opened[otherwise]a closed[end if]".
The fruitssection part 9 is some text that varies. The fruitssection part 9 is " red fruit basket.[if c_6 is open and there is something in the c_6] The red fruit basket contains [a list of things in the c_6].[end if]".
The fruitssection part 10 is some text that varies. The fruitssection part 10 is "[if c_6 is open and the c_6 contains nothing] The red fruit basket is empty! What a waste of a day![end if]".
The fruitssection part 11 is some text that varies. The fruitssection part 11 is " You can make out [if c_9 is locked]a locked[else if c_9 is open]an opened[otherwise]a closed[end if]".
The fruitssection part 12 is some text that varies. The fruitssection part 12 is " fruit basket.[if c_9 is open and there is something in the c_9] The fruit basket contains [a list of things in the c_9]. The light flickers for a second, but nothing else happens.[end if]".
The fruitssection part 13 is some text that varies. The fruitssection part 13 is "[if c_9 is open and the c_9 contains nothing] What a letdown! The fruit basket is empty![end if]".
The fruitssection part 14 is some text that varies. The fruitssection part 14 is "

There is an exit to the east. There is an exit to the south. Don't worry, there is no door. You need an exit without a door? You should try going west.".
The description of r_1 is "[fruitssection part 0][fruitssection part 1][fruitssection part 2][fruitssection part 3][fruitssection part 4][fruitssection part 5][fruitssection part 6][fruitssection part 7][fruitssection part 8][fruitssection part 9][fruitssection part 10][fruitssection part 11][fruitssection part 12][fruitssection part 13][fruitssection part 14]".

The r_0 is mapped west of r_1.
The r_3 is mapped south of r_1.
The r_2 is mapped east of r_1.
Understand "meatssection" as r_2.
The internal name of r_2 is "meatssection".
The printed name of r_2 is "-= Meatssection =-".
The meatssection part 0 is some text that varies. The meatssection part 0 is "You find yourself in a meatssection. An usual one.

 You can see a meats fridge.[if c_11 is open and there is something in the c_11] The meats fridge contains [a list of things in the c_11].[end if]".
The meatssection part 1 is some text that varies. The meatssection part 1 is "[if c_11 is open and the c_11 contains nothing] The meats fridge is empty! This is the worst thing that could possibly happen, ever![end if]".
The meatssection part 2 is some text that varies. The meatssection part 2 is " You scan the room for a meats showcase, and you find a meats showcase. The meats showcase is metallic.[if there is something on the s_5] On the meats showcase you can see [a list of things on the s_5]. Suddenly, you bump your head on the ceiling, but it's not such a bad bump that it's going to prevent you from looking at objects and even things.[end if]".
The meatssection part 3 is some text that varies. The meatssection part 3 is "[if there is nothing on the s_5] But oh no! there's nothing on this piece of trash.[end if]".
The meatssection part 4 is some text that varies. The meatssection part 4 is "

There is an exit to the south. You don't like doors? Why not try going west, that entranceway is not blocked by one.".
The description of r_2 is "[meatssection part 0][meatssection part 1][meatssection part 2][meatssection part 3][meatssection part 4]".

The r_1 is mapped west of r_2.
The r_5 is mapped south of r_2.
Understand "clothingsection" as r_3.
The internal name of r_3 is "clothingsection".
The printed name of r_3 is "-= Clothingsection =-".
The clothingsection part 0 is some text that varies. The clothingsection part 0 is "You find yourself in a clothingsection. A standard one. You can barely contain your excitement.

 You can see a clothing showcase. [if there is something on the s_4]You see [a list of things on the s_4] on the clothing showcase.[end if]".
The clothingsection part 1 is some text that varies. The clothingsection part 1 is "[if there is nothing on the s_4]But the thing hasn't got anything on it.[end if]".
The clothingsection part 2 is some text that varies. The clothingsection part 2 is "

There is an exit to the north. Don't worry, there is no door.".
The description of r_3 is "[clothingsection part 0][clothingsection part 1][clothingsection part 2]".

The r_1 is mapped north of r_3.
Understand "vegetablessection" as r_4.
The internal name of r_4 is "vegetablessection".
The printed name of r_4 is "-= Vegetablessection =-".
The vegetablessection part 0 is some text that varies. The vegetablessection part 0 is "You have moved into a vegetablessection. Not the vegetablessection you'd expect. No, this is a vegetablessection.

 Look out! It's a- oh, never mind, it's just a green veg basket.[if c_3 is open and there is something in the c_3] The green veg basket contains [a list of things in the c_3]. You check the price tag glued to the green veg basket. Fifty bucks?! That's ridiculous! Do you know my pal, they work for the mayor? I'm sure my friend could get you one of those for 70 bucks![end if]".
The vegetablessection part 1 is some text that varies. The vegetablessection part 1 is "[if c_3 is open and the c_3 contains nothing] Empty! What kind of nightmare TextWorld is this?[end if]".
The vegetablessection part 2 is some text that varies. The vegetablessection part 2 is " You make out [if c_5 is locked]a locked[else if c_5 is open]an opened[otherwise]a closed[end if]".
The vegetablessection part 3 is some text that varies. The vegetablessection part 3 is " veg basket.[if c_5 is open and there is something in the c_5] The veg basket contains [a list of things in the c_5].[end if]".
The vegetablessection part 4 is some text that varies. The vegetablessection part 4 is "[if c_5 is open and the c_5 contains nothing] The veg basket is empty! What a waste of a day![end if]".
The vegetablessection part 5 is some text that varies. The vegetablessection part 5 is " You can see [if c_7 is locked]a locked[else if c_7 is open]an opened[otherwise]a closed[end if]".
The vegetablessection part 6 is some text that varies. The vegetablessection part 6 is " conventional looking veg fridge right there by you.[if c_7 is open and there is something in the c_7] The veg fridge contains [a list of things in the c_7]. Classic TextWorld.[end if]".
The vegetablessection part 7 is some text that varies. The vegetablessection part 7 is "[if c_7 is open and the c_7 contains nothing] The veg fridge is empty, what a horrible day![end if]".
The vegetablessection part 8 is some text that varies. The vegetablessection part 8 is "

There is an exit to the south. Don't worry, there is no door.".
The description of r_4 is "[vegetablessection part 0][vegetablessection part 1][vegetablessection part 2][vegetablessection part 3][vegetablessection part 4][vegetablessection part 5][vegetablessection part 6][vegetablessection part 7][vegetablessection part 8]".

The r_0 is mapped south of r_4.
Understand "ingredientssection" as r_5.
The internal name of r_5 is "ingredientssection".
The printed name of r_5 is "-= Ingredientssection =-".
The ingredientssection part 0 is some text that varies. The ingredientssection part 0 is "Well, here we are in the ingredientssection. You start to take note of what's in the room.

 You see an ingredients fridge. Classic TextWorld.[if c_12 is open and there is something in the c_12] The ingredients fridge contains [a list of things in the c_12]. There's something strange about this being here, but you can't put your finger on it.[end if]".
The ingredientssection part 1 is some text that varies. The ingredientssection part 1 is "[if c_12 is open and the c_12 contains nothing] What a letdown! The ingredients fridge is empty![end if]".
The ingredientssection part 2 is some text that varies. The ingredientssection part 2 is " You bend down to tie your shoe. When you stand up, you notice an ingredients shelf. [if there is something on the s_3]On the ingredients shelf you can see [a list of things on the s_3].[end if]".
The ingredientssection part 3 is some text that varies. The ingredientssection part 3 is "[if there is nothing on the s_3]The ingredients shelf appears to be empty.[end if]".
The ingredientssection part 4 is some text that varies. The ingredientssection part 4 is "

There is an exit to the north.".
The description of r_5 is "[ingredientssection part 0][ingredientssection part 1][ingredientssection part 2][ingredientssection part 3][ingredientssection part 4]".

The r_2 is mapped north of r_5.

The RECIPE are recipe-likes.
The RECIPE are privately-named.
The c_0 and the c_1 and the c_10 and the c_11 and the c_12 and the c_2 and the c_3 and the c_4 and the c_5 and the c_6 and the c_7 and the c_8 and the c_9 are containers.
The c_0 and the c_1 and the c_10 and the c_11 and the c_12 and the c_2 and the c_3 and the c_4 and the c_5 and the c_6 and the c_7 and the c_8 and the c_9 are privately-named.
The f_0 are foods.
The f_0 are privately-named.
The ingredient_0 are ingredient-likes.
The ingredient_0 are privately-named.
The meal_0 are meal-likes.
The meal_0 are privately-named.
The o_0 and the o_1 are object-likes.
The o_0 and the o_1 are privately-named.
The oven_0 are oven-likes.
The oven_0 are privately-named.
The r_0 and the r_1 and the r_2 and the r_3 and the r_4 and the r_5 are rooms.
The r_0 and the r_1 and the r_2 and the r_3 and the r_4 and the r_5 are privately-named.
The s_0 and the s_1 and the s_2 and the s_3 and the s_4 and the s_5 are supporters.
The s_0 and the s_1 and the s_2 and the s_3 and the s_4 and the s_5 are privately-named.
The stove_0 are stove-likes.
The stove_0 are privately-named.

The description of c_0 is "The [noun] looks stuffy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_0 is "basket".
Understand "basket" as c_0.
The c_0 is in r_0.
The c_0 is open.
The description of c_1 is "The [noun] looks rugged. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_1 is "fridge".
Understand "fridge" as c_1.
The c_1 is in r_0.
The c_1 is open.
The description of c_10 is "The [noun] looks grand. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_10 is "green fruit basket".
Understand "green fruit basket" as c_10.
Understand "green" as c_10.
Understand "fruit" as c_10.
Understand "basket" as c_10.
The c_10 is in r_1.
The c_10 is open.
The description of c_11 is "The [noun] looks sturdy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_11 is "meats fridge".
Understand "meats fridge" as c_11.
Understand "meats" as c_11.
Understand "fridge" as c_11.
The c_11 is in r_2.
The c_11 is open.
The description of c_12 is "The [noun] looks noble. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to bash open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_12 is "ingredients fridge".
Understand "ingredients fridge" as c_12.
Understand "ingredients" as c_12.
Understand "fridge" as c_12.
The c_12 is in r_5.
The c_12 is open.
The description of c_2 is "The [noun] looks hefty. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_2 is "yellow basket".
Understand "yellow basket" as c_2.
Understand "yellow" as c_2.
Understand "basket" as c_2.
The c_2 is in r_1.
The c_2 is open.
The description of c_3 is "The [noun] looks sturdy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to crack open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_3 is "green veg basket".
Understand "green veg basket" as c_3.
Understand "green" as c_3.
Understand "veg" as c_3.
Understand "basket" as c_3.
The c_3 is in r_4.
The c_3 is open.
The description of c_4 is "The [noun] looks noble. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_4 is "fruits fridge".
Understand "fruits fridge" as c_4.
Understand "fruits" as c_4.
Understand "fridge" as c_4.
The c_4 is in r_1.
The c_4 is open.
The description of c_5 is "The [noun] looks hefty. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to crack open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_5 is "veg basket".
Understand "veg basket" as c_5.
Understand "veg" as c_5.
Understand "basket" as c_5.
The c_5 is in r_4.
The c_5 is open.
The description of c_6 is "The [noun] looks sturdy. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_6 is "red fruit basket".
Understand "red fruit basket" as c_6.
Understand "red" as c_6.
Understand "fruit" as c_6.
Understand "basket" as c_6.
The c_6 is in r_1.
The c_6 is open.
The description of c_7 is "The [noun] looks ominous. [if open]It is open.[else if locked]It is locked.[otherwise]It is closed.[end if]".
The printed name of c_7 is "veg fridge".
Understand "veg fridge" as c_7.
Understand "veg" as c_7.
Understand "fridge" as c_7.
The c_7 is in r_4.
The c_7 is open.
The description of c_8 is "The [noun] looks stuffy. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to crack open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_8 is "donation box".
Understand "donation box" as c_8.
Understand "donation" as c_8.
Understand "box" as c_8.
The c_8 is in r_0.
The c_8 is open.
The description of c_9 is "The [noun] looks durable. [if open]You can see inside it.[else if locked]There is a lock on it and seems impossible to force open.[otherwise]You can't see inside it because the lid's in your way.[end if]".
The printed name of c_9 is "fruit basket".
Understand "fruit basket" as c_9.
Understand "fruit" as c_9.
Understand "basket" as c_9.
The c_9 is in r_1.
The c_9 is open.
The description of oven_0 is "Useful for roasting things.".
The printed name of oven_0 is "oven".
Understand "oven" as oven_0.
The oven_0 is in r_0.
The description of s_0 is "The [noun] is wobbly.".
The printed name of s_0 is "counter".
Understand "counter" as s_0.
The s_0 is in r_0.
The description of s_1 is "The [noun] is solidly built.".
The printed name of s_1 is "shelf".
Understand "shelf" as s_1.
The s_1 is in r_0.
The description of s_2 is "The [noun] is unstable.".
The printed name of s_2 is "showcase".
Understand "showcase" as s_2.
The s_2 is in r_0.
The description of s_3 is "The [noun] is undependable.".
The printed name of s_3 is "ingredients shelf".
Understand "ingredients shelf" as s_3.
Understand "ingredients" as s_3.
Understand "shelf" as s_3.
The s_3 is in r_5.
The description of s_4 is "The [noun] is solid.".
The printed name of s_4 is "clothing showcase".
Understand "clothing showcase" as s_4.
Understand "clothing" as s_4.
Understand "showcase" as s_4.
The s_4 is in r_3.
The description of s_5 is "The [noun] is solidly built.".
The printed name of s_5 is "meats showcase".
Understand "meats showcase" as s_5.
Understand "meats" as s_5.
Understand "showcase" as s_5.
The s_5 is in r_2.
The description of stove_0 is "Useful for frying things.".
The printed name of stove_0 is "stove".
Understand "stove" as stove_0.
The stove_0 is in r_0.
The description of f_0 is "The [noun] looks inviting.".
The printed name of f_0 is "t-shirt".
Understand "t-shirt" as f_0.
The base of ingredient_0 is f_0.
The f_0 is cooked.
The f_0 is edible.
The f_0 is on the s_4.
The description of meal_0 is "".
The printed name of meal_0 is "meal".
Understand "meal" as meal_0.
The meal_0 is edible.
The meal of the RECIPE is the meal_0..
The description of ingredient_0 is "".
The printed name of ingredient_0 is "".
When play begins, add ingredient_0 to the ingredients of the RECIPE.
The ingredient_0 is raw.
The ingredient_0 is uncut.
The description of RECIPE is "".
The printed name of RECIPE is "".
The description of o_0 is "You examine the shopping list and start reading:[line break][line break]Recipe #1[line break]---------[line break]Gather all following ingredients and follow the directions to prepare this tasty meal.[line break][line break]Ingredients:[line break]t-shirt[line break][line break]Directions:[line break]prepare meal[line break]".
The printed name of o_0 is "shopping list".
Understand "recipe" as o_0.
Understand "shopping list" as o_0.
Understand "shopping" as o_0.
Understand "list" as o_0.
The o_0 is on the s_0.
The description of o_1 is "The [noun] appears to be to fit in here".
The printed name of o_1 is "knife".
Understand "knife" as o_1.
The o_1 is on the s_0.
The o_1 is sharp.


The player is in r_3.

The quest0 completed is a truth state that varies.
The quest0 completed is usually false.
Every turn:
	if quest0 completed is true:
		do nothing;
	else if The f_0 is burned:
		end the story; [Lost]

The quest1 completed is a truth state that varies.
The quest1 completed is usually false.

Test quest1_0 with "inventory / go north / go west / examine shopping list / go east / go south / take t-shirt from clothing showcase"

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
	else if The f_0 is fried:
		end the story; [Lost]
	else if The f_0 is grilled:
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
	else if The f_0 is diced:
		end the story; [Lost]
	else if The f_0 is chopped:
		end the story; [Lost]

The quest4 completed is a truth state that varies.
The quest4 completed is usually false.

Test quest4_0 with "inventory / go north / go west / examine shopping list / go east / go south / take t-shirt from clothing showcase / go north / go west / prepare meal"

Every turn:
	if quest4 completed is true:
		do nothing;
	else if The f_0 is consumed:
		end the story; [Lost]
	else if The player carries the meal_0:
		increase the score by 1; [Quest completed]
		Now the quest4 completed is true;

The quest5 completed is a truth state that varies.
The quest5 completed is usually false.

Test quest5_0 with "inventory / go north / go west / examine shopping list / go east / go south / take t-shirt from clothing showcase / go north / go west / prepare meal / eat meal"

Every turn:
	if quest5 completed is true:
		do nothing;
	else if The meal_0 is burned:
		end the story; [Lost]
	else if The meal_0 is consumed:
		increase the score by 1; [Quest completed]
		Now the quest5 completed is true;

Use scoring. The maximum score is 3.
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

The objective part 0 is some text that varies. The objective part 0 is "You are hungry! Let's cook a delicious meal. Check the shopping list in the checkout for the recipe. Once done, enjoy your meal!".

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

