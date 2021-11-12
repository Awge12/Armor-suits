Armor.Save = false // if set to true, all armors will be permanent and save.
Armor.LoseOnDeath = true // if set to true, it removes when you die.

Armor:Add({
	Name = "Tier 1",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/auditor/r6s/rook/chr_gign_lifeline_ash_engset.mdl",
	Entitie = "armor_tier1",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 350 )
        ply:SetHealth( 100 )		
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
        ply:SetHealth( 100 )
	end,
})

Armor:Add({
	Name = "Tier 2",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/arachnit/csgoheavyphoenix/tm_phoenix_heavyplayer.mdl",
	Entitie = "armor_tier2",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 500 )

		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 1.05 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )

		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Tier 3",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/kryptonite/inf_war_machine/inf_war_machine.mdl",
	Entitie = "armor_tier3",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 800 )
		ply:SetJumpPower( 300 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 1.70 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )
		
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({

	Name = "Tier 4",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/models/frix/x01/xo1_powerarmor.mdl",
	Entitie = "armor_tier4",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 1000 )
		ply:SetJumpPower( 300 ) 		

		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 2.0 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )		

		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Tier 5",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/mailer/characters/blackknight.mdl",
	Entitie = "armor_tier5",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 3000 )
		ply:SetJumpPower( 500 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 3.0 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )

		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "God",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/kryptonite/inf_thanos/inf_thanos.mdl",
	Entitie = "armor_god",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 450 )
		ply:SetHealth( 10000 )
		ply:SetJumpPower( 500 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 3.50 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )
		
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Ultra god",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/epangelmatikes/mtu/mtultimate.mdl",
	Entitie = "armor_ultragod",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 1000 )
		ply:SetHealth( 25000 )
		ply:SetJumpPower( 500 ) 

		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 4.6 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )		
		
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Fallen god",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/mailer/characters/cordana.mdl",
	Entitie = "armor_fallengod",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 1000 )
		ply:SetHealth( 35000 )
		ply:SetJumpPower( 500 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 6.00 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )		
		
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "God slayer",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/reverse/ironman_endgame/ironman_endgame.mdl",
	Entitie = "armor_godslayer",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 1000 )
		ply:SetHealth( 45000 )
		ply:SetJumpPower( 500 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 6.80 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )
		
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Horror Tier 1",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/splinks/jeff_the_killer/jeff.mdl",
	Entitie = "armor_horror",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 500 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 4.60 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )
		
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Horror Tier 2",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/player/scp096.mdl",
	Entitie = "armor_horror2",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 500 )
		ply:SetJumpPower( 600 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 5.75 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )

		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Horror Tier 3",
	Length = ( 99999 * 1 ),
	Description = "",
	Model = "models/siren_head_player_jq1991.mdl",
	Entitie = "armor_horror3",
	Price = 100000000000,
	OnGive = function( ply )
		ply:SetArmor( 250 )
		ply:SetHealth( 1000 )
		ply:SetJumpPower( 600 ) 
		
		ply._oldRunSpeed = ply:GetRunSpeed()
		ply:SetRunSpeed( ply:GetRunSpeed() + ( ply:GetRunSpeed() * 6.50 ) )
	end,
	OnRemove = function( ply )
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 400 )

		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})

Armor:Add({
	Name = "Admin Suit", 
	Length = ( 99999999 * 1 ),
	Description = "Cant Get Killed By Gasters",
	Model = "models/player/combine_super_soldier.mdl",
	Entitie = "armor_admin",
	Price = 100000000000,
	OnGive = function( ply )
		ply.adminsuit = true    
		ply:SetArmor( 1000 )
		ply:SetHealth( 10000 )
		
		ply._oldRunSpeed = ply:GetRunSpeed()
	end,
	OnRemove = function( ply )
		ply.adminsuit = false     
		ply:SetArmor( 0 )
		ply:SetHealth( 100 )
		ply:SetJumpPower( 200 )
		if ( ply._oldRunSpeed ) then
			ply:SetRunSpeed( ply._oldRunSpeed )
			ply._oldRunSpeed = nil
		end
	end,
})