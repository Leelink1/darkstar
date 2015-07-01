---------------------------------------------
--  Pinecone Bomb
--
--  Description: Single target damage with sleep.
--
--need to add damage
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/bluemagic");
---------------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
  local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
	local multi = 1.25;
	if(caster:hasStatusEffect(EFFECT_AZURE_LORE)) then
		multi = multi + 0.50;
	end
    
    params.tpmod = TPMOD_CRITICAL; params.dmgtype = DMGTYPE_PIERCE; params.scattr = SC_DARK;
	params.numhits = 1;
    params.multiplier = multi; params.tp150 = 1.25; params.tp300 = 1.25; params.azuretp = 1.25; params.duppercap = 8;
	params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.20; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
   
	target:delHP(damage);
      
	if(damage > 1) then
		
		local typeEffect = EFFECT_SLEEP_I;
	    target:delStatusEffect(typeEffect);
		target:addStatusEffect(typeEffect,1,0,getBlueEffectDuration(caster,resist,typeEffect));
	end
	
    return damage
      
end;