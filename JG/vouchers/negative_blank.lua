
SMODS.Voucher {
    key = 'negative_blank',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'negative blank',
        text = {
            [1] = '{C:red}-1{} joker slot.'
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
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
                    return true
                end
            }))
            
        }
    end
}