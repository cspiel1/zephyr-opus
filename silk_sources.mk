SILK_SOURCES = \
lib/silk/CNG.c \
lib/silk/code_signs.c \
lib/silk/init_decoder.c \
lib/silk/decode_core.c \
lib/silk/decode_frame.c \
lib/silk/decode_parameters.c \
lib/silk/decode_indices.c \
lib/silk/decode_pulses.c \
lib/silk/decoder_set_fs.c \
lib/silk/dec_API.c \
lib/silk/enc_API.c \
lib/silk/encode_indices.c \
lib/silk/encode_pulses.c \
lib/silk/gain_quant.c \
lib/silk/interpolate.c \
lib/silk/LP_variable_cutoff.c \
lib/silk/NLSF_decode.c \
lib/silk/NSQ.c \
lib/silk/NSQ_del_dec.c \
lib/silk/PLC.c \
lib/silk/shell_coder.c \
lib/silk/tables_gain.c \
lib/silk/tables_LTP.c \
lib/silk/tables_NLSF_CB_NB_MB.c \
lib/silk/tables_NLSF_CB_WB.c \
lib/silk/tables_other.c \
lib/silk/tables_pitch_lag.c \
lib/silk/tables_pulses_per_block.c \
lib/silk/VAD.c \
lib/silk/control_audio_bandwidth.c \
lib/silk/quant_LTP_gains.c \
lib/silk/VQ_WMat_EC.c \
lib/silk/HP_variable_cutoff.c \
lib/silk/NLSF_encode.c \
lib/silk/NLSF_VQ.c \
lib/silk/NLSF_unpack.c \
lib/silk/NLSF_del_dec_quant.c \
lib/silk/process_NLSFs.c \
lib/silk/stereo_LR_to_MS.c \
lib/silk/stereo_MS_to_LR.c \
lib/silk/check_control_input.c \
lib/silk/control_SNR.c \
lib/silk/init_encoder.c \
lib/silk/control_codec.c \
lib/silk/A2NLSF.c \
lib/silk/ana_filt_bank_1.c \
lib/silk/biquad_alt.c \
lib/silk/bwexpander_32.c \
lib/silk/bwexpander.c \
lib/silk/debug.c \
lib/silk/decode_pitch.c \
lib/silk/inner_prod_aligned.c \
lib/silk/lin2log.c \
lib/silk/log2lin.c \
lib/silk/LPC_analysis_filter.c \
lib/silk/LPC_inv_pred_gain.c \
lib/silk/table_LSF_cos.c \
lib/silk/NLSF2A.c \
lib/silk/NLSF_stabilize.c \
lib/silk/NLSF_VQ_weights_laroia.c \
lib/silk/pitch_est_tables.c \
lib/silk/resampler.c \
lib/silk/resampler_down2_3.c \
lib/silk/resampler_down2.c \
lib/silk/resampler_private_AR2.c \
lib/silk/resampler_private_down_FIR.c \
lib/silk/resampler_private_IIR_FIR.c \
lib/silk/resampler_private_up2_HQ.c \
lib/silk/resampler_rom.c \
lib/silk/sigm_Q15.c \
lib/silk/sort.c \
lib/silk/sum_sqr_shift.c \
lib/silk/stereo_decode_pred.c \
lib/silk/stereo_encode_pred.c \
lib/silk/stereo_find_predictor.c \
lib/silk/stereo_quant_pred.c \
lib/silk/LPC_fit.c

SILK_SOURCES_X86_RTCD = \
lib/silk/x86/x86_silk_map.c

SILK_SOURCES_SSE4_1 = \
lib/silk/x86/NSQ_sse4_1.c \
lib/silk/x86/NSQ_del_dec_sse4_1.c \
lib/silk/x86/VAD_sse4_1.c \
lib/silk/x86/VQ_WMat_EC_sse4_1.c

SILK_SOURCES_ARM_RTCD = \
lib/silk/arm/arm_silk_map.c

SILK_SOURCES_ARM_NEON_INTR = \
lib/silk/arm/biquad_alt_neon_intr.c \
lib/silk/arm/LPC_inv_pred_gain_neon_intr.c \
lib/silk/arm/NSQ_del_dec_neon_intr.c \
lib/silk/arm/NSQ_neon.c

SILK_SOURCES_FIXED = \
lib/silk/fixed/LTP_analysis_filter_FIX.c \
lib/silk/fixed/LTP_scale_ctrl_FIX.c \
lib/silk/fixed/corrMatrix_FIX.c \
lib/silk/fixed/encode_frame_FIX.c \
lib/silk/fixed/find_LPC_FIX.c \
lib/silk/fixed/find_LTP_FIX.c \
lib/silk/fixed/find_pitch_lags_FIX.c \
lib/silk/fixed/find_pred_coefs_FIX.c \
lib/silk/fixed/noise_shape_analysis_FIX.c \
lib/silk/fixed/process_gains_FIX.c \
lib/silk/fixed/regularize_correlations_FIX.c \
lib/silk/fixed/residual_energy16_FIX.c \
lib/silk/fixed/residual_energy_FIX.c \
lib/silk/fixed/warped_autocorrelation_FIX.c \
lib/silk/fixed/apply_sine_window_FIX.c \
lib/silk/fixed/autocorr_FIX.c \
lib/silk/fixed/burg_modified_FIX.c \
lib/silk/fixed/k2a_FIX.c \
lib/silk/fixed/k2a_Q16_FIX.c \
lib/silk/fixed/pitch_analysis_core_FIX.c \
lib/silk/fixed/vector_ops_FIX.c \
lib/silk/fixed/schur64_FIX.c \
lib/silk/fixed/schur_FIX.c

SILK_SOURCES_FIXED_SSE4_1 = \
lib/silk/fixed/x86/vector_ops_FIX_sse4_1.c \
lib/silk/fixed/x86/burg_modified_FIX_sse4_1.c

SILK_SOURCES_FIXED_ARM_NEON_INTR = \
lib/silk/fixed/arm/warped_autocorrelation_FIX_neon_intr.c

SILK_SOURCES_FLOAT = \
lib/silk/float/apply_sine_window_FLP.c \
lib/silk/float/corrMatrix_FLP.c \
lib/silk/float/encode_frame_FLP.c \
lib/silk/float/find_LPC_FLP.c \
lib/silk/float/find_LTP_FLP.c \
lib/silk/float/find_pitch_lags_FLP.c \
lib/silk/float/find_pred_coefs_FLP.c \
lib/silk/float/LPC_analysis_filter_FLP.c \
lib/silk/float/LTP_analysis_filter_FLP.c \
lib/silk/float/LTP_scale_ctrl_FLP.c \
lib/silk/float/noise_shape_analysis_FLP.c \
lib/silk/float/process_gains_FLP.c \
lib/silk/float/regularize_correlations_FLP.c \
lib/silk/float/residual_energy_FLP.c \
lib/silk/float/warped_autocorrelation_FLP.c \
lib/silk/float/wrappers_FLP.c \
lib/silk/float/autocorrelation_FLP.c \
lib/silk/float/burg_modified_FLP.c \
lib/silk/float/bwexpander_FLP.c \
lib/silk/float/energy_FLP.c \
lib/silk/float/inner_product_FLP.c \
lib/silk/float/k2a_FLP.c \
lib/silk/float/LPC_inv_pred_gain_FLP.c \
lib/silk/float/pitch_analysis_core_FLP.c \
lib/silk/float/scale_copy_vector_FLP.c \
lib/silk/float/scale_vector_FLP.c \
lib/silk/float/schur_FLP.c \
lib/silk/float/sort_FLP.c
