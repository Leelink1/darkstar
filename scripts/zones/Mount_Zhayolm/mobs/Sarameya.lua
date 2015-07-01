-----------------------------------
-- Area: Mount Zhayolm 
-- NPC:  Sarameya ZNM

-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/ability" );
require("scripts/globals/monstertpmoves");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
--mob:addMod(MOD_STUNRES,100);
mob:setMod(MOD_REFRESH, 10);
mob:setMod(MOD_REGAIN, 30);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
	
	 if ((math.random(1,100) >= 33) or (target:hasStatusEffect(EFFECT_POISON) == true)) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(EFFECT_POISON,20,6,duration);
        return SUBEFFECT_POISON,0,EFFECT_POISON;
    end
end;
-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)

			local howl =  mob:getLocalVar("howl");
			local chainSpell = mob:getLocalVar("chainspell");
	        local hpPercent = math.floor(mob:getHP() / mob:getMaxHP() * 100);
	        local hpPerPercent = math.floor(mob:getMaxHP() / 100);
				
				if(howl == 1) then 
				printf("howl=1");
					mob:useMobAbility(1532);
					mob:setLocalVar("howl",2);
				elseif(howl == 2)then
				printf("howl=2");
					if(hpPercent < 25)then
						printf("GoH");
						mob:useMobAbility(1534);
						mob:setLocalVar("howl",3);
					else
						printf("firaga3");
						mob:castSpell(176);
						mob:setLocalVar("howl",3);
					end
				elseif(howl == 3)then
					mob:useMobAbility(1533);
					mob:resetEnmity(target);
					mob:setLocalVar("howl",0);
				end
			
	        if((chainSpell==0 and hpPercent <= 89) or
			   (chainSpell==1 and hpPercent <= 69) or
				(chainSpell==2 and hpPercent <= 49) or
				(chainSpell==3 and hpPercent <= 29) or
				(chainSpell==4 and hpPercent <= 9)) then	        	
	        	mob:useMobAbility(436);
				mob:addStatusEffect(EFFECT_REGAIN,50,0,60);
			--	  mob:AnimationSub(354);
	        	chainSpell = chainSpell + 1;
	        	mob:setLocalVar("chainspell",chainSpell);
			end
		
		if (mob:hasStatusEffect(EFFECT_BLAZE_SPIKES)) then
			mob:setMod(MOD_REGEN, 500);
		else
			mob:setMod(MOD_REGEN, 0);
		end
			
end;




-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
 
end;