
SMODS.Joker{ --Chult
    key = "chult",
    config = {
        extra = {
            currentmoney = 0,
            money÷5 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Chult',
        ['text'] = {
            [1] = '{C:blue}#1# {} Chips, {C:red}#2# {} Mult.',
            [2] = '(This is {C:purple}Bull{} and {C:purple} Bootstraps {} combined)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        
        return {vars = {((G.GAME.dollars or 0)) * 0.5, ((math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)) * 2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = (G.GAME.dollars) * 0.5,
                extra = {
                    mult = (math.floor(lenient_bignum(G.GAME.dollars / 5))) * 2
                }
            }
        end
    end
}