{
    ["outline"] = true,
    ["fontSize"] = 12,
    ["color"] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
    },
    ["displayText"] = "",
    ["yOffset"] = 0,
    ["anchorPoint"] = "CENTER",
    ["customTextUpdate"] = "update",
    ["actions"] = {
        ["start"] = {
            ["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\AirHorn.ogg",
            ["do_sound"] = true,
        },
        ["finish"] = {
        },
        ["init"] = {
        },
    },
    ["parent"] = "Auspicious Spirits Tracker",
    ["justify"] = "LEFT",
    ["selfPoint"] = "BOTTOM",
    ["trigger"] = {
        ["type"] = "custom",
        ["subeventSuffix"] = "_CAST_START",
        ["unevent"] = "auto",
        ["event"] = "Health",
        ["unit"] = "player",
        ["custom_type"] = "status",
        ["custom"] = "-- Auspicious Spirits / Shadowy Apparition tracker. -- By Twintop - Kel'Thuzad-US, 2015/03/15\nfunction()\n    local orbCount = UnitPower(\"player\", SPELL_POWER_SHADOW_ORBS, forceUpdate);\n    WA_SA_TOTAL = WA_SA_TOTAL or 0;\n    \n    if (WA_SA_TOTAL + orbCount) >= 5 and WA_SA_TOTAL > 0 and orbCount >= 3 then\n        return true;\n    end\n    return false;    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
        ["spellIds"] = {
        },
        ["use_unit"] = true,
        ["check"] = "update",
        ["subeventPrefix"] = "SPELL",
        ["names"] = {
        },
        ["debuffType"] = "HELPFUL",
    },
    ["untrigger"] = {
        ["custom"] = "-- Auspicious Spirits / Shadowy Apparition tracker. -- By Twintop - Kel'Thuzad-US, 2015/03/15\nfunction()\n    local orbCount = UnitPower(\"player\", SPELL_POWER_SHADOW_ORBS, forceUpdate);\n    WA_SA_TOTAL = WA_SA_TOTAL or 0;\n    \n    if (WA_SA_TOTAL + orbCount) >= 5 and WA_SA_TOTAL > 0 and orbCount >= 3 then\n        return false;\n    end\n    return true;    \nend",
    },
    ["frameStrata"] = 1,
    ["width"] = 0.99999970197678,
    ["animation"] = {
        ["start"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
        ["main"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
        ["finish"] = {
            ["duration_type"] = "seconds",
            ["type"] = "none",
        },
    },
    ["font"] = "Friz Quadrata TT",
    ["numTriggers"] = 1,
    ["xOffset"] = 0,
    ["height"] = 0.99999970197678,
    ["id"] = "AS Audio Trigger",
    ["load"] = {
        ["use_never"] = true,
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
        ["use_talent"] = true,
        ["use_class"] = true,
        ["role"] = {
            ["multi"] = {
            },
        },
        ["use_spec"] = true,
        ["difficulty"] = {
            ["multi"] = {
            },
        },
        ["race"] = {
            ["multi"] = {
            },
        },
        ["spec"] = {
            ["single"] = 3,
            ["multi"] = {
            },
        },
        ["size"] = {
            ["multi"] = {
            },
        },
    },
    ["regionType"] = "text",
}