-- ============================================================================
-- OpenRGB Color Calibration for Matugen
-- ============================================================================
--
-- Pipeline:
--
-- HEX > RGB > Color matrix > Global saturation boost > Blue trim > HEX
--
-- Generic hardware calibration for an RGB strip driven by raw Matugen colors.
-- ============================================================================

local CONFIG = {
	-- 3x3 color correction matrix
	R_FROM_R = 0.81,
	R_FROM_G = -0.03,
	R_FROM_B = -0.05,

	G_FROM_R = -0.07,
	G_FROM_G = 0.38,
	G_FROM_B = -0.04,

	B_FROM_R = -0.17,
	B_FROM_G = -0.54,
	B_FROM_B = 0.87,

	-- Global saturation boost around perceptual luma
	SATURATION_BOOST = 2,

	-- Final hardware trim
	BLUE_TRIM = 0.82,
}

local function clamp(v)
	return math.max(0, math.min(255, math.floor(v + 0.5)))
end

local function srgb_to_linear(v)
	return (v / 255) ^ 2.2
end

local function linear_to_srgb(v)
	return clamp((math.max(0, math.min(1, v)) ^ (1 / 2.2)) * 255)
end

local function apply_matrix(r, g, b)
	local corrected_r = r * CONFIG.R_FROM_R + g * CONFIG.R_FROM_G + b * CONFIG.R_FROM_B
	local corrected_g = r * CONFIG.G_FROM_R + g * CONFIG.G_FROM_G + b * CONFIG.G_FROM_B
	local corrected_b = r * CONFIG.B_FROM_R + g * CONFIG.B_FROM_G + b * CONFIG.B_FROM_B

	return corrected_r, corrected_g, corrected_b
end

local function apply_saturation_boost(r, g, b)
	local luma = 0.2126 * r + 0.7152 * g + 0.0722 * b

	local boosted_r = luma + (r - luma) * CONFIG.SATURATION_BOOST
	local boosted_g = luma + (g - luma) * CONFIG.SATURATION_BOOST
	local boosted_b = luma + (b - luma) * CONFIG.SATURATION_BOOST

	return boosted_r, boosted_g, boosted_b
end

local hex = (arg[1] or ""):gsub("#", "")

if #hex ~= 6 then
	io.stderr:write("Invalid hex color\n")
	os.exit(1)
end

local r = tonumber(hex:sub(1, 2), 16)
local g = tonumber(hex:sub(3, 4), 16)
local b = tonumber(hex:sub(5, 6), 16)

local r2, g2, b2 = apply_matrix(srgb_to_linear(r), srgb_to_linear(g), srgb_to_linear(b))
r2, g2, b2 = apply_saturation_boost(r2, g2, b2)
b2 = b2 * CONFIG.BLUE_TRIM

print(string.format("%02x%02x%02x", linear_to_srgb(r2), linear_to_srgb(g2), linear_to_srgb(b2)))
