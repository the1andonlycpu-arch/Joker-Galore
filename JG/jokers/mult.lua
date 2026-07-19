
SMODS.Joker{ --MULT
    key = "mult",
    config = {
        extra = {
            g = 1.01,
            n = 0.01,
            h = 0.01,
            gain = 0,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'MULT',
        ['text'] = {
            [1] = 'Gain {X:red,C:white}#2#X{} Mult when a card is discarded. Add',
            [2] = '{X:red,C:white}#3#X{} to {X:red,C:white}XMult{} gain when round ends.',
            [3] = '{C:green}1 in 10{} chance to multiply by {X:red,C:white}10X{}',
            [4] = '{C:inactive}Currently {X:red,C:white}#1#X{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_jokergal_mult') 
        return {vars = {card.ability.extra.g, card.ability.extra.n, card.ability.extra.h, card.ability.extra.gain, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.g
            }
        end
        if context.discard  then
            return {
                func = function()
                    card.ability.extra.g = (card.ability.extra.g) + card.ability.extra.n
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.gain = (card.ability.extra.gain) + card.ability.extra.n
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                return {
                    func = function()
                        card.ability.extra.n = (card.ability.extra.n) + card.ability.extra.h
                        return true
                    end
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_904c1610', 1, card.ability.extra.odds, 'j_jokergal_mult', false) then
                            SMODS.calculate_effect({func = function()
                                card.ability.extra.g = (card.ability.extra.g) * 10
                                return true
                            end}, card)
                            SMODS.calculate_effect({func = function()
                                card.ability.extra.n = (card.ability.extra.n) * 10
                                return true
                            end}, card)
                            SMODS.calculate_effect({func = function()
                                card.ability.extra.h = (card.ability.extra.h) * 10
                                return true
                            end}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}