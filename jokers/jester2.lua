
SMODS.Joker{ --Jester 2?
    key = "jester2",
    config = {
        extra = {
            Prog = 0,
            RoundsReq = 3,
            x = 4
        }
    },
    loc_txt = {
        ['name'] = 'Jester 2?',
        ['text'] = {
            [1] = 'Creates a {C:dark_edition}Negative{} {C:legendary}Jester{} Every {C:attention}x^2 {}{C:inactive}(#3#){} rounds.',
            [2] = 'Where x is {C:attention}#2# {}',
            [3] = 'x increase\'s by {C:attention}1{} when {C:legendary}Jester{}',
            [4] = 'Is created by {C:attention}this{} joker.',
            [5] = '{C:inactive,s:1.1}(#1#/#3#){}'
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
        
        return {vars = {card.ability.extra.Prog, card.ability.extra.RoundsReq, card.ability.extra.x}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if not (to_big((card.ability.extra.Prog or 0)) >= to_big(card.ability.extra.x)) then
                return {
                    func = function()
                        card.ability.extra.Prog = (card.ability.extra.Prog) + 1
                        return true
                    end
                }
            elseif to_big((card.ability.extra.Prog or 0)) >= to_big(card.ability.extra.x) then
                local x_value = card.ability.extra.x
                return {
                    func = function()
                        card.ability.extra.Prog = 0
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.RoundsReq = (card.ability.extra.RoundsReq) + 1
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.x = card.ability.extra.RoundsReq
                                return true
                            end,
                            colour = G.C.BLUE,
                            extra = {
                                func = function()
                                    card.ability.extra.x = (card.ability.extra.x) ^ 2
                                    return true
                                end,
                                colour = G.C.BLUE,
                                extra = {
                                    func = function()
                                        
                                        local created_joker = false
                                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                            created_joker = true
                                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                            G.E_MANAGER:add_event(Event({
                                                func = function()
                                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_jokergal_jester' })
                                                    if joker_card then
                                                        joker_card:set_edition("e_negative", true)
                                                        
                                                    end
                                                    G.GAME.joker_buffer = 0
                                                    return true
                                                end
                                            }))
                                        end
                                        if created_joker then
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                        end
                                        return true
                                    end,
                                    colour = G.C.BLUE
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}