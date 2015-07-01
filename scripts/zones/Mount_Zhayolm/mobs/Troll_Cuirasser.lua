-----------------------------------
-- Area: Mount Zhayolm 
-- NPC:  Troll Cuirassier NM mobs

-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require( "scripts/globals/ability" );
require("/scripts/globals/monstertpmoves");


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)


end;
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
local local1 = math.random (30,60);
if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % local1 == 0) then
mob:addStatusEffect(EFFECT_SOULEATER, 1, 0, 60);


		end
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
 
end;