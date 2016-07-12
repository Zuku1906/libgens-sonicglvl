//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_ViewportSize;
//   sampler2D s0;
//   sampler2D s2;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   g_ViewportSize c24      1
//   s0             s0       1
//   s2             s2       1
//

    ps_3_0
    def c0, 9.99999975e-005, 0, -9.99999975e-005, 0.5
    dcl_texcoord1 v0.xy
    dcl_2d s0
    dcl_2d s2
    add r0.w, -c24.w, v0.y
    add r0.xyz, c0, v0.xyxw
    texld r1, r0.zwzw, s0
    texld r0, r0, s2
    add r1, -r0, r1
    mad_pp oC0, r1, c0.w, r0

// approximately 6 instruction slots used (2 texture, 4 arithmetic)