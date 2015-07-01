-----------------------------------
-- Area: Mount Zhayolm 
-- NPC:  Troll Artilleryman NM mobs

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
--local hammerTime = math.random (15,45);
--if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % hammerTime == 0) then
--mob:useMobAbility(1491);
--end
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
 
end;