//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EmissionParam;
//   float4 g_EyePosition;
//   sampler2D g_GISampler;
//   float4 g_PowerGlossLevel;
//   float4 g_Specular;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgGlobalLight_Specular;
//   float4 mrgInShadowScale;
//   float4 mrgLuminanceRange;
//   sampler2D sampDLScatter;
//   sampler2D sampDif;
//   sampler2D sampEmi;
//   samplerCUBE sampEnv;
//   sampler2D sampSpe;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   mrgGlobalLight_Direction c10      1
//   g_Diffuse                c16      1
//   g_Ambient                c17      1
//   g_Specular               c18      1
//   g_PowerGlossLevel        c20      1
//   g_EyePosition            c22      1
//   mrgGlobalLight_Diffuse   c36      1
//   mrgGlobalLight_Specular  c37      1
//   mrgLuminanceRange        c63      1
//   mrgInShadowScale         c64      1
//   g_EmissionParam          c150     1
//   sampDif                  s0       1
//   sampSpe                  s1       1
//   sampEmi                  s4       1
//   sampEnv                  s5       1
//   sampDLScatter            s9       1
//   g_GISampler              s10      1
//

    ps_3_0
    def c0, 10, 4, 0, 0
    dcl_texcoord v0
    dcl_texcoord1 v1.zw
    dcl_texcoord2 v2.xyz
    dcl_texcoord3_pp v3
    dcl_texcoord5 v4.xy
    dcl_color_pp v5
    dcl_2d s0
    dcl_2d s1
    dcl_2d s4
    dcl_cube s5
    dcl_2d s9
    dcl_2d s10
    texld_pp r0, v0, s0
    mul_pp r0.w, r0.w, c16.w
    mul_pp oC0.w, r0.w, v5.w
    add_pp r1.xyz, c22, -v2
    dp3_pp r0.w, r1, r1
    rsq_pp r0.w, r0.w
    mul r2.xyz, r0.w, r1
    mad_pp r1.xyz, r1, r0.w, -c10
    nrm_pp r3.xyz, r1
    nrm r1.xyz, v3
    dp3 r0.w, -r2, r1
    add r0.w, r0.w, r0.w
    mad_pp r2.xyz, r1, -r0.w, -r2
    mov_pp r2.w, -r2.z
    texld_pp r2, r2.xyww, s5
    texld r4, v0, s1
    mul r0.w, r4.w, c63.x
    mul r1.w, c64.z, c64.x
    mov r5.xz, c64
    mad r2.w, r5.x, -r5.z, r5.z
    texld r5, v0.zwzw, s10
    mad_pp r1.w, r5.w, r2.w, r1.w
    mul r0.w, r0.w, r1.w
    mul_pp r2.xyz, r0.w, r2
    dp3_sat_pp r0.w, r3, r1
    dp3_sat_pp r1.x, r1, -c10
    mul r1.x, r1.x, r5.w
    mul_pp r1.xyz, r1.x, c36
    mad_pp r1.xyz, r5, r5, r1
    mul_pp r1.w, r5.w, c20.z
    mul_pp r1.xyz, r1, c16
    mov r3.y, c20.y
    mul_pp r2.w, r3.y, c0.x
    exp_pp r2.w, r2.w
    mul_pp r2.w, r2.w, c0.y
    pow_pp r3.x, r0.w, r2.w
    mul_pp r0.w, r1.w, r3.x
    mul_pp r3.xyz, r0.w, c37
    mad_pp r2.xyz, r3, c18, r2
    mul_pp r2.xyz, r4, r2
    mul_pp r2.xyz, r2, v3.w
    mad_pp r0.xyz, r1, r0, r2
    texld_pp r1, v1.zwzw, s4
    add r1.xyz, r1, c150
    mul r1.xyz, r1, c17
    mul_pp r1.xyz, r1, c150.w
    mad_pp r0.xyz, r1, c17, r0
    mul_pp r0.xyz, r0, v5
    texld_pp r1, v4.yxzw, s9
    mad_pp oC0.xyz, r0, r1.w, r1

// approximately 56 instruction slots used (6 texture, 50 arithmetic)