Config = Config or {}

Config.Framework = 'vrp' -- vrp, esx, qbcore
Config.chance_of_falling = 0.8 -- 0.8 = 80% chance of falling when blindfolded

Config.Notify = function(title, description, type, src)
    if src then
        lib.notify(src, {
            title = title,
            description = description,
            type = type
        })
    else
        lib.notify({
            title = title,
            description = description,
            type = type
        })
    end
end