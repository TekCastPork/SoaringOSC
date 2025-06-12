// Made with Amplify Shader Editor v1.9.9
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tekcast/Prefab/RR Counter"
{
	Properties
	{
		[NoScaleOffset] _Font( "Font", 2DArray ) = "white" {}
		[HDR] _DigitColor( "Digit Color", Color ) = ( 0, 0, 0, 0 )
		_Background( "Background", 2D ) = "white" {}
		_BackgroundTint( "Background Tint", Color ) = ( 0, 0, 0, 0.8 )
		_AdditionalEmissives( "Additional Emissives", 2D ) = "black" {}
		[HDR] _AdditionalEmissivesTint( "Additional Emissives Tint", Color ) = ( 0, 0, 0 )
		_CurrentBreathRateScale( "Current BreathRate Scale", Range( 0, 10 ) ) = 5.659362
		_MinBreathRateScale( "Min BreathRate Scale", Range( 0, 10 ) ) = 0
		_MaxBreathRateScale( "Max BreathRate Scale", Range( 0, 10 ) ) = 0
		_AvgBreathRateScale( "Avg BreathRate Scale", Range( 0, 10 ) ) = 0
		_CurrentBreathRateOffset( "Current BreathRate Offset", Vector ) = ( 0, 0, 0, 0 )
		_MinBreathRateOffset( "Min BreathRate Offset", Vector ) = ( 0, 0, 0, 0 )
		_MaxBreathRateOffset( "Max BreathRate Offset", Vector ) = ( 0, 0, 0, 0 )
		_AvgBreathRateOffset( "Avg BreathRate Offset", Vector ) = ( 0, 0, 0, 0 )
		_CurrentBreathRate( "Current BreathRate", Vector ) = ( 7, 7, 7, 7 )
		_MinBreathRate( "Min BreathRate", Vector ) = ( 0, 0, 0, 0 )
		_MaxBreathRate( "Max BreathRate", Vector ) = ( 0, 0, 0, 0 )
		_AvgBreathRate( "Avg BreathRate", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "ForceNoShadowCasting" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#define ASE_VERSION 19900
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D_ARRAY(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D_ARRAY(tex,samplertex,coord) tex2DArray(tex,coord)
		#endif//ASE Sampling Macros

		#pragma surface surf StandardSpecular alpha:fade keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Background;
		uniform float4 _Background_ST;
		uniform float4 _BackgroundTint;
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(_Font);
		uniform float _CurrentBreathRateScale;
		uniform float2 _CurrentBreathRateOffset;
		uniform float4 _CurrentBreathRate;
		SamplerState sampler_Font;
		uniform float _MinBreathRateScale;
		uniform float2 _MinBreathRateOffset;
		uniform float4 _MinBreathRate;
		uniform float _MaxBreathRateScale;
		uniform float2 _MaxBreathRateOffset;
		uniform float4 _MaxBreathRate;
		uniform float _AvgBreathRateScale;
		uniform float2 _AvgBreathRateOffset;
		uniform float4 _AvgBreathRate;
		uniform float4 _DigitColor;
		uniform sampler2D _AdditionalEmissives;
		uniform float4 _AdditionalEmissives_ST;
		uniform float3 _AdditionalEmissivesTint;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float2 uv_Background = i.uv_texcoord * _Background_ST.xy + _Background_ST.zw;
			float2 appendResult129_g1207 = (float2(3.0 , 3.0));
			float Counter_1_Scale754 = _CurrentBreathRateScale;
			float clampResult236_g1207 = clamp( Counter_1_Scale754 , 1.0 , 10.0 );
			float temp_output_114_0_g1207 =  (1.0 + ( clampResult236_g1207 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1207 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1207 = ( ( 1.0 - temp_output_114_0_g1207 ) * 1.5 );
			float2 appendResult130_g1207 = (float2(temp_output_127_0_g1207 , temp_output_127_0_g1207));
			float2 Counter_1_Offset753 = _CurrentBreathRateOffset;
			float2 uv_TexCoord135_g1207 = i.uv_texcoord * ( appendResult129_g1207 * temp_output_114_0_g1207 ) + ( appendResult131_g1207 + appendResult130_g1207 + Counter_1_Offset753 );
			float2 clampResult143_g1207 = clamp( uv_TexCoord135_g1207 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_1_Digits737 = _CurrentBreathRate;
			float4 break260_g1207 = Counter_1_Digits737;
			float clampResult230_g1207 = clamp( break260_g1207.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1212 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1207,clampResult230_g1207) );
			float2 clampResult138_g1207 = clamp( uv_TexCoord135_g1207 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1207 = clamp( break260_g1207.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1207 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1207,clampResult231_g1207) );
			float4 temp_output_2_0_g1210 = tex2DArrayNode144_g1207;
			float2 clampResult139_g1207 = clamp( uv_TexCoord135_g1207 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1207 = clamp( break260_g1207.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1207 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1207,clampResult232_g1207) );
			float4 temp_output_2_0_g1209 = tex2DArrayNode145_g1207;
			float4 color146_g1207 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1211 = color146_g1207;
			float clampResult5_g1208 = clamp( ( (temp_output_2_0_g1212).a + (temp_output_2_0_g1210).a + (temp_output_2_0_g1209).a + (temp_output_2_0_g1211).a ) , 0.0 , 1.0 );
			float Counter_1_Opacity762 = clampResult5_g1208;
			float2 appendResult129_g1284 = (float2(3.0 , 3.0));
			float Counter_2_Scale779 = _MinBreathRateScale;
			float clampResult236_g1284 = clamp( Counter_2_Scale779 , 1.0 , 10.0 );
			float temp_output_114_0_g1284 =  (1.0 + ( clampResult236_g1284 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1284 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1284 = ( ( 1.0 - temp_output_114_0_g1284 ) * 1.5 );
			float2 appendResult130_g1284 = (float2(temp_output_127_0_g1284 , temp_output_127_0_g1284));
			float2 Counter_2_Offset780 = _MinBreathRateOffset;
			float2 uv_TexCoord135_g1284 = i.uv_texcoord * ( appendResult129_g1284 * temp_output_114_0_g1284 ) + ( appendResult131_g1284 + appendResult130_g1284 + Counter_2_Offset780 );
			float2 clampResult143_g1284 = clamp( uv_TexCoord135_g1284 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_2_Digits778 = _MinBreathRate;
			float4 break260_g1284 = Counter_2_Digits778;
			float clampResult230_g1284 = clamp( break260_g1284.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1289 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1284,clampResult230_g1284) );
			float2 clampResult138_g1284 = clamp( uv_TexCoord135_g1284 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1284 = clamp( break260_g1284.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1284 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1284,clampResult231_g1284) );
			float4 temp_output_2_0_g1287 = tex2DArrayNode144_g1284;
			float2 clampResult139_g1284 = clamp( uv_TexCoord135_g1284 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1284 = clamp( break260_g1284.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1284 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1284,clampResult232_g1284) );
			float4 temp_output_2_0_g1286 = tex2DArrayNode145_g1284;
			float4 color146_g1284 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1288 = color146_g1284;
			float clampResult5_g1285 = clamp( ( (temp_output_2_0_g1289).a + (temp_output_2_0_g1287).a + (temp_output_2_0_g1286).a + (temp_output_2_0_g1288).a ) , 0.0 , 1.0 );
			float Counter_2_Opacity787 = clampResult5_g1285;
			float2 appendResult129_g1372 = (float2(3.0 , 3.0));
			float Counter_3_Scale829 = _MaxBreathRateScale;
			float clampResult236_g1372 = clamp( Counter_3_Scale829 , 1.0 , 10.0 );
			float temp_output_114_0_g1372 =  (1.0 + ( clampResult236_g1372 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1372 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1372 = ( ( 1.0 - temp_output_114_0_g1372 ) * 1.5 );
			float2 appendResult130_g1372 = (float2(temp_output_127_0_g1372 , temp_output_127_0_g1372));
			float2 Counter_3_Offset830 = _MaxBreathRateOffset;
			float2 uv_TexCoord135_g1372 = i.uv_texcoord * ( appendResult129_g1372 * temp_output_114_0_g1372 ) + ( appendResult131_g1372 + appendResult130_g1372 + Counter_3_Offset830 );
			float2 clampResult143_g1372 = clamp( uv_TexCoord135_g1372 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_3_Digits828 = _MaxBreathRate;
			float4 break260_g1372 = Counter_3_Digits828;
			float clampResult230_g1372 = clamp( break260_g1372.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1377 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1372,clampResult230_g1372) );
			float2 clampResult138_g1372 = clamp( uv_TexCoord135_g1372 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1372 = clamp( break260_g1372.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1372,clampResult231_g1372) );
			float4 temp_output_2_0_g1375 = tex2DArrayNode144_g1372;
			float2 clampResult139_g1372 = clamp( uv_TexCoord135_g1372 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1372 = clamp( break260_g1372.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1372,clampResult232_g1372) );
			float4 temp_output_2_0_g1374 = tex2DArrayNode145_g1372;
			float4 color146_g1372 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1376 = color146_g1372;
			float clampResult5_g1373 = clamp( ( (temp_output_2_0_g1377).a + (temp_output_2_0_g1375).a + (temp_output_2_0_g1374).a + (temp_output_2_0_g1376).a ) , 0.0 , 1.0 );
			float Counter_3_Opacity849 = clampResult5_g1373;
			float2 appendResult129_g1405 = (float2(3.0 , 3.0));
			float Counter_4_Scale861 = _AvgBreathRateScale;
			float clampResult236_g1405 = clamp( Counter_4_Scale861 , 1.0 , 10.0 );
			float temp_output_114_0_g1405 =  (1.0 + ( clampResult236_g1405 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1405 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1405 = ( ( 1.0 - temp_output_114_0_g1405 ) * 1.5 );
			float2 appendResult130_g1405 = (float2(temp_output_127_0_g1405 , temp_output_127_0_g1405));
			float2 Counter_4_Offset860 = _AvgBreathRateOffset;
			float2 uv_TexCoord135_g1405 = i.uv_texcoord * ( appendResult129_g1405 * temp_output_114_0_g1405 ) + ( appendResult131_g1405 + appendResult130_g1405 + Counter_4_Offset860 );
			float2 clampResult143_g1405 = clamp( uv_TexCoord135_g1405 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_4_Digits862 = _AvgBreathRate;
			float4 break260_g1405 = Counter_4_Digits862;
			float clampResult230_g1405 = clamp( break260_g1405.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1410 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1405,clampResult230_g1405) );
			float2 clampResult138_g1405 = clamp( uv_TexCoord135_g1405 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1405 = clamp( break260_g1405.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1405 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1405,clampResult231_g1405) );
			float4 temp_output_2_0_g1408 = tex2DArrayNode144_g1405;
			float2 clampResult139_g1405 = clamp( uv_TexCoord135_g1405 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1405 = clamp( break260_g1405.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1405 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1405,clampResult232_g1405) );
			float4 temp_output_2_0_g1407 = tex2DArrayNode145_g1405;
			float4 color146_g1405 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1409 = color146_g1405;
			float clampResult5_g1406 = clamp( ( (temp_output_2_0_g1410).a + (temp_output_2_0_g1408).a + (temp_output_2_0_g1407).a + (temp_output_2_0_g1409).a ) , 0.0 , 1.0 );
			float Counter_4_Opacity846 = clampResult5_g1406;
			float Final_Opacity813 = ( Counter_1_Opacity762 + Counter_2_Opacity787 + Counter_3_Opacity849 + Counter_4_Opacity846 );
			float4 temp_output_2_0_g1217 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1207,0.0) );
			float4 tex2DArrayNode265_g1207 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1207,0.0) );
			float4 temp_output_2_0_g1215 = tex2DArrayNode265_g1207;
			float4 tex2DArrayNode264_g1207 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1207,0.0) );
			float4 temp_output_2_0_g1214 = tex2DArrayNode264_g1207;
			float4 color271_g1207 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1216 = color271_g1207;
			float clampResult5_g1213 = clamp( ( (temp_output_2_0_g1217).a + (temp_output_2_0_g1215).a + (temp_output_2_0_g1214).a + (temp_output_2_0_g1216).a ) , 0.0 , 1.0 );
			float Counter_1_Backing_Alpha760 = clampResult5_g1213;
			float4 temp_output_2_0_g1294 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1284,0.0) );
			float4 tex2DArrayNode265_g1284 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1284,0.0) );
			float4 temp_output_2_0_g1292 = tex2DArrayNode265_g1284;
			float4 tex2DArrayNode264_g1284 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1284,0.0) );
			float4 temp_output_2_0_g1291 = tex2DArrayNode264_g1284;
			float4 color271_g1284 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1293 = color271_g1284;
			float clampResult5_g1290 = clamp( ( (temp_output_2_0_g1294).a + (temp_output_2_0_g1292).a + (temp_output_2_0_g1291).a + (temp_output_2_0_g1293).a ) , 0.0 , 1.0 );
			float Counter_2_Backing_Alpha785 = clampResult5_g1290;
			float4 temp_output_2_0_g1382 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1372,0.0) );
			float4 tex2DArrayNode265_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1372,0.0) );
			float4 temp_output_2_0_g1380 = tex2DArrayNode265_g1372;
			float4 tex2DArrayNode264_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1372,0.0) );
			float4 temp_output_2_0_g1379 = tex2DArrayNode264_g1372;
			float4 color271_g1372 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1381 = color271_g1372;
			float clampResult5_g1378 = clamp( ( (temp_output_2_0_g1382).a + (temp_output_2_0_g1380).a + (temp_output_2_0_g1379).a + (temp_output_2_0_g1381).a ) , 0.0 , 1.0 );
			float Counter_3_Backing_Alpha851 = clampResult5_g1378;
			float4 temp_output_2_0_g1415 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1405,0.0) );
			float4 tex2DArrayNode265_g1405 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1405,0.0) );
			float4 temp_output_2_0_g1413 = tex2DArrayNode265_g1405;
			float4 tex2DArrayNode264_g1405 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1405,0.0) );
			float4 temp_output_2_0_g1412 = tex2DArrayNode264_g1405;
			float4 color271_g1405 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1414 = color271_g1405;
			float clampResult5_g1411 = clamp( ( (temp_output_2_0_g1415).a + (temp_output_2_0_g1413).a + (temp_output_2_0_g1412).a + (temp_output_2_0_g1414).a ) , 0.0 , 1.0 );
			float Counter_4_Backing_Alpha848 = clampResult5_g1411;
			float Final_Backing_Alpha815 = ( Counter_1_Backing_Alpha760 + Counter_2_Backing_Alpha785 + Counter_3_Backing_Alpha851 + Counter_4_Backing_Alpha848 );
			float clampResult869 = clamp( ( Final_Opacity813 + Final_Backing_Alpha815 ) , 0.0 , 1.0 );
			float3 lerpResult870 = lerp( ( tex2D( _Background, uv_Background ).rgb * _BackgroundTint.rgb ) , float3( 0,0,0 ) , clampResult869);
			o.Albedo = lerpResult870;
			float3 clampResult3_g1208 = clamp( ( (temp_output_2_0_g1212).rgb + (temp_output_2_0_g1210).rgb + (temp_output_2_0_g1209).rgb + (temp_output_2_0_g1211).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_1_Color761 = ( float3( 1,1,1 ) * clampResult3_g1208 );
			float3 clampResult3_g1285 = clamp( ( (temp_output_2_0_g1289).rgb + (temp_output_2_0_g1287).rgb + (temp_output_2_0_g1286).rgb + (temp_output_2_0_g1288).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_2_Color786 = ( float3( 1,1,1 ) * clampResult3_g1285 );
			float3 clampResult3_g1373 = clamp( ( (temp_output_2_0_g1377).rgb + (temp_output_2_0_g1375).rgb + (temp_output_2_0_g1374).rgb + (temp_output_2_0_g1376).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_3_Color850 = ( float3( 1,1,1 ) * clampResult3_g1373 );
			float3 clampResult3_g1406 = clamp( ( (temp_output_2_0_g1410).rgb + (temp_output_2_0_g1408).rgb + (temp_output_2_0_g1407).rgb + (temp_output_2_0_g1409).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_4_Color847 = ( float3( 1,1,1 ) * clampResult3_g1406 );
			float3 clampResult566 = clamp( ( Counter_1_Color761 + Counter_2_Color786 + Counter_3_Color850 + Counter_4_Color847 ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Final_Color_Out806 = ( _DigitColor.rgb * clampResult566 );
			float3 lerpResult558 = lerp( float3( 0,0,0 ) , Final_Color_Out806 , Final_Opacity813);
			float2 uv_AdditionalEmissives = i.uv_texcoord * _AdditionalEmissives_ST.xy + _AdditionalEmissives_ST.zw;
			o.Emission = ( lerpResult558 + ( tex2D( _AdditionalEmissives, uv_AdditionalEmissives ).rgb * _AdditionalEmissivesTint ) );
			o.Smoothness = 0.0;
			o.Occlusion = 1.0;
			float Digit_Opacity873 = _DigitColor.a;
			float lerpResult688 = lerp( _BackgroundTint.a , 1.0 , ( clampResult869 * Digit_Opacity873 ));
			float clampResult883 = clamp( lerpResult688 , 0.0 , 1.0 );
			o.Alpha = clampResult883;
		}

		ENDCG
	}
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19900
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;831;-1792,-464;Inherit;False;580;467;;6;593;561;562;828;829;830;Counter 3 Params;0,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;729;-1792,-1664;Inherit;False;596.571;454.5729;;6;737;586;537;538;754;753;Counter 1 Params;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;781;-1792,-1088;Inherit;False;612;467;;6;592;547;548;778;779;780;Counter 2 Params;1,1,0.4,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;863;-1792,144;Inherit;False;564;483;;6;594;590;591;862;861;860;Counter 4 Params;0,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;534;-1792,-2016;Inherit;True;Property;_Font;Font;0;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;7b433ff0a41187141b92f092b5f98afd;7b433ff0a41187141b92f092b5f98afd;False;white;Auto;Texture2DArray;-1;0;2;SAMPLER2DARRAY;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;586;-1776,-1616;Inherit;False;Property;_CurrentBreathRate;Current BreathRate;14;0;Create;True;1;Counter Digit Values;0;0;False;0;False;7,7,7,7;7,7,7,7;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;538;-1776,-1440;Inherit;False;Property;_CurrentBreathRateScale;Current BreathRate Scale;6;0;Create;True;1;Counter Scales;0;0;False;0;False;5.659362;7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;537;-1776,-1344;Inherit;False;Property;_CurrentBreathRateOffset;Current BreathRate Offset;10;0;Create;True;1;Counter Offsets;0;0;False;0;False;0,0;0,-2.2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;592;-1744,-1024;Inherit;False;Property;_MinBreathRate;Min BreathRate;15;0;Create;True;1;Counter Digit Values;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;547;-1744,-848;Inherit;False;Property;_MinBreathRateScale;Min BreathRate Scale;7;0;Create;True;0;0;0;False;0;False;0;7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;548;-1744,-768;Inherit;False;Property;_MinBreathRateOffset;Min BreathRate Offset;11;0;Create;True;0;0;0;False;0;False;0,0;4.5,0.9;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;593;-1744,-416;Inherit;False;Property;_MaxBreathRate;Max BreathRate;16;0;Create;True;1;Counter Digit Values;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;561;-1744,-240;Inherit;False;Property;_MaxBreathRateScale;Max BreathRate Scale;8;0;Create;True;0;0;0;False;0;False;0;7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;562;-1744,-160;Inherit;False;Property;_MaxBreathRateOffset;Max BreathRate Offset;12;0;Create;True;0;0;0;False;0;False;0,0;-4.5,0.9;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;594;-1744,192;Inherit;False;Property;_AvgBreathRate;Avg BreathRate;17;0;Create;True;1;Counter Digit Values;0;0;False;0;False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;590;-1744,368;Inherit;False;Property;_AvgBreathRateScale;Avg BreathRate Scale;9;0;Create;True;0;0;0;False;0;False;0;7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;591;-1744,464;Inherit;False;Property;_AvgBreathRateOffset;Avg BreathRate Offset;13;0;Create;True;0;0;0;False;0;False;0,0;0,0.9;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;858;-802,-306;Inherit;False;1428;667;;8;735;833;851;850;849;857;856;855;Counter 3 Generator;0,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;794;-768,-1056;Inherit;False;1380;667;Comment;8;786;787;785;788;734;793;792;791;Counter 2 Generator;1,1,0.4,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;777;-768,-1792;Inherit;False;1412;683;;8;738;732;752;739;756;760;762;761;Counter 1 Generator;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;753;-1456,-1344;Inherit;False;Counter 1 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;754;-1456,-1440;Inherit;False;Counter 1 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;737;-1456,-1616;Inherit;False;Counter 1 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;778;-1424,-1024;Inherit;False;Counter 2 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;779;-1424,-848;Inherit;False;Counter 2 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;780;-1424,-768;Inherit;False;Counter 2 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;830;-1456,-160;Inherit;False;Counter 3 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;829;-1456,-240;Inherit;False;Counter 3 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;828;-1456,-416;Inherit;False;Counter 3 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;733;-1568,-2016;Inherit;False;FontTex;-1;True;1;0;SAMPLER2DARRAY;;False;1;SAMPLER2DARRAY;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;859;-754,462;Inherit;False;1348;667;;8;736;837;848;847;846;852;853;854;Counter 4 Generator;0,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;862;-1472,192;Inherit;False;Counter 4 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;861;-1472,368;Inherit;False;Counter 4 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;860;-1472,464;Inherit;False;Counter 4 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;734;-688,-928;Inherit;False;733;FontTex;1;0;OBJECT;;False;1;SAMPLER2DARRAY;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;792;-720,-688;Inherit;False;780;Counter 2 Offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;793;-720,-768;Inherit;False;779;Counter 2 Scale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;791;-720,-848;Inherit;False;778;Counter 2 Digits;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;739;-720,-1376;Inherit;False;753;Counter 1 Offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;752;-704,-1456;Inherit;False;754;Counter 1 Scale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;738;-720,-1552;Inherit;False;737;Counter 1 Digits;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;857;-752,64;Inherit;False;828;Counter 3 Digits;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;856;-736,160;Inherit;False;829;Counter 3 Scale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;855;-752,240;Inherit;False;830;Counter 3 Offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;735;-720,-16;Inherit;False;733;FontTex;1;0;OBJECT;;False;1;SAMPLER2DARRAY;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;736;-672,640;Inherit;False;733;FontTex;1;0;OBJECT;;False;1;SAMPLER2DARRAY;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;854;-704,720;Inherit;False;862;Counter 4 Digits;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;853;-704,800;Inherit;False;861;Counter 4 Scale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;852;-704,880;Inherit;False;860;Counter 4 Offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;732;-688,-1632;Inherit;False;733;FontTex;1;0;OBJECT;;False;1;SAMPLER2DARRAY;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;756;-320,-1504;Inherit;False;Create Number;-1;;1207;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;788;-352,-720;Inherit;False;Create Number;-1;;1284;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;833;-352,32;Inherit;False;Create Number;-1;;1372;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;837;-352,800;Inherit;False;Create Number;-1;;1405;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;821;896,-608;Inherit;False;1188;851;;6;771;801;820;727;815;887;Backing Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;785;336,-1008;Inherit;False;Counter 2 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;760;368,-1712;Inherit;False;Counter 1 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;851;352,-192;Inherit;False;Counter 3 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;827;896,304;Inherit;False;1131.013;829.8878;;6;813;616;825;804;773;886;Opacity Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;787;336,-688;Inherit;False;Counter 2 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;762;368,-1376;Inherit;False;Counter 1 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;849;352,144;Inherit;False;Counter 3 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;848;320,512;Inherit;False;Counter 4 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;846;320,832;Inherit;False;Counter 4 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;771;960,-288;Inherit;False;760;Counter 1 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;801;960,-224;Inherit;False;785;Counter 2 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;773;944,608;Inherit;False;762;Counter 1 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;804;944,672;Inherit;False;787;Counter 2 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;825;944,736;Inherit;False;849;Counter 3 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;886;944,800;Inherit;False;846;Counter 4 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;820;960,-160;Inherit;False;851;Counter 3 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;887;960,-96;Inherit;False;848;Counter 4 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;811;896,-1792;Inherit;False;1476;1091;;10;767;798;808;613;566;567;806;872;873;888;Color Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;786;336,-848;Inherit;False;Counter 2 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;761;368,-1536;Inherit;False;Counter 1 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;850;352,-16;Inherit;False;Counter 3 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;847;320,672;Inherit;False;Counter 4 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;727;1280,-288;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;616;1232,608;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;767;944,-1296;Inherit;False;761;Counter 1 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;798;944,-1232;Inherit;False;786;Counter 2 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;808;944,-1168;Inherit;False;850;Counter 3 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;888;944,-1104;Inherit;False;847;Counter 4 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;817;2688,-768;Inherit;False;2534.78;1580.484;;26;885;878;877;884;688;883;879;0;866;864;876;871;870;558;814;874;867;807;875;869;557;868;812;816;889;890;Final Merge and Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;813;1792,352;Inherit;True;Final Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;815;1824,-560;Inherit;False;Final Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;613;1264,-1296;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;816;2816,192;Inherit;True;815;Final Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;812;2816,-64;Inherit;True;813;Final Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;872;1632,-1760;Inherit;False;Property;_DigitColor;Digit Color;1;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;566;1776,-1552;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;873;2064,-1616;Inherit;False;Digit Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;868;3120,112;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;567;1968,-1744;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;869;3312,112;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;875;3328,336;Inherit;False;873;Digit Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;806;2128,-1744;Inherit;False;Final Color Out;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;864;2688,-688;Inherit;True;Property;_Background;Background;2;0;Create;True;0;0;0;False;0;False;None;57b50d0114ea286419b1a8de5431b2b3;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;877;3216,416;Inherit;True;Property;_AdditionalEmissives;Additional Emissives;4;0;Create;True;0;0;0;False;0;False;None;71acea0a26a37e4429731e12114093a1;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;557;2752,-400;Inherit;False;Property;_BackgroundTint;Background Tint;3;0;Create;True;0;0;0;False;0;False;0,0,0,0.8;1,1,1,0.9607843;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;874;3600,144;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;807;3424,-288;Inherit;False;806;Final Color Out;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;814;3456,-208;Inherit;False;813;Final Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;866;3008,-640;Inherit;True;Property;_TextureSample0;Texture Sample 0;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;878;3600,400;Inherit;True;Property;_TextureSample1;Texture Sample 0;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;885;3664,608;Inherit;False;Property;_AdditionalEmissivesTint;Additional Emissives Tint;5;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0.6235294,0.6235294,0.6235294,1;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;688;3936,-48;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;867;3360,-560;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;558;3728,-368;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;884;4144,160;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;890;4144,-704;Inherit;True;Property;_Normal;Normal;18;1;[Normal];Create;True;0;0;0;False;0;False;None;None;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;870;3744,-624;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;889;4416,-624;Inherit;True;Property;_TextureSample2;Texture Sample 2;18;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;879;4368,-320;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;883;4544,128;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;871;4608,-208;Inherit;False;Constant;_Float0;Float 0;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;876;4576,-128;Inherit;False;Constant;_Float1;Float 0;21;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;4864,-304;Float;False;True;-1;2;AmplifyShaderEditor.MaterialInspector;0;0;StandardSpecular;Tekcast/Prefab/RR Counter;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;True;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Transparent;1;True;False;0;False;Transparent;;Transparent;All;12;all;True;True;True;False;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;4;1;False;;1;False;;0;False;;1;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;_Culling;-1;0;False;_Opacity;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;753;0;537;0
WireConnection;754;0;538;0
WireConnection;737;0;586;0
WireConnection;778;0;592;0
WireConnection;779;0;547;0
WireConnection;780;0;548;0
WireConnection;830;0;562;0
WireConnection;829;0;561;0
WireConnection;828;0;593;0
WireConnection;733;0;534;0
WireConnection;862;0;594;0
WireConnection;861;0;590;0
WireConnection;860;0;591;0
WireConnection;756;163;732;0
WireConnection;756;241;738;0
WireConnection;756;235;752;0
WireConnection;756;234;739;0
WireConnection;788;163;734;0
WireConnection;788;241;791;0
WireConnection;788;235;793;0
WireConnection;788;234;792;0
WireConnection;833;163;735;0
WireConnection;833;241;857;0
WireConnection;833;235;856;0
WireConnection;833;234;855;0
WireConnection;837;163;736;0
WireConnection;837;241;854;0
WireConnection;837;235;853;0
WireConnection;837;234;852;0
WireConnection;785;0;788;269
WireConnection;760;0;756;269
WireConnection;851;0;833;269
WireConnection;787;0;788;162
WireConnection;762;0;756;162
WireConnection;849;0;833;162
WireConnection;848;0;837;269
WireConnection;846;0;837;162
WireConnection;786;0;788;0
WireConnection;761;0;756;0
WireConnection;850;0;833;0
WireConnection;847;0;837;0
WireConnection;727;0;771;0
WireConnection;727;1;801;0
WireConnection;727;2;820;0
WireConnection;727;3;887;0
WireConnection;616;0;773;0
WireConnection;616;1;804;0
WireConnection;616;2;825;0
WireConnection;616;3;886;0
WireConnection;813;0;616;0
WireConnection;815;0;727;0
WireConnection;613;0;767;0
WireConnection;613;1;798;0
WireConnection;613;2;808;0
WireConnection;613;3;888;0
WireConnection;566;0;613;0
WireConnection;873;0;872;4
WireConnection;868;0;812;0
WireConnection;868;1;816;0
WireConnection;567;0;872;5
WireConnection;567;1;566;0
WireConnection;869;0;868;0
WireConnection;806;0;567;0
WireConnection;874;0;869;0
WireConnection;874;1;875;0
WireConnection;866;0;864;0
WireConnection;866;7;864;1
WireConnection;878;0;877;0
WireConnection;878;7;877;1
WireConnection;688;0;557;4
WireConnection;688;2;874;0
WireConnection;867;0;866;5
WireConnection;867;1;557;5
WireConnection;558;1;807;0
WireConnection;558;2;814;0
WireConnection;884;0;878;5
WireConnection;884;1;885;0
WireConnection;870;0;867;0
WireConnection;870;2;869;0
WireConnection;889;0;890;0
WireConnection;889;7;890;1
WireConnection;879;0;558;0
WireConnection;879;1;884;0
WireConnection;883;0;688;0
WireConnection;0;0;870;0
WireConnection;0;2;879;0
WireConnection;0;4;871;0
WireConnection;0;5;876;0
WireConnection;0;9;883;0
ASEEND*/
//CHKSM=3EEF7F264168F41042EE5ECBFEE3C12432B52932