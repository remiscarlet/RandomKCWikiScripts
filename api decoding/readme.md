# Major API Dump Sections And Known Information Ver.1.0.1
The kcsapi/start_api2 json dump is split into 17 primary sections. These sections are the top-level of interesting data in the depth of the json tree. To give a better idea of data format, the json tree is split as follows

```
svdata={"api_result":1,"api_result_msg":"成功","api_data":{
  "api_mst_ship":[{DATA},{DATA},...,{DATA}],
  "api_mst_shipgraph":[{DATA},{DATA},...,{DATA}],
  "api_mst_slotitem_equiptype":[{DATA},{DATA},...,{DATA}],
  "api_mst_equip_exslot":[{DATA,{DATA},...,{DATA}],
  "api_mst_stype":[{DATA},{DATA},...,{DATA}],
  "api_mst_slotitem":[{DATA},{DATA},...,{DATA}],
  "api_mst_furniture":[{DATA},{DATA},...,{DATA}],
  "api_mst_furnituregraph":[{DATA},{DATA},...,{DATA}],
  "api_mst_useitem":[{DATA},{DATA},...,{DATA}],
  "api_mst_payitem":[{DATA},{DATA},...,{DATA}],
  "api_mst_maparea":[{DATA},{DATA},...,{DATA}],
  "api_mst_mapinfo":[{DATA},{DATA},...,{DATA}],
  "api_mst_mapbgm":[{DATA},{DATA},...,{DATA}],
  "api_mst_mapcell":[{DATA},{DATA},...,{DATA}],
  "api_mst_mission":[{DATA},{DATA},...,{DATA}],
  "api_mst_shipupgrade":[{DATA},{DATA},...,{DATA}],
  "api_mst_bgm":[{DATA},{DATA},...,{DATA}]
}}
```

Where ```DATA``` is an object containing key-value pairs of data such as ```api_id``` and ```api_sortno```


The sections are as follows and their information is as listed. Sorted alphabetically:

-------

***api_mst_bgm***: Id's for each bgm track and their title. These are bgm's used in port specifically. Note that the url endpoint for these requires a random lowercase letter appended to the id itself to access. Not sure how these work but I've brute-forced them out. 

Access the following tracks at the url ```http://203.104.209.23/kcs/resources/bgm_p/<ID_WITH_LETTER>.swf```

* ```101r```
* ```105h```
* ```106q```
* ```107b```
* ```108o```
* ```109k```
* ```110s```
* ```111c```
* ```112o```
* ```113c```
* ```114s```
* ```115k```
* ```116e```
* ```117a```
* ```118c```
* ```119t```
* ```205c```
* ```206i```
* ```207q```
* ```208a```
* ```209d```
* ```210i```
* ```211p```
* ```212y```
* ```213j```
* ```214w```
* ```215l```
* ```216c```
* ```217s```
* ```218e```
* ```219s```
* ```220i```
* ```221a```
* ```222u```
* ```223q```
* ```224o```
* ```225o```
* ```226k```
* ```227f```
* ```228c```

-------

***api_mst_exslot***
I have no fucking clue dude. It's literally nothing but 3 numbers.

-------

***api_mst_furniture***
Contains information on furniture. Id's, prices, names

-------

***api_mst_furnituregraph***
Presumably a list of equipment that are animated, eg in flash files. api_version may be the number of variants/frames there are.

-------

***api_mst_maparea***
A list of the worlds and their Id's.

-------

***api_mst_mapbgm***
Contains data for what bgm is used in each map. As far as I can tell, the second number in each list isn't used... or something. The "song id" is the 1st element in each list so eg **[10,10]** means the song id is 10.

The url endpoint for map songs is ```http://203.104.209.102/kcs/resources/swf/sound_b_bgm_<id>.swf``` Obviously the hostserver ip is interchangeable with any other server.

-------

***api_mst_mapcell***
Contains every NODE's information on each map. Eg, Node A on 1-1, etc.
* ```api_color_no```:
  * ```0```: The start node
  * ```2```: Resource node
  * ```3```: Maelstrom
  * ```4```: Normal battle
  * ```5```: Boss battle
  * ```7```: Aerial-phase only
  * ```8```: No battle
  * ```9```: Presumably the green recon nodes but unconfirmed.

-------

***api_mst_mapinfo***
Contains information about the map such as its id, description, how many times the boss needs to be killed, difficulty and rewards.
* ```api_id```: Consists of ```api_maparea_id``` and ```api_no``` concatenated together
* ```api_maparea_id```: Value from 1 to 6, denotes the world.
* ```api_no```: Value from 1 to 6, denotes what map of the world we're on. Eg, 2-4 would have value 2 here.
* ```api_name```: The name of the map
* ```api_level```: Difficulty, the star rating
* ```api_opetext```: Operation name
* ```api_infotext```: Description of operation/map
* ```api_item```: Reward id's. Only first two values seem to be populated. Refer to ```api_mst_useitem``` for mapping.
* ```api_max_maphp```: Numerical hp of boss. Only used on event maps. ```null``` if not used
* ```api_required_defeat_count```: Number of kills required. Presumably event maps don't use this as they use ```api_max_maphp``` instead
* ```api_sally_flag```: Unknown. All values are [1,0]. Need data from events to confirm, but may be whether combined fleet or not. Eg, if [1,1] then it means both fleets are used whereas [1,0] means only first is used.

-------

***api_mst_mission***
Expedition information.
* ```api_id```: Expedition number.
* ```api_maparea_id```: Which world
* ```api_name```: Expedition name
* ```api_details```: Details
* ```api_time```: Duration in minutes
* ```api_difficulty```: Letter grade difficulty
* ```api_use_fuel```: Float from 0.0 to 1.0 denoting percentage of max fuel used on each ship
* ```api_use_bull```: Same as above but for ammo
* ```api_win_item1```: Reward. First value is the item id as per ```api_mst_useitem``` and second value is quantity awarded
* ```api_win_item2```: Second reward, if any
* ```api_return_flag```: Not exactly sure, but this is set to 1 on every expedition **except** support expeditions

-------

***api_mst_payitem***
Purchasable entries on the cash store.

-------

***api_mst_ship***
Section of the JSON dump at kcsapi/start_api2 that contains (most) data for shipgirls and abyssals including stats, intro line, identifiers, etc

* ```api_id```: Ship ID
* ```api_afterbull```: Remodeling cost (Ammo)
* ```api_afterlv```: Minimum remodel level
* ```api_aftershipid```: Ship ID after remodel
* ```api_atap```: May have been attack power for equipment. Unused.
* ```api_backs```: Rarity
* ```api_bakk```: Unknown, may have been a substitute for api_backs
* ```api_baku```: Unknown, may have been a substitute for api_backs
* ```api_broken```: Resource gain from deconstruction (scrapping)
* ```api_buildtime```: Ship Construction time
* ```api_bull_max```: Maximum ammo capacity
* ```api_cnum```: Ship index within its category
* ```api_fuel_max```: Maximum fuel capacity
* ```api_getmes```: Ship Acquisition message, displayed when constructed/dropped
* ```api_houg```: Firepower [Base, Max]
* ```api_houk```: Exists on equipment. Evasion bonus.
* ```api_houm```: Exists on equipment. Accuracy bonus.
* ```api_luck```: Luck [Base, Max*] Max can be surpassed with Maruyus, however hardcap maximum luck is 99.
* ```api_raig```: Torpedo stats [Base, Max]
* ```api_sakb```: Exists on equipment. Currently unused, may be in the future.
* ```api_saku```: Exists on equipment. LoS bonus.
* ```api_tais```: Exists in equipment. ASW bonus.
* ```api_slot_num```: Number of Equipment Slots
* ```api_sortno```: Card Number
* ```api_souk```: Armor [Base, Max]
* ```api_soku```: Speed
  * ```5``` = Slow
  * ```10``` = Fast
* ```api_stype```: Ship Type.
  * ```1``` = Unused for now.
  * ```2``` = Destroyer (DD)
  * ```3``` = Light Cruiser (CL)
  * ```4``` = Torpedo Cruiser (CLT)
  * ```5``` = Heavy Cruiser (CA)
  * ```6``` = Aviation Cruiser (CAV)
  * ```7``` = Light Carrier (CVL)

-------

***api_mst_shipgraph***
Contains the obfuscated id's for friendly and enemy vessels. Also contains unused identifiers. New ships have been populating unused identifiers and presumably will continue to do so.

-------

***api_mst_shipupgrade***
Any ship that needs a blueprint or catapult anywhere in its upgrade tree is included in here on all forms. Because this may get confusing, let's pretend we're looking at a Bismarck Zwei.

* ```api_id```: The id of the version of the ship the upgrade will result in. This would mean the id of Bismarck Drei.
* ```api_current_ship_id```: The id of the version of the ship we currently have. This is the id of Bismarck Zwei.
* ```api_original_ship_id```: Id of the lowest form of the ship. This would be the id for Bismarck. (nonkai)
* ```api_upgrade_type```: Unknown. All entries have this value set to 1
* ```api_upgrade_level```: A number indicating which upgrde in the tree we're on. Since Bismarck has BSMK, BSMK kai, BSMK Zwei and BSMK Drei, our Bismarck Zwei is ```api_upgrade_level``` 3, or the third upgrade in the tree.
* ```api_drawing_count```: The number of blueprints needed to achieve the next model. In our case, this value would be 1 since it requires 1 blueprint to get from Zwei to Drei.
* ```api_catapult_count```: What do you think this means.
* ```api_sortno```: The sortno, or the id that appears in-game, of the ship we're upgrading into. Since this list contains all forms of ships that have any kind of item-requiring upgrade in its tree, for cases where we're upgrading non-kai to kai and the in-game id doesn't change, the api_sortno for that ship will simply increase by 100. Eg, Tone is sortno 273 but turns into 373 at kai. This is also actually a simplification because ```api_mst_ship``` has tone kai as 1373. Pretend non-id changing ships have a 1 prepended to their sortno.

-------

***api_mst_slotitem***
Data for every equipment in the game. All id's beyond 500 are abyssal equipment and prior are kanmusu equipment

-------

***api_mst_slotitem_equiptype***
Contains id's for each equipment TYPE such as primary gun, secondary, torpedo, etc

-------

***api_mst_stype***
Contains data on ship types.

-------

***api_mst_useitem***
Contains data for all "usable" items as well as reward items such as resources (fuel/ammo/steel/baux)


