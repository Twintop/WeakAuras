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
    ["init_completed"] = 1,
    ["actions"] = {
        ["start"] = {
        },
        ["init"] = {
        },
        ["finish"] = {
        },
    },
    ["regionType"] = "text",
    ["justify"] = "LEFT",
    ["selfPoint"] = "BOTTOM",
    ["trigger"] = {
        ["type"] = "custom",
        ["subeventSuffix"] = "_CAST_START",
        ["debuffType"] = "HELPFUL",
        ["event"] = "Chat Message",
        ["unit"] = "player",
        ["names"] = {
        },
        ["subeventPrefix"] = "SPELL",
        ["custom"] = "-- Auspicious Spirits / Shadowy Apparition tracker. -- By Twintop - Kel'Thuzad-US, 2015/03/15\nfunction(event,time,type,_,sourceGUID,sourcename,_,_,destGUID,destname,_,_,spellid,spellname,_,_,_,_,_,_,_,spellcritical,_,_,_,spellmultistrike)\n    local CurrentTime = GetTime();\n    \n    WA_SA_NUM_UNITS = WA_SA_NUM_UNITS or 0;\n    WA_SA_TOTAL = WA_SA_TOTAL or 0;\n    \n    -- Stats buffer\n    WA_SA_STATS = WA_SA_STATS or {};\n    \n    WA_SA_DEAD = WA_SA_DEAD or {};\n    \n    WA_LAST_CONTINUITY_CHECK = WA_LAST_CONTINUITY_CHECK or GetTime();\n    \n    WA_SA_Cleanup = function(guid)\n        if WA_SA_STATS[guid] then\n            WA_SA_TOTAL = WA_SA_TOTAL - WA_SA_STATS[guid].Count;\n            \n            if WA_SA_TOTAL < 0 then\n                WA_SA_TOTAL = 0;\n            end\n            \n            WA_SA_STATS[guid].Count = nil;\n            WA_SA_STATS[guid].LastUpdate = nil;\n            WA_SA_STATS[guid] = nil;\n            \n            WA_SA_NUM_UNITS = WA_SA_NUM_UNITS - 1;\n            \n            if WA_SA_NUM_UNITS < 0 then\n                WA_SA_NUM_UNITS = 0;\n            end\n        end\n    end    \n    \n    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" and sourceGUID == UnitGUID(\"player\") then\n        if spellid == 147193 and type == \"SPELL_CAST_SUCCESS\" then -- Shadowy Apparition Spawned\n            if not WA_SA_STATS[destGUID] or WA_SA_STATS[destGUID] == nil then\n                WA_SA_STATS[destGUID] = {};\n                WA_SA_STATS[destGUID].Count = 0;\n                WA_SA_NUM_UNITS = WA_SA_NUM_UNITS + 1;\n            end\n            \n            WA_SA_TOTAL = WA_SA_TOTAL + 1;\n            WA_SA_STATS[destGUID].Count = WA_SA_STATS[destGUID].Count + 1;\n            WA_SA_STATS[destGUID].LastUpdate = CurrentTime;\n        elseif spellid == 155521 and type == \"SPELL_CAST_SUCCESS\" then -- Auspicious Spirit Hit\n            WA_SA_TOTAL = WA_SA_TOTAL - 1;\n            if WA_SA_STATS[destGUID] and WA_SA_STATS[destGUID].Count > 0 then   \n                WA_SA_STATS[destGUID].Count = WA_SA_STATS[destGUID].Count - 1;\n                WA_SA_STATS[destGUID].LastUpdate = CurrentTime;\n                \n                if WA_SA_STATS[destGUID].Count <= 0 then\n                    WA_SA_Cleanup(destGUID);\n                end\n            end\n        end\n    end\n    \n    if WA_SA_TOTAL < 0 then\n        WA_SA_TOTAL = 0;\n    end\n    \n    for guid,count in pairs(WA_SA_STATS) do\n        if (CurrentTime - WA_SA_STATS[guid].LastUpdate) > 10 then\n            --If we haven't had a new SA spawn in 10sec, that means all SAs that are out have hit the target (usually), or, the target disappeared.\n            WA_SA_Cleanup(guid);\n        end\n    end\n    \n    \n    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" and (type == \"UNIT_DIED\" or type == \"UNIT_DESTROYED\" or type == \"SPELL_INSTAKILL\") then -- Unit Died, remove them from the target list.\n        WA_SA_Cleanup(destGUID);\n    end\n    \n    if UnitIsDeadOrGhost(\"player\") or not UnitAffectingCombat(\"player\") or event == \"PLAYER_REGEN_ENABLED\" then -- We died, or, exited combat, go ahead and purge the list\n        for guid,count in pairs(WA_SA_STATS) do \n            WA_SA_Cleanup(guid);\n        end\n        \n        WA_SA_STATS = {};\n        WA_SA_NUM_UNITS = 0;\n        WA_SA_TOTAL = 0;\n    end\n    \n    if CurrentTime - WA_LAST_CONTINUITY_CHECK > 10 then --Force check of unit count every 10sec\n        local newUnits = 0;\n        for guid,count in pairs(WA_SA_STATS) do\n            newUnits = newUnits + 1;\n        end\n        WA_SA_NUM_UNITS = newUnits;\n        WA_LAST_CONTINUITY_CHECK = CurrentTime;\n    end\n    \n    if WA_SA_NUM_UNITS > 0 then \n        local totalSAs = 0;\n        \n        for guid,count in pairs(WA_SA_STATS) do\n            if WA_SA_STATS[guid].Count <= 0 or (UnitIsDeadOrGhost(guid)) then\n                WA_SA_DEAD[guid] = true;\n            else\n                totalSAs = totalSAs + WA_SA_STATS[guid].Count;\n            end\n        end\n        \n        if totalSAs > 0 and WA_SA_TOTAL > 0 then\n            return true;\n        end\n    end\n    \n    return false;\nend",
        ["custom_type"] = "status",
        ["check"] = "event",
        ["events"] = "COMBAT_LOG_EVENT_UNFILTERED PLAYER_REGEN_ENABLED",
        ["unevent"] = "auto",
        ["custom_hide"] = "timed",
    },
    ["untrigger"] = {
    },
    ["frameStrata"] = 1,
    ["width"] = 0.99999970197678,
    ["id"] = "AS Trigger",
    ["font"] = "Friz Quadrata TT",
    ["numTriggers"] = 1,
    ["xOffset"] = 0,
    ["height"] = 0.99999970197678,
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
    ["load"] = {
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
        ["spec"] = {
            ["single"] = 3,
            ["multi"] = {
            },
        },
        ["race"] = {
            ["multi"] = {
            },
        },
        ["size"] = {
            ["multi"] = {
            },
        },
    },
    ["parent"] = "Auspicious Spirits Tracker",
}