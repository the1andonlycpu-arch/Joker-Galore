
SMODS.Joker{ --Coin
    key = "coin",
    config = {
        extra = {
            JokerE = 10,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'Coin',
        ['text'] = {
            [1] = 'Earn {C:attention}#1#${}  at the end of the round. Multiply by {C:white,X:attention}1.25X{} each ante.',
            [2] = 'Theres a {C:uncommon}#2# in 6{} chance to Multiply it by {X:attention,C:white}2X{} instead.',
            [3] = 'Always triggers if you have {C:attention,E:1}at least {}{C:money}100$ {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "jokergal_econ",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_jokergal_coin') 
        return {vars = {card.ability.extra.JokerE, new_numerator, new_denominator}}
    end, 
    
    calc_dollar_bonus = function(card)
        local blind_reward = 0
        blind_reward = blind_reward + math.max(card.config.extra.JokerE, 0)
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
        end
        if context.ante_change  then
            if to_big(G.GAME.dollars) >= to_big(100) then
                return {
                    func = function()
                        card.ability.extra.JokerE = (card.ability.extra.JokerE) * 2
                        return true
                    end
                }
            elseif to_big(G.GAME.dollars) <= to_big(99) then
                return {
                    func = function()
                        card.ability.extra.JokerE = (card.ability.extra.JokerE) * 1.25
                        return true
                    end
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_507b6fb1', 1, card.ability.extra.odds, 'j_jokergal_coin', false) then
                            local JokerE_value = card.ability.extra.JokerE
                            SMODS.calculate_effect({func = function()
                                card.ability.extra.JokerE = (card.ability.extra.JokerE) / 1.25
                                return true
                            end}, card)
                            SMODS.calculate_effect({func = function()
                                card.ability.extra.JokerE = (card.ability.extra.JokerE) * 2
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