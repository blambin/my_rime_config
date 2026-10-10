local thai = nil

local function load_dict()
    if thai ~= nil then
        return thai
    end

    thai = {}

    local ok, user_dir = pcall(rime_api.get_user_data_dir)
    if not ok or not user_dir then
        return thai
    end

    local file = io.open(user_dir .. "/lua/thai_hint.tsv", "r")
    if not file then
        return thai
    end

    for line in file:lines() do
        local word, meaning = line:match("^([^\t]+)\t(.*)$")
        if word and meaning and word ~= "" and meaning ~= "" then
            thai[word] = meaning
        end
    end

    file:close()
    return thai
end

local function filter(input, env)
    local dict = load_dict()

    for cand in input:iter() do
        local hint = dict[cand.text]

        if hint then
            local comment = cand.comment or ""
            if comment ~= "" then
                comment = comment .. "  "
            end

            yield(ShadowCandidate(
                cand, cand.type, cand.text, comment .. hint
            ))
        else
            yield(cand)
        end
    end
end

return filter
