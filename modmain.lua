PrefabFiles = {
    "wuggles",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/wuggles.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/wuggles.xml" ),

    -- selectscreen portraits are the floating heads you see when selecting a character?
    -- Now they are actually animated, so I don't know if these are being used anymore.
    -- Tested. when anim/wuggles.zip is not included in the assets collection, the head disappears.
    Asset( "IMAGE", "images/selectscreen_portraits/wuggles.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wuggles.xml" ),

    -- When are silhouettes used?
    Asset( "IMAGE", "images/selectscreen_portraits/wuggles_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wuggles_silho.xml" ),

    -- What you see near your stats when selecting a character.
    Asset( "IMAGE", "bigportraits/wuggles.tex" ),
    Asset( "ATLAS", "bigportraits/wuggles.xml" ),

    -- Without these, apparently other players will eventually crash
    Asset( "IMAGE", "images/avatars/avatar_wuggles.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_wuggles.xml" ),

    -- Wuggles is invisible as a ghost. These DO NOT currently help.
    Asset( "IMAGE", "images/avatars/avatar_ghost_wuggles.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_wuggles.xml" ),
}

modimport("scripts/strings.lua")

TUNING.WUGGLES_SOUND = "wolfgang"

-- Character select screen
-- Use lower-case character names
GLOBAL.STRINGS.CHARACTER_NAMES.wuggles = "Wuggles"
GLOBAL.STRINGS.CHARACTER_SURVIVABILITY.wuggles = "Slim"
GLOBAL.STRINGS.CHARACTER_TITLES.wuggles = "The Snuggler"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.wuggles = [[
*Is a natural forager
*Has a warm coat of fur
*Is sensitive
*Loves to snuggle
]]
GLOBAL.STRINGS.CHARACTER_QUOTES.wuggles = "Grr grr, I am a bear!"

-- FIXME: Consider using pre-existing variables for better intuition
TUNING.WUGGLES_HUNGER = 250
TUNING.WUGGLES_HUNGER_RATE = TUNING.WILSON_HUNGER_RATE * 1.05
TUNING.WUGGLES_SNUGGLE_BUNS_CALORIES_BONUS = 50

TUNING.WUGGLES_HEALTH = 250

TUNING.WUGGLES_SANITY = 175
TUNING.WUGGLES_SANITY_DAPPERNESS = 0  -- Speed of automatic recovery of sanity recovery

TUNING.WUGGLES_RUNSPEED = 6.30
TUNING.WUGGLES_DAMAGE_MULTIPLIER = 1.30


TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WUGGLES = {
    'honey', 'honey', 'honey', 'honey',

    'silk', 'silk', 'silk', 'silk',
    'silk', 'silk', 'silk', 'silk',

    'petals', 'petals', 'petals', 'petals',
    'petals', 'petals', 'petals', 'petals',
}

-- Gender (for proper pronouns)
-- Possible genders here are MALE, FEMALE, or ROBOT
table.insert(GLOBAL.CHARACTER_GENDERS.ROBOT, "wuggles")

AddModCharacter("wuggles")
