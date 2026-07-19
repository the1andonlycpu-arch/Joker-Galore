
SMODS.Back {
    key = 'joker_deck',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 6
        },
    },
    loc_txt = {
        name = 'Joker Deck',
        text = {
            [1] = 'Start With {C:attention}10000{} Joker Slots.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end,
    apply = function(self, back)
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 9995
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 6
                return true
            end
        }))
    end
}