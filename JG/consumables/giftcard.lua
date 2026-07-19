
SMODS.Consumable {
    key = 'giftcard',
    set = 'shopping',
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'Gift card',
        text = {
            [1] = 'Create a random voucher'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        local voucher_key = pseudorandom_element(G.P_CENTER_POOLS.Voucher, "c401275b").key
        local voucher_card = SMODS.create_card{area = G.play, key = voucher_key}
        voucher_card:start_materialize()
        voucher_card.cost = 0
        G.play:emplace(voucher_card)
        delay(0.8)
        voucher_card:redeem()
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                voucher_card:start_dissolve()                
                return true
            end
        }))
        return {
            message = nil
        }
    end,
    can_use = function(self, card)
        return true
    end
}