
SMODS.Joker{ --Jimbo
    key = "jimbo",
    config = {
        extra = {
            discount_amount = '1',
            Mon = 5,
            loss = 1,
            jkrslots = 0,
            blindsskipped = 0,
            totaljokerslots = 0,
            mult0 = 4,
            joker_slots0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jimbo',
        ['text'] = {
            [1] = '{s:1,X:red,C:white}Jimbo.{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Mon, card.ability.extra.loss, card.ability.extra.jkrslots, ((G.GAME.skips or 0)) * 5, (G.jokers and G.jokers.config.card_limit or 0 or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 4
            }
        end
        if context.reroll_shop  then
            return {
                func = function()
                    card.ability.extra.Mon = (card.ability.extra.Mon) + 1
                    return true
                end,
                extra = {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.Mon
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.Mon), colour = G.C.MONEY})
                        return true
                    end,
                    colour = G.C.MONEY
                }
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    return true
                end
            }
        end
        if context.ending_shop  then
            return {
                func = function()
                    card.ability.extra.Mon = 5
                    return true
                end
            }
        end
        if context.selling_self  then
            local jkrslots_value = card.ability.extra.jkrslots
            return {
                func = function()
                    card.ability.extra.jkrslots = G.jokers and G.jokers.config.card_limit or 0
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.jkrslots = math.max(0, (card.ability.extra.jkrslots) - card.ability.extra.loss)
                        return true
                    end,
                    colour = G.C.RED,
                    extra = {
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Joker Slots set to "..tostring(G.jokers and G.jokers.config.card_limit or 0), colour = G.C.BLUE})
                            G.jokers.config.card_limit = G.jokers and G.jokers.config.card_limit or 0
                            return true
                        end,
                        colour = G.C.DARK_EDITION
                    }
                }
            }
        end
        
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
            SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
            SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
        end
        
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - (G.GAME.skips) * 5
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + (G.GAME.skips) * 5
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_jokergal_jimbo" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    	if e.config.ref_table.config.center.key == "j_jokergal_jimbo" then
        		e.config.colour = G.C.GREEN
        		e.config.button = "use_card"
    	else
        		can_select_card_ref(e)
    	end
end


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_jokergal_jimbo")) then
        if (self.ability.set == 'Planet' or (self.ability.set == 'Booster' and self.config.center.kind == 'Celestial')) then
            self.cost = 0
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end