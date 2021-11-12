To add gun that cant kill admin suits is at armor_suits\lua\armor\sv_armor.lua

=================================================================================

Xenin Inventory Config : lua\inventory\configuration\items\suits.lua
Gmodstore Addon : https://www.gmodstore.com/market/view/xenin-inventory

Put That At The Top
ITEM.Models = {
  ["armor_tier1"] = "models/Items/item_item_crate.mdl"
  ["armor_tier2"] = "models/Items/item_item_crate.mdl"
  ["armor_tier3"] = "models/Items/item_item_crate.mdl"
  ["armor_tier4"] = "models/Items/item_item_crate.mdl"
  ["armor_tier5"] = "models/Items/item_item_crate.mdl"
  ["armor_god"] = "models/Items/item_item_crate.mdl"
  ["armor_ultragod"] = "models/Items/item_item_crate.mdl"
  ["armor_godslayer"] = "models/Items/item_item_crate.mdl"
  ["armor_horror"] = "models/Items/item_item_crate.mdl"
  ["armor_horror2"] = "models/Items/item_item_crate.mdl"
  ["armor_horror3"] = "models/Items/item_item_crate.mdl"
  ["armor_as"] = "models/Items/item_item_crate.mdl"
}

-- Put This At The buttom
ITEM:Register("armor_tier1")
ITEM:Register("armor_tier2")
ITEM:Register("armor_tier3")
ITEM:Register("armor_tier4")
ITEM:Register("armor_tier5")
ITEM:Register("armor_god")
ITEM:Register("armor_ultragod")
ITEM:Register("armor_godslayer")
ITEM:Register("armor_horror")
ITEM:Register("armor_horror2")
ITEM:Register("armor_horror3")
ITEM:Register("armor_as")

=================================================================================

ItemStore Inventory Config :
Gmodstore Addon : https://www.gmodstore.com/market/view/15

itemstore.config.CustomItems = {
   armor_tier1 = { "Tier 1", "Boxed Power Armor", true },
   armor_tier2 = { "Tier 2", "Boxed Power Armor", true },
   armor_tier3 = { "Tier 3", "Boxed Power Armor", true },
   armor_tier4 = { "Tier 4", "Boxed Power Armor", true },
   armor_tier5 = { "Tier 5", "Boxed Power Armor", true },
   armor_god = { "Tier God", "Boxed Power Armor", true },
   armor_ultragod = { "Tier Ultra God", "Boxed Power Armor", true },
   armor_fallengod = { "Tier Fallen God", "Boxed Power Armor", true },
   armor_godslayer = { "Tier God Slayer", "Boxed Power Armor", true },
   armor_horror = { "Horror Suit", "Boxed Power Armor", true },
   armor_horror2 = { "Horror Suit Tier 2", "Boxed Power Armor", true },
   armor_horror3 = { "Horror Suit Tier 3", "Boxed Power Armor", true },
   armor_as = { "Admin Armour", "Boxed Power Armor", true },
}

=================================================================================