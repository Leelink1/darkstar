---------------------------------------------
--  Corrosive Ooze
--
--  Description: AoE Water Damage, Attack Down, and Defense Down
--  Type: Magical Water (Element)
--
--
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------
function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	
	local dmgmod = 1;
	local accmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WATER,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	target:addStatusEffect(EFFECT_ATTACK_DOWN,5,0,30);
	target:addStatusEffect(EFFECT_DEFENSE_DOWN,5,0,30);
	return dmg;
end;