
SMODS.Joker{ --Jester
    key = "jester",
    config = {
        extra = {
            Prog = 0,
            RoundsReq = 3
        }
    },
    loc_txt = {
        ['name'] = 'Jester',
        ['text'] = {
            [1] = 'Creates {C:legendary}The Fool{} Every {C:attention}#2# {} rounds. Rounds increase by {C:attention}1{} when {C:legendary}The Fool{}',
            [2] = 'Is created by {C:attention}this{} joker.',
            [3] = '{C:inactive,s:1.1}(#1#/#2#){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Prog, card.ability.extra.RoundsReq}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if not (to_big((card.ability.extra.Prog or 0)) >= to_big(card.ability.extra.RoundsReq)) then
                return {
                    func = function()
                        card.ability.extra.Prog = (card.ability.extra.Prog) + 1
                        return true
                    end
                }
            elseif to_big((card.ability.extra.Prog or 0)) == to_big(card.ability.extra.RoundsReq) then
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
                                
                                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.4,
                                        func = function()
                                            play_sound('timpani')
                                            SMODS.add_card({ set = 'Tarot', key = 'c_fool'})                            
                                            card:juice_up(0.3, 0.5)
                                            return true
                                        end
                                    }))
                                end
                                delay(0.6)
                                
                                if created_consumable then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                                end
                                return true
                            end,
                            colour = G.C.PURPLE
                        }
                    }
                }
            end
        end
    end
}