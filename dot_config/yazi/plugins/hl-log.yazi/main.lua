-- ABOUTME: Yazi previewer plugin for JSONL log files using hl.
-- ABOUTME: Falls back to default code previewer for non-JSONL .log files.

local M = {}

local function is_jsonl(url)
	local file, err = io.open(tostring(url), "r")
	if not file then
		return false
	end

	local line = nil
	-- Find first non-empty line
	for l in file:lines() do
		local trimmed = l:match("^%s*(.-)%s*$")
		if trimmed and #trimmed > 0 then
			line = trimmed
			break
		end
	end
	file:close()

	if not line then
		return false
	end
	return line:sub(1, 1) == "{"
end

function M:peek(job)
	if not is_jsonl(job.file.url) then
		require("code"):peek(job)
		return
	end

	local skip = job.skip or 0
	local height = job.area.h
	local lines_needed = skip + height

	local child, err = Command("hl")
		:args({ "-P", "-L", "-c", tostring(job.file.url) })
		:stdout(Command.PIPED)
		:stderr(Command.NULL)
		:spawn()

	if not child then
		require("code"):peek(job)
		return
	end

	local output, _ = child:wait_with_output()
	if not output or not output.stdout or #output.stdout == 0 then
		require("code"):peek(job)
		return
	end

	-- Split output into lines, skip and limit to preview height
	local lines = {}
	local i = 0
	for line in output.stdout:gmatch("[^\n]*") do
		i = i + 1
		if i > skip and #lines < height then
			lines[#lines + 1] = line
		end
		if #lines >= height then
			break
		end
	end

	if #lines == 0 then
		ya.preview_widgets(job, {})
		return
	end

	local text = ui.Text.parse(table.concat(lines, "\n")):area(job.area)
	ya.preview_widgets(job, { text })
end

function M:seek(job)
	local h = cx.active.current.hovered
	if not h or h.url ~= job.file.url then
		return
	end

	local step = math.floor(job.units * job.area.h / 10)
	step = step == 0 and ya.clamp(-1, job.units, 1) or step

	ya.emit("peek", {
		math.max(0, cx.active.preview.skip + step),
		only_if = job.file.url,
	})
end

return M
