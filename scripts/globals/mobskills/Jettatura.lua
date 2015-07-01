---------------------------------------------
--  Jettatura
--
--  Description: Enemies within a fan-shaped area originating from the caster are frozen with fear.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------



function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_TERROR;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, math.random(1, 3)));

    return typeEffect;
end;

