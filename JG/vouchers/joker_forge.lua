
SMODS.Voucher {
    key = 'joker_forge',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'joker forge',
        text = {
            [1] = '{C:attention}+25{} joker slots'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 50,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'negative_blank'},
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 25
                    return true
                end
            }))
            
        }
    end
}