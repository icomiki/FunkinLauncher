function cameraLerp(val)
{
	return val * ((delta_time/1000000) / (1 / 60));
}
function coolLerp(base, target, ratio)
{
    return base + cameraLerp(ratio) * (target - base);
}