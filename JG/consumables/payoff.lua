
SMODS.Consumable {
    key = 'payoff',
    set = 'econ',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            currentmoney = 0   
        } 
    },
    loc_txt = {
        name = 'Payoff',
        text = {
            [1] = '{X:money,C:white}#1#X{} Money'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {vars = {((G.GAME.dollars or 0)) * 1000}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars * (G.GAME.dollars) * 1000
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "X"..tostring((G.GAME.dollars) * 1000).." $", colour = G.C.RED})
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