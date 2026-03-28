
SMODS.Back {
    key = 'ultimate_erratic_deck',
    pos = { x = 4, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Ultimate Erratic Deck',
        text = {
            [1] = 'Randomizes {X:attention,C:white}All{} cards.'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'random_enhance')
                    v:set_ability(enhancement)
                    local seal_pool = {'Gold', 'Red', 'Blue', 'Purple'}
                    local random_seal = pseudorandom_element(seal_pool, 'random_seal')
                    v:set_seal(random_seal, nil, true)
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                    v:set_edition(edition, true, true)
                    local _suit = pseudorandom_element(SMODS.Suits, 'random_suit')
                    assert(SMODS.change_base(v, _suit.key))
                    local _rank = pseudorandom_element(SMODS.Ranks, 'random_rank')
                    assert(SMODS.change_base(v, nil, _rank.key))
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
    end
}