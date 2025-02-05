local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {
    ls.add_snippets("all", {
        s("surround", {
            c(1, {
                { t('"'), t('"') },
                { t("{"), t("}") },
                { t("("), t(")") },
                { t("["), t("]") }
            })
        })
    })
}
