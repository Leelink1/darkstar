-----------------------------------
-- Area: Appolyon
-- Name: 
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)
if(GetMobAction(16932889) > 0)then DespawnMob(16932889);end
if(GetMobAction(16932890) > 0)then DespawnMob(16932890);end
if(GetMobAction(16932891) > 0)then DespawnMob(16932891);end
if(GetMobAction(16932892) > 0)then DespawnMob(16932892);end
if(GetMobAction(16932893) > 0)then DespawnMob(16932893);end
if(GetMobAction(16932894) > 0)then DespawnMob(16932894);end
if(GetMobAction(16932895) > 0)then DespawnMob(16932895);end
	SetServerVariable("[SW_Apollyon]UniqueID",GenerateLimbusKey());
	HideArmouryCrates(GetInstanceRegion(1291),APPOLLYON_NW_SW);
    SetServerVariable("[SW_Apollyon]MimicTrigger",0);	
	SetServerVariable("[SW_Apollyon]ElementalTrigger",0);
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)
	player:setVar("limbusbitmap",0);
	player:setVar("characterLimbusKey",GetServerVariable("[SW_Apollyon]UniqueID"));
	player:setVar("LimbusID",1291);	
	player:delKeyItem(COSMOCLEANSE);
	player:delKeyItem(RED_CARD);
end;

-- Leaving  by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish

function onBcnmLeave(player,instance,leavecode)
	if(leavecode == 4) then
        player:setPos(-668,0.1,-666);
		ResetPlayerLimbusVariable(player)
	end
end;