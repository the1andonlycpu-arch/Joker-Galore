
SMODS.Joker{ --Robo
    key = "robo",
    config = {
        extra = {
            mult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Robo',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "jokergal_commoner",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.mult = to_big(card.ability.extra.mult):pow(1.1) --10^((math.log10(card.ability.extra.mult)*1.1)-math.floor(math.log10(card.ability.extra.mult)*1.1)).."e"..math.floor(math.log10(card.ability.extra.mult)*1.1)
                    return true
                end
            }
        end
    end
}