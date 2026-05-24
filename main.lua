SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers", 
    path = "CustomVouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
function loadfolder(target)
  local trget = tostring(target)
  local p = io.popen('ls '..trget)
  for filename in p:lines() do
    if filename:match("%.lua$") then
      --print(filename)
      local modulename = filename[i].name
      --m[modulename] = require(trget.."/" .. modulename)
      assert(SMODS.load_file(trget.."/" .. modulename .. ".lua"))()
    end
  end
  p:close()
  --return m
end
 --load the jokers
if true then
    assert(SMODS.load_file("jokers/jimbo.lua"))()
    assert(SMODS.load_file("jokers/joker2.lua"))()
    assert(SMODS.load_file("jokers/jeans.lua"))()
    assert(SMODS.load_file("jokers/thebeckoning.lua"))()
    assert(SMODS.load_file("jokers/balancer.lua"))()
    assert(SMODS.load_file("jokers/tradeoff.lua"))()
    assert(SMODS.load_file("jokers/dragon.lua"))()
    assert(SMODS.load_file("jokers/jester.lua"))()
    assert(SMODS.load_file("jokers/jester2.lua"))()
    assert(SMODS.load_file("jokers/coin.lua"))()
    assert(SMODS.load_file("jokers/chult.lua"))()
    assert(SMODS.load_file("jokers/handssans.lua"))()
    assert(SMODS.load_file("jokers/bigbrainsusie.lua"))()
    assert(SMODS.load_file("jokers/brainstorm2.lua"))()
    assert(SMODS.load_file("jokers/mech.lua"))()
    assert(SMODS.load_file("jokers/mult.lua"))()
    assert(SMODS.load_file("jokers/jokerfiller.lua"))()
    assert(SMODS.load_file("jokers/robo.lua"))()
    assert(SMODS.load_file("jokers/jokergalore.lua"))()
    assert(SMODS.load_file("jokers/xmult.lua"))()
    assert(SMODS.load_file("jokers/monkey.lua"))()
    assert(SMODS.load_file("jokers/newjoker.lua"))()
    assert(SMODS.load_file("jokers/newjoker2.lua"))()
end
--]]

-- load the consumables
if true then
    assert(SMODS.load_file("consumables/payoff.lua"))()
    assert(SMODS.load_file("consumables/interest.lua"))()
    assert(SMODS.load_file("consumables/thetrade.lua"))()
    assert(SMODS.load_file("consumables/helper.lua"))()
    assert(SMODS.load_file("consumables/dragonegg.lua"))()
    assert(SMODS.load_file("consumables/thebank.lua"))()
    assert(SMODS.load_file("consumables/giftcard.lua"))()
end
--load the sets
assert(SMODS.load_file("consumables/sets.lua"))()
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/merchant.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/swapper.lua"))()
end

-- load the editions
if true then
    assert(SMODS.load_file("editions/robert.lua"))()
end

-- load the vouchers
if true then
    assert(SMODS.load_file("vouchers/negative_blank.lua"))()
    assert(SMODS.load_file("vouchers/joker_forge.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/pink_deck.lua"))()
    assert(SMODS.load_file("decks/base_deck.lua"))()
    assert(SMODS.load_file("decks/joker_deck.lua"))()
    assert(SMODS.load_file("decks/plasma_deck2.lua"))()
    assert(SMODS.load_file("decks/ultimate_erratic_deck.lua"))()
    assert(SMODS.load_file("decks/w.lua"))()
    assert(SMODS.load_file("stakes/custom.lua"))()
end



assert(SMODS.load_file("rarities.lua"))()


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "jokergal_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "jokergal_mycustom_jokers",
    cards = {
        ["j_jokergal_joker2"] = true,
        ["j_jokergal_jeans"] = true,
        ["j_jokergal_thebeckoning"] = true,
        ["j_jokergal_balancer"] = true,
        ["j_jokergal_tradeoff"] = true,
        ["j_jokergal_dragon"] = true
    },
})

SMODS.ObjectType({
    key = "jokergal_jokergal_jokers",
    cards = {
        ["j_jokergal_jester"] = true,
        ["j_jokergal_jester2"] = true,
        ["j_jokergal_coin"] = true,
        ["j_jokergal_chult"] = true,
        ["j_jokergal_handssans"] = true,
        ["j_jokergal_bigbrainsusie"] = true,
        ["j_jokergal_mech"] = true,
        ["j_jokergal_mult"] = true,
        ["j_jokergal_jokerfiller"] = true,
        ["j_jokergal_robo"] = true,
        ["j_jokergal_jokergalore"] = true,
        ["j_jokergal_xmult"] = true,
        ["j_jokergal_monkey"] = true,
        ["j_jokergal_newjoker"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end