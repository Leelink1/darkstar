-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Tinnin
-----------------------------------

require("scripts/globals/titles");


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
	mob:setMobMod(MOBMOD_DRAW_IN, 1);
end;



-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:setHP(23000); 
mob:setMod(MOD_REGEN, 150);
mob:setMod(MOD_REGAIN, 10);
mob:AnimationSub(3);
mob:setUnkillable(true);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

	local phase = mob:getLocalVar("phase");

	local battletime = mob:getBattleTime();
	local headcountp1 =  mob:getLocalVar("headcount");
	local headgrow = mob:getLocalVar("headgrow");
	local broken = mob:AnimationSub();
	local broken1 = mob:AnimationSub();
	local mstime = mob:getLocalVar("Mighty");
	local headgrow1 = mob:getLocalVar("headgrow1");
	
	if (battletime > mstime + 150) then
		mob:useMobAbility(432);
		mob:setLocalVar("Mighty", battletime);
	end	
	
	if (phase == 0) then
		if (headgrow < battletime and broken > 0) then
			mob:AnimationSub(broken - 1);
			mob:setLocalVar("headgrow", battletime + 30);
			headcountp1 = headcountp1 + 1;
	        	mob:setLocalVar("headcount",headcountp1);
			if (headcountp1 == 2) then
			mob:setMod(MOD_REGEN, 100);
			mob:addHP(11500);
			mob:useMobAbility(1576);
			mob:useMobAbility(1574);
				else if (headcountp1 == 3) then	
				mob:addHP(9500);
				phase = phase + 1;
				mob:setLocalVar("phase",phase);
				mob:setUnkillable(false);
			
				
			
				end
			end
		end
	end
	
	if (phase == 1) then
	mob:setMod(MOD_REGEN, 30);
	
		if (headgrow1 < battletime and broken1 > 0) then
		mob:AnimationSub(broken1 - 1);
		mob:setLocalVar("headgrow1", battletime + 150);
			if (broken == 2) then
			mob:addHP(2000);
			mob:useMobAbility(1576);
			mob:useMobAbility(1574);
				elseif (broken == 1) then
				mob:addHP(2000);
				mob:useMobAbility(1576);
				mob:useMobAbility(1574);
				mob:useMobAbility(1572);
				end	
		end
	end	
end;

-----------------------------------
-- onCriticalHit Action
-----------------------------------

function onCriticalHit(mob)

	local rand = math.random();
	local battletime = mob:getBattleTime();
    local headgrow1 = mob:getLocalVar("headgrow1");
	local headbreak1 = mob:getLocalVar("headbreak1");
	local broken1 = mob:AnimationSub();
	local phase = mob:getLocalVar("phase");
	
	if (phase == 1) then	
		
		
		
		if (rand <= 0.15 and battletime >= headbreak1 and broken1 < 2) then
		mob:AnimationSub(broken1 + 1);
		mob:setLocalVar("headgrow1", battletime + math.random(120, 180))
        mob:setLocalVar("headbreak1", battletime + 100);
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

end;

-----------------------------------
-- onMobDrawIn
-----------------------------------

function onMobDrawIn(mob, target)
	-- todo make him use AoE tp move
	mob:addTP(300);
end;