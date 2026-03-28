
SMODS.Back {
    key = 'pink_deck',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 3,
            play_size0 = 1,
            ante_value0 = 1
        },
    },
    loc_txt = {
        name = 'Pink Deck',
        text = {
            [1] = '{C:attention}0.334X{} Blind Size.',
            [2] = '{C:red}-1{} Card Selection Limit'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            local mod = -1
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_ante(mod)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                    return true
                end,
            }))
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 3
                return true
            end
        }))
        local ante = G.GAME.win_ante - 7
        local int_part, frac_part = math.modf(ante)
        local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
        G.GAME.win_ante = rounded
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_jokergal_thebeckoning' })
                    if new_joker then
                        new_joker:set_edition("e_negative", true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_play_limit(-1)
                    return true
                end
            }))
        }
    end
}