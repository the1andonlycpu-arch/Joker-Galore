
SMODS.Voucher {
    key = 'redo2',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            all_blinds_size0 = 1.5,
            ante_value0 = 2,
            hand_size0 = 2,
            all_blinds_size0 = 2,
            winner_ante_value0 = 2
        } 
    },
    loc_txt = {
        name = 'Redo+',
        text = {
            [1] = '{C:red}-2{} hand size and win ante and {C:red}-2{} ante. {C:red}2X{} blind size'
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
    requires = {'v_redo'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling / 1.5
                return true
            end
        }))
        local mod = -2
        ease_ante(mod)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 2
                return true
            end
        }))
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(-2)
                    return true
                end
            })),
            extra = {
                func = function()
                    
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            local ante = G.GAME.win_ante - 2
                            local int_part, frac_part = math.modf(ante)
                            local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
                            G.GAME.win_ante = rounded
                            return true
                        end
                    }))
                    return true
                end,
                message = "Winner Ante -" .. 2,
                colour = G.C.FILTER
            }
        }
    end
}