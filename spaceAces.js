//This code generates all code for Space Aces
console.log(`\x1b[34m	Space Aces Generator v3.1.0	\n\n\x1b[0m`);
global.__basedir = __dirname;
global.__tick = ``;

const fs = require("fs");
const afs = require("./libraries/generic/afs.js");
require("./libraries/arena.js");

const staticFiles = fs.readdirSync("./libraries/not-generated");
for(let i=0;i<staticFiles.length;i++) {
  afs.copyFilesSync("./libraries/not-generated/" + staticFiles[i],"./SpaceAces/data");
}



const Translate = function(translate,color) {
  if(color==undefined) {
    return `\\\"translate\\\":\\\"${translate}\\\"`;
  } else {
    return `{\\\"translate\\\":\\\"${translate}\\\",\\\"color\\\":\\\"${color}\\\"}`;
  }
}

const Constant = function(n) {
  let currentLC = "#List of generated constants";
  try {
    currentLC = fs.readFileSync(`./SpaceAces/data/load/functions/constants.mcfunction`);
  } catch(e) {}
  let check = currentLC.indexOf(" " + n + " ")
  if(check==-1) {
    fs.writeFileSync(`./SpaceAces/data/load/functions/constants.mcfunction`,`${currentLC}\nscoreboard players set ${n} Numbers ${n}`);
  }
}

// hitbox generation
let hitboxes = `#Stores all hitboxes, which are used by all projectiles`;
let generatedHB = fs.readdirSync("./hitboxes");
for(let i=0;i<generatedHB.length;i++) {
  console.log(`Generating hitbox for: ${generatedHB[i].slice(0, -5)}`);
    let type = generatedHB[i].split('.').pop();
    if(type=="json") {
      try {
        hitboxes = `${hitboxes}
execute positioned ~ ~-1 ~ if entity @e[tag=hb_${generatedHB[i].slice(0, -5)},distance=..2] positioned ~ ~1 ~ run function projectile:hitboxes/${generatedHB[i].slice(0, -5)}`
        let newHB = JSON.parse(fs.readFileSync(`./hitboxes/${generatedHB[i]}`));
        let hitboxFile = `#Hitbox for entities tagged with hb_${generatedHB[i].slice(0, -5)}`;
        for(let j=0;j<newHB.elements.length;j++) {
          let offsety = newHB.elements[j].from[1]/16,
              l = Math.abs((newHB.elements[j].to[0]-newHB.elements[j].from[0])/16),
              w = Math.abs((newHB.elements[j].to[2]-newHB.elements[j].from[2])/16),
              h = Math.abs((newHB.elements[j].to[1]-newHB.elements[j].from[1])/16);
          let distance = (Math.floor((Math.sqrt(Math.pow(.5*l,2)+Math.pow(.5*w,2)+Math.pow(.5*h,2)))*1000))/1000;
          let criticalBox = "damage";
          if(j==0) {
            criticalBox = "doubledamage";
          };
          hitboxFile = `${hitboxFile}
execute positioned ~ ~-${.5*h+offsety} ~ if entity @e[tag=hb_${generatedHB[i].slice(0, -5)},distance=..${distance},limit=1,sort=nearest] run function projectile:${criticalBox}`;
        }
        fs.writeFileSync(`./SpaceAces/data/projectile/functions/hitboxes/${generatedHB[i].slice(0, -5)}.mcfunction`,hitboxFile);
      } catch(e) {
        console.log(e);
      }
    }
}

fs.writeFileSync(__basedir + "/SpaceAces/data/projectile/functions/hitbox.mcfunction",hitboxes);



const characters = ["halley_wales","chip_rogers","spud_stark","db_nebula","reginald_shultz","liz_ericson","steve_manning","sky_florence","johnny_sprocket","chatter_barnes","howard_barton","anne_schmidt","antonio_goodman","race_lago","maria_mercendesz","gunn_frobe","cain_rogers","jenn_spurs","twitchy_mcghee","barge_hernandez","star_workman","moose_sayjack","spike_wong","viz_barclay","whitney_eclipse","jasper_smith","brim_rock","sarah_salis","jafan_kesysk","komang_zlatan"];
let archives = `#for archive room
execute unless score archive Numbers matches 0.. run scoreboard players set archive Numbers 29
execute unless score archive Numbers matches ..29 run scoreboard players set archive Numbers 0
execute if score archive Numbers matches 0..14 run replaceitem entity @e[type=armor_stand,tag=archive_display,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:lapis_block"}]}] armor.head lapis_block
execute if score archive Numbers matches 15.. run replaceitem entity @e[type=armor_stand,tag=archive_display,nbt=!{ArmorItems:[{},{},{},{id:"minecraft:redstone_block"}]}] armor.head redstone_block
execute as @e[type=armor_stand,tag=archive_display] at @s run tp @s ~ ~ ~ ~1 ~`;


for(let i=0;i<characters.length;i++) {
  archives = `${archives}
execute if score archive Numbers matches ${i} run data merge block 8 215 1 {Text2:"{\\"translate\\":\\"${characters[i]}\\",\\"color\\":\\"dark_aqua\\",\\"bold\\":true,\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"function archives:${characters[i]}\\"}}"}`;
}
afs.mkdirsSync(`./SpaceAces/data/archives/functions`);
fs.writeFileSync(`./SpaceAces/data/archives/functions/main.mcfunction`,archives.replace(/\t/g,''));

const archive = JSON.parse(fs.readFileSync("./libraries/archives/characters.json"));

for(let i=0;i<Object.keys(archive.characters).length;i++) {
  let characterCommand = `tellraw @s {"text":"\\n\\n\\n${archive.characters[Object.keys(archive.characters)[i]].display}:\\n","color":"${archive.characters[Object.keys(archive.characters)[i]].color}","bold":true,"underlined":true,"extra":[{"text":"\\nClass: ","color":"dark_gray","bold":true,"underlined":false},{"text":"${archive.characters[Object.keys(archive.characters)[i]].class}","color":"${archive.characters[Object.keys(archive.characters)[i]].color}","bold":false,"underlined":false},{"text":"\\nY.O.B: ","color":"dark_gray","bold":true,"underlined":false},{"text":"${archive.characters[Object.keys(archive.characters)[i]].yob}","color":"${archive.characters[Object.keys(archive.characters)[i]].color}","bold":false,"underlined":false},{"text":"\\nPlanet: ","color":"dark_gray","bold":true,"underlined":false},{"text":"${archive.characters[Object.keys(archive.characters)[i]].planet}","color":"${archive.characters[Object.keys(archive.characters)[i]].color}","bold":false,"underlined":false},{"text":"\\nBackground: ","color":"dark_gray","bold":true,"underlined":false},{"text":"${archive.characters[Object.keys(archive.characters)[i]].background}","color":"${archive.characters[Object.keys(archive.characters)[i]].color}","bold":false,"underlined":false}]}`;
  fs.writeFileSync(`./SpaceAces/data/archives/functions/${Object.keys(archive.characters)[i]}.mcfunction`,characterCommand)
};


Constant(2);
Constant(20);
Constant(10);
Constant(5);
Constant(16);


{//Update Armor
let update_armor_blue = `#updates armor to display health
scoreboard players set @s[scores={displayHealth=10..}] displayHealth 9
replaceitem entity @s[level=..14,team=blue,tag=!invis] armor.legs leather_leggings{HideFlags:7,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:587429,UUIDMost:448322}],Unbreakable:1,display:{color:524543},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[level=15..,team=blue,tag=!invis] armor.legs chainmail_leggings{HideFlags:63,Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:859049,UUIDMost:39080}]}
replaceitem entity @s[level=..14,team=blue,tag=!invis] armor.chest leather_chestplate{HideFlags:7,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:587429,UUIDMost:448322}],Unbreakable:1,display:{color:524543},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[level=15..,team=blue,tag=!invis] armor.chest chainmail_chestplate{HideFlags:63,Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:859049,UUIDMost:39080}]}
`;
let update_armor_red = `#updates armor to display health
scoreboard players set @s[scores={displayHealth=10..}] displayHealth 9
replaceitem entity @s[level=..14,team=red,tag=!invis] armor.legs leather_leggings{HideFlags:7,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:587429,UUIDMost:448322}],Unbreakable:1,display:{color:16711680},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[level=15..,team=red,tag=!invis] armor.legs golden_leggings{HideFlags:63,Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:859049,UUIDMost:39080}]}
replaceitem entity @s[level=..14,team=red,tag=!invis] armor.chest leather_chestplate{HideFlags:7,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:587429,UUIDMost:448322}],Unbreakable:1,display:{color:16711680},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[level=15..,team=red,tag=!invis] armor.chest golden_chestplate{HideFlags:63,Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:859049,UUIDMost:39080}]}`;
for(let i=0;i<10;i++) {
  update_armor_blue = `${update_armor_blue}
    replaceitem entity @s[level=..14,team=blue,tag=!invis,scores={displayHealth=${9-i}}] armor.feet minecraft:leather_boots{HideFlags:7,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:587429,UUIDMost:448322},{AttributeName:"generic.maxHealth",Name:"generic.maxHealth",Amount:${-i/10},Operation:2,UUIDLeast:826507,UUIDMost:221912,Slot:"feet"}],Unbreakable:1,display:{color:524543},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
    replaceitem entity @s[level=15..,team=blue,tag=!invis,scores={displayHealth=${9-i}}] armor.feet minecraft:chainmail_boots{HideFlags:63,Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:859049,UUIDMost:39080},{AttributeName:"generic.armorToughness",Name:"generic.armorToughness",Amount:0,Operation:0,UUIDLeast:445359,UUIDMost:188469},{AttributeName:"generic.maxHealth",Name:"generic.maxHealth",Amount:${-i/10},Operation:2,UUIDLeast:826507,UUIDMost:221912,Slot:"feet"}]}`

  update_armor_red = `${update_armor_red}
    replaceitem entity @s[level=..9,team=red,tag=!invis,scores={displayHealth=${9-i}}] armor.feet minecraft:leather_boots{HideFlags:7,AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:587429,UUIDMost:448322},{AttributeName:"generic.maxHealth",Name:"generic.maxHealth",Amount:${-i/10},Operation:2,UUIDLeast:826507,UUIDMost:221912,Slot:"feet"}],Unbreakable:1,display:{color:16711680},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
    replaceitem entity @s[level=10..,team=red,tag=!invis,scores={displayHealth=${9-i}}] armor.feet minecraft:golden_boots{HideFlags:63,Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:859049,UUIDMost:39080},{AttributeName:"generic.armorToughness",Name:"generic.armorToughness",Amount:0,Operation:0,UUIDLeast:445359,UUIDMost:188469},{AttributeName:"generic.maxHealth",Name:"generic.maxHealth",Amount:${-i/10},Operation:2,UUIDLeast:826507,UUIDMost:221912,Slot:"feet"}]}`
};
fs.writeFileSync(`./SpaceAces/data/health/functions/update_armor_blue.mcfunction`,update_armor_blue.replace(/\t/g,''));
fs.writeFileSync(`./SpaceAces/data/health/functions/update_armor_red.mcfunction`,update_armor_red.replace(/\t/g,''));}

let impact = `tag @s add kill
execute if entity @s[tag=stun] run function classes:shocksmith/stun/land
execute if entity @s[tag=fire_bomb] run function classes:pyro/fire_bomb/land`;

let classFinder = "";

let classes = fs.readdirSync("./libraries/class");
for(let i=0; i<classes.length; i++) {
  const fileName = classes[i];
  const c = JSON.parse(fs.readFileSync(`./libraries/class/${fileName}`));
	const lname = c.name.toLowerCase();
  classFinder += `execute if score @s Class matches ${c.id} run function classes:${lname}/base\n`;
  //generates filepaths for Class
	afs.mkdirsSync(`./SpaceAces/data/classes/functions/${lname}`);
  Constant(c.health);

  let secondaryLore = Translate(c.secondary.name+"_lore1","white"),tertiaryLore = Translate(c.tertiary.name+"_lore1","white");

  for(let j=2; j<c.secondary.lore_lines+1;j++) {
    secondaryLore = `${secondaryLore}","${Translate(c.secondary.name+"_lore"+j,"white")}`;
  }

  for(let j=2; j<c.tertiary.lore_lines+1;j++) {
    tertiaryLore = `${tertiaryLore}","${Translate(c.tertiary.name+"_lore"+j,"white")}`;
  }

  let base = `replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:${(c.speed-100)/100},Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:${c.helmet_color}},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:${(c.aim_speed-100)/100},Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:${c.helmet_color}},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"${Translate(c.secondary.name,"white")}",Lore:["${secondaryLore}"]},HideFlags:63,CustomModelData:${11000001+(10000*c.id)},Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:${lname}/${c.secondary.name}/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=${c.secondary.duration}}] run function classes:${lname}/${c.secondary.name}/deactivate
scoreboard players set @s[scores={activate_second=${c.secondary.recharge}..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"${Translate(c.tertiary.name,"white")}",Lore:["${tertiaryLore}"]},HideFlags:63,CustomModelData:${11000002+(10000*c.id)},Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:${lname}/${c.tertiary.name}/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=${c.tertiary.duration}}] run function classes:${lname}/${c.tertiary.name}/deactivate
scoreboard players set @s[scores={activate_third=${c.tertiary.recharge}..}] activate_third 0
scoreboard players set @s maxHealth ${c.health}\n`;

  if(c.primary.type=="melee") {
    let item;
    if(c.primary.slash==true||c.primary.slash==1) {
      item = "golden_sword"
    } else {
      item = "golden_shovel"
    };
    let flame = "";
    if(c.primary.fire>0) {
      flame = `,Enchantments:[{id:"minecraft:fire_aspect",lvl:${c.primary.fire}}]`
    }
    base = `${base}\nreplaceitem entity @s hotbar.0 ${item}{display:{Name:"{${Translate(c.primary.name)}}",Lore:["${Translate(c.primary.name+"_lore","white")}","{\\"text\\":\\" - damage: ${c.primary.damage}\\",\\"color\\":\\"white\\",\\"italic\\":false}"]},HideFlags:63,CustomModelData:${11000000+(10000*c.id)}${flame},HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:${c.primary.damage},Operation:0,UUIDLeast:369737,UUIDMost:252112,Slot:"mainhand"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:${-4+c.primary.cool_down},Operation:0,UUIDLeast:45318,UUIDMost:673759,Slot:"mainhand"}]}
scoreboard players set @s[scores={crouching=1..}] crouching 0
replaceitem entity @s weapon.offhand air`;

} else if(c.primary.type=="gun"||c.primary.type=="launcher") {

  for(let i=0;i<c.primary.ammo;i++) {
    base = `${base}\nreplaceitem entity @s[scores={totalShots=${i}}] weapon.offhand arrow ${c.primary.ammo-i}`
  }

  let nbt = `display:{Name:"{${Translate(c.primary.name)}}",Lore:["${Translate(c.primary.name+"_lore","white")}","{\\"text\\":\\" - damage: ${c.primary.projectile.damage}\\",\\"color\\":\\"white\\",\\"italic\\":false}","{\\"text\\":\\" - ammo: ${c.primary.ammo}\\",\\"color\\":\\"white\\",\\"italic\\":false}","{\\"text\\":\\" - reload speed: ${c.primary.reload/20}s\\",\\"color\\":\\"white\\",\\"italic\\":false}"]},HideFlags:63,CustomModelData:${11000000+(10000*c.id)}`;
  //main functions always run
  base = `${base}\nreplaceitem entity @s[scores={totalShots=${c.primary.ammo}}] weapon.offhand air
replaceitem entity @s[scores={reload=0,shoot=0}] hotbar.0 carrot_on_a_stick{${nbt},Unbreakable:1}
replaceitem entity @s[scores={reload=0,shoot=1..}] hotbar.0 paper{${nbt}}
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=0}] rightClick matches 1.. run scoreboard players set @s shoot 1
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=1}] rightClick matches 1.. run scoreboard players add @s totalShots 1
scoreboard players reset @s[nbt={SelectedItemSlot:0}] rightClick
execute if score @s shoot matches 1 run function classes:${lname}/shoot
scoreboard players add @s[scores={shoot=1..}] shoot 1
scoreboard players set @s[scores={shoot=${c.primary.delay}..}] shoot 0
scoreboard players add @s[scores={totalShots=${c.primary.ammo}..,reload=0}] reload 1
execute if score @s reload matches 1.. run function classes:${lname}/reload
scoreboard players set @s[scores={crouching=1..}] crouching 0`;

    //this algorithm sets up the commands for when the gun is reloading.  it is a bit complex to optimize looks and functions
  let reloadingFunctions = "#Used when reloading"
  let previousReload = 0;
  for(let i=0;i<c.primary.reload;i++) {
    let reloadIncrease = Math.floor((14*(i+1))/c.primary.reload);
      if(reloadIncrease>previousReload) {
        reloadingFunctions += `\nreplaceitem entity @s[scores={reload=${i+1}}] hotbar.0 golden_hoe{Damage:${32-(reloadIncrease*32/14)},CustomModelData:${11000000+(10000*c.id)},display:{Name:"{\\"translate\\":\\"reloading\\"}"}}`
        previousReload = reloadIncrease;
      }
    };
    reloadingFunctions = `${reloadingFunctions}\neffect give @s[scores={reload=1}] hunger 1 100 true
scoreboard players add @s[scores={reload=1..}] reload 1
scoreboard players set @s[scores={reload=${c.primary.reload}}] totalShots 0
execute if score @s reload matches ${c.primary.reload} run playsound ${c.primary.sounds.reload} hostile @a ~ ~ ~
scoreboard players set @s[scores={reload=${c.primary.reload}..}] reload 0`;
    fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/reload.mcfunction`,reloadingFunctions.replace(/\t/g,''));

    if(c.primary.type=="launcher") {
      let fireFunctions = ``;
			for(let i=0;i<c.primary.projectile_amount;i++) {
				fireFunctions = `${fireFunctions}\nsummon armor_stand ~ ~ ~ {Tags:["${c.primary.projectile.name}","raycast","grenade"],DisabledSlots:4144959,Invisible:1b,NoBasePlate:1b,Marker:1b,Small:1b,Pose:{Head:[180f,0f,0f]}}`;
			}
			fireFunctions = `${fireFunctions}\nexecute if entity @s[team=blue] run tag @e[type=armor_stand,tag=grenade,limit=${c.primary.projectile_amount},sort=nearest] add blue
execute if entity @s[team=red] run tag @e[type=armor_stand,tag=grenade,limit=${c.primary.projectile_amount},sort=nearest] add red
execute if entity @s[scores={crouching=0}] run tp @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] ~ ~.6 ~ ~ ~${c.primary.fire_angle}
execute if entity @s[scores={crouching=1..}] run tp @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] ~ ~.26 ~ ~ ~${c.primary.fire_angle}
execute store result score @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] id run scoreboard players get @s id
execute as @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] at @s positioned ~ ~1.25 ~ run function classes:${lname}/projectile
execute as @s at @s run playsound ${c.primary.sounds.shoot} hostile @a ~ ~ ~`;

        fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/shoot.mcfunction`,fireFunctions.replace(/\t/g,''));

        let projectileFunctions = `scoreboard players set @s damage ${c.primary.projectile.damage}
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:paper",tag:{CustomModelData:${c.primary.projectile.model}},Count:1b}]}
scoreboard players set @s arcRate ${c.primary.projectile.arc_rate}
scoreboard players set @s speed ${c.primary.projectile.speed*16}
scoreboard players operation @s j = @s speed`;
        if(c.primary.projectile.inaccuracy>0) {
          projectileFunctions = `${projectileFunctions}
scoreboard players set @s Numbers ${c.primary.projectile.inaccuracy}
function projectile:spread`;
        }
        projectileFunctions = `${projectileFunctions}
execute unless entity @s[scores={Numbers=0..}] positioned ~ ~-.25 ~ run function projectile:ray`;
        fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/projectile.mcfunction`,projectileFunctions);

        impact = `${impact}\nexecute if entity @s[tag=${c.primary.projectile.name}] run ${c.primary.projectile.impact_command}`;

    } else if(c.primary.type=="gun") {
      let fireFunctions = ``;
  		for(let i=0;i<c.primary.projectile_amount;i++) {
  			fireFunctions = `${fireFunctions}
summon area_effect_cloud ~ ~ ~ {Particle:"dolphin",ReapplicationDelay:0,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:600,DurationOnUse:0f,Age:0,Tags:["${c.primary.projectile.name}","raycast"]}`;
  		}
  		  fireFunctions = `${fireFunctions}\nexecute if entity @s[team=blue] run tag @e[type=area_effect_cloud,limit=${c.primary.projectile_amount},sort=nearest] add blue
execute if entity @s[team=red] run tag @e[type=area_effect_cloud,limit=${c.primary.projectile_amount},sort=nearest] add red
execute if entity @s[scores={crouching=0}] run tp @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] ~ ~1.6 ~ ~ ~
execute if entity @s[scores={crouching=1..}] run tp @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] ~ ~1.26 ~ ~ ~
execute store result score @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] id run scoreboard players get @s id
execute as @e[tag=${c.primary.projectile.name},limit=${c.primary.projectile_amount},sort=nearest] at @s run function classes:${lname}/projectile
execute as @s at @s run playsound ${c.primary.sounds.shoot} hostile @a ~ ~ ~`;
        fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/shoot.mcfunction`,fireFunctions.replace(/\t/g,''));


        let projectileFunctions = `scoreboard players set @s damage ${c.primary.projectile.damage}
scoreboard players set @s falloff ${c.primary.projectile.falloff}
scoreboard players set @s falloffStart ${c.primary.projectile.falloffstart}
scoreboard players set @s speed ${c.primary.projectile.speed*16}
scoreboard players operation @s j = @s speed`;
      if(c.primary.projectile.heal>0) {
        projectileFunctions = `${projectileFunctions}
scoreboard players set @s healing ${c.primary.projectile.heal}`;
      }
      if(c.primary.projectile.inaccuracy>0) {
        projectileFunctions = `${projectileFunctions}
scoreboard players set @s Numbers ${c.primary.projectile.inaccuracy}
function projectile:spread`;
      } else {
      projectileFunctions = `${projectileFunctions}
function projectile:ray`;
      }

        fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/projectile.mcfunction`,projectileFunctions);
    }
}



  let getSign = `give @p minecraft:oak_sign{display:{Name:"${lname}"},BlockEntityTag:{Text2:\"{\\\"text\\\":\\\"${c.name}\\\",\\\"color\\\":\\\"${c.item_color}\\\",\\\"bold\\\":true,\\\"underlined\\\":true,\\\"clickEvent\\\":{\\\"action\\\":\\\"run_command\\\",\\\"value\\\":\\\"function classes:${lname}/select\\\"}}\",Text3:\"{\\\"text\\\":\\\"${c.style[0]}\\\",\\\"color\\\":\\\"${c.style[1]}\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"run_command\\\",\\\"value\\\":\\\"function classes:reselect\\\"}}\"}}`;

  let select = `scoreboard players set @s Class ${c.id}
tellraw @p {"text":"\\nSelected Class ${c.name}","color":"dark_gray","bold":true,"extra":[{"text":"\\n${c.description}","color":"gray","bold":false}]}`;

    fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/select.mcfunction`,select.replace(/\t/g,''));
		fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/get_sign.mcfunction`,getSign.replace(/\t/g,''));
		fs.writeFileSync(`./SpaceAces/data/classes/functions/${lname}/base.mcfunction`,base.replace(/\t/g,''));
		console.log(`\x1b[32m	Finished generating class ${lname}.	\x1b[0m`);
};

	fs.writeFileSync(`./SpaceAces/data/classes/functions/finder.mcfunction`,classFinder);
  fs.writeFileSync(__basedir + `/SpaceAces/data/projectile/functions/impact.mcfunction`,impact)



//Final write to tick
afs.mkdirsSync(`./SpaceAces/data/tick/functions/`);
fs.writeFileSync(`./SpaceAces/data/tick/functions/tickz.mcfunction`,__tick);

//gets all signs at once (because of laziness)
class_signs = `function classes:scout/get_sign
function classes:soldier/get_sign
function classes:sniper/get_sign
function classes:bomber/get_sign
function classes:gunner/get_sign
function classes:healer/get_sign
function classes:brawler/get_sign
function classes:mobility/get_sign
function classes:mechanic/get_sign
function classes:scientist/get_sign
function classes:infiltraitor/get_sign
function classes:pyro/get_sign
function classes:seeker/get_sign
function classes:shocksmith/get_sign
function classes:rocketeer/get_sign`;
fs.writeFileSync(`./SpaceAces/data/tick/functions/get_all_signs.mcfunction`,class_signs);

let clean_inventory = `#Cleans up inventory`;
for(let i=3;i<8;i++) {
  clean_inventory = `${clean_inventory}
replaceitem entity @s hotbar.${i} air`;
}
for(let i=0;i<26;i++) {
  clean_inventory = `${clean_inventory}
replaceitem entity @s inventory.${i} air`;
}

fs.writeFileSync(`./SpaceAces/data/classes/functions/clear_inventory.mcfunction`,clean_inventory);

//fs.writeFileSync(`./SpaceAces/data/gamemode/functions/update_maps.mcfunction`,__updateMaps);
