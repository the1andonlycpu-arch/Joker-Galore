
SMODS.Enhancement {
    key = 'merchant',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            m = 0,
            hyperchips_n0 = 1.1,
            hyperchips_arrows0 = 1
        }
    },
    loc_txt = {
        name = 'merchant',
        text = {
            [1] = 'gives'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 14.25,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.m}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.m = (card.ability.extra.m) + 1
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.m
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "money", colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    hyperchips = {
                        1,
                        1.1
                    },
                    message = "THE WORLD WILL [Redacted]",
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}