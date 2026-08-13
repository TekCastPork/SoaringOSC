// Made with Amplify Shader Editor v1.9.9.12
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Tekcast/Prefab/Effect Counter"
{
	Properties
	{
		[NoScaleOffset] _Font( "Font", 2DArray ) = "white" {}
		[HDR] _DigitColor( "Digit Color", Color ) = ( 0, 0, 0, 0 )
		_Background( "Background", 2D ) = "white" {}
		_BackgroundTint( "Background Tint", Color ) = ( 0, 0, 0, 0.8 )
		_AdditionalEmissives( "Additional Emissives", 2D ) = "black" {}
		[HDR] _AdditionalEmissivesTint( "Additional Emissives Tint", Color ) = ( 0, 0, 0 )
		_ModerateMinutesScale( "Moderate Minutes Scale", Range( 0, 10 ) ) = 5.659362
		_VigorousMinutesScale( "Vigorous Minutes Scale", Range( 0, 10 ) ) = 0
		_RecoveryHoursScale( "Recovery Hours Scale", Range( 0, 10 ) ) = 0
		_ModerateMinutesOffset( "Moderate Minutes Offset", Vector ) = ( 0, 0, 0, 0 )
		_VigorousMinutesOffset( "Vigorous Minutes Offset", Vector ) = ( 0, 0, 0, 0 )
		_RecoveryHoursOffset( "Recovery Hours Offset", Vector ) = ( 0, 0, 0, 0 )
		_ModerateMinutes( "Moderate Minutes", Vector ) = ( 7, 7, 7, 7 )
		_VigorousMinutes( "Vigorous Minutes", Vector ) = ( 0, 0, 0, 0 )
		_RecoveryHours( "Recovery Hours", Vector ) = ( 0, 0, 0, 0 )
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "ForceNoShadowCasting" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#define ASE_VERSION 19912
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
		uniform float _ModerateMinutesScale;
		uniform float2 _ModerateMinutesOffset;
		uniform float4 _ModerateMinutes;
		SamplerState sampler_Font;
		uniform float _VigorousMinutesScale;
		uniform float2 _VigorousMinutesOffset;
		uniform float4 _VigorousMinutes;
		uniform float _RecoveryHoursScale;
		uniform float2 _RecoveryHoursOffset;
		uniform float4 _RecoveryHours;
		uniform float4 _DigitColor;
		uniform sampler2D _AdditionalEmissives;
		uniform float4 _AdditionalEmissives_ST;
		uniform float3 _AdditionalEmissivesTint;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float2 uv_Background = i.uv_texcoord * _Background_ST.xy + _Background_ST.zw;
			float2 appendResult129_g1394 = (float2(3.0 , 3.0));
			float Counter_1_Scale754 = _ModerateMinutesScale;
			float clampResult236_g1394 = clamp( Counter_1_Scale754 , 1.0 , 10.0 );
			float temp_output_114_0_g1394 =  (1.0 + ( clampResult236_g1394 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1394 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1394 = ( ( 1.0 - temp_output_114_0_g1394 ) * 1.5 );
			float2 appendResult130_g1394 = (float2(temp_output_127_0_g1394 , temp_output_127_0_g1394));
			float2 Counter_1_Offset753 = _ModerateMinutesOffset;
			float2 uv_TexCoord135_g1394 = i.uv_texcoord * ( appendResult129_g1394 * temp_output_114_0_g1394 ) + ( appendResult131_g1394 + appendResult130_g1394 + Counter_1_Offset753 );
			float2 clampResult143_g1394 = clamp( uv_TexCoord135_g1394 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_1_Digits737 = _ModerateMinutes;
			float4 break260_g1394 = Counter_1_Digits737;
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
			float4 color146_g1394 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1398 = color146_g1394;
			float clampResult5_g1395 = clamp( ( (temp_output_2_0_g1399).a + (temp_output_2_0_g1397).a + (temp_output_2_0_g1396).a + (temp_output_2_0_g1398).a ) , 0.0 , 1.0 );
			float Counter_1_Opacity762 = clampResult5_g1395;
			float2 appendResult129_g1383 = (float2(3.0 , 3.0));
			float Counter_2_Scale779 = _VigorousMinutesScale;
			float clampResult236_g1383 = clamp( Counter_2_Scale779 , 1.0 , 10.0 );
			float temp_output_114_0_g1383 =  (1.0 + ( clampResult236_g1383 - 1.0 ) * ( 7.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1383 = (float2(0.0 , -1.0));
			float temp_output_127_0_g1383 = ( ( 1.0 - temp_output_114_0_g1383 ) * 1.5 );
			float2 appendResult130_g1383 = (float2(temp_output_127_0_g1383 , temp_output_127_0_g1383));
			float2 Counter_2_Offset780 = _VigorousMinutesOffset;
			float2 uv_TexCoord135_g1383 = i.uv_texcoord * ( appendResult129_g1383 * temp_output_114_0_g1383 ) + ( appendResult131_g1383 + appendResult130_g1383 + Counter_2_Offset780 );
			float2 clampResult143_g1383 = clamp( uv_TexCoord135_g1383 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_2_Digits778 = _VigorousMinutes;
			float4 break260_g1383 = Counter_2_Digits778;
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
			float4 color146_g1383 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1387 = color146_g1383;
			float clampResult5_g1384 = clamp( ( (temp_output_2_0_g1388).a + (temp_output_2_0_g1386).a + (temp_output_2_0_g1385).a + (temp_output_2_0_g1387).a ) , 0.0 , 1.0 );
			float Counter_2_Opacity787 = clampResult5_g1384;
			float2 appendResult129_g1372 = (float2(2.0 , 2.0));
			float Counter_3_Scale829 = _RecoveryHoursScale;
			float clampResult236_g1372 = clamp( Counter_3_Scale829 , 1.0 , 10.0 );
			float temp_output_114_0_g1372 =  (1.0 + ( clampResult236_g1372 - 1.0 ) * ( 10.0 - 1.0 ) / ( 10.0 - 1.0 ) );
			float2 appendResult131_g1372 = (float2(0.0 , -0.5));
			float temp_output_127_0_g1372 = ( ( 1.0 - temp_output_114_0_g1372 ) * 1.0 );
			float2 appendResult130_g1372 = (float2(temp_output_127_0_g1372 , temp_output_127_0_g1372));
			float2 Counter_3_Offset830 = _RecoveryHoursOffset;
			float2 uv_TexCoord135_g1372 = i.uv_texcoord * ( appendResult129_g1372 * temp_output_114_0_g1372 ) + ( appendResult131_g1372 + appendResult130_g1372 + Counter_3_Offset830 );
			float2 clampResult143_g1372 = clamp( uv_TexCoord135_g1372 , float2( 0,0 ) , float2( 1,1 ) );
			float4 Counter_3_Digits828 = _RecoveryHours;
			float4 break260_g1372 = Counter_3_Digits828;
			float clampResult230_g1372 = clamp( break260_g1372.x , 0.0 , 9.0 );
			float4 temp_output_2_0_g1377 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1372,clampResult230_g1372) );
			float2 clampResult138_g1372 = clamp( uv_TexCoord135_g1372 , float2( 1,0 ) , float2( 2,1 ) );
			float clampResult231_g1372 = clamp( break260_g1372.y , 0.0 , 9.0 );
			float4 tex2DArrayNode144_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1372,clampResult231_g1372) );
			float4 temp_output_2_0_g1375 = tex2DArrayNode144_g1372;
			float4 color146_g1372 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1374 = color146_g1372;
			float4 temp_output_2_0_g1376 = color146_g1372;
			float clampResult5_g1373 = clamp( ( (temp_output_2_0_g1377).a + (temp_output_2_0_g1375).a + (temp_output_2_0_g1374).a + (temp_output_2_0_g1376).a ) , 0.0 , 1.0 );
			float Counter_3_Opacity849 = clampResult5_g1373;
			float Final_Opacity813 = ( Counter_1_Opacity762 + Counter_2_Opacity787 + Counter_3_Opacity849 );
			float4 temp_output_2_0_g1404 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1394,0.0) );
			float4 tex2DArrayNode265_g1394 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1394,0.0) );
			float4 temp_output_2_0_g1402 = tex2DArrayNode265_g1394;
			float4 tex2DArrayNode264_g1394 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1394,0.0) );
			float4 temp_output_2_0_g1401 = tex2DArrayNode264_g1394;
			float4 color271_g1394 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1403 = color271_g1394;
			float clampResult5_g1400 = clamp( ( (temp_output_2_0_g1404).a + (temp_output_2_0_g1402).a + (temp_output_2_0_g1401).a + (temp_output_2_0_g1403).a ) , 0.0 , 1.0 );
			float Counter_1_Backing_Alpha760 = clampResult5_g1400;
			float4 temp_output_2_0_g1393 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1383,0.0) );
			float4 tex2DArrayNode265_g1383 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1383,0.0) );
			float4 temp_output_2_0_g1391 = tex2DArrayNode265_g1383;
			float4 tex2DArrayNode264_g1383 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult139_g1383,0.0) );
			float4 temp_output_2_0_g1390 = tex2DArrayNode264_g1383;
			float4 color271_g1383 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1392 = color271_g1383;
			float clampResult5_g1389 = clamp( ( (temp_output_2_0_g1393).a + (temp_output_2_0_g1391).a + (temp_output_2_0_g1390).a + (temp_output_2_0_g1392).a ) , 0.0 , 1.0 );
			float Counter_2_Backing_Alpha785 = clampResult5_g1389;
			float4 temp_output_2_0_g1382 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult143_g1372,0.0) );
			float4 tex2DArrayNode265_g1372 = SAMPLE_TEXTURE2D_ARRAY( _Font, sampler_Font, float3(clampResult138_g1372,0.0) );
			float4 temp_output_2_0_g1380 = tex2DArrayNode265_g1372;
			float4 color271_g1372 = IsGammaSpace() ? float4( 0, 0, 0, 0 ) : float4( 0, 0, 0, 0 );
			float4 temp_output_2_0_g1379 = color271_g1372;
			float4 temp_output_2_0_g1381 = color271_g1372;
			float clampResult5_g1378 = clamp( ( (temp_output_2_0_g1382).a + (temp_output_2_0_g1380).a + (temp_output_2_0_g1379).a + (temp_output_2_0_g1381).a ) , 0.0 , 1.0 );
			float Counter_3_Backing_Alpha851 = clampResult5_g1378;
			float Final_Backing_Alpha815 = ( Counter_1_Backing_Alpha760 + Counter_2_Backing_Alpha785 + Counter_3_Backing_Alpha851 );
			float clampResult869 = clamp( ( Final_Opacity813 + Final_Backing_Alpha815 ) , 0.0 , 1.0 );
			float3 lerpResult870 = lerp( ( tex2D( _Background, uv_Background ).rgb * _BackgroundTint.rgb ) , float3( 0,0,0 ) , clampResult869);
			o.Albedo = lerpResult870;
			float3 clampResult3_g1395 = clamp( ( (temp_output_2_0_g1399).rgb + (temp_output_2_0_g1397).rgb + (temp_output_2_0_g1396).rgb + (temp_output_2_0_g1398).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_1_Color761 = ( float3( 1,1,1 ) * clampResult3_g1395 );
			float3 clampResult3_g1384 = clamp( ( (temp_output_2_0_g1388).rgb + (temp_output_2_0_g1386).rgb + (temp_output_2_0_g1385).rgb + (temp_output_2_0_g1387).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_2_Color786 = ( float3( 1,1,1 ) * clampResult3_g1384 );
			float3 clampResult3_g1373 = clamp( ( (temp_output_2_0_g1377).rgb + (temp_output_2_0_g1375).rgb + (temp_output_2_0_g1374).rgb + (temp_output_2_0_g1376).rgb ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
			float3 Counter_3_Color850 = ( float3( 1,1,1 ) * clampResult3_g1373 );
			float3 clampResult566 = clamp( ( Counter_1_Color761 + Counter_2_Color786 + Counter_3_Color850 ) , float3( 0,0,0 ) , float3( 1,1,1 ) );
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
	Fallback Off
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19912
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":831,"pos":[-1792,-464],"params":["Inherit","False","580","467","","6","593","561","562","828","829","830","Counter 3 Params","0,1,0,1","0","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":729,"pos":[-1792,-1664],"params":["Inherit","False","596.571","454.5729","","6","737","586","537","538","754","753","Counter 1 Params","1,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":781,"pos":[-1792,-1088],"params":["Inherit","False","612","467","","6","592","547","548","778","779","780","Counter 2 Params","1,1,0.4,1","0","0"]}
{"type":"AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor","id":534,"pos":[-1792,-2016],"params":["Inherit","True","Property","_Font","Font","0","1","[NoScaleOffset]","Create","True","0","0","0","False","0","False","","7b433ff0a41187141b92f092b5f98afd","7b433ff0a41187141b92f092b5f98afd","False","white","Auto","Texture2DArray","False","-1","0","2","SAMPLER2DARRAY","0","SAMPLERSTATE","1"]}
{"type":"AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor","id":593,"pos":[-1744,-416],"params":["Inherit","False","Property","_RecoveryHours","Recovery Hours","16","0","Create","True","1","Counter Digit Values","0","0","False","0","False","Object","-1","","0,0,0,0","0,0,0,0","0","5","FLOAT4","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4"]}
{"type":"AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor","id":561,"pos":[-1744,-240],"params":["Inherit","False","Property","_RecoveryHoursScale","Recovery Hours Scale","8","0","Create","True","0","0","0","False","0","False","Object","-1","","0","6","0","10","0","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor","id":562,"pos":[-1744,-160],"params":["Inherit","False","Property","_RecoveryHoursOffset","Recovery Hours Offset","12","0","Create","True","0","0","0","False","0","False","Object","-1","","0,0","3.41,-0.87","0","3","FLOAT2","0","FLOAT","1","FLOAT","2"]}
{"type":"AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor","id":586,"pos":[-1776,-1616],"params":["Inherit","False","Property","_ModerateMinutes","Moderate Minutes","14","0","Create","True","1","Counter Digit Values","0","0","False","0","False","Object","-1","","7,7,7,7","7,7,7,7","0","5","FLOAT4","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4"]}
{"type":"AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor","id":538,"pos":[-1776,-1440],"params":["Inherit","False","Property","_ModerateMinutesScale","Moderate Minutes Scale","6","0","Create","True","1","Counter Scales","0","0","False","0","False","Object","-1","","5.659362","10","0","10","0","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor","id":537,"pos":[-1776,-1344],"params":["Inherit","False","Property","_ModerateMinutesOffset","Moderate Minutes Offset","10","0","Create","True","1","Counter Offsets","0","0","False","0","False","Object","-1","","0,0","-4.56,-3.7","0","3","FLOAT2","0","FLOAT","1","FLOAT","2"]}
{"type":"AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor","id":592,"pos":[-1744,-1024],"params":["Inherit","False","Property","_VigorousMinutes","Vigorous Minutes","15","0","Create","True","1","Counter Digit Values","0","0","False","0","False","Object","-1","","0,0,0,0","0,0,0,0","0","5","FLOAT4","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4"]}
{"type":"AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor","id":547,"pos":[-1744,-848],"params":["Inherit","False","Property","_VigorousMinutesScale","Vigorous Minutes Scale","7","0","Create","True","0","0","0","False","0","False","Object","-1","","0","10","0","10","0","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor","id":548,"pos":[-1744,-768],"params":["Inherit","False","Property","_VigorousMinutesOffset","Vigorous Minutes Offset","11","0","Create","True","0","0","0","False","0","False","Object","-1","","0,0","-4.56,0.3","0","3","FLOAT2","0","FLOAT","1","FLOAT","2"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":858,"pos":[-802,-306],"params":["Inherit","False","1428","667","","8","735","833","851","850","849","857","856","855","Counter 3 Generator","0,1,0,1","0","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":794,"pos":[-768,-1056],"params":["Inherit","False","1380","667","Comment","8","786","787","785","788","734","793","792","791","Counter 2 Generator","1,1,0.4,1","0","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":777,"pos":[-768,-1792],"params":["Inherit","False","1412","683","","8","738","732","752","739","756","760","762","761","Counter 1 Generator","1,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":753,"pos":[-1456,-1344],"params":["Inherit","False","Counter 1 Offset","-1","True","1","0","FLOAT2","0,0","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":754,"pos":[-1456,-1440],"params":["Inherit","False","Counter 1 Scale","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":737,"pos":[-1456,-1616],"params":["Inherit","False","Counter 1 Digits","-1","True","1","0","FLOAT4","0,0,0,0","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":778,"pos":[-1424,-1024],"params":["Inherit","False","Counter 2 Digits","-1","True","1","0","FLOAT4","0,0,0,0","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":779,"pos":[-1424,-848],"params":["Inherit","False","Counter 2 Scale","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":780,"pos":[-1424,-768],"params":["Inherit","False","Counter 2 Offset","-1","True","1","0","FLOAT2","0,0","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":830,"pos":[-1456,-160],"params":["Inherit","False","Counter 3 Offset","-1","True","1","0","FLOAT2","0,0","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":829,"pos":[-1456,-240],"params":["Inherit","False","Counter 3 Scale","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":733,"pos":[-1568,-2016],"params":["Inherit","False","FontTex","-1","True","1","0","SAMPLER2DARRAY","","False","1","SAMPLER2DARRAY","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":828,"pos":[-1456,-416],"params":["Inherit","False","Counter 3 Digits","-1","True","1","0","FLOAT4","0,0,0,0","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":732,"pos":[-688,-1632],"params":["Inherit","False","733","FontTex","1","0","OBJECT","","False","1","SAMPLER2DARRAY","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":734,"pos":[-688,-928],"params":["Inherit","False","733","FontTex","1","0","OBJECT","","False","1","SAMPLER2DARRAY","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":792,"pos":[-720,-688],"params":["Inherit","False","780","Counter 2 Offset","1","0","OBJECT","","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":793,"pos":[-720,-768],"params":["Inherit","False","779","Counter 2 Scale","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":791,"pos":[-720,-848],"params":["Inherit","False","778","Counter 2 Digits","1","0","OBJECT","","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":739,"pos":[-720,-1376],"params":["Inherit","False","753","Counter 1 Offset","1","0","OBJECT","","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":752,"pos":[-704,-1456],"params":["Inherit","False","754","Counter 1 Scale","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":738,"pos":[-720,-1552],"params":["Inherit","False","737","Counter 1 Digits","1","0","OBJECT","","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":856,"pos":[-736,160],"params":["Inherit","False","829","Counter 3 Scale","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":855,"pos":[-752,240],"params":["Inherit","False","830","Counter 3 Offset","1","0","OBJECT","","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":735,"pos":[-720,-16],"params":["Inherit","False","733","FontTex","1","0","OBJECT","","False","1","SAMPLER2DARRAY","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":857,"pos":[-752,64],"params":["Inherit","False","828","Counter 3 Digits","1","0","OBJECT","","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":811,"pos":[896,-1792],"params":["Inherit","False","1476","1091","","10","767","798","808","613","566","567","806","872","873","892","Color Mixing","1,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":786,"pos":[336,-848],"params":["Inherit","False","Counter 2 Color","-1","True","1","0","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":761,"pos":[368,-1536],"params":["Inherit","False","Counter 1 Color","-1","True","1","0","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":850,"pos":[352,-16],"params":["Inherit","False","Counter 3 Color","-1","True","1","0","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor","id":833,"pos":[-352,32],"params":["Inherit","False","Create Number","-1","","1372","36bba83cc54e07e449728c7a7faa3517","10,166,1,167,1,222,1,223,1,224,1,225,1,221,1,270,1,273,1,272,1","4","163","SAMPLER2DARRAY","0","False","241","FLOAT4","0,0,0,0","False","235","FLOAT","0","False","234","FLOAT2","0,0","False","3","FLOAT","269","FLOAT3","0","FLOAT","162"]}
{"type":"AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor","id":788,"pos":[-352,-720],"params":["Inherit","False","Create Number","-1","","1383","36bba83cc54e07e449728c7a7faa3517","10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2","4","163","SAMPLER2DARRAY","0","False","241","FLOAT4","0,0,0,0","False","235","FLOAT","0","False","234","FLOAT2","0,0","False","3","FLOAT","269","FLOAT3","0","FLOAT","162"]}
{"type":"AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor","id":756,"pos":[-320,-1504],"params":["Inherit","False","Create Number","-1","","1394","36bba83cc54e07e449728c7a7faa3517","10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2","4","163","SAMPLER2DARRAY","0","False","241","FLOAT4","0,0,0,0","False","235","FLOAT","0","False","234","FLOAT2","0,0","False","3","FLOAT","269","FLOAT3","0","FLOAT","162"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":821,"pos":[896,-608],"params":["Inherit","False","1188","851","","6","771","801","820","727","815","891","Backing Mixing","1,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":827,"pos":[896,304],"params":["Inherit","False","1131.013","829.8878","","6","813","616","825","804","773","886","Opacity Mixing","1,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":785,"pos":[336,-1008],"params":["Inherit","False","Counter 2 Backing Alpha","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":760,"pos":[368,-1712],"params":["Inherit","False","Counter 1 Backing Alpha","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":851,"pos":[352,-192],"params":["Inherit","False","Counter 3 Backing Alpha","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":787,"pos":[336,-688],"params":["Inherit","False","Counter 2 Opacity","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":762,"pos":[368,-1376],"params":["Inherit","False","Counter 1 Opacity","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":849,"pos":[352,144],"params":["Inherit","False","Counter 3 Opacity","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":767,"pos":[944,-1296],"params":["Inherit","False","761","Counter 1 Color","1","0","OBJECT","","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":798,"pos":[944,-1232],"params":["Inherit","False","786","Counter 2 Color","1","0","OBJECT","","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":808,"pos":[944,-1168],"params":["Inherit","False","850","Counter 3 Color","1","0","OBJECT","","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":771,"pos":[960,-288],"params":["Inherit","False","760","Counter 1 Backing Alpha","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":801,"pos":[960,-224],"params":["Inherit","False","785","Counter 2 Backing Alpha","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":773,"pos":[944,608],"params":["Inherit","False","762","Counter 1 Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":804,"pos":[944,672],"params":["Inherit","False","787","Counter 2 Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":825,"pos":[944,736],"params":["Inherit","False","849","Counter 3 Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":820,"pos":[960,-160],"params":["Inherit","False","851","Counter 3 Backing Alpha","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor","id":613,"pos":[1264,-1296],"params":["Inherit","False","3","3","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","2","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor","id":727,"pos":[1280,-288],"params":["Inherit","False","3","3","0","FLOAT","0","False","1","FLOAT","0","False","2","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor","id":616,"pos":[1232,608],"params":["Inherit","False","3","3","0","FLOAT","0","False","1","FLOAT","0","False","2","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.ColorNode, AmplifyShaderEditor","id":872,"pos":[1632,-1760],"params":["Inherit","False","Property","_DigitColor","Digit Color","1","1","[HDR]","Create","True","0","0","0","False","0","False","Object","-1","","0,0,0,0","0,1,0,1","True","True","0","6","COLOR","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4","FLOAT3","5"]}
{"type":"AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor","id":566,"pos":[1776,-1552],"params":["Inherit","False","3","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","2","FLOAT3","1,1,1","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":817,"pos":[2688,-768],"params":["Inherit","False","2534.78","1580.484","","26","885","878","877","884","688","883","879","0","866","864","876","871","870","558","814","874","867","807","875","869","557","868","812","816","889","890","Final Merge and Output","1,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":813,"pos":[1792,352],"params":["Inherit","True","Final Opacity","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":815,"pos":[1824,-560],"params":["Inherit","False","Final Backing Alpha","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":873,"pos":[2064,-1616],"params":["Inherit","False","Digit Opacity","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor","id":567,"pos":[1968,-1744],"params":["Inherit","False","2","2","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":816,"pos":[2816,192],"params":["Inherit","True","815","Final Backing Alpha","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":812,"pos":[2816,-64],"params":["Inherit","True","813","Final Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":875,"pos":[3328,336],"params":["Inherit","False","873","Digit Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":806,"pos":[2128,-1744],"params":["Inherit","False","Final Color Out","-1","True","1","0","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor","id":864,"pos":[2688,-688],"params":["Inherit","True","Property","_Background","Background","2","0","Create","True","0","0","0","False","0","False","","None","ef5d6444662681a40be57bdac91b4cb8","False","white","Auto","Texture2D","False","-1","0","2","SAMPLER2D","0","SAMPLERSTATE","1"]}
{"type":"AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor","id":877,"pos":[3216,416],"params":["Inherit","True","Property","_AdditionalEmissives","Additional Emissives","4","0","Create","True","0","0","0","False","0","False","","None","4716bf11aa76cda4f9f795ef06dba664","False","black","Auto","Texture2D","False","-1","0","2","SAMPLER2D","0","SAMPLERSTATE","1"]}
{"type":"AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor","id":868,"pos":[3120,112],"params":["Inherit","False","2","2","0","FLOAT","0","False","1","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.ColorNode, AmplifyShaderEditor","id":557,"pos":[2752,-400],"params":["Inherit","False","Property","_BackgroundTint","Background Tint","3","0","Create","True","0","0","0","False","0","False","Object","-1","","0,0,0,0.8","1,1,1,0.9607843","True","True","0","6","COLOR","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4","FLOAT3","5"]}
{"type":"AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor","id":874,"pos":[3600,144],"params":["Inherit","True","2","2","0","FLOAT","0","False","1","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":807,"pos":[3424,-288],"params":["Inherit","False","806","Final Color Out","1","0","OBJECT","","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":814,"pos":[3456,-208],"params":["Inherit","False","813","Final Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor","id":866,"pos":[3008,-640],"params":["Inherit","True","Property","_TextureSample0","Texture Sample 0","21","0","Create","True","0","0","0","False","0","False","","-1","None","None","True","0","False","white","Auto","False","Object","-1","Auto","Texture2D","False","8","0","SAMPLER2D","","False","1","FLOAT2","0,0","False","2","FLOAT","0","False","3","FLOAT2","0,0","False","4","FLOAT2","0,0","False","5","FLOAT","1","False","6","FLOAT","0","False","7","SAMPLERSTATE","","False","6","COLOR","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4","FLOAT3","5"]}
{"type":"AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor","id":878,"pos":[3600,400],"params":["Inherit","True","Property","_TextureSample1","Texture Sample 0","21","0","Create","True","0","0","0","False","0","False","","-1","None","None","True","0","False","white","Auto","False","Object","-1","Auto","Texture2D","False","8","0","SAMPLER2D","","False","1","FLOAT2","0,0","False","2","FLOAT","0","False","3","FLOAT2","0,0","False","4","FLOAT2","0,0","False","5","FLOAT","1","False","6","FLOAT","0","False","7","SAMPLERSTATE","","False","6","COLOR","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4","FLOAT3","5"]}
{"type":"AmplifyShaderEditor.ColorNode, AmplifyShaderEditor","id":885,"pos":[3664,608],"params":["Inherit","False","Property","_AdditionalEmissivesTint","Additional Emissives Tint","5","1","[HDR]","Create","True","0","0","0","False","0","False","Object","-1","","0,0,0,0","1,1,1,0","True","False","0","6","FLOAT3","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4","FLOAT3","5"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":863,"pos":[-1792,144],"params":["Inherit","False","564","483","","6","594","590","591","862","861","860","Counter 4 Params","0,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.CommentaryNode, AmplifyShaderEditor","id":859,"pos":[-754,462],"params":["Inherit","False","1348","667","","8","736","837","848","847","846","852","853","854","Counter 4 Generator","0,1,1,1","0","0"]}
{"type":"AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor","id":869,"pos":[3312,112],"params":["Inherit","True","3","0","FLOAT","0","False","1","FLOAT","0","False","2","FLOAT","1","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.LerpOp, AmplifyShaderEditor","id":688,"pos":[3936,-48],"params":["Inherit","True","3","0","FLOAT","0","False","1","FLOAT","1","False","2","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor","id":867,"pos":[3360,-560],"params":["Inherit","True","2","2","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.LerpOp, AmplifyShaderEditor","id":558,"pos":[3728,-368],"params":["Inherit","True","3","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","2","FLOAT","0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.SimpleMultiplyOpNode, AmplifyShaderEditor","id":884,"pos":[4144,160],"params":["Inherit","True","2","2","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.Vector4Node, AmplifyShaderEditor","id":594,"pos":[-1744,192],"params":["Inherit","False","Property","_AvgHeartRate","Avg HeartRate","17","0","Create","True","1","Counter Digit Values","0","0","False","0","False","Object","-1","","0,0,0,0","0,0,0,0","0","5","FLOAT4","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4"]}
{"type":"AmplifyShaderEditor.Vector2Node, AmplifyShaderEditor","id":591,"pos":[-1744,464],"params":["Inherit","False","Property","_AvgHeartRateOffset","Avg HeartRate Offset","13","0","Create","True","0","0","0","False","0","False","Object","-1","","0,0","0,0.9","0","3","FLOAT2","0","FLOAT","1","FLOAT","2"]}
{"type":"AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor","id":590,"pos":[-1744,368],"params":["Inherit","False","Property","_AvgHeartRateScale","Avg HeartRate Scale","9","0","Create","True","0","0","0","False","0","False","Object","-1","","0","7","0","10","0","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":862,"pos":[-1472,192],"params":["Inherit","False","Counter 4 Digits","-1","True","1","0","FLOAT4","0,0,0,0","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":861,"pos":[-1472,368],"params":["Inherit","False","Counter 4 Scale","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":860,"pos":[-1472,464],"params":["Inherit","False","Counter 4 Offset","-1","True","1","0","FLOAT2","0,0","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":736,"pos":[-672,640],"params":["Inherit","False","733","FontTex","1","0","OBJECT","","False","1","SAMPLER2DARRAY","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":854,"pos":[-704,720],"params":["Inherit","False","862","Counter 4 Digits","1","0","OBJECT","","False","1","FLOAT4","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":853,"pos":[-704,800],"params":["Inherit","False","861","Counter 4 Scale","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":852,"pos":[-704,880],"params":["Inherit","False","860","Counter 4 Offset","1","0","OBJECT","","False","1","FLOAT2","0"]}
{"type":"AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor","id":837,"pos":[-352,800],"params":["Inherit","False","Create Number","-1","","1405","36bba83cc54e07e449728c7a7faa3517","10,166,2,167,2,222,2,223,2,224,2,225,2,221,2,270,2,273,2,272,2","4","163","SAMPLER2DARRAY","0","False","241","FLOAT4","0,0,0,0","False","235","FLOAT","0","False","234","FLOAT2","0,0","False","3","FLOAT","269","FLOAT3","0","FLOAT","162"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":848,"pos":[320,512],"params":["Inherit","False","Counter 4 Backing Alpha","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":846,"pos":[320,832],"params":["Inherit","False","Counter 4 Opacity","-1","True","1","0","FLOAT","0","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":886,"pos":[944,800],"params":["Inherit","False","846","Counter 4 Opacity","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor","id":847,"pos":[320,672],"params":["Inherit","False","Counter 4 Color","-1","True","1","0","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.TexturePropertyNode, AmplifyShaderEditor","id":890,"pos":[4144,-704],"params":["Inherit","True","Property","_Normal","Normal","18","1","[Normal]","Create","True","0","0","0","False","0","False","","None","None","True","bump","Auto","Texture2D","False","-1","0","2","SAMPLER2D","0","SAMPLERSTATE","1"]}
{"type":"AmplifyShaderEditor.LerpOp, AmplifyShaderEditor","id":870,"pos":[3744,-624],"params":["Inherit","True","3","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","2","FLOAT","0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.SamplerNode, AmplifyShaderEditor","id":889,"pos":[4416,-624],"params":["Inherit","True","Property","_TextureSample2","Texture Sample 2","18","1","[Normal]","Create","True","0","0","0","False","0","False","","-1","None","None","True","0","False","white","Auto","False","Object","-1","Auto","Texture2D","False","8","0","SAMPLER2D","","False","1","FLOAT2","0,0","False","2","FLOAT","0","False","3","FLOAT2","0,0","False","4","FLOAT2","0,0","False","5","FLOAT","1","False","6","FLOAT","0","False","7","SAMPLERSTATE","","False","6","COLOR","0","FLOAT","1","FLOAT","2","FLOAT","3","FLOAT","4","FLOAT3","5"]}
{"type":"AmplifyShaderEditor.SimpleAddOpNode, AmplifyShaderEditor","id":879,"pos":[4368,-320],"params":["Inherit","True","2","2","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.ClampOpNode, AmplifyShaderEditor","id":883,"pos":[4544,128],"params":["Inherit","True","3","0","FLOAT","0","False","1","FLOAT","0","False","2","FLOAT","1","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor","id":871,"pos":[4608,-208],"params":["Inherit","False","Constant","_Float0","Float 0","21","0","Create","True","0","0","0","False","0","False","Object","-1","","0","0","0","0","0","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor","id":876,"pos":[4576,-128],"params":["Inherit","False","Constant","_Float1","Float 0","21","0","Create","True","0","0","0","False","0","False","Object","-1","","1","0","0","0","0","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":891,"pos":[960,-96],"params":["Inherit","False","848","Counter 4 Backing Alpha","1","0","OBJECT","","False","1","FLOAT","0"]}
{"type":"AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor","id":892,"pos":[944,-1104],"params":["Inherit","False","847","Counter 4 Color","1","0","OBJECT","","False","1","FLOAT3","0"]}
{"type":"AmplifyShaderEditor.StandardSurfaceOutputNode, AmplifyShaderEditor","id":0,"pos":[4864,-304],"params":["Float","False","True","-1","2","AmplifyShaderEditor.MaterialInspector","0","0","StandardSpecular","Tekcast/Prefab/Effect Counter","False","False","False","False","True","True","True","True","True","True","True","True","False","False","True","True","False","False","False","False","False","Back","0","False","","0","False","","False","0","False","","0","False","","False","0","0","False","","0","Transparent","1","True","False","0","False","Transparent","","Transparent","All","12","all","True","True","True","False","0","False","","False","0","False","","255","False","","255","False","","0","False","","0","False","","0","False","","0","False","","0","False","","0","False","","0","False","","0","False","","False","2","15","10","25","False","0.5","False","2","5","False","","10","False","","4","1","False","","1","False","","0","False","","1","False","","0","False","0","0,0,0,0","VertexOffset","True","False","Cylindrical","False","True","Relative","0","","-1","-1","-1","-1","0","False","0","0","False","","-1","0","False","","0","0","0","False","0.1","False","","0","False","","False","17","0","FLOAT3","0,0,0","False","1","FLOAT3","0,0,0","False","2","FLOAT3","0,0,0","False","3","FLOAT3","0,0,0","False","4","FLOAT","0","False","5","FLOAT","0","False","6","FLOAT3","0,0,0","False","7","FLOAT3","0,0,0","False","8","FLOAT","0","False","9","FLOAT","0","False","10","FLOAT","0","False","13","FLOAT3","0,0,0","False","11","FLOAT3","0,0,0","False","12","FLOAT3","0,0,0","False","16","FLOAT4","0,0,0,0","False","14","FLOAT4","0,0,0,0","False","15","FLOAT3","0,0,0","False","0"]}
{"wire":[753,0,537,0]}
{"wire":[754,0,538,0]}
{"wire":[737,0,586,0]}
{"wire":[778,0,592,0]}
{"wire":[779,0,547,0]}
{"wire":[780,0,548,0]}
{"wire":[830,0,562,0]}
{"wire":[829,0,561,0]}
{"wire":[733,0,534,0]}
{"wire":[828,0,593,0]}
{"wire":[786,0,788,0]}
{"wire":[761,0,756,0]}
{"wire":[850,0,833,0]}
{"wire":[833,163,735,0]}
{"wire":[833,241,857,0]}
{"wire":[833,235,856,0]}
{"wire":[833,234,855,0]}
{"wire":[788,163,734,0]}
{"wire":[788,241,791,0]}
{"wire":[788,235,793,0]}
{"wire":[788,234,792,0]}
{"wire":[756,163,732,0]}
{"wire":[756,241,738,0]}
{"wire":[756,235,752,0]}
{"wire":[756,234,739,0]}
{"wire":[785,0,788,269]}
{"wire":[760,0,756,269]}
{"wire":[851,0,833,269]}
{"wire":[787,0,788,162]}
{"wire":[762,0,756,162]}
{"wire":[849,0,833,162]}
{"wire":[613,0,767,0]}
{"wire":[613,1,798,0]}
{"wire":[613,2,808,0]}
{"wire":[727,0,771,0]}
{"wire":[727,1,801,0]}
{"wire":[727,2,820,0]}
{"wire":[616,0,773,0]}
{"wire":[616,1,804,0]}
{"wire":[616,2,825,0]}
{"wire":[566,0,613,0]}
{"wire":[813,0,616,0]}
{"wire":[815,0,727,0]}
{"wire":[873,0,872,4]}
{"wire":[567,0,872,5]}
{"wire":[567,1,566,0]}
{"wire":[806,0,567,0]}
{"wire":[868,0,812,0]}
{"wire":[868,1,816,0]}
{"wire":[874,0,869,0]}
{"wire":[874,1,875,0]}
{"wire":[866,0,864,0]}
{"wire":[866,7,864,1]}
{"wire":[878,0,877,0]}
{"wire":[878,7,877,1]}
{"wire":[869,0,868,0]}
{"wire":[688,0,557,4]}
{"wire":[688,2,874,0]}
{"wire":[867,0,866,5]}
{"wire":[867,1,557,5]}
{"wire":[558,1,807,0]}
{"wire":[558,2,814,0]}
{"wire":[884,0,878,5]}
{"wire":[884,1,885,0]}
{"wire":[862,0,594,0]}
{"wire":[861,0,590,0]}
{"wire":[860,0,591,0]}
{"wire":[837,163,736,0]}
{"wire":[837,241,854,0]}
{"wire":[837,235,853,0]}
{"wire":[837,234,852,0]}
{"wire":[848,0,837,269]}
{"wire":[846,0,837,162]}
{"wire":[847,0,837,0]}
{"wire":[870,0,867,0]}
{"wire":[870,2,869,0]}
{"wire":[889,0,890,0]}
{"wire":[889,7,890,1]}
{"wire":[879,0,558,0]}
{"wire":[879,1,884,0]}
{"wire":[883,0,688,0]}
{"wire":[0,0,870,0]}
{"wire":[0,2,879,0]}
{"wire":[0,4,871,0]}
{"wire":[0,5,876,0]}
{"wire":[0,9,883,0]}
ASEEND*/
//CHKSM=CA7F23CDC3D8C993CB398EA1F07FCDDFDE1381DC