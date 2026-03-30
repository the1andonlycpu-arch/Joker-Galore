
SMODS.Voucher {
    key = 'redo',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            all_blinds_size0 = 1.5,
            winner_ante_value0 = 1,
            ante_value0 = 1
        } 
    },
    loc_txt = {
        name = 'Redo',
        text = {
            [1] = '{C:attention}-1{} ante and win ante. {C:red}1.5X{} blind size.'
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
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.5
                return true
            end
        }))
        local mod = -1
        ease_ante(mod)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
        return {
            func = function()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        local ante = G.GAME.win_ante - 1
                        local int_part, frac_part = math.modf(ante)
                        local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
                        G.GAME.win_ante = rounded
                        return true
                    end
                }))
                return true
            end,
            message = "Winner Ante -" .. 1
        }
    end
}