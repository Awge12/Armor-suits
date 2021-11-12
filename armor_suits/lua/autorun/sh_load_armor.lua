Armor = {}
Armor.Data = {}
Armor.on = {}
function Armor:Add( tab )
    for k,v in pairs( self.Data ) do
        if ( v.Name == tab.Name ) then
            self.Data[ k ] = tab
            return
        end
    end
    
    table.insert( self.Data, tab )
end
if CLIENT then
    surface.CreateFont( "ArmorBetter", {
        font = "arp_suit", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
        extended = false,
        size = 60,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false,
    } )
end
function Armor:Get( name )
    if ( !name ) then return nil end
    
    for k,v in pairs( self.Data ) do
        if ( v.Name == name ) then
            return v
        end
    end
    
    return nil
end

if ( SERVER ) then
    AddCSLuaFile( "armor/config_armor.lua" )
    AddCSLuaFile( "armor/cl_armor.lua" )

    include( "armor/config_armor.lua" )
    include( "armor/sv_armor.lua" )
else
    include( "armor/config_armor.lua" )
    include( "armor/cl_armor.lua" )
end

for k, v in pairs( Armor.Data ) do
    local ENT = {}
    
    ENT.Type = "anim"
    ENT.Base = "base_gmodentity"
    ENT.PrintName = v.Name
    ENT.Author = "Crackhead On Anime"
        ENT.Category = "Suits"
        
    ENT.Spawnable = true
    
    if ( SERVER ) then
        function ENT:Initialize()
            self:SetModel( "models/Items/item_item_crate.mdl" )
                        --self:SetModel( data.Model )           
self:PhysicsInit(SOLID_VPHYSICS)
            self:SetMoveType(MOVETYPE_VPHYSICS)
            self:SetSolid(SOLID_VPHYSICS)
            self:SetUseType( SIMPLE_USE )
            
            local phys = self:GetPhysicsObject()
            phys:Wake()
        end
        
        function ENT:Use( ply )
                      if (!ply.armorSuit) then
            ply:giveArmorSuit( v.Name )
            self:Remove()
                        end
        end
    else
        function ENT:Draw()
            self:DrawModel()
            
            local angle = Angle(0, 0, 0 )
            angle:RotateAroundAxis(Vector(1,0,0), 90)
            angle.y = LocalPlayer():GetAngles().y + 90 + 180

            local pos = self:GetPos() + Vector( 0, 0, 32 )
            
            cam.Start3D2D( pos, angle, 0.2 )
                draw.SimpleTextOutlined( v.Name, "ArmorBetter", 0, 0, color_white, 1, 1, 1, Color( 0, 0, 0) )
            cam.End3D2D()
        end
    end
    
    scripted_ents.Register( ENT, v.Entitie )
end