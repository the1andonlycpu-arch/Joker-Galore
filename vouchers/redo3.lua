
SMODS.Voucher {
    key = 'redo3',
    pos = { x = 2, y = 0 },
    config = { 
        extra = {
            all_blinds_size0 = 2,
            all_blinds_size0 = 3,
            hands0 = 3,
            ante_value0 = 3
        } 
    },
    loc_txt = {
        name = 'Redo++',
        text = {
            [1] = '{C:red}-3{} hands and ante {C:inactive}(you should really stop){}. {C:red}2X {} blind size.'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_redo2'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 2
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 3
                return true
            end
        }))
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 3
        ease_hands_played(-3)
        local mod = -3
        ease_ante(mod)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
    end
}