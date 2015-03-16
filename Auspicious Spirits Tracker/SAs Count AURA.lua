{
    ["xOffset"] = 0,
    ["customText"] = "-- Auspicious Spirits / Shadowy Apparition tracker. -- By Twintop - Kel'Thuzad-US, 2015/03/15\nfunction()\n    local WA_RETURN = -1;\n    local totalSAs = 0;    \n    local LastTime = GetTime();\n    local CurrentTime = GetTime();\n    local color = \"FFFFFFFF\";\n    local orbCount = UnitPower(\"player\", SPELL_POWER_SHADOW_ORBS, forceUpdate);\n    local WA_RETURN_STRING;\n    WA_SA_NUM_UNITS = WA_SA_NUM_UNITS or 0;\n    \n    if WA_SA_NUM_UNITS > 0 then\n        for guid,count in pairs(WA_SA_STATS) do\n            totalSAs = totalSAs + WA_SA_STATS[guid].Count;\n            LastTime = WA_SA_STATS[guid].LastUpdate;\n        end\n        \n        if totalSAs > WA_SA_TOTAL then\n            WA_RETURN = WA_SA_TOTAL or 0;\n        else\n            WA_RETURN = totalSAs or 0;\n        end\n    else\n        WA_RETURN = -2;\n    end\n    \n    if WA_RETURN <= 0 then\n        return \"0\";\n    end\n    \n    if (orbCount + WA_RETURN) >= 5 and orbCount >= 3 then\n        color = \"FFFF0000\";\n    else\n        color = \"FFFFFFFF\";\n    end\n    \n    WA_RETURN_STRING = string.format(\"|c%s%s\",color,WA_RETURN);\n    return WA_RETURN_STRING;\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
    ["yOffset"] = 0,
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "update",
    ["actions"] = {
        ["start"] = {
            ["do_message"] = false,
        },
        ["init"] = {
        },
        ["finish"] = {
        },
    },
    ["fontFlags"] = "OUTLINE",
    ["animation"] = {
        ["start"] = {
            ["type"] = "none",
            ["duration_type"] = "seconds",
        },
        ["main"] = {
            ["type"] = "none",
            ["duration_type"] = "seconds",
        },
        ["finish"] = {
            ["type"] = "none",
            ["duration_type"] = "seconds",
        },
    },
    ["trigger"] = {
        ["type"] = "custom",
        ["custom_type"] = "status",
        ["custom_hide"] = "custom",
        ["duration"] = "5",
        ["event"] = "Health",
        ["customStacks"] = "\n\n",
        ["subeventSuffix"] = "_CAST_START",
        ["events"] = "COMBAT_LOG_EVENT_UNFILTERED PLAYER_REGEN_ENABLED PLAYER_REGEN_DISABLED",
        ["custom"] = "-- Auspicious Spirits / Shadowy Apparition tracker. -- By Twintop - Kel'Thuzad-US, 2015/03/15\nfunction()\n    local totalSAs = 0;\n    \n    if not WA_SA_STATS or WA_SA_STATS == nil then\n        return false;\n    else\n        if WA_SA_NUM_UNITS > 0 then\n            for guid,count in pairs(WA_SA_STATS) do\n                totalSAs = totalSAs + WA_SA_STATS[guid].Count;\n            end\n        else\n            return false;\n        end\n    end\n    \n    if WA_SA_NUM_UNITS <= 0 or totalSAs <= 0 or WA_SA_TOTAL <= 0 then\n        return false;\n    end\n    \n    return true;\nend",
        ["unit"] = "player",
        ["check"] = "update",
        ["subeventPrefix"] = "SPELL",
        ["names"] = {
        },
        ["debuffType"] = "HELPFUL",
    },
    ["desaturate"] = false,
    ["font"] = "Friz Quadrata TT",
    ["height"] = 52,
    ["load"] = {
        ["use_never"] = false,
        ["talent"] = {
            ["single"] = 21,
            ["multi"] = {
            },
        },
        ["class"] = {
            ["single"] = "PRIEST",
            ["multi"] = {
            },
        },
        ["use_level"] = false,
        ["use_talent"] = true,
        ["use_class"] = true,
        ["race"] = {
            ["multi"] = {
            },
        },
        ["difficulty"] = {
            ["multi"] = {
            },
        },
        ["use_spec"] = true,
        ["spec"] = {
            ["single"] = 3,
            ["multi"] = {
            },
        },
        ["use_combat"] = true,
        ["role"] = {
            ["multi"] = {
            },
        },
        ["size"] = {
            ["multi"] = {
            },
        },
    },
    ["fontSize"] = 24,
    ["displayStacks"] = "%c",
    ["regionType"] = "icon",
    ["init_completed"] = 1,
    ["parent"] = "Auspicious Spirits Tracker",
    ["icon"] = true,
    ["stacksContainment"] = "INSIDE",
    ["zoom"] = 0,
    ["auto"] = true,
    ["id"] = "SAs Count",
    ["additional_triggers"] = {
    },
    ["stickyDuration"] = false,
    ["frameStrata"] = 1,
    ["width"] = 52,
    ["untrigger"] = {
        ["custom"] = "-- Auspicious Spirits / Shadowy Apparition tracker. -- By Twintop - Kel'Thuzad-US, 2015/03/15\nfunction()\n    local WA_RETURN;\n    \n    local totalSAs = 0;    \n    local LastTime = GetTime();\n    local CurrentTime = GetTime();\n    \n    if WA_SA_STATS == nil then\n        WA_RETURN = -1;\n    else\n        if WA_SA_NUM_UNITS > 0 then\n            for guid,count in pairs(WA_SA_STATS) do\n                totalSAs = totalSAs + WA_SA_STATS[guid].Count;\n                LastTime = WA_SA_STATS[guid].LastUpdate;\n            end\n            \n            if totalSAs > WA_SA_TOTAL then\n                WA_RETURN = WA_SA_TOTAL or 0;\n            else\n                WA_RETURN = totalSAs or 0;\n            end            \n        else\n            WA_RETURN = -2;\n        end\n    end\n    \n    if WA_RETURN <= 0 then\n        return true;\n    end\n    \n    return false;\nend",
    },
    ["numTriggers"] = 1,
    ["inverse"] = false,
    ["color"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
    ["selfPoint"] = "CENTER",
    ["displayIcon"] = "INTERFACE\\ICONS\\ability_priest_shadowyapparition",
    ["stacksPoint"] = "CENTER",
    ["textColor"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
}