SMODS.Rarity {
    key = "decks_only",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ffffff'),
    loc_txt = {
        name = "DECKS ONLY"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "unrare",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.008,
    badge_colour = HEX('00e0ff'),
    loc_txt = {
        name = "Un-Rare"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "econ",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.1,
    badge_colour = HEX('c8c818'),
    loc_txt = {
        name = "Econ"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}