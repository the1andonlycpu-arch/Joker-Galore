SMODS.Rarity {
    key = "economy",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.7,
    badge_colour = HEX('dabf19'),
    loc_txt = {
        name = "Economy"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}