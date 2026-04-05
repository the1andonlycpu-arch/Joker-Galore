
SMODS.Joker{ --Jeans
    key = "jeans",
    config = {
        extra = {
            xChips = 3,
            Increases = 0,
            Inc1 = 0,
            inc2 = 0,
            Int = 0.5,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Jeans',
        ['text'] = {
            [1] = '{X:blue,C:white}#1#X{} Chips. Increase by {X:blue,C:white}#5#X{} every {C:inactive}(#3#/2) {}rounds.',
            [2] = 'All values gets multiplied by {X:blue,C:white}1.25X{} every {C:inactive}(#4#/2){} increases.',
            [3] = '{C:uncommon}#6# in #7# {} chance to {C:rare}reset{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_jokergal_jeans') 
        return {vars = {card.ability.extra.xChips, card.ability.extra.Increases, card.ability.extra.Inc1, card.ability.extra.inc2, card.ability.extra.Int, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_cdaade87', 1, card.ability.extra.odds, 'j_jokergal_jeans', false) then
                    card.ability.extra.xChips = 3
                    card.ability.extra.Int = 0.5
                    
                end
            else
                return {
                    x_chips = card.ability.extra.xChips
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (to_big((card.ability.extra.Inc1 or 0)) >= to_big(2) and not (to_big((card.ability.extra.inc2 or 0)) >= to_big(2))) then
                return {
                    func = function()
                        card.ability.extra.Inc1 = 0
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.Increases = (card.ability.extra.Increases) + 1
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.xChips = (card.ability.extra.xChips) + card.ability.extra.Int
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    card.ability.extra.inc2 = (card.ability.extra.inc2) + 1
                                    return true
                                end,
                                colour = G.C.GREEN
                            }
                        }
                    }
                }
            elseif to_big((card.ability.extra.inc2 or 0)) >= to_big(2) then
                return {
                    func = function()
                        card.ability.extra.xChips = (card.ability.extra.xChips) * 1.25
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.Increases = (card.ability.extra.Increases) + 1
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.inc2 = 0
                                return true
                            end,
                            colour = G.C.BLUE,
                            extra = {
                                func = function()
                                    card.ability.extra.Int = (card.ability.extra.Int) * 1.25
                                    return true
                                end,
                                colour = G.C.MULT
                            }
                        }
                    }
                }
            else
                return {
                    func = function()
                        card.ability.extra.Inc1 = (card.ability.extra.Inc1) + 1
                        return true
                    end
                }
            end
        end
    end
}