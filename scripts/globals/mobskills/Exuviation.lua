----------------------------------------------------
-- Exuviation
-- Full Erase. Restores HP based on amount of debuffs it Erased from itself.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)

local debuff =  mob:getLocalVar("debuff");
 if (mob:delStatusEffect(EFFECT_SLOW)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_BLINDNESS)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_PARALYSIS)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_SILENCE)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_BIND)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_WEIGHT)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_BURN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_FROST)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_CHOKE)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_RASP)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_SHOCK)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_DROWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_DIA)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_POISON)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_BIO)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_STR_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_DEX_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_VIT_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_AGI_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_MND_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_INT_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_CHR_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_STR_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_ATTACK_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_EVASION_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_DEFENSE_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_MAGIC_DEF_DOWN)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_REQUIEM)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_ELEGY)) then debuff = debuff + 1; end
 if (mob:delStatusEffect(EFFECT_HELIX)) then debuff = debuff + 1; end 
 if (mob:delStatusEffect(EFFECT_FLASH)) then debuff = debuff + 1; end

  
    
	cure = 200 * debuff;
	
	skill:setMsg(MSG_SELF_HEAL);
	target:addHP(cure);
	 
	 
	 mob:setLocalVar("debuff",0);
	return cure;
	
	
end;
[[---------------------------------------------
--  Exuviation
--
--  Description: Restores HP and removes one detrimental magic effect.
--  Type: Magical (Light)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local potency = skill:getParam();

    if(potency == 0) then
    	potency = 9;
    end

	potency = potency - math.random(0, potency/6);

	skill:setMsg(MSG_SELF_HEAL);
	
	mob:eraseStatusEffect();
	
	return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
]]
