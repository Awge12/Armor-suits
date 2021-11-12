local config = {
    commands = {"/dropsuit"}
}
hook.Add("PlayerSay", "dropsuit", function(ply, txt)
    local cmd = string.Trim(txt)
    if table.HasValue(config.commands, cmd) then
        if ply.armorSuit then
           ply:ChatPrint("Dropping Suit In 5 Seconds!")
            timer.Simple(1,function()
              ply:ChatPrint("Dropping Suit In 4 Seconds!")
              timer.Simple(1,function()
              ply:ChatPrint("Dropping Suit In 3 Seconds!")
              timer.Simple(1,function()
              ply:ChatPrint("Dropping Suit In 2 Seconds!")
              timer.Simple(1,function()
              ply:ChatPrint("Dropping Suit In 1 Seconds!")
              timer.Simple(1,function()
            if ply:Alive() then 
            local armor = ply.armorSuit
            local armorclass = Armor:Get(armor)
            local trace = {}
            trace.start = ply:EyePos()
            trace.endpos = trace.start + ply:GetAimVector() * 85
            trace.filter = ply
            local tr = util.TraceLine(trace)
            local dropped = ents.Create(armorclass.Entitie)
            dropped:SetPos(tr.HitPos)
            dropped:Spawn()
            ply:removeArmorSuit()
            ply:ChatPrint("Suit Dropped!")
            else 
            ply:ChatPrint("Dropsuit Failed, You Died!")
            end
        end)
        end) 
          end) 
          end)
         end)
        else
            ply:ChatPrint("No Suit equiped!")
        end
        return "/dropsuit"
    end
end)