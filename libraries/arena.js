const fs = require("fs");
const afs = require("./generic/afs.js");
afs.mkdirsSync(__basedir+`/SpaceAces/data/arena/functions`);


const arenas = JSON.parse(fs.readFileSync("./libraries/arena/arenas.json")); // Reads the arenas file, and parses it to JSON

for(let i=0;i<Object.keys(arenas.maps).length; i++) { // loops for every map
  const name = Object.keys(arenas.maps)[i]; // stores name to name
  const obj = arenas.maps[name]; // creates an object variable for the current map

  let loadArenaFunctions = "#Loads Arena: " + name + " (dynamic)";
  for(let h=0; h<obj.x; h++) {
    for(let j=0; j<obj.y; j++) {
      for(let k=0; k<obj.z; k++) {
        loadArenaFunctions = `${loadArenaFunctions}
            setblock ${20000+(32*h)} ${0+(32*j)} ${0+(32*k)} minecraft:structure_block
            data merge block ${20000+(32*h)} ${0+(32*j)} ${0+(32*k)} {ignoreEntities:0b,powered:0b,mode:"LOAD",posX:0,posY:0,posZ:0,name:"arena:${name}_${h}_${j}_${k}",showboundingbox:0b}
            setblock ${20000+(32*h)} ${1+(32*j)} ${0+(32*k)} redstone_block`;
        if(obj.y==1) {
          loadArenaFunctions = `${loadArenaFunctions}
          fill ${20000+(32*h)} 32 ${0+(32*k)} ${20031+(32*h)} 63 ${31+(32*k)} air`;
        }
      }
    }
  }
  afs.mkdirsSync(__basedir+`/SpaceAces/data/arena/functions/`);
  fs.writeFileSync(__basedir+`/SpaceAces/data/arena/functions/load_${name}.mcfunction`,loadArenaFunctions.replace(/\t/g,''));

}


const SIGN_LOCATIONS = [[8,205,40],[9,205,40],[7,205,40],[11,205,38],[5,205,38],[11,205,37],[5,205,37],[11,205,36],[5,205,36]] // these 3d coords are used to anchor the location of the map signs

const gamemodes = JSON.parse(fs.readFileSync("./libraries/gamemode/gamemodes.json")); // Reads the gamemodes file, and parses it to JSON

let gamemode_running = `# Determines which gamemode is running and runs it (dynamic)`;
let gamemode_load = `# Determines which gamemode is to be loaded (dynamic)`;


let gamemode_cycle = `# Cycles the currently selected gamemode (dynamic)
scoreboard players add Gamemode Numbers 1
execute if score Gamemode Numbers matches ${Object.keys(gamemodes.gamemodes).length}.. run scoreboard players set Gamemode Numbers 0`;

let console_dictionary = `# Links console trigger to different functionalities (dynamic)
execute if score @s console matches 1 run function gamemode:console/1
execute if score @s console matches 2 run function gamemode:console/2
execute if score @s console matches 3 run function gamemode:console/3
execute if score @s console matches 4 run function gamemode:console/4
execute if score @s console matches 5 run function gamemode:console/5
execute if score @s console matches 6 run function gamemode:console/6`;

let console_trigger = 7;
let pages = `"[\\"\\",{\\"text\\":\\"Master Settings\\",\\"bold\\":true,\\"color\\":\\"white\\"},{\\"text\\":\\"\\\\n\\"},{\\"text\\":\\"\\\\n\\"},{\\"text\\":\\"Min Players \\",\\"color\\":\\"gray\\"},{\\"text\\":\\"- \\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set 1\\"}},{\\"score\\":{\\"name\\":\\"MinPlay\\",\\"objective\\":\\"Numbers\\"},\\"color\\":\\"gold\\"},{\\"text\\":\\" + \\",\\"color\\":\\"green\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set 2\\"}},{\\"text\\":\\"\\\\n\\"},{\\"text\\":\\"Max Players \\",\\"color\\":\\"gray\\"},{\\"text\\":\\"- \\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set 3\\"}},{\\"score\\":{\\"name\\":\\"MaxPlay\\",\\"objective\\":\\"Numbers\\"},\\"color\\":\\"gold\\"},{\\"text\\":\\" + \\",\\"color\\":\\"green\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set 4\\"}},{\\"text\\":\\"\\\\n\\"},{\\"text\\":\\"Random Classes \\",\\"color\\":\\"gray\\"},{\\"text\\":\\"toggle\\",\\"color\\":\\"dark_gray\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set 5\\"}},{\\"text\\":\\"\\\\n\\"},{\\"text\\":\\"Balance Teams \\",\\"color\\":\\"gray\\"},{\\"text\\":\\"toggle\\",\\"color\\":\\"dark_gray\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set 6\\"}}]"`

let console_load = `# Sets the default values for the console (dynamic)
scoreboard players set MinPlay Numbers 2
scoreboard players set MaxPlay Numbers 10`;

for (let i = 0; i < Object.keys( gamemodes.gamemodes ).length; i++) { // loops for every gamemode within the gamemodes.json file
  const name = Object.keys( gamemodes.gamemodes )[i]; // writes the current gamemode's name to name
  const obj = gamemodes.gamemodes[name]; // creates an object for simpler functions later

  // below are the functions used to load the arena when this gamemode is started
  // it's worth pointing out that ActiveMode stores a numerical id for the currently selected gamemode
  let gmf = `# Loads ${name} (dynamic)
  scoreboard players set ActiveMode Numbers ${i+1}`;

  let display_gamemode = `#Displays the current maps and creates signs for them`;

  for(let j = 0; j < obj.maps.length; j++ ) { // loops for every map found within the maps array in gamemode (does not validate them)
    gmf = `${gmf}
    execute if score Map Numbers matches ${j} run function arena:load_${obj.maps[j]}`;

    display_gamemode = `${display_gamemode}
    data merge block ${SIGN_LOCATIONS[j][0]} ${SIGN_LOCATIONS[j][1]} ${SIGN_LOCATIONS[j][2]} {Text2:\"{\\\"text\\\":\\\"${arenas.maps[obj.maps[j]].display_name}\\\",\\\"color\\\":\\\"dark_blue\\\",\\\"bold\\\":true,\\\"clickEvent\\\":{\\\"action\\\":\\\"run_command\\\",\\\"value\\\":\\\"tellraw @a [\\\\\\\"\\\\\\\",{\\\\\\\"text\\\\\\\":\\\\\\\"Selected Map ${arenas.maps[obj.maps[j]].display_name}\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"dark_green\\\\\\\",\\\\\\\"bold\\\\\\\":true}]\\\"}}\"}
    replaceitem entity @e[tag=map_display_${j},type=armor_stand] armor.head player_head{SkullOwner:{Id:"${arenas.maps[obj.maps[j]].skull.Id}",Properties:{textures:[{Value:"${arenas.maps[obj.maps[j]].skull.Properties.textures.Value}"}]}}}`;
  }

  for(let j = SIGN_LOCATIONS.length - 1; j >= obj.maps.length; j--) {
    display_gamemode = `${display_gamemode}
    setblock ${SIGN_LOCATIONS[j][0]} ${SIGN_LOCATIONS[j][1]} ${SIGN_LOCATIONS[j][2]} air`;
  }

  for(let j = 0; j < obj.extra.length; j++) {
    gmf = `${gmf}
    ${obj.extra[j]}`;
  }

  // logic and scripting for gamemode options (found at main console)
  if(obj.settings != null && Object.keys(obj.settings).length>0) {
    let page = `{\\"text\\":\\"${gamemodes.gamemodes[name].display_name} \\",\\"color\\":\\"white\\",\\"bold\\":\\"true\\"},{\\"text\\":\\"\\\\n\\"}`;
    for(let j = 0; j < Object.keys(obj.settings).length; j++) {
      if(obj.settings[Object.keys(obj.settings)[j]].type == "integer") {
        page = `${page},{\\"text\\":\\"\\\\n\\"},{\\"text\\":\\"${obj.settings[Object.keys(obj.settings)[j]].name} \\",\\"color\\":\\"gray\\"},{\\"text\\":\\"- \\",\\"color\\":\\"red\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set ${i+1}1${j}\\"}},{\\"score\\":{\\"name\\":\\"${obj.settings[Object.keys(obj.settings)[j]].scoreboard}\\",\\"objective\\":\\"Numbers\\"},\\"color\\":\\"gold\\"},{\\"text\\":\\" + \\",\\"color\\":\\"green\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"/trigger console set ${i+1}2${j}\\"}}`;
        if(obj.settings[Object.keys(obj.settings)[j]].default) {
          console_load = `${console_load}\nscoreboard players set ${obj.settings[Object.keys(obj.settings)[j]].scoreboard} Numbers ${obj.settings[Object.keys(obj.settings)[j]].default}`;
        }
        console_dictionary = `${console_dictionary}\n
        execute if score @s console matches ${i+1}1${j} run function gamemode:console/${i+1}1${j}
        execute if score @s console matches ${i+1}2${j} run function gamemode:console/${i+1}2${j}`;
      }
    }
    pages = `${pages},"[\\"\\",${page}]"`;
  }


  afs.mkdirsSync(__basedir+`/SpaceAces/data/gamemode/functions/${name}`);
  fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/${name}/load.mcfunction`,gmf);
  fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/${name}/display.mcfunction`,display_gamemode);


  gamemode_running = `${gamemode_running}
  execute if score ActiveMode Numbers matches ${i+1} run function gamemode:${name}/running`;

  gamemode_cycle = `${gamemode_cycle}
  execute if score Gamemode Numbers matches ${i} run data merge block 9 200 65 {Text2:"{\\"text\\":\\"\\",\\"color\\":\\"black\\"}",Text2:"{\\"text\\":\\"Mission Type:\\",\\"color\\":\\"green\\",\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"function gamemode:cycle\\"}}",Text3:"{\\"text\\":\\"${obj.display_name}\\",\\"color\\":\\"gray\\",\\"bold\\":true}"}
  execute if score Gamemode Numbers matches ${i} run function gamemode:${name}/display
  execute if score Gamemode Numbers matches ${i} run scoreboard players set GameMinPlay Numbers ${obj.min_players}
  execute if score Gamemode Numbers matches ${i} run scoreboard players set GameRecPlay Numbers ${obj.rec_players}`;

  gamemode_load = `${gamemode_load}
  execute if score Gamemode Numbers matches ${i} run function gamemode:${name}/load`

}

// example: data merge block 8 200 66 {Book:{tag:{pages:["[\"\",{\"text\":\"One\",\"color\":\"dark_blue\"},{\"text\":\"Two\",\"color\":\"dark_green\"}]","",""]}}}
const console_book = `data merge block 8 200 66 {Book:{tag:{pages:[${pages}],resolved:0b}}}`;
afs.mkdirsSync(__basedir+`/SpaceAces/data/gamemode/functions/console/`);
fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/console/book.mcfunction`,console_book);
fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/console/load.mcfunction`,console_load);
// save the dictionary lookup to file
fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/console/dictionary.mcfunction`,console_dictionary + "\nscoreboard players reset @s console");


fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/running.mcfunction`,gamemode_running);
fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/cycle.mcfunction`,gamemode_cycle);



let clearArena = `kill @e[x=19999,y=0,z=-1,dx=129,dy=65,dz=65,type=!player]`;
for(let i=0;i<64;i++) {
  clearArena += `\nfill 20000 ${i} 0 20127 ${i} 63 barrier`;
}


const becomeSpectator = `gamemode spectator @s
team join spectator @s
tp @s 20013 9 15`;
fs.writeFileSync(__basedir+`/SpaceAces/data/arena/functions/become_spectator.mcfunction`,becomeSpectator.replace(/\t/g,''));

const loadArena = `scoreboard players reset Mission
data merge block 8 200 65 {Text2:"{\\"text\\":\\"Spectate\\",\\"color\\":\\"gray\\",\\"bold\\":true,\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"function arena:become_spectator\\"}}",Text3:"{\\"text\\":\\"Mission\\",\\"color\\":\\"gray\\",\\"bold\\":true,\\"clickEvent\\":{\\"action\\":\\"run_command\\",\\"value\\":\\"\\"}}"}
${clearArena}
scoreboard players operation Map Numbers = Maps Numbers
execute if score Map Numbers matches -1 run function scoreboard:rand_int
execute if score Map Numbers matches -1 run scoreboard players operation @e[tag=rng_one,type=area_effect_cloud,limit=1] Numbers %= 5 Numbers
execute if score Map Numbers matches -1 run scoreboard players operation Map Numbers = @e[tag=rng_one,type=area_effect_cloud,limit=1] Numbers

${gamemode_load}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:baked_potato",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000002}},Invulnerable:1b,Tags:["strong_health","health_pack"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:potato",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000003}},Invulnerable:1b,Tags:["weak_health","health_pack"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:lapis_lazuli",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:lapis_lazuli",Count:1b},Invulnerable:1b,Tags:["blue_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:red_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:red_dye",Count:1b},Invulnerable:1b,Tags:["red_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:bone_meal",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:bone_meal",Count:1b},Invulnerable:1b,Tags:["general_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:black_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:black_dye",Count:1b},Invulnerable:1b,Tags:["capture_point"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:pink_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:pink_dye",Count:1b},Invulnerable:1b,Tags:["forward_red_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:magenta_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:magenta_dye",Count:1b},Invulnerable:1b,Tags:["middle_red_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:cyan_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:cyan_dye",Count:1b},Invulnerable:1b,Tags:["middle_blue_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:light_blue_dye",Count:1b},Invulnerable:1b,Tags:["forward_blue_spawn"]}
tag @e[type=item_frame,tag=!processed] add processed
tag @a[tag=awaiting] add in_game
tag @a[tag=awaiting] remove awaiting`;
fs.writeFileSync(__basedir+`/SpaceAces/data/arena/functions/load.mcfunction`,loadArena.replace(/\t/g,''));

const waves = JSON.parse(fs.readFileSync(__basedir+`/libraries/waves.json`));
let waveFinder = `# Relates the wave with the score of the wave (dynamic)`;
for(let i = 0; i < Object.keys(waves.waves).length; i++) {
  const wave = waves.waves[i+1];
  waveFinder = `execute if score wave Numbers matches ${i+1} run function gamemode:escape/wave/${i+1}\n${waveFinder}`;
  let waveCommands = `#Commands for wave ${i+1} (dynamic)\nscoreboard players set waveDelay Numbers ${100+(i*100)}`;
  let totalEnemies = 0;
  for(let j = 0; j < wave.bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/bot`
    totalEnemies++;
  }
  for(let j = 0; j < wave.armored_bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/armored_bot`
    totalEnemies++;
  }
  for(let j = 0; j < wave.mine_runner; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner`
    totalEnemies++;
  }
  for(let j = 0; j < wave.poison_bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/poison_bot`
    totalEnemies++;
  }
  for(let j = 0; j < wave.ranged_bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot`
    totalEnemies++;
  }
  for(let j = 0; j < wave.ranged_explosive_bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_explosive_bot`
    totalEnemies++;
  }
  for(let j = 0; j < wave.slow_bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot`
    totalEnemies++;
  }
  for(let j = 0; j < wave.zap_bot; j++) {
    waveCommands = `${waveCommands}\nexecute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/zap_bot`
    totalEnemies++;
  }

  waveCommands = `${waveCommands}\nbossbar set minecraft:main max ${100+(i*100)}\nscoreboard players operation currency Numbers += wave Numbers\nscoreboard players set wave Numbers ${i+2}`;
  fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/escape/wave/${i+1}.mcfunction`,waveCommands);
}
fs.writeFileSync(__basedir+`/SpaceAces/data/gamemode/functions/escape/wave/finder.mcfunction`,waveFinder);
