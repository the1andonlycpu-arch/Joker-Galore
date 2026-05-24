
SMODS.Joker{ --Xmult
    key = "xmult",
    config = {
        extra = {
            xmult = 3,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Xmult',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X#1# {} Mult. Subtract by {X:red,C:white,s:1.05}0.05{}{C:inactive}?{} every blind skipped.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 2
            }
        end
        if context.skip_blind  then
            return {
                func = function()
                    card.ability.extra.xmult = math.max(0, (card.ability.extra.xmult) - 0.05)
                    return true
                end
            }
        end
    end
}