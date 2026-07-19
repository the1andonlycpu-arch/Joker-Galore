
SMODS.Joker{ --Scales are dying
    key = "scalesaredying",
    config = {
        extra = {
            DUS = 1
        }
    },
    loc_txt = {
        ['name'] = 'Scales are dying',
        ['text'] = {
            [1] = '{X:red,C:white}#1#X{} Mult and Chips. Changes by 0.1 every hand.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["modprefix_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.DUS}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
	    card.ability.extra.DUS = card.ability.extra.DUS + 0.1
            return {
                Xmult = card.ability.extra.DUS,
                extra = {
                    x_chips = card.ability.extra.DUS,
                    colour = G.C.DARK_EDITION
                }
            }
        end
        if context.after and context.cardarea == G.jokers  then
        end
    end
}
