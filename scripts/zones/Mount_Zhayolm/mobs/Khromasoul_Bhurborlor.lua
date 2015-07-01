-----------------------------------
-- Area: Mount Zhayolm 
-- NPC:  Khromasoul Bhurborlor

-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/ability" );
require("scripts/globals/monstertpmoves");


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
local mobID = mob:getID();
local HPP= ((mob:getHP()/mob:getMaxHP())*100); 
	-- HP over 80% -- Respawn adds after using healing stomp
	if(HPP > 80 and mob:getLocalVar("reinforce") == 1)then	
		if(GetMobAction(17027475) == 0) then 
			SpawnMob(17027475):updateEnmity(target);
			GetMobByID(17027475):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
		end
		if(GetMobAction(17027476) == 0) then 
			SpawnMob(17027476):updateEnmity(target);
			GetMobByID(17027476):setPos( mob:getXPos()-4, mob:getYPos()-4, mob:getZPos(), mob:getRotPos() );
		end
		if(GetMobAction(17027477) == 0) then 
			SpawnMob(17027477):updateEnmity(target);
			GetMobByID(17027477):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
		end
		mob:setLocalVar("reinforce",0);
	end
	-- HP under 80% -- Despawn adds, spawn next set
	if(HPP < 80)then	
		if(mob:getLocalVar("reinforcements") == 0) then
			DespawnMob(17027475);
			DespawnMob(17027476);
			DespawnMob(17027477);
			SpawnMob(17027478):updateEnmity(target);
			SpawnMob(17027479):updateEnmity(target);
			SpawnMob(17027480):updateEnmity(target);
			GetMobByID(17027478):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
			GetMobByID(17027479):setPos( mob:getXPos()-4, mob:getYPos()-4, mob:getZPos(), mob:getRotPos() );
			GetMobByID(17027480):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
			mob:setLocalVar("reinforcements",1);
		end
	end
	-- HP Between 60% and 80% -- Respawn adds after using healing stomp
	if(HPP > 60 and HPP < 80 and mob:getLocalVar("reinforce") == 1)then   -- 
		if(GetMobAction(17027478) == 0) then
			SpawnMob(17027478):updateEnmity(target);
			GetMobByID(17027478):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
		end
		if(GetMobAction(17027479) == 0) then 
			SpawnMob(17027479):updateEnmity(target);
			GetMobByID(17027479):setPos( mob:getXPos()-4, mob:getYPos()-4, mob:getZPos(), mob:getRotPos() );
		end
		if(GetMobAction(17027480) == 0) then 
			SpawnMob(17027480):updateEnmity(target);
			GetMobByID(17027480):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
		end
		mob:setLocalVar("reinforce",0);
	end
	-- HP under 60% -- Despawn adds, spawn next set
	if(HPP < 60)then
		if(mob:getLocalVar("reinforcements") == 1) then
			DespawnMob(17027478);
			DespawnMob(17027479);
			DespawnMob(17027480);
			SpawnMob(17027481):updateEnmity(target);
			SpawnMob(17027482):updateEnmity(target);
			GetMobByID(17027481):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
			GetMobByID(17027482):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
			mob:setLocalVar("reinforcements",2);
		end
	end
	-- HP Between 40% and 60% -- Respawn adds after using healing stomp
	if(HPP > 40 and HPP < 60 and mob:getLocalVar("reinforce") == 1)then   -- 
		if(GetMobAction(17027481) == 0) then 
			SpawnMob(17027481):updateEnmity(target);
			GetMobByID(17027481):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
		end
		if(GetMobAction(17027482) == 0) then 
			SpawnMob(17027482):updateEnmity(target);
			GetMobByID(17027482):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
		end
		mob:setLocalVar("reinforce",0);
	end
	-- HP under 40% -- Despawn adds, spawn next set
	if(HPP < 40)then
		if(mob:getLocalVar("reinforcements") == 2) then
			DespawnMob(17027481);
			DespawnMob(17027482);
			SpawnMob(17027483):updateEnmity(target);
			SpawnMob(17027484):updateEnmity(target);
			GetMobByID(17027483):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
			GetMobByID(17027484):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
			mob:setLocalVar("reinforcements",3);
		end
	end
	-- HP Between 20% and 40% -- Respawn adds after using healing stomp
	if(HPP > 20 and HPP < 40 and mob:getLocalVar("reinforce") == 1)then   -- 
		if(GetMobAction(17027483) == 0) then 
			SpawnMob(17027483):updateEnmity(target);
			GetMobByID(17027483):setPos( mob:getXPos()-2, mob:getYPos()-2, mob:getZPos(), mob:getRotPos() );
		end
		if(GetMobAction(17027484) == 0) then 
			SpawnMob(17027484):updateEnmity(target);
			GetMobByID(17027484):setPos( mob:getXPos()+2, mob:getYPos()+2, mob:getZPos(), mob:getRotPos() );
		end
		mob:setLocalVar("reinforce",0);
	end
	-- HP under 20% -- Despawn adds and start spamming Overthrow
	if(HPP < 20)then	 
		if(mob:getLocalVar("reinforcements") == 3) then
			DespawnMob(17027483);
			DespawnMob(17027484);
			mob:setLocalVar("reinforcements",4);
		end
		if(mob:getBattleTime() ~= 0 and mob:getBattleTime() % math.random(15,25) == 0) then -- Every 15-25 seconds
			mob:useMobAbility(1639);
		end
	end
	-- Force healing stomp to respawn adds every 2-3 minutes
	if( HPP > 20 and mob:getBattleTime() ~= 0 and mob:getBattleTime() % math.random(120,180) == 0) then -- Every 2-3 minutes
		mob:useMobAbility(1644);
	end
	
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
 
end;