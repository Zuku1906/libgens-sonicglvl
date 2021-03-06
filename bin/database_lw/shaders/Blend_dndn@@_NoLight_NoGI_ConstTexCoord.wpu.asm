//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_aLightField[6];
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   sampler2D sampDLScatter;
//   sampler2D sampDif0;
//   sampler2D sampDif1;
//   sampler2D sampNrm0;
//   sampler2D sampNrm1;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   mrgGlobalLight_Direction c10      1
//   g_Diffuse                c16      1
//   g_Ambient                c17      1
//   mrgGlobalLight_Diffuse   c36      1
//   g_aLightField            c77      6
//   sampDif0                 s0       1
//   sampDif1                 s1       1
//   sampNrm0                 s4       1
//   sampNrm1                 s5       1
//   sampDLScatter            s9       1
//

    ps_3_0
    def c0, 2, -1, 1, 0.5
    dcl_texcoord v0.xy
    dcl_texcoord1 v1.xy
    dcl_texcoord3 v2.xyz
    dcl_texcoord5 v3.xy
    dcl_texcoord7 v4.xyz
    dcl_texcoord8 v5.xyz
    dcl_color_pp v6
    dcl_2d s0
    dcl_2d s1
    dcl_2d s4
    dcl_2d s5
    dcl_2d s9
    texld_pp r0, v0, s0
    texld_pp r1, v1, s1
    lrp_pp r2, v6.w, r0, r1
    mul_pp oC0.w, r2.w, c16.w
    nrm_pp r0.xyz, v5
    texld_pp r1, v0, s4
    texld_pp r3, v1, s5
    lrp_pp r4.yzw, v6.w, r1.xxyw, r3.xxyw
    mul_pp r4.x, r4.w, r4.y
    mad_pp r1.xy, r4.xzzw, c0.x, c0.y
    mul_pp r0.xyz, r0, r1.y
    nrm_pp r3.xyz, v4
    mad_pp r0.xyz, r1.x, r3, r0
    dp2add_pp r0.w, r1, -r1, c0.z
    rsq_pp r0.w, r0.w
    rcp_pp r0.w, r0.w
    nrm_pp r1.xyz, v2
    mad_pp r0.xyz, r0.w, r1, r0
    mad_pp r1.xyz, r0, c0.w, c0.w
    mov r3.xyz, c77
    mad r3.xyz, c78, r1.x, r3
    mul_pp r4.xyz, r0, r0
    dp3_sat_pp r0.x, r0, -c10
    mul r0.x, r0.x, c77.w
    mul_pp r0.xyz, r0.x, c36
    mov r5.xyz, c80
    mad r1.xyw, r5.xyzz, r1.y, c79.xyzz
    mov r5.xyz, c82
    mad r5.xyz, r5, r1.z, c81
    mul r1.xyz, r1.xyww, r4.y
    mad_pp r1.xyz, r4.x, r3, r1
    mad_pp r1.xyz, r4.z, r5, r1
    mad_pp r0.xyz, r1, c17, r0
    mul_pp r0.xyz, r0, c16
    mul_pp r0.xyz, r2, r0
    mul_pp r0.xyz, r0, v6
    texld_pp r1, v3.yxzw, s9
    mad_pp oC0.xyz, r0, r1.w, r1

// approximately 45 instruction slots used (5 texture, 40 arithmetic)
