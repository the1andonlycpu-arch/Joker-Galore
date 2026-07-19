
SMODS.Consumable {
    key = 'dragonegg',
    set = 'medival',
    pos = { x = 4, y = 0 },
    config = { 
        extra = {
            odds = 10   
        } 
    },
    loc_txt = {
        name = 'Dragon Egg',
        text = {
            [1] = '{C:green}#1# in #2#{} chance to create {C:legendary}Dragon{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'c_jokergal_dragonegg')
        return {vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if SMODS.pseudorandom_probability(card, 'group_0_0743cfc5', 1, card.ability.extra.odds, 'j_jokergal_dragonegg', true) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_jokergal_dragon' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}