
SMODS.Back {
    key = 'base_deck',
    pos = { x = 1, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Base Deck',
        text = {
            [1] = 'A base deck with {C:dark_edition}No{} Effects.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    
}
SMODS.Back {
    key = 'custom_deck',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            ante_value0 = 35,
            all_blinds_size0 = 800,
            ante_value = 1,
            odds = 3
        },
    },
    loc_txt = {
        name = 'Challenge deck: ?',
        text = {
            [1] = 'Starting rules:',
            [2] = 'Start at ante 35',
            [3] = 'Set blind req to 300.',
            [4] = 'When ante changes:',
            [5] = '{C:red}-1{} ante',
            [6] = '{C:attention}+1{} joker slot',
            [7] = 'Create a common, uncommon, rare, and legendary joker',
	    [8] = 'Banned cards:',
	    [9] = '{C:attention}None!{}'
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
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                    if new_joker then
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Uncommon' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
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
        local mod = 35 - G.GAME.round_resets.ante
        G.E_MANAGER:add_event(Event({
            func = function()
                ease_ante(mod)
                G.GAME.round_resets.blind_ante = 35
                return true
            end,
        }))
        G.GAME.win_ante = 35
        G.E_MANAGER:add_event(Event({
            func = function()
		G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling + 0.2
                return true
            end
        }))
    end
}