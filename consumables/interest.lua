
SMODS.Consumable {
    key = 'interest',
    set = 'econ',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            money÷5 = 0   
        } 
    },
    loc_txt = {
        name = 'Interest',
        text = {
            [1] = 'Earn {C:money}1${} For Every {C:money}5${} You Have. No Interest Cap.'
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
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + math.floor(lenient_bignum(G.GAME.dollars / 5))
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(math.floor(lenient_bignum(G.GAME.dollars / 5))).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}