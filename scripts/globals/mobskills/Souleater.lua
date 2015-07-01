---------------------------------------------------
-- Souleater
-- Souleater Ability.
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if(mob:getHPP() <= 0) then
        return 0;
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
local typeEffect = EFFECT_SOULEATER;

	mob:addStatusEffect(EFFECT_SOULEATER, 0, 0, 60);
  

    skill:setMsg(MSG_BUFF);
    return EFFECT_SOULEATER;
end;
