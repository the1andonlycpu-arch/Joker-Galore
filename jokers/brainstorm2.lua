
SMODS.Joker{ --Brainstorm 
    key = "bstorm",
    config = {
        extra = {
            thisjokersellvalue = 0
        }
    },
    loc_txt = {
        ['name'] = 'Brainstorm ',
        ['text'] = {
            [1] = 'Copies the ability of leftmost {C:attention}Joker{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {(function() for _, joker in ipairs(G.jokers and (G.jokers and G.jokers.cards or {}) or {}) do if joker == card then return joker.sell_cost end end end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                target_card.ability.extra_value = (card.ability.extra_value or 0) + (function() for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker == card then return joker.sell_cost end end end)()
                    target_card:set_cost()
                    return true
                end,
                message = "+"..tostring((function() for _, joker in ipairs(G.jokers and G.jokers.cards or {}) do if joker == card then return joker.sell_cost end end end)()).." Sell Value"
            }
        end
        
        local target_joker = nil
        
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        SMODS.calculate_effect(ret, card)
            
        
    end
}