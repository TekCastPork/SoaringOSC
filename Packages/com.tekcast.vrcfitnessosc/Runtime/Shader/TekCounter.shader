// Made with Amplify Shader Editor v1.9.9
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tekcast/Counter"
{
	Properties
	{
		[KeywordEnum( One,Two,Three,Four )] _NumberofCounters( "Number of Counters", Float ) = 0
		[KeywordEnum( One,Two,Three,Four )] _Counter1Digits( "Counter 1 Digits", Float ) = 0
		[KeywordEnum( One,Two,Three,Four )] _Counter2Digits( "Counter 2 Digits", Float ) = 0
		[KeywordEnum( One,Two,Three,Four )] _Counter3Digits( "Counter 3 Digits", Float ) = 0
		[KeywordEnum( One,Two,Three,Four )] _Counter4Digits( "Counter 4 Digits", Float ) = 0
		[NoScaleOffset] _Font( "Font", 2DArray ) = "white" {}
		[HDR] _DigitColor( "Digit Color", Color ) = ( 0, 0, 0, 0 )
		_Background( "Background", 2D ) = "white" {}
		_BackgroundTint( "Background Tint", Color ) = ( 0, 0, 0, 0.8 )
		_AdditionalEmissives( "Additional Emissives", 2D ) = "black" {}
		[HDR] _AdditionalEmissivesTint( "Additional Emissives Tint", Color ) = ( 0, 0, 0 )
		[Header(Counter Scales)] _Counter1Scale( "Counter 1 Scale", Range( 0, 10 ) ) = 0
		_Counter2Scale( "Counter 2 Scale", Range( 0, 10 ) ) = 0
		_Counter3Scale( "Counter 3 Scale", Range( 0, 10 ) ) = 0
		_Counter4Scale( "Counter 4 Scale", Range( 0, 10 ) ) = 0
		[Header(Counter Offsets)] _Counter1Offset( "Counter 1 Offset", Vector ) = ( 0, 0, 0, 0 )
		_Counter2Offset( "Counter 2 Offset", Vector ) = ( 0, 0, 0, 0 )
		_Counter3Offset( "Counter 3 Offset", Vector ) = ( 0, 0, 0, 0 )
		_Counter4Offset( "Counter 4 Offset", Vector ) = ( 0, 0, 0, 0 )
		[Header(Counter Digit Values)] _Counter1( "Counter 1", Vector ) = ( 7, 7, 7, 7 )
		_Counter2( "Counter 2", Vector ) = ( 0, 0, 0, 0 )
		_Counter3( "Counter 3", Vector ) = ( 0, 0, 0, 0 )
		_Counter4( "Counter 4", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "ForceNoShadowCasting" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma shader_feature_local _NUMBEROFCOUNTERS_ONE _NUMBEROFCOUNTERS_TWO _NUMBEROFCOUNTERS_THREE _NUMBEROFCOUNTERS_FOUR
		#pragma shader_feature_local _COUNTER1DIGITS_ONE _COUNTER1DIGITS_TWO _COUNTER1DIGITS_THREE _COUNTER1DIGITS_FOUR
		#pragma shader_feature_local _COUNTER2DIGITS_ONE _COUNTER2DIGITS_TWO _COUNTER2DIGITS_THREE _COUNTER2DIGITS_FOUR
		#pragma shader_feature_local _COUNTER3DIGITS_ONE _COUNTER3DIGITS_TWO _COUNTER3DIGITS_THREE _COUNTER3DIGITS_FOUR
		#pragma shader_feature_local _COUNTER4DIGITS_ONE _COUNTER4DIGITS_TWO _COUNTER4DIGITS_THREE _COUNTER4DIGITS_FOUR
		#define ASE_VERSION 19900
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D_ARRAY(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D_ARRAY(tex,samplertex,coord) tex2DArray(tex,coord)
		#endif//ASE Sampling Macros

		#pragma surface surf Standard alpha:fade keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Background;
		uniform float4 _Background_ST;
		uniform float4 _BackgroundTint;
		UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(_Font);
		uniform float _Counter1Scale;
		uniform float2 _Counter1Offset;
		uniform float4 _Counter1;
		SamplerState sampler_Font;
		uniform float _Counter2Scale;
		uniform float2 _Counter2Offset;
		uniform float4 _Counter2;
		uniform float _Counter3Scale;
		uniform float2 _Counter3Offset;
		uniform float4 _Counter3;
		uniform float _Counter4Scale;
		uniform float2 _Counter4Offset;
		uniform float4 _Counter4;
		uniform float4 _DigitColor;
		uniform sampler2D _AdditionalEmissives;
		uniform float4 _AdditionalEmissives_ST;
		uniform float3 _AdditionalEmissivesTint;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Background = i.uv_texcoord * _Background_ST.xy + _Background_ST.zw;
			float2 appendResult129_g1240 = (float2(1.0 , 1.0));
			float Counter_1_Scale754 = _Counter1Scale;
			float clampResult236_g1240 = clamp( Counter_1_Scale754 , 1.0 , 10.0 );
			float temp_output_114_0_g1240 =  (1.0 + ( clampResult236_g1240 - 1.0 ) * ( 20.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1240 = (float2(0.0 , 0.0));
			float temp_output_127_0_g1240 = ( ( 1.0 - temp_output_114_0_g1240 ) * 0.5 );
			float2 appendResult130_g1240 = (float2(temp_output_127_0_g1240 , temp_output_127_0_g1240));
			float2 Counter_1_Offset753 = _Counter1Offset;
			float2 uv_TexCoord135_g1240 = i.uv_texcoord * ( appendResult129_g1240 * temp_output_114_0_g1240 ) + ( appendResult131_g1240 + appendResult130_g1240 + Counter_1_Offset753 );
			float2 clampResult143_g1240 = clamp( uv_TexCoord135_g1240 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_1_Digits737 = _Counter1;
			float4 break260_g1240 = Counter_1_Digits737;
			float clampResult230_g1240 = clamp( break260_g1240.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1245 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1240,clampResult230_g1240) );
			float4 color146_g1240 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1243 = color146_g1240;
			float4 temp_output_2_0_g1242 = color146_g1240;
			float4 temp_output_2_0_g1244 = color146_g1240;
			float clampResult5_g1241 = clamp( ( (temp_output_2_0_g1245).a + (temp_output_2_0_g1243).a + (temp_output_2_0_g1242).a + (temp_output_2_0_g1244).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1229 = (float2(2.0 , 2.0));
			float clampResult236_g1229 = clamp( Counter_1_Scale754 , 1.0 , 10.0 );
			float temp_output_114_0_g1229 =  (1.0 + ( clampResult236_g1229 - 1.0 ) * ( 10.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1229 = (float2(0.0 , -0.5));
			float temp_output_127_0_g1229 = ( ( 1.0 - temp_output_114_0_g1229 ) * 1.0 );
			float2 appendResult130_g1229 = (float2(temp_output_127_0_g1229 , temp_output_127_0_g1229));
			float2 uv_TexCoord135_g1229 = i.uv_texcoord * ( appendResult129_g1229 * temp_output_114_0_g1229 ) + ( appendResult131_g1229 + appendResult130_g1229 + Counter_1_Offset753 );
			float2 clampResult143_g1229 = clamp( uv_TexCoord135_g1229 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1229 = Counter_1_Digits737;
			float clampResult230_g1229 = clamp( break260_g1229.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1234 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1229,clampResult230_g1229) );
			float2 clampResult138_g1229 = clamp( uv_TexCoord135_g1229 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1229 = clamp( break260_g1229.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1229 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1229,clampResult231_g1229) );
			float4 temp_output_2_0_g1232 = tex2DArrayNode144_g1229;
			float4 color146_g1229 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1231 = color146_g1229;
			float4 temp_output_2_0_g1233 = color146_g1229;
			float clampResult5_g1230 = clamp( ( (temp_output_2_0_g1234).a + (temp_output_2_0_g1232).a + (temp_output_2_0_g1231).a + (temp_output_2_0_g1233).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1207 = (float2(3.0 , 3.0));
			float clampResult236_g1207 = clamp( Counter_1_Scale754 , 1.0 , 10.0 );
			float temp_output_114_0_g1207 =  (1.0 + ( clampResult236_g1207 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1207 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1207 = ( ( 1.0 - temp_output_114_0_g1207 ) * 1.5 );
			float2 appendResult130_g1207 = (float2(temp_output_127_0_g1207 , temp_output_127_0_g1207));
			float2 uv_TexCoord135_g1207 = i.uv_texcoord * ( appendResult129_g1207 * temp_output_114_0_g1207 ) + ( appendResult131_g1207 + appendResult130_g1207 + Counter_1_Offset753 );
			float2 clampResult143_g1207 = clamp( uv_TexCoord135_g1207 , float2( 0,0 ) , float2( 1,1 ) );
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
			float2 appendResult129_g1218 = (float2(4.0 , 4.0));
			float clampResult236_g1218 = clamp( Counter_1_Scale754 , 1.0 , 10.0 );
			float temp_output_114_0_g1218 =  (1.0 + ( clampResult236_g1218 - 1.0 ) * ( 5.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1218 = (float2(0.0 , -1.5));
			float temp_output_127_0_g1218 = ( ( 1.0 - temp_output_114_0_g1218 ) * 2.0 );
			float2 appendResult130_g1218 = (float2(temp_output_127_0_g1218 , temp_output_127_0_g1218));
			float2 uv_TexCoord135_g1218 = i.uv_texcoord * ( appendResult129_g1218 * temp_output_114_0_g1218 ) + ( appendResult131_g1218 + appendResult130_g1218 + Counter_1_Offset753 );
			float2 clampResult143_g1218 = clamp( uv_TexCoord135_g1218 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1218 = Counter_1_Digits737;
			float clampResult230_g1218 = clamp( break260_g1218.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1223 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1218,clampResult230_g1218) );
			float2 clampResult138_g1218 = clamp( uv_TexCoord135_g1218 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1218 = clamp( break260_g1218.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1218 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1218,clampResult231_g1218) );
			float4 temp_output_2_0_g1221 = tex2DArrayNode144_g1218;
			float2 clampResult139_g1218 = clamp( uv_TexCoord135_g1218 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1218 = clamp( break260_g1218.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1218 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1218,clampResult232_g1218) );
			float4 temp_output_2_0_g1220 = tex2DArrayNode145_g1218;
			float2 clampResult137_g1218 = clamp( uv_TexCoord135_g1218 , float2( 3,0 ) , float2( 4,1 ) );
			float clampResult233_g1218 = clamp( break260_g1218.w , 0.0 , 9.0 );
			float4 temp_output_2_0_g1222 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1218,clampResult233_g1218) );
			float clampResult5_g1219 = clamp( ( (temp_output_2_0_g1223).a + (temp_output_2_0_g1221).a + (temp_output_2_0_g1220).a + (temp_output_2_0_g1222).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER1DIGITS_ONE )
				float staticSwitch759 = clampResult5_g1241;
			#elif defined( _COUNTER1DIGITS_TWO )
				float staticSwitch759 = clampResult5_g1230;
			#elif defined( _COUNTER1DIGITS_THREE )
				float staticSwitch759 = clampResult5_g1208;
			#elif defined( _COUNTER1DIGITS_FOUR )
				float staticSwitch759 = clampResult5_g1219;
			#else
				float staticSwitch759 = clampResult5_g1241;
			#endif
			float Counter_1_Opacity762 = staticSwitch759;
			float2 appendResult129_g1306 = (float2(1.0 , 1.0));
			float Counter_2_Scale779 = _Counter2Scale;
			float clampResult236_g1306 = clamp( Counter_2_Scale779 , 1.0 , 10.0 );
			float temp_output_114_0_g1306 =  (1.0 + ( clampResult236_g1306 - 1.0 ) * ( 20.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1306 = (float2(0.0 , 0.0));
			float temp_output_127_0_g1306 = ( ( 1.0 - temp_output_114_0_g1306 ) * 0.5 );
			float2 appendResult130_g1306 = (float2(temp_output_127_0_g1306 , temp_output_127_0_g1306));
			float2 Counter_2_Offset780 = _Counter2Offset;
			float2 uv_TexCoord135_g1306 = i.uv_texcoord * ( appendResult129_g1306 * temp_output_114_0_g1306 ) + ( appendResult131_g1306 + appendResult130_g1306 + Counter_2_Offset780 );
			float2 clampResult143_g1306 = clamp( uv_TexCoord135_g1306 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_2_Digits778 = _Counter2;
			float4 break260_g1306 = Counter_2_Digits778;
			float clampResult230_g1306 = clamp( break260_g1306.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1311 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1306,clampResult230_g1306) );
			float4 color146_g1306 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1309 = color146_g1306;
			float4 temp_output_2_0_g1308 = color146_g1306;
			float4 temp_output_2_0_g1310 = color146_g1306;
			float clampResult5_g1307 = clamp( ( (temp_output_2_0_g1311).a + (temp_output_2_0_g1309).a + (temp_output_2_0_g1308).a + (temp_output_2_0_g1310).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1295 = (float2(2.0 , 2.0));
			float clampResult236_g1295 = clamp( Counter_2_Scale779 , 1.0 , 10.0 );
			float temp_output_114_0_g1295 =  (1.0 + ( clampResult236_g1295 - 1.0 ) * ( 10.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1295 = (float2(0.0 , -0.5));
			float temp_output_127_0_g1295 = ( ( 1.0 - temp_output_114_0_g1295 ) * 1.0 );
			float2 appendResult130_g1295 = (float2(temp_output_127_0_g1295 , temp_output_127_0_g1295));
			float2 uv_TexCoord135_g1295 = i.uv_texcoord * ( appendResult129_g1295 * temp_output_114_0_g1295 ) + ( appendResult131_g1295 + appendResult130_g1295 + Counter_2_Offset780 );
			float2 clampResult143_g1295 = clamp( uv_TexCoord135_g1295 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1295 = Counter_2_Digits778;
			float clampResult230_g1295 = clamp( break260_g1295.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1300 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1295,clampResult230_g1295) );
			float2 clampResult138_g1295 = clamp( uv_TexCoord135_g1295 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1295 = clamp( break260_g1295.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1295 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1295,clampResult231_g1295) );
			float4 temp_output_2_0_g1298 = tex2DArrayNode144_g1295;
			float4 color146_g1295 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1297 = color146_g1295;
			float4 temp_output_2_0_g1299 = color146_g1295;
			float clampResult5_g1296 = clamp( ( (temp_output_2_0_g1300).a + (temp_output_2_0_g1298).a + (temp_output_2_0_g1297).a + (temp_output_2_0_g1299).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1284 = (float2(3.0 , 3.0));
			float clampResult236_g1284 = clamp( Counter_2_Scale779 , 1.0 , 10.0 );
			float temp_output_114_0_g1284 =  (1.0 + ( clampResult236_g1284 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1284 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1284 = ( ( 1.0 - temp_output_114_0_g1284 ) * 1.5 );
			float2 appendResult130_g1284 = (float2(temp_output_127_0_g1284 , temp_output_127_0_g1284));
			float2 uv_TexCoord135_g1284 = i.uv_texcoord * ( appendResult129_g1284 * temp_output_114_0_g1284 ) + ( appendResult131_g1284 + appendResult130_g1284 + Counter_2_Offset780 );
			float2 clampResult143_g1284 = clamp( uv_TexCoord135_g1284 , float2( 0,0 ) , float2( 1,1 ) );
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
			float2 appendResult129_g1273 = (float2(4.0 , 4.0));
			float clampResult236_g1273 = clamp( Counter_2_Scale779 , 1.0 , 10.0 );
			float temp_output_114_0_g1273 =  (1.0 + ( clampResult236_g1273 - 1.0 ) * ( 5.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1273 = (float2(0.0 , -1.5));
			float temp_output_127_0_g1273 = ( ( 1.0 - temp_output_114_0_g1273 ) * 2.0 );
			float2 appendResult130_g1273 = (float2(temp_output_127_0_g1273 , temp_output_127_0_g1273));
			float2 uv_TexCoord135_g1273 = i.uv_texcoord * ( appendResult129_g1273 * temp_output_114_0_g1273 ) + ( appendResult131_g1273 + appendResult130_g1273 + Counter_2_Offset780 );
			float2 clampResult143_g1273 = clamp( uv_TexCoord135_g1273 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1273 = Counter_2_Digits778;
			float clampResult230_g1273 = clamp( break260_g1273.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1278 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1273,clampResult230_g1273) );
			float2 clampResult138_g1273 = clamp( uv_TexCoord135_g1273 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1273 = clamp( break260_g1273.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1273 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1273,clampResult231_g1273) );
			float4 temp_output_2_0_g1276 = tex2DArrayNode144_g1273;
			float2 clampResult139_g1273 = clamp( uv_TexCoord135_g1273 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1273 = clamp( break260_g1273.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1273 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1273,clampResult232_g1273) );
			float4 temp_output_2_0_g1275 = tex2DArrayNode145_g1273;
			float2 clampResult137_g1273 = clamp( uv_TexCoord135_g1273 , float2( 3,0 ) , float2( 4,1 ) );
			float clampResult233_g1273 = clamp( break260_g1273.w , 0.0 , 9.0 );
			float4 temp_output_2_0_g1277 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1273,clampResult233_g1273) );
			float clampResult5_g1274 = clamp( ( (temp_output_2_0_g1278).a + (temp_output_2_0_g1276).a + (temp_output_2_0_g1275).a + (temp_output_2_0_g1277).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER2DIGITS_ONE )
				float staticSwitch784 = clampResult5_g1307;
			#elif defined( _COUNTER2DIGITS_TWO )
				float staticSwitch784 = clampResult5_g1296;
			#elif defined( _COUNTER2DIGITS_THREE )
				float staticSwitch784 = clampResult5_g1285;
			#elif defined( _COUNTER2DIGITS_FOUR )
				float staticSwitch784 = clampResult5_g1274;
			#else
				float staticSwitch784 = clampResult5_g1307;
			#endif
			float Counter_2_Opacity787 = staticSwitch784;
			float2 appendResult129_g1350 = (float2(1.0 , 1.0));
			float Counter_3_Scale829 = _Counter3Scale;
			float clampResult236_g1350 = clamp( Counter_3_Scale829 , 1.0 , 10.0 );
			float temp_output_114_0_g1350 =  (1.0 + ( clampResult236_g1350 - 1.0 ) * ( 20.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1350 = (float2(0.0 , 0.0));
			float temp_output_127_0_g1350 = ( ( 1.0 - temp_output_114_0_g1350 ) * 0.5 );
			float2 appendResult130_g1350 = (float2(temp_output_127_0_g1350 , temp_output_127_0_g1350));
			float2 Counter_3_Offset830 = _Counter3Offset;
			float2 uv_TexCoord135_g1350 = i.uv_texcoord * ( appendResult129_g1350 * temp_output_114_0_g1350 ) + ( appendResult131_g1350 + appendResult130_g1350 + Counter_3_Offset830 );
			float2 clampResult143_g1350 = clamp( uv_TexCoord135_g1350 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_3_Digits828 = _Counter3;
			float4 break260_g1350 = Counter_3_Digits828;
			float clampResult230_g1350 = clamp( break260_g1350.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1355 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1350,clampResult230_g1350) );
			float4 color146_g1350 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1353 = color146_g1350;
			float4 temp_output_2_0_g1352 = color146_g1350;
			float4 temp_output_2_0_g1354 = color146_g1350;
			float clampResult5_g1351 = clamp( ( (temp_output_2_0_g1355).a + (temp_output_2_0_g1353).a + (temp_output_2_0_g1352).a + (temp_output_2_0_g1354).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1361 = (float2(2.0 , 2.0));
			float clampResult236_g1361 = clamp( Counter_3_Scale829 , 1.0 , 10.0 );
			float temp_output_114_0_g1361 =  (1.0 + ( clampResult236_g1361 - 1.0 ) * ( 10.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1361 = (float2(0.0 , -0.5));
			float temp_output_127_0_g1361 = ( ( 1.0 - temp_output_114_0_g1361 ) * 1.0 );
			float2 appendResult130_g1361 = (float2(temp_output_127_0_g1361 , temp_output_127_0_g1361));
			float2 uv_TexCoord135_g1361 = i.uv_texcoord * ( appendResult129_g1361 * temp_output_114_0_g1361 ) + ( appendResult131_g1361 + appendResult130_g1361 + Counter_3_Offset830 );
			float2 clampResult143_g1361 = clamp( uv_TexCoord135_g1361 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1361 = Counter_3_Digits828;
			float clampResult230_g1361 = clamp( break260_g1361.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1366 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1361,clampResult230_g1361) );
			float2 clampResult138_g1361 = clamp( uv_TexCoord135_g1361 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1361 = clamp( break260_g1361.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1361 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1361,clampResult231_g1361) );
			float4 temp_output_2_0_g1364 = tex2DArrayNode144_g1361;
			float4 color146_g1361 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1363 = color146_g1361;
			float4 temp_output_2_0_g1365 = color146_g1361;
			float clampResult5_g1362 = clamp( ( (temp_output_2_0_g1366).a + (temp_output_2_0_g1364).a + (temp_output_2_0_g1363).a + (temp_output_2_0_g1365).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1372 = (float2(3.0 , 3.0));
			float clampResult236_g1372 = clamp( Counter_3_Scale829 , 1.0 , 10.0 );
			float temp_output_114_0_g1372 =  (1.0 + ( clampResult236_g1372 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1372 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1372 = ( ( 1.0 - temp_output_114_0_g1372 ) * 1.5 );
			float2 appendResult130_g1372 = (float2(temp_output_127_0_g1372 , temp_output_127_0_g1372));
			float2 uv_TexCoord135_g1372 = i.uv_texcoord * ( appendResult129_g1372 * temp_output_114_0_g1372 ) + ( appendResult131_g1372 + appendResult130_g1372 + Counter_3_Offset830 );
			float2 clampResult143_g1372 = clamp( uv_TexCoord135_g1372 , float2( 0,0 ) , float2( 1,1 ) );
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
			float2 appendResult129_g1383 = (float2(4.0 , 4.0));
			float clampResult236_g1383 = clamp( Counter_3_Scale829 , 1.0 , 10.0 );
			float temp_output_114_0_g1383 =  (1.0 + ( clampResult236_g1383 - 1.0 ) * ( 5.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1383 = (float2(0.0 , -1.5));
			float temp_output_127_0_g1383 = ( ( 1.0 - temp_output_114_0_g1383 ) * 2.0 );
			float2 appendResult130_g1383 = (float2(temp_output_127_0_g1383 , temp_output_127_0_g1383));
			float2 uv_TexCoord135_g1383 = i.uv_texcoord * ( appendResult129_g1383 * temp_output_114_0_g1383 ) + ( appendResult131_g1383 + appendResult130_g1383 + Counter_3_Offset830 );
			float2 clampResult143_g1383 = clamp( uv_TexCoord135_g1383 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1383 = Counter_3_Digits828;
			float clampResult230_g1383 = clamp( break260_g1383.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1388 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1383,clampResult230_g1383) );
			float2 clampResult138_g1383 = clamp( uv_TexCoord135_g1383 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1383 = clamp( break260_g1383.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1383 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1383,clampResult231_g1383) );
			float4 temp_output_2_0_g1386 = tex2DArrayNode144_g1383;
			float2 clampResult139_g1383 = clamp( uv_TexCoord135_g1383 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1383 = clamp( break260_g1383.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1383 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1383,clampResult232_g1383) );
			float4 temp_output_2_0_g1385 = tex2DArrayNode145_g1383;
			float2 clampResult137_g1383 = clamp( uv_TexCoord135_g1383 , float2( 3,0 ) , float2( 4,1 ) );
			float clampResult233_g1383 = clamp( break260_g1383.w , 0.0 , 9.0 );
			float4 temp_output_2_0_g1387 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1383,clampResult233_g1383) );
			float clampResult5_g1384 = clamp( ( (temp_output_2_0_g1388).a + (temp_output_2_0_g1386).a + (temp_output_2_0_g1385).a + (temp_output_2_0_g1387).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER3DIGITS_ONE )
				float staticSwitch843 = clampResult5_g1351;
			#elif defined( _COUNTER3DIGITS_TWO )
				float staticSwitch843 = clampResult5_g1362;
			#elif defined( _COUNTER3DIGITS_THREE )
				float staticSwitch843 = clampResult5_g1373;
			#elif defined( _COUNTER3DIGITS_FOUR )
				float staticSwitch843 = clampResult5_g1384;
			#else
				float staticSwitch843 = clampResult5_g1351;
			#endif
			float Counter_3_Opacity849 = staticSwitch843;
			float2 appendResult129_g1416 = (float2(1.0 , 1.0));
			float Counter_4_Scale861 = _Counter4Scale;
			float clampResult236_g1416 = clamp( Counter_4_Scale861 , 1.0 , 10.0 );
			float temp_output_114_0_g1416 =  (1.0 + ( clampResult236_g1416 - 1.0 ) * ( 20.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1416 = (float2(0.0 , 0.0));
			float temp_output_127_0_g1416 = ( ( 1.0 - temp_output_114_0_g1416 ) * 0.5 );
			float2 appendResult130_g1416 = (float2(temp_output_127_0_g1416 , temp_output_127_0_g1416));
			float2 Counter_4_Offset860 = _Counter4Offset;
			float2 uv_TexCoord135_g1416 = i.uv_texcoord * ( appendResult129_g1416 * temp_output_114_0_g1416 ) + ( appendResult131_g1416 + appendResult130_g1416 + Counter_4_Offset860 );
			float2 clampResult143_g1416 = clamp( uv_TexCoord135_g1416 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_4_Digits862 = _Counter4;
			float4 break260_g1416 = Counter_4_Digits862;
			float clampResult230_g1416 = clamp( break260_g1416.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1421 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1416,clampResult230_g1416) );
			float4 color146_g1416 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1419 = color146_g1416;
			float4 temp_output_2_0_g1418 = color146_g1416;
			float4 temp_output_2_0_g1420 = color146_g1416;
			float clampResult5_g1417 = clamp( ( (temp_output_2_0_g1421).a + (temp_output_2_0_g1419).a + (temp_output_2_0_g1418).a + (temp_output_2_0_g1420).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1427 = (float2(2.0 , 2.0));
			float clampResult236_g1427 = clamp( Counter_4_Scale861 , 1.0 , 10.0 );
			float temp_output_114_0_g1427 =  (1.0 + ( clampResult236_g1427 - 1.0 ) * ( 10.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1427 = (float2(0.0 , -0.5));
			float temp_output_127_0_g1427 = ( ( 1.0 - temp_output_114_0_g1427 ) * 1.0 );
			float2 appendResult130_g1427 = (float2(temp_output_127_0_g1427 , temp_output_127_0_g1427));
			float2 uv_TexCoord135_g1427 = i.uv_texcoord * ( appendResult129_g1427 * temp_output_114_0_g1427 ) + ( appendResult131_g1427 + appendResult130_g1427 + Counter_4_Offset860 );
			float2 clampResult143_g1427 = clamp( uv_TexCoord135_g1427 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1427 = Counter_4_Digits862;
			float clampResult230_g1427 = clamp( break260_g1427.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1432 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1427,clampResult230_g1427) );
			float2 clampResult138_g1427 = clamp( uv_TexCoord135_g1427 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1427 = clamp( break260_g1427.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1427 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1427,clampResult231_g1427) );
			float4 temp_output_2_0_g1430 = tex2DArrayNode144_g1427;
			float4 color146_g1427 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1429 = color146_g1427;
			float4 temp_output_2_0_g1431 = color146_g1427;
			float clampResult5_g1428 = clamp( ( (temp_output_2_0_g1432).a + (temp_output_2_0_g1430).a + (temp_output_2_0_g1429).a + (temp_output_2_0_g1431).a ) , 0.0 , 1.0 );
			float2 appendResult129_g1405 = (float2(3.0 , 3.0));
			float clampResult236_g1405 = clamp( Counter_4_Scale861 , 1.0 , 10.0 );
			float temp_output_114_0_g1405 =  (1.0 + ( clampResult236_g1405 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1405 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1405 = ( ( 1.0 - temp_output_114_0_g1405 ) * 1.5 );
			float2 appendResult130_g1405 = (float2(temp_output_127_0_g1405 , temp_output_127_0_g1405));
			float2 uv_TexCoord135_g1405 = i.uv_texcoord * ( appendResult129_g1405 * temp_output_114_0_g1405 ) + ( appendResult131_g1405 + appendResult130_g1405 + Counter_4_Offset860 );
			float2 clampResult143_g1405 = clamp( uv_TexCoord135_g1405 , float2( 0,0 ) , float2( 1,1 ) );
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
			float2 appendResult129_g1394 = (float2(4.0 , 4.0));
			float clampResult236_g1394 = clamp( Counter_4_Scale861 , 1.0 , 10.0 );
			float temp_output_114_0_g1394 =  (1.0 + ( clampResult236_g1394 - 1.0 ) * ( 5.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1394 = (float2(0.0 , -1.5));
			float temp_output_127_0_g1394 = ( ( 1.0 - temp_output_114_0_g1394 ) * 2.0 );
			float2 appendResult130_g1394 = (float2(temp_output_127_0_g1394 , temp_output_127_0_g1394));
			float2 uv_TexCoord135_g1394 = i.uv_texcoord * ( appendResult129_g1394 * temp_output_114_0_g1394 ) + ( appendResult131_g1394 + appendResult130_g1394 + Counter_4_Offset860 );
			float2 clampResult143_g1394 = clamp( uv_TexCoord135_g1394 , float2( 0,0 ) , float2( 1,1 ) );
			float4 break260_g1394 = Counter_4_Digits862;
			float clampResult230_g1394 = clamp( break260_g1394.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1399 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1394,clampResult230_g1394) );
			float2 clampResult138_g1394 = clamp( uv_TexCoord135_g1394 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1394 = clamp( break260_g1394.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1394 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1394,clampResult231_g1394) );
			float4 temp_output_2_0_g1397 = tex2DArrayNode144_g1394;
			float2 clampResult139_g1394 = clamp( uv_TexCoord135_g1394 , float2( 2,0 ) , float2( 3,1 ) );
			float clampResult232_g1394 = clamp( break260_g1394.z , 0.0 , 9.0 );
			float4 tex2DArrayNode145_g1394 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1394,clampResult232_g1394) );
			float4 temp_output_2_0_g1396 = tex2DArrayNode145_g1394;
			float2 clampResult137_g1394 = clamp( uv_TexCoord135_g1394 , float2( 3,0 ) , float2( 4,1 ) );
			float clampResult233_g1394 = clamp( break260_g1394.w , 0.0 , 9.0 );
			float4 temp_output_2_0_g1398 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1394,clampResult233_g1394) );
			float clampResult5_g1395 = clamp( ( (temp_output_2_0_g1399).a + (temp_output_2_0_g1397).a + (temp_output_2_0_g1396).a + (temp_output_2_0_g1398).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER4DIGITS_ONE )
				float staticSwitch840 = clampResult5_g1417;
			#elif defined( _COUNTER4DIGITS_TWO )
				float staticSwitch840 = clampResult5_g1428;
			#elif defined( _COUNTER4DIGITS_THREE )
				float staticSwitch840 = clampResult5_g1406;
			#elif defined( _COUNTER4DIGITS_FOUR )
				float staticSwitch840 = clampResult5_g1395;
			#else
				float staticSwitch840 = clampResult5_g1417;
			#endif
			float Counter_4_Opacity846 = staticSwitch840;
			#if defined( _NUMBEROFCOUNTERS_ONE )
				float staticSwitch588 = Counter_1_Opacity762;
			#elif defined( _NUMBEROFCOUNTERS_TWO )
				float staticSwitch588 = ( Counter_1_Opacity762 + Counter_2_Opacity787 );
			#elif defined( _NUMBEROFCOUNTERS_THREE )
				float staticSwitch588 = ( Counter_1_Opacity762 + Counter_2_Opacity787 + Counter_3_Opacity849 );
			#elif defined( _NUMBEROFCOUNTERS_FOUR )
				float staticSwitch588 = ( Counter_1_Opacity762 + Counter_2_Opacity787 + Counter_3_Opacity849 + Counter_4_Opacity846 );
			#else
				float staticSwitch588 = Counter_1_Opacity762;
			#endif
			float Final_Opacity813 = staticSwitch588;
			float4 temp_output_2_0_g1250 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1240,0.0) );
			float4 color271_g1240 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1248 = color271_g1240;
			float4 temp_output_2_0_g1247 = color271_g1240;
			float4 temp_output_2_0_g1249 = color271_g1240;
			float clampResult5_g1246 = clamp( ( (temp_output_2_0_g1250).a + (temp_output_2_0_g1248).a + (temp_output_2_0_g1247).a + (temp_output_2_0_g1249).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1239 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1229,0.0) );
			float4 tex2DArrayNode265_g1229 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1229,0.0) );
			float4 temp_output_2_0_g1237 = tex2DArrayNode265_g1229;
			float4 color271_g1229 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1236 = color271_g1229;
			float4 temp_output_2_0_g1238 = color271_g1229;
			float clampResult5_g1235 = clamp( ( (temp_output_2_0_g1239).a + (temp_output_2_0_g1237).a + (temp_output_2_0_g1236).a + (temp_output_2_0_g1238).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1217 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1207,0.0) );
			float4 tex2DArrayNode265_g1207 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1207,0.0) );
			float4 temp_output_2_0_g1215 = tex2DArrayNode265_g1207;
			float4 tex2DArrayNode264_g1207 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1207,0.0) );
			float4 temp_output_2_0_g1214 = tex2DArrayNode264_g1207;
			float4 color271_g1207 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1216 = color271_g1207;
			float clampResult5_g1213 = clamp( ( (temp_output_2_0_g1217).a + (temp_output_2_0_g1215).a + (temp_output_2_0_g1214).a + (temp_output_2_0_g1216).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1228 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1218,0.0) );
			float4 tex2DArrayNode265_g1218 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1218,0.0) );
			float4 temp_output_2_0_g1226 = tex2DArrayNode265_g1218;
			float4 tex2DArrayNode264_g1218 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1218,0.0) );
			float4 temp_output_2_0_g1225 = tex2DArrayNode264_g1218;
			float4 temp_output_2_0_g1227 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1218,0.0) );
			float clampResult5_g1224 = clamp( ( (temp_output_2_0_g1228).a + (temp_output_2_0_g1226).a + (temp_output_2_0_g1225).a + (temp_output_2_0_g1227).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER1DIGITS_ONE )
				float staticSwitch730 = clampResult5_g1246;
			#elif defined( _COUNTER1DIGITS_TWO )
				float staticSwitch730 = clampResult5_g1235;
			#elif defined( _COUNTER1DIGITS_THREE )
				float staticSwitch730 = clampResult5_g1213;
			#elif defined( _COUNTER1DIGITS_FOUR )
				float staticSwitch730 = clampResult5_g1224;
			#else
				float staticSwitch730 = clampResult5_g1246;
			#endif
			float Counter_1_Backing_Alpha760 = staticSwitch730;
			float4 temp_output_2_0_g1316 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1306,0.0) );
			float4 color271_g1306 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1314 = color271_g1306;
			float4 temp_output_2_0_g1313 = color271_g1306;
			float4 temp_output_2_0_g1315 = color271_g1306;
			float clampResult5_g1312 = clamp( ( (temp_output_2_0_g1316).a + (temp_output_2_0_g1314).a + (temp_output_2_0_g1313).a + (temp_output_2_0_g1315).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1305 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1295,0.0) );
			float4 tex2DArrayNode265_g1295 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1295,0.0) );
			float4 temp_output_2_0_g1303 = tex2DArrayNode265_g1295;
			float4 color271_g1295 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1302 = color271_g1295;
			float4 temp_output_2_0_g1304 = color271_g1295;
			float clampResult5_g1301 = clamp( ( (temp_output_2_0_g1305).a + (temp_output_2_0_g1303).a + (temp_output_2_0_g1302).a + (temp_output_2_0_g1304).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1294 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1284,0.0) );
			float4 tex2DArrayNode265_g1284 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1284,0.0) );
			float4 temp_output_2_0_g1292 = tex2DArrayNode265_g1284;
			float4 tex2DArrayNode264_g1284 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1284,0.0) );
			float4 temp_output_2_0_g1291 = tex2DArrayNode264_g1284;
			float4 color271_g1284 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1293 = color271_g1284;
			float clampResult5_g1290 = clamp( ( (temp_output_2_0_g1294).a + (temp_output_2_0_g1292).a + (temp_output_2_0_g1291).a + (temp_output_2_0_g1293).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1283 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1273,0.0) );
			float4 tex2DArrayNode265_g1273 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1273,0.0) );
			float4 temp_output_2_0_g1281 = tex2DArrayNode265_g1273;
			float4 tex2DArrayNode264_g1273 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1273,0.0) );
			float4 temp_output_2_0_g1280 = tex2DArrayNode264_g1273;
			float4 temp_output_2_0_g1282 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1273,0.0) );
			float clampResult5_g1279 = clamp( ( (temp_output_2_0_g1283).a + (temp_output_2_0_g1281).a + (temp_output_2_0_g1280).a + (temp_output_2_0_g1282).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER2DIGITS_ONE )
				float staticSwitch782 = clampResult5_g1312;
			#elif defined( _COUNTER2DIGITS_TWO )
				float staticSwitch782 = clampResult5_g1301;
			#elif defined( _COUNTER2DIGITS_THREE )
				float staticSwitch782 = clampResult5_g1290;
			#elif defined( _COUNTER2DIGITS_FOUR )
				float staticSwitch782 = clampResult5_g1279;
			#else
				float staticSwitch782 = clampResult5_g1312;
			#endif
			float Counter_2_Backing_Alpha785 = staticSwitch782;
			float4 temp_output_2_0_g1360 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1350,0.0) );
			float4 color271_g1350 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1358 = color271_g1350;
			float4 temp_output_2_0_g1357 = color271_g1350;
			float4 temp_output_2_0_g1359 = color271_g1350;
			float clampResult5_g1356 = clamp( ( (temp_output_2_0_g1360).a + (temp_output_2_0_g1358).a + (temp_output_2_0_g1357).a + (temp_output_2_0_g1359).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1371 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1361,0.0) );
			float4 tex2DArrayNode265_g1361 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1361,0.0) );
			float4 temp_output_2_0_g1369 = tex2DArrayNode265_g1361;
			float4 color271_g1361 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1368 = color271_g1361;
			float4 temp_output_2_0_g1370 = color271_g1361;
			float clampResult5_g1367 = clamp( ( (temp_output_2_0_g1371).a + (temp_output_2_0_g1369).a + (temp_output_2_0_g1368).a + (temp_output_2_0_g1370).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1382 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1372,0.0) );
			float4 tex2DArrayNode265_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1372,0.0) );
			float4 temp_output_2_0_g1380 = tex2DArrayNode265_g1372;
			float4 tex2DArrayNode264_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1372,0.0) );
			float4 temp_output_2_0_g1379 = tex2DArrayNode264_g1372;
			float4 color271_g1372 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1381 = color271_g1372;
			float clampResult5_g1378 = clamp( ( (temp_output_2_0_g1382).a + (temp_output_2_0_g1380).a + (temp_output_2_0_g1379).a + (temp_output_2_0_g1381).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1393 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1383,0.0) );
			float4 tex2DArrayNode265_g1383 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1383,0.0) );
			float4 temp_output_2_0_g1391 = tex2DArrayNode265_g1383;
			float4 tex2DArrayNode264_g1383 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1383,0.0) );
			float4 temp_output_2_0_g1390 = tex2DArrayNode264_g1383;
			float4 temp_output_2_0_g1392 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1383,0.0) );
			float clampResult5_g1389 = clamp( ( (temp_output_2_0_g1393).a + (temp_output_2_0_g1391).a + (temp_output_2_0_g1390).a + (temp_output_2_0_g1392).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER3DIGITS_ONE )
				float staticSwitch845 = clampResult5_g1356;
			#elif defined( _COUNTER3DIGITS_TWO )
				float staticSwitch845 = clampResult5_g1367;
			#elif defined( _COUNTER3DIGITS_THREE )
				float staticSwitch845 = clampResult5_g1378;
			#elif defined( _COUNTER3DIGITS_FOUR )
				float staticSwitch845 = clampResult5_g1389;
			#else
				float staticSwitch845 = clampResult5_g1356;
			#endif
			float Counter_3_Backing_Alpha851 = staticSwitch845;
			float4 temp_output_2_0_g1426 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1416,0.0) );
			float4 color271_g1416 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1424 = color271_g1416;
			float4 temp_output_2_0_g1423 = color271_g1416;
			float4 temp_output_2_0_g1425 = color271_g1416;
			float clampResult5_g1422 = clamp( ( (temp_output_2_0_g1426).a + (temp_output_2_0_g1424).a + (temp_output_2_0_g1423).a + (temp_output_2_0_g1425).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1437 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1427,0.0) );
			float4 tex2DArrayNode265_g1427 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1427,0.0) );
			float4 temp_output_2_0_g1435 = tex2DArrayNode265_g1427;
			float4 color271_g1427 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1434 = color271_g1427;
			float4 temp_output_2_0_g1436 = color271_g1427;
			float clampResult5_g1433 = clamp( ( (temp_output_2_0_g1437).a + (temp_output_2_0_g1435).a + (temp_output_2_0_g1434).a + (temp_output_2_0_g1436).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1415 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1405,0.0) );
			float4 tex2DArrayNode265_g1405 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1405,0.0) );
			float4 temp_output_2_0_g1413 = tex2DArrayNode265_g1405;
			float4 tex2DArrayNode264_g1405 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1405,0.0) );
			float4 temp_output_2_0_g1412 = tex2DArrayNode264_g1405;
			float4 color271_g1405 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1414 = color271_g1405;
			float clampResult5_g1411 = clamp( ( (temp_output_2_0_g1415).a + (temp_output_2_0_g1413).a + (temp_output_2_0_g1412).a + (temp_output_2_0_g1414).a ) , 0.0 , 1.0 );
			float4 temp_output_2_0_g1404 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1394,0.0) );
			float4 tex2DArrayNode265_g1394 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1394,0.0) );
			float4 temp_output_2_0_g1402 = tex2DArrayNode265_g1394;
			float4 tex2DArrayNode264_g1394 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1394,0.0) );
			float4 temp_output_2_0_g1401 = tex2DArrayNode264_g1394;
			float4 temp_output_2_0_g1403 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult137_g1394,0.0) );
			float clampResult5_g1400 = clamp( ( (temp_output_2_0_g1404).a + (temp_output_2_0_g1402).a + (temp_output_2_0_g1401).a + (temp_output_2_0_g1403).a ) , 0.0 , 1.0 );
			#if defined( _COUNTER4DIGITS_ONE )
				float staticSwitch842 = clampResult5_g1422;
			#elif defined( _COUNTER4DIGITS_TWO )
				float staticSwitch842 = clampResult5_g1433;
			#elif defined( _COUNTER4DIGITS_THREE )
				float staticSwitch842 = clampResult5_g1411;
			#elif defined( _COUNTER4DIGITS_FOUR )
				float staticSwitch842 = clampResult5_g1400;
			#else
				float staticSwitch842 = clampResult5_g1422;
			#endif
			float Counter_4_Backing_Alpha848 = staticSwitch842;
			#if defined( _NUMBEROFCOUNTERS_ONE )
				float staticSwitch680 = Counter_1_Backing_Alpha760;
			#elif defined( _NUMBEROFCOUNTERS_TWO )
				float staticSwitch680 = ( Counter_1_Backing_Alpha760 + Counter_2_Backing_Alpha785 );
			#elif defined( _NUMBEROFCOUNTERS_THREE )
				float staticSwitch680 = ( Counter_1_Backing_Alpha760 + Counter_2_Backing_Alpha785 + Counter_3_Backing_Alpha851 );
			#elif defined( _NUMBEROFCOUNTERS_FOUR )
				float staticSwitch680 = ( Counter_1_Backing_Alpha760 + Counter_2_Backing_Alpha785 + Counter_3_Backing_Alpha851 + Counter_4_Backing_Alpha848 );
			#else
				float staticSwitch680 = Counter_1_Backing_Alpha760;
			#endif
			float Final_Backing_Alpha815 = staticSwitch680;
			float clampResult869 = clamp( ( Final_Opacity813 + Final_Backing_Alpha815 ) , 0.0 , 1.0 );
			float3 lerpResult870 = lerp( ( tex2D( _Background, uv_Background ).rgb * _BackgroundTint.rgb ) , float3( 0,0,0 ) , clampResult869);
			o.Albedo = lerpResult870;
			float3 clampResult3_g1241 = clamp( ( (temp_output_2_0_g1245).rgb + (temp_output_2_0_g1243).rgb + (temp_output_2_0_g1242).rgb + (temp_output_2_0_g1244).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1230 = clamp( ( (temp_output_2_0_g1234).rgb + (temp_output_2_0_g1232).rgb + (temp_output_2_0_g1231).rgb + (temp_output_2_0_g1233).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1208 = clamp( ( (temp_output_2_0_g1212).rgb + (temp_output_2_0_g1210).rgb + (temp_output_2_0_g1209).rgb + (temp_output_2_0_g1211).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1219 = clamp( ( (temp_output_2_0_g1223).rgb + (temp_output_2_0_g1221).rgb + (temp_output_2_0_g1220).rgb + (temp_output_2_0_g1222).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			#if defined( _COUNTER1DIGITS_ONE )
				float3 staticSwitch758 = ( float3( 1,1,1 ) * clampResult3_g1241 );
			#elif defined( _COUNTER1DIGITS_TWO )
				float3 staticSwitch758 = ( float3( 1,1,1 ) * clampResult3_g1230 );
			#elif defined( _COUNTER1DIGITS_THREE )
				float3 staticSwitch758 = ( float3( 1,1,1 ) * clampResult3_g1208 );
			#elif defined( _COUNTER1DIGITS_FOUR )
				float3 staticSwitch758 = ( float3( 1,1,1 ) * clampResult3_g1219 );
			#else
				float3 staticSwitch758 = ( float3( 1,1,1 ) * clampResult3_g1241 );
			#endif
			float3 Counter_1_Color761 = staticSwitch758;
			float3 clampResult3_g1307 = clamp( ( (temp_output_2_0_g1311).rgb + (temp_output_2_0_g1309).rgb + (temp_output_2_0_g1308).rgb + (temp_output_2_0_g1310).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1296 = clamp( ( (temp_output_2_0_g1300).rgb + (temp_output_2_0_g1298).rgb + (temp_output_2_0_g1297).rgb + (temp_output_2_0_g1299).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1285 = clamp( ( (temp_output_2_0_g1289).rgb + (temp_output_2_0_g1287).rgb + (temp_output_2_0_g1286).rgb + (temp_output_2_0_g1288).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1274 = clamp( ( (temp_output_2_0_g1278).rgb + (temp_output_2_0_g1276).rgb + (temp_output_2_0_g1275).rgb + (temp_output_2_0_g1277).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			#if defined( _COUNTER2DIGITS_ONE )
				float3 staticSwitch783 = ( float3( 1,1,1 ) * clampResult3_g1307 );
			#elif defined( _COUNTER2DIGITS_TWO )
				float3 staticSwitch783 = ( float3( 1,1,1 ) * clampResult3_g1296 );
			#elif defined( _COUNTER2DIGITS_THREE )
				float3 staticSwitch783 = ( float3( 1,1,1 ) * clampResult3_g1285 );
			#elif defined( _COUNTER2DIGITS_FOUR )
				float3 staticSwitch783 = ( float3( 1,1,1 ) * clampResult3_g1274 );
			#else
				float3 staticSwitch783 = ( float3( 1,1,1 ) * clampResult3_g1307 );
			#endif
			float3 Counter_2_Color786 = staticSwitch783;
			float3 clampResult3_g1351 = clamp( ( (temp_output_2_0_g1355).rgb + (temp_output_2_0_g1353).rgb + (temp_output_2_0_g1352).rgb + (temp_output_2_0_g1354).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1362 = clamp( ( (temp_output_2_0_g1366).rgb + (temp_output_2_0_g1364).rgb + (temp_output_2_0_g1363).rgb + (temp_output_2_0_g1365).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1373 = clamp( ( (temp_output_2_0_g1377).rgb + (temp_output_2_0_g1375).rgb + (temp_output_2_0_g1374).rgb + (temp_output_2_0_g1376).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1384 = clamp( ( (temp_output_2_0_g1388).rgb + (temp_output_2_0_g1386).rgb + (temp_output_2_0_g1385).rgb + (temp_output_2_0_g1387).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			#if defined( _COUNTER3DIGITS_ONE )
				float3 staticSwitch844 = ( float3( 1,1,1 ) * clampResult3_g1351 );
			#elif defined( _COUNTER3DIGITS_TWO )
				float3 staticSwitch844 = ( float3( 1,1,1 ) * clampResult3_g1362 );
			#elif defined( _COUNTER3DIGITS_THREE )
				float3 staticSwitch844 = ( float3( 1,1,1 ) * clampResult3_g1373 );
			#elif defined( _COUNTER3DIGITS_FOUR )
				float3 staticSwitch844 = ( float3( 1,1,1 ) * clampResult3_g1384 );
			#else
				float3 staticSwitch844 = ( float3( 1,1,1 ) * clampResult3_g1351 );
			#endif
			float3 Counter_3_Color850 = staticSwitch844;
			float3 clampResult3_g1417 = clamp( ( (temp_output_2_0_g1421).rgb + (temp_output_2_0_g1419).rgb + (temp_output_2_0_g1418).rgb + (temp_output_2_0_g1420).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1428 = clamp( ( (temp_output_2_0_g1432).rgb + (temp_output_2_0_g1430).rgb + (temp_output_2_0_g1429).rgb + (temp_output_2_0_g1431).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1406 = clamp( ( (temp_output_2_0_g1410).rgb + (temp_output_2_0_g1408).rgb + (temp_output_2_0_g1407).rgb + (temp_output_2_0_g1409).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 clampResult3_g1395 = clamp( ( (temp_output_2_0_g1399).rgb + (temp_output_2_0_g1397).rgb + (temp_output_2_0_g1396).rgb + (temp_output_2_0_g1398).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			#if defined( _COUNTER4DIGITS_ONE )
				float3 staticSwitch841 = ( float3( 1,1,1 ) * clampResult3_g1417 );
			#elif defined( _COUNTER4DIGITS_TWO )
				float3 staticSwitch841 = ( float3( 1,1,1 ) * clampResult3_g1428 );
			#elif defined( _COUNTER4DIGITS_THREE )
				float3 staticSwitch841 = ( float3( 1,1,1 ) * clampResult3_g1406 );
			#elif defined( _COUNTER4DIGITS_FOUR )
				float3 staticSwitch841 = ( float3( 1,1,1 ) * clampResult3_g1395 );
			#else
				float3 staticSwitch841 = ( float3( 1,1,1 ) * clampResult3_g1417 );
			#endif
			float3 Counter_4_Color847 = staticSwitch841;
			#if defined( _NUMBEROFCOUNTERS_ONE )
				float3 staticSwitch595 = Counter_1_Color761;
			#elif defined( _NUMBEROFCOUNTERS_TWO )
				float3 staticSwitch595 = ( Counter_1_Color761 + Counter_2_Color786 );
			#elif defined( _NUMBEROFCOUNTERS_THREE )
				float3 staticSwitch595 = ( Counter_1_Color761 + Counter_2_Color786 + Counter_3_Color850 );
			#elif defined( _NUMBEROFCOUNTERS_FOUR )
				float3 staticSwitch595 = ( Counter_1_Color761 + Counter_2_Color786 + Counter_3_Color850 + Counter_4_Color847 );
			#else
				float3 staticSwitch595 = Counter_1_Color761;
			#endif
			float3 clampResult566 = clamp( staticSwitch595 , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Final_Color_Out806 = ( _DigitColor.rgb * clampResult566 );
			float3 lerpResult558 = lerp( float3( 0,0,0 ) , Final_Color_Out806 , Final_Opacity813);
			float2 uv_AdditionalEmissives = i.uv_texcoord * _AdditionalEmissives_ST.xy + _AdditionalEmissives_ST.zw;
			float4 tex2DNode878 = tex2D( _AdditionalEmissives, uv_AdditionalEmissives );
			o.Emission = ( lerpResult558 + ( tex2DNode878.rgb * _AdditionalEmissivesTint ) );
			float temp_output_871_0 = 0.0;
			o.Metallic = temp_output_871_0;
			o.Smoothness = temp_output_871_0;
			o.Occlusion = 1.0;
			float Digit_Opacity873 = _DigitColor.a;
			float lerpResult688 = lerp( _BackgroundTint.a , 1.0 , ( clampResult869 * Digit_Opacity873 ));
			float clampResult883 = clamp( ( lerpResult688 + tex2DNode878.a ) , 0.0 , 1.0 );
			o.Alpha = clampResult883;
		}

		ENDCG
	}
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19900
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;863;-1792,144;Inherit;False;564;483;;6;594;590;591;862;861;860;Counter 4 Params;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;831;-1792,-464;Inherit;False;580;467;;6;593;561;562;828;829;830;Counter 3 Params;0,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;729;-1792,-1664;Inherit;False;596.571;454.5729;;6;737;586;537;538;754;753;Counter 1 Params;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;781;-1792,-1088;Inherit;False;612;467;;6;592;547;548;778;779;780;Counter 2 Params;1,1,0.4,1;0;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;537;-1776,-1344;Inherit;False;Property;_Counter1Offset;Counter 1 Offset;15;1;[Header];Create;True;1;Counter Offsets;0;0;False;0;False;0,0;-1,-1.78;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;538;-1776,-1440;Inherit;False;Property;_Counter1Scale;Counter 1 Scale;11;1;[Header];Create;True;1;Counter Scales;0;0;False;0;False;0;5.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;586;-1776,-1616;Inherit;False;Property;_Counter1;Counter 1;19;1;[Header];Create;True;1;Counter Digit Values;0;0;False;0;False;7,7,7,7;1,7,5,2;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;592;-1744,-1024;Inherit;False;Property;_Counter2;Counter 2;20;0;Create;True;1;Counter Digit Values;0;0;False;0;False;0,0,0,0;2,3,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;547;-1744,-848;Inherit;False;Property;_Counter2Scale;Counter 2 Scale;12;0;Create;True;0;0;0;False;0;False;0;5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;548;-1744,-768;Inherit;False;Property;_Counter2Offset;Counter 2 Offset;16;0;Create;True;0;0;0;False;0;False;0,0;-2.86,-1.8;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;593;-1744,-416;Inherit;False;Property;_Counter3;Counter 3;21;0;Create;True;1;Counter Digit Values;0;0;False;0;False;0,0,0,0;4,5,6,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;561;-1744,-240;Inherit;False;Property;_Counter3Scale;Counter 3 Scale;13;0;Create;True;0;0;0;False;0;False;0;5;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;562;-1744,-160;Inherit;False;Property;_Counter3Offset;Counter 3 Offset;17;0;Create;True;0;0;0;False;0;False;0,0;-2,0.63;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;594;-1744,192;Inherit;False;Property;_Counter4;Counter 4;22;0;Create;True;1;Counter Digit Values;0;0;False;0;False;0,0,0,0;7,8,9,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;590;-1744,368;Inherit;False;Property;_Counter4Scale;Counter 4 Scale;14;0;Create;True;0;0;0;False;0;False;0;7;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;591;-1744,464;Inherit;False;Property;_Counter4Offset;Counter 4 Offset;18;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;534;-1792,-2016;Inherit;True;Property;_Font;Font;5;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;7b433ff0a41187141b92f092b5f98afd;7b433ff0a41187141b92f092b5f98afd;False;white;Auto;Texture2DArray;-1;0;2;SAMPLER2DARRAY;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;859;-754,462;Inherit;False;1348;667;;14;736;836;837;839;838;842;841;840;848;847;846;852;853;854;Counter 4 Generator;0,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;858;-802,-306;Inherit;False;1428;667;;14;735;845;844;843;835;834;833;832;851;850;849;857;856;855;Counter 3 Generator;0,1,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;794;-768,-1056;Inherit;False;1380;667;Comment;14;782;783;784;786;787;785;790;789;788;709;734;793;792;791;Counter 2 Generator;1,1,0.4,1;0;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;777;-768,-1792;Inherit;False;1412;683;;14;738;732;752;739;756;711;757;755;730;760;758;759;762;761;Counter 1 Generator;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;753;-1456,-1344;Inherit;False;Counter 1 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;754;-1456,-1440;Inherit;False;Counter 1 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;737;-1456,-1616;Inherit;False;Counter 1 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;778;-1424,-1024;Inherit;False;Counter 2 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;779;-1424,-848;Inherit;False;Counter 2 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;780;-1424,-768;Inherit;False;Counter 2 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;830;-1456,-160;Inherit;False;Counter 3 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;829;-1456,-240;Inherit;False;Counter 3 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;828;-1456,-416;Inherit;False;Counter 3 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;862;-1472,192;Inherit;False;Counter 4 Digits;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;861;-1472,368;Inherit;False;Counter 4 Scale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;860;-1472,464;Inherit;False;Counter 4 Offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;733;-1568,-2016;Inherit;False;FontTex;-1;True;1;0;SAMPLER2DARRAY;;False;1;SAMPLER2DARRAY;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;732;-688,-1632;Inherit;False;733;FontTex;1;0;OBJECT;;False;1;SAMPLER2DARRAY;0
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
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;756;-320,-1456;Inherit;False;Create Number;-1;;1207;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;711;-320,-1296;Inherit;False;Create Number;-1;;1218;36bba83cc54e07e449728c7a7faa3517;10,166,3,167,3,222,3,223,3,224,3,225,3,221,3,270,3,273,3,272,3;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;757;-320,-1600;Inherit;False;Create Number;-1;;1229;36bba83cc54e07e449728c7a7faa3517;10,166,1,167,1,222,1,223,1,224,1,225,1,221,1,270,1,273,1,272,1;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;755;-304,-1744;Inherit;False;Create Number;-1;;1240;36bba83cc54e07e449728c7a7faa3517;10,166,0,167,0,222,0,223,0,224,0,225,0,221,0,270,0,273,0,272,0;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;709;-352,-576;Inherit;False;Create Number;-1;;1273;36bba83cc54e07e449728c7a7faa3517;10,166,3,167,3,222,3,223,3,224,3,225,3,221,3,270,3,273,3,272,3;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;788;-352,-720;Inherit;False;Create Number;-1;;1284;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;789;-352,-864;Inherit;False;Create Number;-1;;1295;36bba83cc54e07e449728c7a7faa3517;10,166,1,167,1,222,1,223,1,224,1,225,1,221,1,270,1,273,1,272,1;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;790;-352,-1008;Inherit;False;Create Number;-1;;1306;36bba83cc54e07e449728c7a7faa3517;10,166,0,167,0,222,0,223,0,224,0,225,0,221,0,270,0,273,0,272,0;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;835;-352,-256;Inherit;False;Create Number;-1;;1350;36bba83cc54e07e449728c7a7faa3517;10,166,0,167,0,222,0,223,0,224,0,225,0,221,0,270,0,273,0,272,0;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;834;-352,-112;Inherit;False;Create Number;-1;;1361;36bba83cc54e07e449728c7a7faa3517;10,166,1,167,1,222,1,223,1,224,1,225,1,221,1,270,1,273,1,272,1;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;833;-352,32;Inherit;False;Create Number;-1;;1372;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;832;-352,176;Inherit;False;Create Number;-1;;1383;36bba83cc54e07e449728c7a7faa3517;10,166,3,167,3,222,3,223,3,224,3,225,3,221,3,270,3,273,3,272,3;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;836;-352,944;Inherit;False;Create Number;-1;;1394;36bba83cc54e07e449728c7a7faa3517;10,166,3,167,3,222,3,223,3,224,3,225,3,221,3,270,3,273,3,272,3;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;837;-352,800;Inherit;False;Create Number;-1;;1405;36bba83cc54e07e449728c7a7faa3517;10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;839;-352,512;Inherit;False;Create Number;-1;;1416;36bba83cc54e07e449728c7a7faa3517;10,166,0,167,0,222,0,223,0,224,0,225,0,221,0,270,0,273,0,272,0;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;838;-352,656;Inherit;False;Create Number;-1;;1427;36bba83cc54e07e449728c7a7faa3517;10,166,1,167,1,222,1,223,1,224,1,225,1,221,1,270,1,273,1,272,1;4;163;SAMPLER2DARRAY;0;False;241;FLOAT4;0,0,0,0;False;235;FLOAT;0;False;234;FLOAT2;0,0;False;3;FLOAT;269;FLOAT3;0;FLOAT;162
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;784;48,-688;Inherit;False;Property;_Keyword1;Keyword 0;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;782;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;759;96,-1376;Inherit;False;Property;_CounterDigits2;Counter 1 Digits;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Reference;730;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;843;64,144;Inherit;False;Property;_CounterDigits3;Counter 1 Digits;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Reference;845;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;840;16,832;Inherit;False;Property;_Keyword2;Keyword 0;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;842;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;782;48,-1008;Inherit;False;Property;_Counter2Digits;Counter 2 Digits;2;0;Create;True;0;0;0;False;0;False;0;0;1;True;;KeywordEnum;4;One;Two;Three;Four;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;730;112,-1712;Inherit;False;Property;_Counter1Digits;Counter 1 Digits;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;845;80,-192;Inherit;False;Property;_Counter3Digits;Counter 3 Digits;3;0;Create;True;0;0;0;False;0;False;0;0;1;True;;KeywordEnum;4;One;Two;Three;Four;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;842;16,512;Inherit;False;Property;_Counter4Digits;Counter 4 Digits;4;0;Create;True;0;0;0;False;0;False;0;0;2;True;;KeywordEnum;4;One;Two;Three;Four;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;827;896,304;Inherit;False;1131.013;829.8878;;15;813;588;551;616;617;764;824;826;805;774;825;804;773;803;772;Opacity Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;787;336,-688;Inherit;False;Counter 2 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;762;368,-1376;Inherit;False;Counter 1 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;849;352,144;Inherit;False;Counter 3 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;846;320,832;Inherit;False;Counter 4 Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;821;896,-608;Inherit;False;1188;851;;15;680;800;769;763;771;801;820;802;770;819;818;727;728;726;815;Backing Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;785;336,-1008;Inherit;False;Counter 2 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;760;368,-1712;Inherit;False;Counter 1 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;851;352,-192;Inherit;False;Counter 3 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;848;320,512;Inherit;False;Counter 4 Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;783;48,-848;Inherit;False;Property;_Keyword0;Keyword 0;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;782;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;758;96,-1536;Inherit;False;Property;_Counter1Digits1;Counter 1 Digits;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Reference;730;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;844;64,-16;Inherit;False;Property;_CounterDigits4;Counter 1 Digits;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Reference;845;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;841;16,672;Inherit;False;Property;_Keyword3;Keyword 0;4;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;842;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;772;944,448;Inherit;False;762;Counter 1 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;803;944,512;Inherit;False;787;Counter 2 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;773;944,608;Inherit;False;762;Counter 1 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;804;944,672;Inherit;False;787;Counter 2 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;774;944,832;Inherit;False;762;Counter 1 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;805;944,896;Inherit;False;787;Counter 2 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;824;944,1024;Inherit;False;846;Counter 4 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;826;944,960;Inherit;False;849;Counter 3 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;825;944,736;Inherit;False;849;Counter 3 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;800;960,-384;Inherit;False;785;Counter 2 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;769;960,-448;Inherit;False;760;Counter 1 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;771;960,-288;Inherit;False;760;Counter 1 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;801;960,-224;Inherit;False;785;Counter 2 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;802;960,0;Inherit;False;785;Counter 2 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;770;960,-64;Inherit;False;760;Counter 1 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;818;960,128;Inherit;False;848;Counter 4 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;819;960,64;Inherit;False;851;Counter 3 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;820;960,-160;Inherit;False;851;Counter 3 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;811;896,-1792;Inherit;False;1476;1091;;19;768;799;809;810;550;766;795;767;798;808;613;614;765;595;566;567;806;872;873;Color Mixing;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;786;336,-848;Inherit;False;Counter 2 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;761;368,-1536;Inherit;False;Counter 1 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;850;352,-16;Inherit;False;Counter 3 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;847;320,672;Inherit;False;Counter 4 Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;764;1136,352;Inherit;False;762;Counter 1 Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;617;1232,448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;616;1232,608;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;551;1232,832;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;763;1216,-560;Inherit;False;760;Counter 1 Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;727;1280,-288;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;728;1280,-64;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;726;1280,-448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;768;960,-1008;Inherit;False;761;Counter 1 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;799;960,-944;Inherit;False;786;Counter 2 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;766;944,-1456;Inherit;False;761;Counter 1 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;795;944,-1392;Inherit;False;786;Counter 2 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;767;944,-1296;Inherit;False;761;Counter 1 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;798;944,-1232;Inherit;False;786;Counter 2 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;810;960,-816;Inherit;False;847;Counter 4 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;809;960,-880;Inherit;False;850;Counter 3 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;808;944,-1168;Inherit;False;850;Counter 3 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;588;1456,352;Inherit;False;Property;_NumberofCounters;Number of Counters;0;0;Create;True;0;0;0;False;0;False;0;0;2;True;;KeywordEnum;4;One;Two;Three;Four;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;680;1520,-560;Inherit;False;Property;_NumberofCounters2;Number of Counters;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Reference;588;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;550;1264,-1008;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;613;1264,-1296;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;614;1264,-1456;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;765;1168,-1584;Inherit;False;761;Counter 1 Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;817;2688,-768;Inherit;False;2534.78;1580.484;;25;885;878;877;884;688;882;883;879;0;866;864;876;871;870;558;814;874;867;807;875;869;557;868;812;816;Final Merge and Output;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;813;1792,352;Inherit;False;Final Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;815;1824,-560;Inherit;False;Final Backing Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;595;1488,-1552;Inherit;False;Property;_NumberofCounters1;Number of Counters;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;One;Two;Three;Four;Reference;588;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;816;2816,192;Inherit;True;815;Final Backing Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;812;2816,-64;Inherit;True;813;Final Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;872;1632,-1760;Inherit;False;Property;_DigitColor;Digit Color;6;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,1,0,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;566;1776,-1552;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;873;2064,-1616;Inherit;False;Digit Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;868;3120,112;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;567;1968,-1744;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;869;3312,112;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;875;3328,336;Inherit;False;873;Digit Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;806;2128,-1744;Inherit;False;Final Color Out;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;557;2752,-400;Inherit;False;Property;_BackgroundTint;Background Tint;8;0;Create;True;0;0;0;False;0;False;0,0,0,0.8;1,1,1,0.9490196;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;874;3600,144;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;864;2688,-688;Inherit;True;Property;_Background;Background;7;0;Create;True;0;0;0;False;0;False;None;b8c058298615cde4b89d8fc3614382a6;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;877;3216,416;Inherit;True;Property;_AdditionalEmissives;Additional Emissives;9;0;Create;True;0;0;0;False;0;False;None;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;807;3424,-288;Inherit;False;806;Final Color Out;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;814;3456,-208;Inherit;False;813;Final Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;866;3008,-640;Inherit;True;Property;_TextureSample0;Texture Sample 0;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;688;3936,-48;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;878;3600,400;Inherit;True;Property;_TextureSample1;Texture Sample 0;21;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;885;3664,608;Inherit;False;Property;_AdditionalEmissivesTint;Additional Emissives Tint;10;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;False;0;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;867;3360,-560;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;558;3728,-368;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;882;4576,-32;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;884;4144,160;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;870;3744,-624;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;871;4000,-224;Inherit;False;Constant;_Float0;Float 0;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;876;4000,-144;Inherit;False;Constant;_Float1;Float 0;21;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;883;4704,-80;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;879;4544,-288;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;0;4864,-304;Float;False;True;-1;2;AmplifyShaderEditor.MaterialInspector;0;0;Standard;Tekcast/Counter;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;True;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Transparent;1;True;False;0;False;Transparent;;Transparent;All;12;all;True;True;True;False;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;4;1;False;;1;False;;0;False;;1;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;_Culling;-1;0;False;_Opacity;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;753;0;537;0
WireConnection;754;0;538;0
WireConnection;737;0;586;0
WireConnection;778;0;592;0
WireConnection;779;0;547;0
WireConnection;780;0;548;0
WireConnection;830;0;562;0
WireConnection;829;0;561;0
WireConnection;828;0;593;0
WireConnection;862;0;594;0
WireConnection;861;0;590;0
WireConnection;860;0;591;0
WireConnection;733;0;534;0
WireConnection;756;163;732;0
WireConnection;756;241;738;0
WireConnection;756;235;752;0
WireConnection;756;234;739;0
WireConnection;711;163;732;0
WireConnection;711;241;738;0
WireConnection;711;235;752;0
WireConnection;711;234;739;0
WireConnection;757;163;732;0
WireConnection;757;241;738;0
WireConnection;757;235;752;0
WireConnection;757;234;739;0
WireConnection;755;163;732;0
WireConnection;755;241;738;0
WireConnection;755;235;752;0
WireConnection;755;234;739;0
WireConnection;709;163;734;0
WireConnection;709;241;791;0
WireConnection;709;235;793;0
WireConnection;709;234;792;0
WireConnection;788;163;734;0
WireConnection;788;241;791;0
WireConnection;788;235;793;0
WireConnection;788;234;792;0
WireConnection;789;163;734;0
WireConnection;789;241;791;0
WireConnection;789;235;793;0
WireConnection;789;234;792;0
WireConnection;790;163;734;0
WireConnection;790;241;791;0
WireConnection;790;235;793;0
WireConnection;790;234;792;0
WireConnection;835;163;735;0
WireConnection;835;241;857;0
WireConnection;835;235;856;0
WireConnection;835;234;855;0
WireConnection;834;163;735;0
WireConnection;834;241;857;0
WireConnection;834;235;856;0
WireConnection;834;234;855;0
WireConnection;833;163;735;0
WireConnection;833;241;857;0
WireConnection;833;235;856;0
WireConnection;833;234;855;0
WireConnection;832;163;735;0
WireConnection;832;241;857;0
WireConnection;832;235;856;0
WireConnection;832;234;855;0
WireConnection;836;163;736;0
WireConnection;836;241;854;0
WireConnection;836;235;853;0
WireConnection;836;234;852;0
WireConnection;837;163;736;0
WireConnection;837;241;854;0
WireConnection;837;235;853;0
WireConnection;837;234;852;0
WireConnection;839;163;736;0
WireConnection;839;241;854;0
WireConnection;839;235;853;0
WireConnection;839;234;852;0
WireConnection;838;163;736;0
WireConnection;838;241;854;0
WireConnection;838;235;853;0
WireConnection;838;234;852;0
WireConnection;784;1;790;162
WireConnection;784;0;789;162
WireConnection;784;2;788;162
WireConnection;784;3;709;162
WireConnection;759;1;755;162
WireConnection;759;0;757;162
WireConnection;759;2;756;162
WireConnection;759;3;711;162
WireConnection;843;1;835;162
WireConnection;843;0;834;162
WireConnection;843;2;833;162
WireConnection;843;3;832;162
WireConnection;840;1;839;162
WireConnection;840;0;838;162
WireConnection;840;2;837;162
WireConnection;840;3;836;162
WireConnection;782;1;790;269
WireConnection;782;0;789;269
WireConnection;782;2;788;269
WireConnection;782;3;709;269
WireConnection;730;1;755;269
WireConnection;730;0;757;269
WireConnection;730;2;756;269
WireConnection;730;3;711;269
WireConnection;845;1;835;269
WireConnection;845;0;834;269
WireConnection;845;2;833;269
WireConnection;845;3;832;269
WireConnection;842;1;839;269
WireConnection;842;0;838;269
WireConnection;842;2;837;269
WireConnection;842;3;836;269
WireConnection;787;0;784;0
WireConnection;762;0;759;0
WireConnection;849;0;843;0
WireConnection;846;0;840;0
WireConnection;785;0;782;0
WireConnection;760;0;730;0
WireConnection;851;0;845;0
WireConnection;848;0;842;0
WireConnection;783;1;790;0
WireConnection;783;0;789;0
WireConnection;783;2;788;0
WireConnection;783;3;709;0
WireConnection;758;1;755;0
WireConnection;758;0;757;0
WireConnection;758;2;756;0
WireConnection;758;3;711;0
WireConnection;844;1;835;0
WireConnection;844;0;834;0
WireConnection;844;2;833;0
WireConnection;844;3;832;0
WireConnection;841;1;839;0
WireConnection;841;0;838;0
WireConnection;841;2;837;0
WireConnection;841;3;836;0
WireConnection;786;0;783;0
WireConnection;761;0;758;0
WireConnection;850;0;844;0
WireConnection;847;0;841;0
WireConnection;617;0;772;0
WireConnection;617;1;803;0
WireConnection;616;0;773;0
WireConnection;616;1;804;0
WireConnection;616;2;825;0
WireConnection;551;0;774;0
WireConnection;551;1;805;0
WireConnection;551;2;826;0
WireConnection;551;3;824;0
WireConnection;727;0;771;0
WireConnection;727;1;801;0
WireConnection;727;2;820;0
WireConnection;728;0;770;0
WireConnection;728;1;802;0
WireConnection;728;2;819;0
WireConnection;728;3;818;0
WireConnection;726;0;769;0
WireConnection;726;1;800;0
WireConnection;588;1;764;0
WireConnection;588;0;617;0
WireConnection;588;2;616;0
WireConnection;588;3;551;0
WireConnection;680;1;763;0
WireConnection;680;0;726;0
WireConnection;680;2;727;0
WireConnection;680;3;728;0
WireConnection;550;0;768;0
WireConnection;550;1;799;0
WireConnection;550;2;809;0
WireConnection;550;3;810;0
WireConnection;613;0;767;0
WireConnection;613;1;798;0
WireConnection;613;2;808;0
WireConnection;614;0;766;0
WireConnection;614;1;795;0
WireConnection;813;0;588;0
WireConnection;815;0;680;0
WireConnection;595;1;765;0
WireConnection;595;0;614;0
WireConnection;595;2;613;0
WireConnection;595;3;550;0
WireConnection;566;0;595;0
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
WireConnection;688;0;557;4
WireConnection;688;2;874;0
WireConnection;878;0;877;0
WireConnection;878;7;877;1
WireConnection;867;0;866;5
WireConnection;867;1;557;5
WireConnection;558;1;807;0
WireConnection;558;2;814;0
WireConnection;882;0;688;0
WireConnection;882;1;878;4
WireConnection;884;0;878;5
WireConnection;884;1;885;0
WireConnection;870;0;867;0
WireConnection;870;2;869;0
WireConnection;883;0;882;0
WireConnection;879;0;558;0
WireConnection;879;1;884;0
WireConnection;0;0;870;0
WireConnection;0;2;879;0
WireConnection;0;3;871;0
WireConnection;0;4;871;0
WireConnection;0;5;876;0
WireConnection;0;9;883;0
ASEEND*/
//CHKSM=DF087B48C5903EAE1125C21C164033C4F12B3F7F