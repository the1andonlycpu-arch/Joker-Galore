
SMODS.Joker{ --Big brain susie
    key = "bigbrainsusie",
    config = {
        extra = {
            abc = 0
        }
    },
    loc_txt = {
        ['name'] = 'Big brain susie',
        ['text'] = {
            [1] = 'Once per 2 {C:attention}antes{}, Create a negative brainstorm',
            [2] = '{C:inactive}(#1#/2){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "jokergal_unrare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.abc}}
    end,
    
    calculate = function(self, card, context)
        if context.ante_change  then
            if not (to_big((card.ability.extra.abc or 0)) >= to_big(2)) then
                return {
                    func = function()
                        card.ability.extra.abc = (card.ability.extra.abc) + 1
                        return true
                    end
                }
            elseif to_big((card.ability.extra.abc or 0)) >= to_big(2) then
                return {
                    func = function()
                        card.ability.extra.abc = 0
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            local created_joker = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_jokergal_bstorm' })
                                    if joker_card then
                                        joker_card:set_edition("e_negative", true)
                                        
                                    end
                                    
                                    return true
                                end
                            }))
                            
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
    end
}