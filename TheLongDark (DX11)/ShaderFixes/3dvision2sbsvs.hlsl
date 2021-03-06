Texture2D<float4> StereoParams : register(t125);
Texture1D<float4> IniParams : register(t120);

void main(
		out float4 pos : SV_Position0,
		uint vertex : SV_VertexID)
{
	float4 stereo = StereoParams.Load(0);
	float mode = IniParams.Load(int2(7, 0)).x;
	if (stereo.x == 0 || mode == 0) {
		pos = 0;
		return;
	}

	// Not using vertex buffers so manufacture our own coordinates.
	switch(vertex) {
		case 0:
			pos.xy = float2(-1, -1);
			break;
		case 1:
			pos.xy = float2(-1, 1);
			break;
		case 2:
			pos.xy = float2(1, -1);
			break;
		case 3:
			pos.xy = float2(1, 1);
			break;
		default:
			pos.xy = 0;
			break;
	};
	pos.zw = float2(0, 1);
}
