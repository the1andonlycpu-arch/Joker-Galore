
SMODS.Joker{ --Trade off
    key = "tradeoff",
    config = {
        extra = {
            discards_change = '0',
            basediscardsperround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Trade off',
        ['text'] = {
            [1] = 'Give up your {C:rare}Discards{} for that many {C:blue}Hands{}.',
            [2] = '{C:inactive}(Disclaimer: Really buggy! Will fix in future updates.{}'
            },
            ['unlock'] = {
                [1] = 'Unlocked by default.'
            }
        },
        pos = {
            x = 5,
            y = 0
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
        pools = { ["jokergal_mycustom_jokers"] = true },
        
        loc_vars = function(self, info_queue, card)
            
            return {vars = {(G.GAME.round_resets.discards or 0)}}
        end,
        
        calculate = function(self, card, context)
            if context.setting_blind  and not context.blueprint then
                return {
                    func = function()
                        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.GAME.blind:disable()
                                    play_sound('timpani')
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                        end
                        return true
                    end,
                    extra = {
                        func = function()
                            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.GAME.blind:disable()
                                        play_sound('timpani')
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
                            end
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end,
        
        add_to_deck = function(self, card, from_debuff)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + G.GAME.round_resets.discards
            card.ability.extra.original_discards = G.GAME.round_resets.discards
            G.GAME.round_resets.discards = 0
        end,
        
        remove_from_deck = function(self, card, from_debuff)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - G.GAME.round_resets.discards
            if card.ability.extra.original_discards then
                G.GAME.round_resets.discards = card.ability.extra.original_discards
            end
        end
    }