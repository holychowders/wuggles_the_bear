local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
        Asset( "ANIM", "anim/player_basic.zip" ),
        -- Don't forget to include your character's custom assets!
        Asset( "ANIM", "anim/wuggles.zip" ),
        Asset( "ANIM", "anim/ghost_wuggles_build.zip" ),
}

local prefabs = {}

local function set_starting_inventory(inst)
    local function build_inventories()
        local inventories = {}
        -- game_mode would be LAVAARENA, DEFAULT, etc...
        -- They make it lowercase because their functions to get the game mode will return lowercase.
        for int_index, game_mode in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
            inventories[string.lower(int_index)] = game_mode.WUGGLES
        end

        return inventories
    end

    local inventories = build_inventories()
    local detected_game_mode = TheNet:GetServerGameMode()

    inst.starting_inventory = inventories.detected_game_mode or inventories.default
end

local function add_components(inst)
    local function set_basic_stats(inst)
        inst.components.health:SetMaxHealth(TUNING.WUGGLES_HEALTH)
        inst.components.hunger:SetMax(TUNING.WUGGLES_HUNGER)
        inst.components.sanity:SetMax(TUNING.WUGGLES_SANITY)
    end
    local function set_food_stats(inst)
        inst.components.hunger.hungerrate = TUNING.WUGGLES_HUNGER_RATE
        inst.components.foodaffinity:AddPrefabAffinity("snugglebuns", TUNING.WUGGLES_SNUGGLE_BUNS_CALORIES_BONUS)
    end

    set_basic_stats(inst)
    set_food_stats(inst)

    inst.components.locomotor.runspeed = TUNING.WUGGLES_RUNSPEED

    inst.components.combat.damagemultiplier = TUNING.WUGGLES_DAMAGE_MULTIPLIER

    inst.components.sanity.dapperness = TUNING.WUGGLES_SANITY_DAPPERNESS
end

function add_tags(inst)
    inst:AddTag("playermonster")
    inst:AddTag("monster")
end


-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
    set_starting_inventory(inst)
    add_components(inst)
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst)
    add_tags(inst)

    inst.soundsname = "wolfgang"
    inst.MiniMapEntity:SetIcon("wilson.png")

    --inst:AddTag("burnableignorefuel")
end


return MakePlayerCharacter("wuggles", prefabs, assets, common_postinit, master_postinit)
