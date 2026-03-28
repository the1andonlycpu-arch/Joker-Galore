
SMODS.Voucher {
    key = 'palette',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            hand_size0 = 1
        } 
    },
    loc_txt = {
        name = 'Palette Copy',
        text = {
            [1] = '{C:attention}+1{} hand size'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = false,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_paint_brush'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    G.hand:change_size(1)
                    return true
                end
            }))
        }
    end
}