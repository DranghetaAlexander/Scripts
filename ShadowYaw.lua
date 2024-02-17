-- Coded By ShadoW#5333 | discord.gg/9E5mmeyWJY
menu.add_slider_float("---ShadowYaw---", 100, 100)
menu.add_check_box("Anti-Aim Presets")

menu.add_check_box("Static-AA")

client.add_callback("on_paint", function()
    if not menu.get_bool("Static-AA") then return
    end
    if globals.get_tickcount() % 120 < 60 then
            menu.set_int("anti_aim.yaw_offset", 0)
            menu.set_int("anti_aim.desync_range", 58)
            menu.set_int("anti_aim.desync_range_inverted", 58)
            menu.set_int("anti_aim.yaw_modifier_range", 0)
            menu.set_int("anti_aim.desync_type", 1)
        else
            menu.set_int("anti_aim.yaw_offset", 0)
            menu.set_int("anti_aim.desync_range", 58)
            menu.set_int("anti_aim.desync_range_inverted", 58)
            menu.set_int("anti_aim.yaw_modifier_range", 0)
            menu.set_int("anti_aim.desync_type", 1)
        end
    end)



menu.add_check_box("Modified Tank-AA")

client.add_callback("on_paint", function()
if not menu.get_bool("Modified Tank-AA") then return
end
if globals.get_tickcount() % 120 < 60 then
        menu.set_int("anti_aim.yaw_offset", -2)
        menu.set_int("anti_aim.desync_range", 36)
        menu.set_int("anti_aim.desync_range_inverted", 36)
        menu.set_int("anti_aim.yaw_modifier_range", 40)
        menu.set_bool("anti_aim.enable_fake_lag", true)
        menu.set_int("anti_aim.yaw_modifier", 1)
        menu.set_int("anti_aim.desync_type", 2)
    else
        menu.set_int("anti_aim.yaw_offset", -2)
        menu.set_int("anti_aim.desync_range",36)
        menu.set_int("anti_aim.desync_range_inverted", 36)
        menu.set_int("anti_aim.yaw_modifier_range", 45)
        menu.set_bool("anti_aim.enable_fake_lag", true)
        menu.set_int("anti_aim.yaw_modifier", 1)
        menu.set_int("anti_aim.desync_type", 2)
    end
end)

menu.add_check_box("Timer-AA")

client.add_callback("on_paint", function()
if not menu.get_bool("Timer-AA") then return
end
if globals.get_tickcount() % 120 < 60 then
        menu.set_int("anti_aim.yaw_offset", -6)
        menu.set_int("anti_aim.desync_range", 35)
        menu.set_int("anti_aim.desync_range_inverted", 35)
        menu.set_int("anti_aim.yaw_modifier_range", 3)
        menu.set_bool("anti_aim.enable_fake_lag", true)
        menu.set_int("anti_aim.yaw_modifier", 1)
        menu.set_int("anti_aim.desync_type", 1)
    else
        menu.set_int("anti_aim.yaw_offset", 11)
        menu.set_int("anti_aim.desync_range", 36)
        menu.set_int("anti_aim.desync_range_inverted", 36)
        menu.set_int("anti_aim.yaw_modifier_range", 3)
        menu.set_bool("anti_aim.enable_fake_lag", true)
        menu.set_int("anti_aim.yaw_modifier", 1)
        menu.set_int("anti_aim.desync_type", 1)
    end
end)

menu.add_check_box("Skeet-AA")

client.add_callback("on_paint", function()
    if not menu.get_bool("Skeet-AA") then return
    end
    if globals.get_tickcount() % 120 < 60 then
            menu.set_int("anti_aim.yaw_offset", -2)
            menu.set_int("anti_aim.desync_range", 30)
            menu.set_int("anti_aim.desync_range_inverted", 30)
            menu.set_int("anti_aim.yaw_modifier_range", 20)
            menu.set_bool("anti_aim.enable_fake_lag", true)
            menu.set_int("anti_aim.yaw_modifier", 1)
            menu.set_int("anti_aim.desync_type", 1)
        else
            menu.set_int("anti_aim.yaw_offset", -6)
            menu.set_int("anti_aim.desync_range", 23)
            menu.set_int("anti_aim.desync_range_inverted", 23)
            menu.set_int("anti_aim.yaw_modifier_range", 20)
            menu.set_bool("anti_aim.enable_fake_lag", true)
            menu.set_int("anti_aim.yaw_modifier", 1)
            menu.set_int("anti_aim.desync_type", 1)
        end
    end)

    menu.add_slider_float("---Other---", 100, 100)

    --menu.set_int("misc.field_of_view",14)
--menu.set_bool("misc.clan_tag", true)
menu.add_slider_int( "Custom Slow-Walk Speed", 1, 120)
menu.add_key_bind("Custom Slow-Walk")

local bit = require("bit")
local function a(cmd)
    if not menu.get_key_bind_state("Custom Slow-Walk") then
        return
    end
    if not entitylist.get_local_player() then
        return
    end

    Forward_Flag = bit.band(cmd.buttons, 8) == 8
    Back_Flag = bit.band(cmd.buttons, 16) == 16
    Left_Flag = bit.band(cmd.buttons, 512) == 512
    Right_Flag = bit.band(cmd.buttons, 1024) == 1024

    Movement_Straight = 0
    Movement_Side = 0

    if Forward_Flag then
        Movement_Straight = Movement_Straight + menu.get_int("Custom Slow-Walk Speed")
    end

    if Back_Flag then
        Movement_Straight = Movement_Straight - menu.get_int("Custom Slow-Walk Speed")
    end

    if Left_Flag then
        Movement_Side = Movement_Side - menu.get_int("Custom Slow-Walk Speed")
    end

    if Right_Flag then
        Movement_Side = Movement_Side + menu.get_int("Custom Slow-Walk Speed")
    end


    cmd.forwardmove = Movement_Straight
    cmd.sidemove = Movement_Side
    --if()
    --cmd.forwardmove = 300
    --cmd.sidemove = 300
    --client.log(tostring(cmd.forwardmove))
    --client.log(tostring(cmd.sidemove))
    return
end
client.add_callback("create_move",a)



--[[ function slowwalk(cmd)
    if not menu.get_key_bind_state("Custom Slow-Walk") then
        return
    end
    if not entitylist.get_local_player() then
        return
    end
    w_flag = --w的键值 + speed
    s_flag = --s的键值 - speed
    a_flag = --a的键值 - speed
    d_flag = --d的键值 + speed

    Forward_Speed = 0
    Side_Speed = 0
    if([w_flag has toggled )
        Forward_Speed += menu.get_int("Custom Slow-Walk Speed")
    end

    if( s_flag has toggled )
        Forward_Speed -= menu.get_int("Custom Slow-Walk Speed")
    end

    if( a_flag has toggled )
        Side_Speed -= menu.get_int("Custom Slow-Walk Speed")
    end

    if( d_flag has toggled )
        Side_Speed += menu.get_int("Custom Slow-Walk Speed")
    end
    cmd.forwardmove = Forward_Speed
    cmd.sidemove = Side_Speed
end
client.add_callback( "create_move", slowwalk) ]]

menu.add_check_box("Clantag")
local ffi = require "ffi"

ffi.cdef[[
    typedef int(__fastcall* clantag_t)(const char*, const char*);
]]
local set_clantag = ffi.cast("clantag_t", utils.find_signature("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
local old_time = 0
local anim = {

    " ",
    "S|",
    "Sh|",
    "Sha|",
    "Shad|",
    "Shado|",
    "Shadow|",
    "ShadowY|",
    "ShadowYa|",
    "ShadowYaw",
    "ShadowYaw",
    "ShadowYaw",
    "ShadowYa|",
    "ShadowY|",
    "Shadow|",
    "Shado|",
    "Shad|",
    "Sha|",
    "Sh|",
    "S|",
    " ",
}
function clan_tag()
  if menu.get_bool("Clantag") == true then
    local time = globals.get_curtime()
    local speed = math.floor((time * 2.33)+0.5)
    local local_player = entitylist.get_local_player()
    if local_player then
      local site = local_player:get_prop_int("CBaseEntity","m_iTeamNum")
      if site ~= 0 then
        if old_time ~= speed and (globals.get_tickcount() % 2) == 1 then
          set_clantag(anim[speed % #anim+2], anim[speed % #anim+2])
          old_time = speed
        end
      end  
    end
  else
    return
  end
end

client.add_callback("on_paint", clan_tag)


menu.add_slider_float("---Visuals---", 100, 100)

local font = render.create_font("Verdana", 12, 500, false, true, false)

menu.add_check_box("Keybind List")
menu.add_slider_int("Key binds position X", 0, engine.get_screen_width())
menu.add_slider_int("Key binds position Y", 0, engine.get_screen_height())

local types = {"always", "holding", "toggled"}

local get_state, get_mode = menu.get_key_bind_state, menu.get_key_bind_mode
local screen_x, screen_y = engine.get_screen_width(), engine.get_screen_height()
local count = 0

local function add_bind(name, bind_name, x, y)
    if get_state(bind_name) then
        render.draw_text(font, x, y + 22 + (15 * count), color.new(255, 255, 255), name)     
        text_width = render.get_text_width(font, "[" .. types[get_mode(bind_name) + 1] .. "]")
      
        render.draw_text(font, x + 151 - text_width - 5, y + 23 + (15 * count), color.new(255, 255, 255), "[" .. types[get_mode(bind_name) + 1] .. "]")     
        count = count + 1   
    end
end

local function on_paint()
    if not menu.get_bool("Keybind List") then
        return
    end

    if not engine.is_in_game() then
        return
    end

    local pos_x = menu.get_int("Key binds position X")
    local pos_y = menu.get_int("Key binds position Y")
 
    render.draw_rect_filled(pos_x, pos_y - 3, 150, 2, color.new(125, 125, 255))
    render.draw_rect_filled(pos_x, pos_y - 1, 150, 18, color.new(20, 20, 20, 100))
    render.draw_text(font, pos_x + 55, pos_y + 2, color.new(255, 255, 255), "keybinds")
    count = 0
 
    add_bind(" Hide shots", "rage.hide_shots_key", pos_x + 1, pos_y - 2)
    add_bind(" Edge jump", "misc.edge_jump_key", pos_x + 1, pos_y - 2)
    add_bind(" Double tap", "rage.double_tap_key", pos_x + 1, pos_y - 2)
    add_bind(" Slow walk", "misc.slow_walk_key", pos_x + 1, pos_y - 2)
    add_bind(" Force damage", "rage.force_damage_key", pos_x + 1, pos_y - 2)
    add_bind(" Invert desync", "anti_aim.invert_desync_key", pos_x + 1, pos_y - 2)
    add_bind(" Fake duck", "anti_aim.fake_duck_key", pos_x + 1, pos_y - 2)
    add_bind(" Automatic peek", "misc.automatic_peek_key", pos_x + 1, pos_y - 2)
    add_bind(" Third person", "misc.third_person_key", pos_x + 1, pos_y - 2)
end

client.add_callback("on_paint", on_paint)

local font = render.create_font("Verdana", 12, 500, false, true, false)

menu.add_check_box("Watermark")

client.add_callback("on_paint", function()
    if menu.get_bool("Watermark") then
        local screen_width = engine.get_screen_width()
        local username = globals.get_username()
        local ping = tostring(globals.get_ping())
        local tickrate = math.floor(1.0 / globals.get_intervalpertick())
		local get_time = os.date("%X", os.time())
        --
        local text
        if engine.is_connected() then
            text = tostring(" ShadowYaw | " .. username .. " | delay: " .. ping .. "ms | " .. tickrate .. "tick | "..get_time.. " ")
        else
            text = tostring(" ShadowYaw | " .. username .. " | " ..get_time.. " ")
        end
        --
        local width = render.get_text_width(font, text)
        --
        local line_color = color.new(125, 125, 255)
        local text_color = color.new(255, 255, 255)
        local bg_color = color.new(20, 20, 20, 100)
        --
        local x = screen_width - 10 - width - 4
        local y = 10
        local w = width + 5
        --
        render.draw_rect_filled(x, y - 1, w, 2, line_color)
        render.draw_rect_filled(x, y + 1, w, 18, bg_color)
        --render.draw_rect_filled(x + w - 100, y + 23, 100, 18, bg_color)
        render.draw_text(font, x + 2.5, y + 3, text_color, text)
    end
end)

menu.add_check_box( "Viewmodel on scope" )

local function scopee()



    local lp = entitylist.get_local_player()

 

    if lp ~= nil then

        is_scoped = lp:is_scoped()

    end



if menu.get_bool( "Viewmodel on scope" ) then

    if is_scoped then

     

        console.set_float( "fov_cs_debug", 90 )





        else

            console.set_float("fov_cs_debug", 90)

        end

    end

end



client.add_callback("on_paint", scopee)

menu.add_check_box("Thirdperson Dist")
menu.add_slider_int("Thirdperson distance",1, 300)

local function thirdperson1()
	if menu.get_bool("Thirdperson Dist") then
	    menu.set_int("misc.third_person_distance", menu.get_int("Thirdperson distance"))
	else
	end
end

client.add_callback("create_move", thirdperson1)


menu.add_slider_float("Bloom scale", 0.0, 10.0)

local ffi = require("ffi")

local IClientEntityList = ffi.cast(ffi.typeof("void***"), utils.create_interface("client.dll", "VClientEntityList003"))
local GetHighestEntityIndex = ffi.cast(ffi.typeof("int(__thiscall*)(void*)"), IClientEntityList[0][6])

local FindByClass = function(name)
  for i = 64, GetHighestEntityIndex(IClientEntityList) do
    local entity = entitylist.get_player_by_index(i)
    if entity ~= nil then
      if entity:get_class_name() == name then
        return entity
      end
    end
  end
end


client.add_callback("on_paint", function()
  local CEnvTonemapController = FindByClass("CEnvTonemapController")

  if CEnvTonemapController ~= nil then
    CEnvTonemapController:set_prop_int("CEnvTonemapController", "m_bUseCustomBloomScale", 1.0)
    CEnvTonemapController:set_prop_float("CEnvTonemapController", "m_flCustomBloomScale", menu.get_float("Bloom scale"))
  end
end)

client.add_callback('unload', function()
  local CEnvTonemapController = FindByClass("CEnvTonemapController")

  if CEnvTonemapController ~= nil then
    CEnvTonemapController:set_prop_int("CEnvTonemapController", "m_bUseCustomBloomScale", 0.0)
  end
end)


menu.add_check_box("Enable fog")
menu.add_color_picker("Fog color")
menu.add_slider_int("Start Distance", 0, 1000)
menu.add_slider_int("End Distance", 0, 2000)
menu.add_slider_int("Density", 0, 100)

client.add_callback("on_paint", function()
  if entitylist.get_local_player() ~= nil and globals.get_server_address() ~= nil then
    if menu.get_bool("Enable fog") then
      local color = menu.get_color("Fog color")
      local start_pos = menu.get_int("Start Distance")
      local end_pos = menu.get_int("End Distance")
      local density = menu.get_int("Density")
      console.set_float("fog_override", 1)
      console.set_string("fog_color", string.format("%i %i %i", color:r(), color:g(), color:b()))
      console.set_float("fog_start" , start_pos)
      console.set_float("fog_end" , end_pos)
      console.set_float("fog_maxdensity" , density /100)
    else
      console.set_float("fog_color", -1);
      console.set_float("fog_override", 0)
      console.set_float("fog_start", -1)
      console.set_float("fog_end", -1)
      console.set_float("fog_maxdensity", -1)
    end
  end
end)

client.add_callback("unload", function()
  console.set_float("fog_color", -1);
  console.set_float("fog_override", 0)
  console.set_float("fog_start", -1)
  console.set_float("fog_end", -1)
  console.set_float("fog_maxdensity", -1)
end)

