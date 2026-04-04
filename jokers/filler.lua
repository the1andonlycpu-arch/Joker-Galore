
SMODS.Joker{ --Filler
    key = "filler",
    config = {
        extra = {
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Filler',
        ['text'] = {
            [1] = '{C:attention}+1{} hand per round. (ex: 4 -> 5 -> 6)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
    pools = { ["jokergal_jokergal_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                    ease_hands_played(1)
                    
                    return true
                end
            }
        end
    end
}