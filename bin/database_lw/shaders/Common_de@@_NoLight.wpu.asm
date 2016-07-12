//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EyePosition;
//   sampler2D g_FramebufferSampler;
//   float4 g_GIModeParam;
//   sampler2D g_GISampler;
//   float4 g_ViewportSize;
//   float4 mrgEyeLight_Diffuse;
//   float4 mrgEyeLight_Range;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgInShadowScale;
//   float4 mrgLuminanceRange;
//   sampler2D sampDLScatter;
//   sampler2D sampDif;
//   sampler2D sampEnv;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   mrgGlobalLight_Direction c10      1
//   g_Diffuse                c16      1
//   g_Ambient                c17      1
//   g_EyePosition            c22      1
//   g_ViewportSize           c24      1
//   mrgGlobalLight_Diffuse   c36      1
//   mrgEyeLight_Diffuse      c58      1
//   mrgEyeLight_Range        c60      1
//   mrgLuminanceRange        c63      1
//   mrgInShadowScale         c64      1
//   g_GIModeParam            c69      1
//   sampDif                  s0       1
//   sampEnv                  s5       1
//   sampDLScatter            s9       1
//   g_GISampler              s10      1
//   g_FramebufferSampler     s11      1
//

    ps_3_0
    def c0, 0.5, -1, 1, 0
    def c1, 0.25, 0, 0, 0
    dcl_texcoord v0
    dcl_texcoord2 v1.xyz
    dcl_texcoord3_pp v2
    dcl_texcoord5 v3.xy
    dcl_color_pp v4
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s5
    dcl_2d s9
    dcl_2d s10
    dcl_2d s11
    texld_pp r0, v0, s0
    mul_pp r0.w, r0.w, c16.w
    mul_pp oC0.w, r0.w, v4.w
    add_pp r1, c22.xyzx, -v1.xyzx
    dp3_pp r0.w, r1.yzww, r1.yzww
    rsq_pp r0.w, r0.w
    mul r1, r0.w, r1
    rcp r0.w, r0.w
    mad_sat_pp r0.w, -r0.w, c60.z, c60.w
    mul r2.xyz, r0.w, c58
    nrm r3, v2.xyzx
    dp3_pp r0.w, r3.yzww, r1.yzww
    add r2.w, r0.w, r0.w
    mov_sat_pp r0.w, r0.w
    mul_pp r2.xyz, r2, r0.w
    mad r1, r2.w, r3, -r1
    dp3_sat_pp r0.w, r3.wyzw, -c10
    mul r3, r1.wyzw, c0.yyzw
    mad r4, r1, c0.zyyw, c0.wwwx
    cmp r1, r1.z, r3, r4
    add r1.z, r1.z, c0.z
    rcp r1.z, r1.z
    mad r1.xy, r1.yxzw, r1.z, c0.z
    mad_pp r3.x, r1.y, c1.x, r1.w
    mul_pp r3.y, r1.x, c0.x
    texld_pp r1, r3, s5
    mul r1.w, c64.z, c64.x
    mov r3.xz, c64
    mad r2.w, r3.x, -r3.z, r3.z
    texld r3, v0.zwzw, s10
    mad_pp r1.w, r3.w, r2.w, r1.w
    mul r1.w, r1.w, c63.x
    mul_pp r1.xyz, r1.w, r1
    mul_pp r1.xyz, r1, v2.w
    mul r0.w, r0.w, r3.w
    mul_pp r3.xyz, r3, r3
    mad_pp r2.xyz, r0.w, c36, r2
    mad_pp r2.xyz, r3, c17, r2
    mul_pp r2.xyz, r2, c16
    mad_pp r0.xyz, r2, r0, r1
    mul_pp r0.xyz, r0, v4
    texld_pp r1, v3.yxzw, s9
    mad_pp r0.xyz, r0, r1.w, r1
    add r1.xy, c0.x, vPos
    mul r1.xy, r1, c24.zwzw
    texld r1, r1, s11
    add r1.xyz, -r0, r1
    mul r0.w, c69.z, v3.x
    mad_pp oC0.xyz, r0.w, r1, r0

// approximately 51 instruction slots used (5 texture, 46 arithmetic)