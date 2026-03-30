
SMODS.Booster {
    key = 'econ_pack',
    loc_txt = {
        name = "Econ pack",
        text = {
            [1] = 'Choose 1 of 3 {C:money}Econ{} cards'
        },
        group_name = "mycustom_boosters"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'Econ',
    group_key = "mycustom_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Tarot",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'common_joker_pack',
    loc_txt = {
        name = "Common Joker Pack",
        text = {
            [1] = 'Choose 1 of 3 {C:blue}Common{} jokers.',
            [2] = '{C:inactive}(1% chance for a uncommon){}'
        },
        group_name = "jokergal_boosters"
    },
    config = { extra = 3, choose = 1 },
    weight = 5.05,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'Joker Pack',
    group_key = "jokergal_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            4.95,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('jokergal_common_joker_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "Joker",
                rarity = "Common",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "jokergal_common_joker_pack"
            }
        elseif selected_index == 2 then
            return {
                set = "Joker",
                rarity = "Uncommon",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "jokergal_common_joker_pack"
            }
        end
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    