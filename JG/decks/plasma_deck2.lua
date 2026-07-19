
SMODS.Back {
    key = 'plasma_deck2',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            ante_value0 = 1
        },
    },
    loc_txt = {
        name = 'Plasma Deck?',
        text = {
            [1] = 'Balance {C:blue}Chips{} and',
            [2] = '{C:red}Mult{} when calculating',
            [3] = 'score for played hand',
            [4] = '{C:red}X2{} base Blind size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            local mod = 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_ante(mod)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
                    return true
                end,
            }))
            local ante = G.GAME.win_ante + 1
            local int_part, frac_part = math.modf(ante)
            local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
            G.GAME.win_ante = rounded
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_jokergal_balancer' })
                if new_joker then
                    new_joker:set_edition("e_negative", true)
                    new_joker:add_sticker('eternal', true)
                end
                return true
            end
        }))
    end
}