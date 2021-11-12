util.AddNetworkString( "armorSend" )

hook.Add( "PlayerSpawn", "giveArmorBack", function( ply )
	if ( Armor.LoseOnDeath and ply.armorSuit ) then
		ply:removeArmorSuit()
		return
	end
	
	timer.Simple( .05, function()
		if ( ply.armorSuit ) then
			ply:applyArmorSuit()
		end
	end )
end )

local PMeta = FindMetaTable( "Player" )

function PMeta:applyArmorSuit()
	local data = Armor:Get( self.armorSuit )
	
	if ( !data ) then return end
	
	self:SetModel( data.Model )
		if ( data.OnGive ) then
		data.OnGive( self )
	end
end

function PMeta:removeArmorSuit()
	local data = Armor:Get( self.armorSuit )
	
	if ( !data ) then return end

	if ( data.OnRemove ) then
		data.OnRemove( self )
	end
	
	net.Start( "armorSend" )
		net.WriteString( "nil" )
	net.Send( self )
	
	hook.Call( "PlayerSetModel", GAMEMODE, self )
	
	timer.Destroy( self:SteamID().."_"..self.armorSuit )
	
	self.armorSuit = nil
end

function PMeta:giveArmorSuit( name )
	local data = Armor:Get( name )
	
	if ( !data ) then return end
	
	if ( self.armorSuit ) then
		self:removeArmorSuit()
	end
	
	self.armorSuit = name
	self:applyArmorSuit()
	
	net.Start( "armorSend" )
		net.WriteString( name )
	net.Send( self )
	
	if ( Armor.Save ) then
		local info = sql.Query( "SELECT * from armor_suits WHERE SteamID = '"..self:SteamID().."'" )
		
		if ( info and table.Count( info ) > 0 ) then
			sql.Query( "UPDATE armor_suits SET SuitName = '"..name.."' WHERE SteamID = '"..self:SteamID().."'" )
		else
			sql.Query( "INSERT INTO armor_suits(`SteamID`, `SuitName`) VALUES('"..self:SteamID().."', '"..name.."')" )
		end
	else		
		local tStr = self:SteamID().."_"..name
	
		timer.Create( tStr, data.Length, 1, function()
			timer.Destroy( tStr )
			
			if ( IsValid( self ) ) then
				self:removeArmorSuit()
			end
		end )
	end
end

local delay_of_boost = 5

hook.Add( "KeyPress", "boostOnsHIFTtAU", function( ply, key )
	if ( key != IN_SPEED ) then return end
	if ( ply.armorSuit != "TAU Armor" ) then return end
	if ( ( ply.armorLiftOff or 0 ) > CurTime() ) then return end 
	
	ply:SetVelocity( ( ply:GetAngles():Forward() * 800 ) + Vector( 0, 0, 400 ) )
	sound.Play( "ambient/explosions/exp1.wav", ply:GetPos() )
	
	ply.armorLiftOff = CurTime() + delay_of_boost
end )

timer.Simple(2,function()
	hook.Add( "EntityTakeDamage", "adminsuit", function( pl,  dmg )
		local WhitelistedGuns = {
			"weapon_gblaster_badtime",
		    "weapon_supreme_badtime_bm_gblaster",
			"weapon_gblaster_asriel_rainbow",
			"weapon_gblaster",
			"weapon_gblaster_pistol",
			"weapon_nrgbeam_admin",
			"weapon_nrgbeam",
			"weapon_bm_rifle_admin",
			"weapon_bm_rifle_nonadmin",
			"weapon_bm_rifle",
			"weapon_buu_bms_gluon",
			"weapon_redeemer",
		    "weapon_bm_welder",
			"weapon_bm_ams",
			"weapon_bm_aimbot",
			"weapon_bm_gauss2",
			"weapon_bm_qe_zapper",			
		}						
		local ply = dmg:GetInflictor()    
		if not pl:IsPlayer() then else 
			if not pl.adminsuit then else
				if not table.HasValue(WhitelistedGuns, dmg:GetAttacker():GetActiveWeapon():GetClass()) then
					dmg:SetDamage(dmg:GetDamage()/4)
				else
					dmg:SetDamage(0)
				end
		    end
		end
	end)	
end)

if ( Armor.Save ) then
	sql.Query( "CREATE TABLE IF NOT EXISTS armor_suits ( SteamID VARCHAR(50), SuitName VARCHAR(50) )" )
	
	hook.Add( "PlayerInitialSpawn", "loadArmorsRay", function( ply )
		timer.Simple( 10, function()
			if ( !IsValid( ply ) ) then return end
			
			local info = sql.Query( "SELECT * from armor_suits WHERE SteamID = '"..ply:SteamID().."'" )
			
			if ( info and table.Count( info ) > 0 ) then
				ply.armorSuit = info[1]["SuitName"]
				ply:applyArmorSuit()
				
				net.Start( "armorSend" )
					net.WriteString( ply.armorSuit )
				net.Send( ply )
			end
		end )
	end )
else
	hook.Remove( "PlayerInitialSpawn", "loadArmorsRay" )
end
