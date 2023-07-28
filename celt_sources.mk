CELT_SOURCES = \
lib/celt/bands.c \
lib/celt/celt.c \
lib/celt/celt_encoder.c \
lib/celt/celt_decoder.c \
lib/celt/cwrs.c \
lib/celt/entcode.c \
lib/celt/entdec.c \
lib/celt/entenc.c \
lib/celt/kiss_fft.c \
lib/celt/laplace.c \
lib/celt/mathops.c \
lib/celt/mdct.c \
lib/celt/modes.c \
lib/celt/pitch.c \
lib/celt/celt_lpc.c \
lib/celt/quant_bands.c \
lib/celt/rate.c \
lib/celt/vq.c

CELT_SOURCES_X86_RTCD = \
lib/celt/x86/x86cpu.c \
lib/celt/x86/x86_celt_map.c

CELT_SOURCES_SSE = \
lib/celt/x86/pitch_sse.c

CELT_SOURCES_SSE2 = \
lib/celt/x86/pitch_sse2.c \
lib/celt/x86/vq_sse2.c

CELT_SOURCES_SSE4_1 = \
lib/celt/x86/celt_lpc_sse4_1.c \
lib/celt/x86/pitch_sse4_1.c

CELT_SOURCES_ARM_RTCD = \
lib/celt/arm/armcpu.c \
lib/celt/arm/arm_celt_map.c

CELT_SOURCES_ARM_ASM = \
lib/celt/arm/celt_pitch_xcorr_arm.s

CELT_AM_SOURCES_ARM_ASM = \
lib/celt/arm/armopts.s.in

CELT_SOURCES_ARM_NEON_INTR = \
lib/celt/arm/celt_neon_intr.c \
lib/celt/arm/pitch_neon_intr.c

CELT_SOURCES_ARM_NE10 = \
lib/celt/arm/celt_fft_ne10.c \
lib/celt/arm/celt_mdct_ne10.c
