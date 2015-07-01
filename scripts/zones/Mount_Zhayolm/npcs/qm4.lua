-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  ??? (Spawn Khromasoul Bhurborlor(ZNM T3))
-- @pos 88 -22 70 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mount_Zhayolm/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(2585,1) and trade:getItemCount() == 1) then -- Trade Vinegar Pie
		player:tradeComplete();
		SpawnMob(17027474,180):updateClaim(player);
		SpawnMob(17027475):updateEnmity(player);
		SpawnMob(17027476):updateEnmity(player);
		SpawnMob(17027477):updateEnmity(player);
		GetMobByID(17027475):setPos( npc:getXPos()-2, npc:getYPos()-2, npc:getZPos(), npc:getRotPos() );
		GetMobByID(17027476):setPos( npc:getXPos()-4, npc:getYPos()-4, npc:getZPos(), npc:getRotPos() );
		GetMobByID(17027477):setPos( npc:getXPos()+2, npc:getYPos()+2, npc:getZPos(), npc:getRotPos() );
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_HAPPENS);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;