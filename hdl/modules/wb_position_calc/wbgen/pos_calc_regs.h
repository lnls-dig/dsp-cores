/*
  Register definitions for slave core: Position Calculation Core registers

  * File           : pos_calc_regs.h
  * Author         : auto-generated by wbgen2 from wb_pos_calc_regs.wb
  * Created        : Mon May 28 09:40:24 2018
  * Standard       : ANSI C

    THIS FILE WAS GENERATED BY wbgen2 FROM SOURCE FILE wb_pos_calc_regs.wb
    DO NOT HAND-EDIT UNLESS IT'S ABSOLUTELY NECESSARY!

*/

#ifndef __WBGEN2_REGDEFS_WB_POS_CALC_REGS_WB
#define __WBGEN2_REGDEFS_WB_POS_CALC_REGS_WB

#include <inttypes.h>

#if defined( __GNUC__)
#define PACKED __attribute__ ((packed))
#else
#error "Unsupported compiler?"
#endif

#ifndef __WBGEN2_MACROS_DEFINED__
#define __WBGEN2_MACROS_DEFINED__
#define WBGEN2_GEN_MASK(offset, size) (((1<<(size))-1) << (offset))
#define WBGEN2_GEN_WRITE(value, offset, size) (((value) & ((1<<(size))-1)) << (offset))
#define WBGEN2_GEN_READ(reg, offset, size) (((reg) >> (offset)) & ((1<<(size))-1))
#define WBGEN2_SIGN_EXTEND(value, bits) (((value) & (1<<bits) ? ~((1<<(bits))-1): 0 ) | (value))
#endif


/* definitions for register: Config divisor threshold TBT register */

/* definitions for field: Config divisor threshold TBT in reg: Config divisor threshold TBT register */
#define POS_CALC_DS_TBT_THRES_VAL_MASK        WBGEN2_GEN_MASK(0, 26)
#define POS_CALC_DS_TBT_THRES_VAL_SHIFT       0
#define POS_CALC_DS_TBT_THRES_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 26)
#define POS_CALC_DS_TBT_THRES_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 26)

/* definitions for field: Reserved in reg: Config divisor threshold TBT register */
#define POS_CALC_DS_TBT_THRES_RESERVED_MASK   WBGEN2_GEN_MASK(26, 6)
#define POS_CALC_DS_TBT_THRES_RESERVED_SHIFT  26
#define POS_CALC_DS_TBT_THRES_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 26, 6)
#define POS_CALC_DS_TBT_THRES_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 26, 6)

/* definitions for register: Config divisor threshold FOFB register */

/* definitions for field: Config divisor threshold FOFB in reg: Config divisor threshold FOFB register */
#define POS_CALC_DS_FOFB_THRES_VAL_MASK       WBGEN2_GEN_MASK(0, 26)
#define POS_CALC_DS_FOFB_THRES_VAL_SHIFT      0
#define POS_CALC_DS_FOFB_THRES_VAL_W(value)   WBGEN2_GEN_WRITE(value, 0, 26)
#define POS_CALC_DS_FOFB_THRES_VAL_R(reg)     WBGEN2_GEN_READ(reg, 0, 26)

/* definitions for field: Reserved in reg: Config divisor threshold FOFB register */
#define POS_CALC_DS_FOFB_THRES_RESERVED_MASK  WBGEN2_GEN_MASK(26, 6)
#define POS_CALC_DS_FOFB_THRES_RESERVED_SHIFT 26
#define POS_CALC_DS_FOFB_THRES_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 26, 6)
#define POS_CALC_DS_FOFB_THRES_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 26, 6)

/* definitions for register: Config divisor threshold Monit. register */

/* definitions for field: Config Divisor Threshold Monit. in reg: Config divisor threshold Monit. register */
#define POS_CALC_DS_MONIT_THRES_VAL_MASK      WBGEN2_GEN_MASK(0, 26)
#define POS_CALC_DS_MONIT_THRES_VAL_SHIFT     0
#define POS_CALC_DS_MONIT_THRES_VAL_W(value)  WBGEN2_GEN_WRITE(value, 0, 26)
#define POS_CALC_DS_MONIT_THRES_VAL_R(reg)    WBGEN2_GEN_READ(reg, 0, 26)

/* definitions for field: Reserved in reg: Config divisor threshold Monit. register */
#define POS_CALC_DS_MONIT_THRES_RESERVED_MASK WBGEN2_GEN_MASK(26, 6)
#define POS_CALC_DS_MONIT_THRES_RESERVED_SHIFT 26
#define POS_CALC_DS_MONIT_THRES_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 26, 6)
#define POS_CALC_DS_MONIT_THRES_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 26, 6)

/* definitions for register: BPM sensitivity (X axis) parameter register */

/* definitions for field: BPM sensitivity (X axis) parameter register in reg: BPM sensitivity (X axis) parameter register */
#define POS_CALC_KX_VAL_MASK                  WBGEN2_GEN_MASK(0, 25)
#define POS_CALC_KX_VAL_SHIFT                 0
#define POS_CALC_KX_VAL_W(value)              WBGEN2_GEN_WRITE(value, 0, 25)
#define POS_CALC_KX_VAL_R(reg)                WBGEN2_GEN_READ(reg, 0, 25)

/* definitions for field: Reserved in reg: BPM sensitivity (X axis) parameter register */
#define POS_CALC_KX_RESERVED_MASK             WBGEN2_GEN_MASK(25, 7)
#define POS_CALC_KX_RESERVED_SHIFT            25
#define POS_CALC_KX_RESERVED_W(value)         WBGEN2_GEN_WRITE(value, 25, 7)
#define POS_CALC_KX_RESERVED_R(reg)           WBGEN2_GEN_READ(reg, 25, 7)

/* definitions for register: BPM sensitivity (Y axis) parameter register */

/* definitions for field: BPM sensitivity (Y axis) parameter register in reg: BPM sensitivity (Y axis) parameter register */
#define POS_CALC_KY_VAL_MASK                  WBGEN2_GEN_MASK(0, 25)
#define POS_CALC_KY_VAL_SHIFT                 0
#define POS_CALC_KY_VAL_W(value)              WBGEN2_GEN_WRITE(value, 0, 25)
#define POS_CALC_KY_VAL_R(reg)                WBGEN2_GEN_READ(reg, 0, 25)

/* definitions for field: Reserved in reg: BPM sensitivity (Y axis) parameter register */
#define POS_CALC_KY_RESERVED_MASK             WBGEN2_GEN_MASK(25, 7)
#define POS_CALC_KY_RESERVED_SHIFT            25
#define POS_CALC_KY_RESERVED_W(value)         WBGEN2_GEN_WRITE(value, 25, 7)
#define POS_CALC_KY_RESERVED_R(reg)           WBGEN2_GEN_READ(reg, 25, 7)

/* definitions for register: BPM sensitivity (Sum) parameter register */

/* definitions for field: BPM sensitivity (Sum) parameter register in reg: BPM sensitivity (Sum) parameter register */
#define POS_CALC_KSUM_VAL_MASK                WBGEN2_GEN_MASK(0, 25)
#define POS_CALC_KSUM_VAL_SHIFT               0
#define POS_CALC_KSUM_VAL_W(value)            WBGEN2_GEN_WRITE(value, 0, 25)
#define POS_CALC_KSUM_VAL_R(reg)              WBGEN2_GEN_READ(reg, 0, 25)

/* definitions for field: Reserved in reg: BPM sensitivity (Sum) parameter register */
#define POS_CALC_KSUM_RESERVED_MASK           WBGEN2_GEN_MASK(25, 7)
#define POS_CALC_KSUM_RESERVED_SHIFT          25
#define POS_CALC_KSUM_RESERVED_W(value)       WBGEN2_GEN_WRITE(value, 25, 7)
#define POS_CALC_KSUM_RESERVED_R(reg)         WBGEN2_GEN_READ(reg, 25, 7)

/* definitions for register: DSP TBT incorrect TDM counter */

/* definitions for field: TBT incorrect counter for channels 0/1 (multiplexed) in reg: DSP TBT incorrect TDM counter */
#define POS_CALC_DSP_CTNR_TBT_CH01_MASK       WBGEN2_GEN_MASK(0, 16)
#define POS_CALC_DSP_CTNR_TBT_CH01_SHIFT      0
#define POS_CALC_DSP_CTNR_TBT_CH01_W(value)   WBGEN2_GEN_WRITE(value, 0, 16)
#define POS_CALC_DSP_CTNR_TBT_CH01_R(reg)     WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: TBT incorrect counter for channels 2/3 (multiplexed) in reg: DSP TBT incorrect TDM counter */
#define POS_CALC_DSP_CTNR_TBT_CH23_MASK       WBGEN2_GEN_MASK(16, 16)
#define POS_CALC_DSP_CTNR_TBT_CH23_SHIFT      16
#define POS_CALC_DSP_CTNR_TBT_CH23_W(value)   WBGEN2_GEN_WRITE(value, 16, 16)
#define POS_CALC_DSP_CTNR_TBT_CH23_R(reg)     WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: DSP FOFB incorrect TDM counter */

/* definitions for field: FOFB incorrect counter for channels 0/1 (multiplexed) in reg: DSP FOFB incorrect TDM counter */
#define POS_CALC_DSP_CTNR_FOFB_CH01_MASK      WBGEN2_GEN_MASK(0, 16)
#define POS_CALC_DSP_CTNR_FOFB_CH01_SHIFT     0
#define POS_CALC_DSP_CTNR_FOFB_CH01_W(value)  WBGEN2_GEN_WRITE(value, 0, 16)
#define POS_CALC_DSP_CTNR_FOFB_CH01_R(reg)    WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: FOFB incorrect counter for channels 2/3 (multiplexed) in reg: DSP FOFB incorrect TDM counter */
#define POS_CALC_DSP_CTNR_FOFB_CH23_MASK      WBGEN2_GEN_MASK(16, 16)
#define POS_CALC_DSP_CTNR_FOFB_CH23_SHIFT     16
#define POS_CALC_DSP_CTNR_FOFB_CH23_W(value)  WBGEN2_GEN_WRITE(value, 16, 16)
#define POS_CALC_DSP_CTNR_FOFB_CH23_R(reg)    WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: DSP Monit. incorrect TDM counter part 1 */

/* definitions for field: Monit. CIC incorrect counter for channels 0/1/2/3 (multiplexed) in reg: DSP Monit. incorrect TDM counter part 1 */
#define POS_CALC_DSP_CTNR1_MONIT_CIC_MASK     WBGEN2_GEN_MASK(0, 16)
#define POS_CALC_DSP_CTNR1_MONIT_CIC_SHIFT    0
#define POS_CALC_DSP_CTNR1_MONIT_CIC_W(value) WBGEN2_GEN_WRITE(value, 0, 16)
#define POS_CALC_DSP_CTNR1_MONIT_CIC_R(reg)   WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: Monit. CFIR incorrect counter for channels 0/1/2/3 (multiplexed) in reg: DSP Monit. incorrect TDM counter part 1 */
#define POS_CALC_DSP_CTNR1_MONIT_CFIR_MASK    WBGEN2_GEN_MASK(16, 16)
#define POS_CALC_DSP_CTNR1_MONIT_CFIR_SHIFT   16
#define POS_CALC_DSP_CTNR1_MONIT_CFIR_W(value) WBGEN2_GEN_WRITE(value, 16, 16)
#define POS_CALC_DSP_CTNR1_MONIT_CFIR_R(reg)  WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: DSP Monit. incorrect TDM counter part 2 */

/* definitions for field: Monit. PFIR incorrect counter for channels 0/1/2/3 (multiplexed) in reg: DSP Monit. incorrect TDM counter part 2 */
#define POS_CALC_DSP_CTNR2_MONIT_PFIR_MASK    WBGEN2_GEN_MASK(0, 16)
#define POS_CALC_DSP_CTNR2_MONIT_PFIR_SHIFT   0
#define POS_CALC_DSP_CTNR2_MONIT_PFIR_W(value) WBGEN2_GEN_WRITE(value, 0, 16)
#define POS_CALC_DSP_CTNR2_MONIT_PFIR_R(reg)  WBGEN2_GEN_READ(reg, 0, 16)

/* definitions for field: Monit. 0.1 Hz incorrect counter for channels 0/1/2/3 (multiplexed) in reg: DSP Monit. incorrect TDM counter part 2 */
#define POS_CALC_DSP_CTNR2_MONIT_FIR_01_MASK  WBGEN2_GEN_MASK(16, 16)
#define POS_CALC_DSP_CTNR2_MONIT_FIR_01_SHIFT 16
#define POS_CALC_DSP_CTNR2_MONIT_FIR_01_W(value) WBGEN2_GEN_WRITE(value, 16, 16)
#define POS_CALC_DSP_CTNR2_MONIT_FIR_01_R(reg) WBGEN2_GEN_READ(reg, 16, 16)

/* definitions for register: DSP error clearing */

/* definitions for field: Clear TBT error counters in reg: DSP error clearing */
#define POS_CALC_DSP_ERR_CLR_TBT              WBGEN2_GEN_MASK(0, 1)

/* definitions for field: Clear FOFB error counters in reg: DSP error clearing */
#define POS_CALC_DSP_ERR_CLR_FOFB             WBGEN2_GEN_MASK(1, 1)

/* definitions for field: Clear Monit. CIC and CFIR error counters in reg: DSP error clearing */
#define POS_CALC_DSP_ERR_CLR_MONIT_PART1      WBGEN2_GEN_MASK(2, 1)

/* definitions for field: Clear Monit. PFIR and Monit. 0.1 error counters in reg: DSP error clearing */
#define POS_CALC_DSP_ERR_CLR_MONIT_PART2      WBGEN2_GEN_MASK(3, 1)

/* definitions for register: DDS general config registers for all channels */

/* definitions for field: Valid signal for channel 0 DDS in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_VALID_CH0            WBGEN2_GEN_MASK(0, 1)

/* definitions for field: Test data counter for all channels in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_TEST_DATA            WBGEN2_GEN_MASK(1, 1)

/* definitions for field: Reserved in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_RESERVED_CH0_MASK    WBGEN2_GEN_MASK(2, 6)
#define POS_CALC_DDS_CFG_RESERVED_CH0_SHIFT   2
#define POS_CALC_DDS_CFG_RESERVED_CH0_W(value) WBGEN2_GEN_WRITE(value, 2, 6)
#define POS_CALC_DDS_CFG_RESERVED_CH0_R(reg)  WBGEN2_GEN_READ(reg, 2, 6)

/* definitions for field: Valid signal for channel 1 DDS in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_VALID_CH1            WBGEN2_GEN_MASK(8, 1)

/* definitions for field: Reserved in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_RESERVED_CH1_MASK    WBGEN2_GEN_MASK(9, 7)
#define POS_CALC_DDS_CFG_RESERVED_CH1_SHIFT   9
#define POS_CALC_DDS_CFG_RESERVED_CH1_W(value) WBGEN2_GEN_WRITE(value, 9, 7)
#define POS_CALC_DDS_CFG_RESERVED_CH1_R(reg)  WBGEN2_GEN_READ(reg, 9, 7)

/* definitions for field: Valid signal for channel 2 DDS in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_VALID_CH2            WBGEN2_GEN_MASK(16, 1)

/* definitions for field: Reserved in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_RESERVED_CH2_MASK    WBGEN2_GEN_MASK(17, 7)
#define POS_CALC_DDS_CFG_RESERVED_CH2_SHIFT   17
#define POS_CALC_DDS_CFG_RESERVED_CH2_W(value) WBGEN2_GEN_WRITE(value, 17, 7)
#define POS_CALC_DDS_CFG_RESERVED_CH2_R(reg)  WBGEN2_GEN_READ(reg, 17, 7)

/* definitions for field: Valid signal for channel 3 DDS in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_VALID_CH3            WBGEN2_GEN_MASK(24, 1)

/* definitions for field: Reserved in reg: DDS general config registers for all channels */
#define POS_CALC_DDS_CFG_RESERVED_CH3_MASK    WBGEN2_GEN_MASK(25, 7)
#define POS_CALC_DDS_CFG_RESERVED_CH3_SHIFT   25
#define POS_CALC_DDS_CFG_RESERVED_CH3_W(value) WBGEN2_GEN_WRITE(value, 25, 7)
#define POS_CALC_DDS_CFG_RESERVED_CH3_R(reg)  WBGEN2_GEN_READ(reg, 25, 7)

/* definitions for register: DDS phase increment parameter register for channel 0 */

/* definitions for field: DDS phase increment parameter register for channel 0 in reg: DDS phase increment parameter register for channel 0 */
#define POS_CALC_DDS_PINC_CH0_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_PINC_CH0_VAL_SHIFT       0
#define POS_CALC_DDS_PINC_CH0_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_PINC_CH0_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase increment parameter register for channel 0 */
#define POS_CALC_DDS_PINC_CH0_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_PINC_CH0_RESERVED_SHIFT  30
#define POS_CALC_DDS_PINC_CH0_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_PINC_CH0_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase increment parameter register for channel 1 */

/* definitions for field: DDS phase increment parameter register for channel 1 in reg: DDS phase increment parameter register for channel 1 */
#define POS_CALC_DDS_PINC_CH1_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_PINC_CH1_VAL_SHIFT       0
#define POS_CALC_DDS_PINC_CH1_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_PINC_CH1_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase increment parameter register for channel 1 */
#define POS_CALC_DDS_PINC_CH1_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_PINC_CH1_RESERVED_SHIFT  30
#define POS_CALC_DDS_PINC_CH1_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_PINC_CH1_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase increment parameter register for channel 2 */

/* definitions for field: DDS phase increment parameter register for channel 2 in reg: DDS phase increment parameter register for channel 2 */
#define POS_CALC_DDS_PINC_CH2_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_PINC_CH2_VAL_SHIFT       0
#define POS_CALC_DDS_PINC_CH2_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_PINC_CH2_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase increment parameter register for channel 2 */
#define POS_CALC_DDS_PINC_CH2_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_PINC_CH2_RESERVED_SHIFT  30
#define POS_CALC_DDS_PINC_CH2_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_PINC_CH2_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase increment parameter register for channel 3 */

/* definitions for field: DDS phase increment parameter register for channel 3 in reg: DDS phase increment parameter register for channel 3 */
#define POS_CALC_DDS_PINC_CH3_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_PINC_CH3_VAL_SHIFT       0
#define POS_CALC_DDS_PINC_CH3_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_PINC_CH3_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase increment parameter register for channel 3 */
#define POS_CALC_DDS_PINC_CH3_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_PINC_CH3_RESERVED_SHIFT  30
#define POS_CALC_DDS_PINC_CH3_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_PINC_CH3_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase offset parameter register for channel 0 */

/* definitions for field: DDS phase offset parameter register for channel 0 in reg: DDS phase offset parameter register for channel 0 */
#define POS_CALC_DDS_POFF_CH0_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_POFF_CH0_VAL_SHIFT       0
#define POS_CALC_DDS_POFF_CH0_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_POFF_CH0_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase offset parameter register for channel 0 */
#define POS_CALC_DDS_POFF_CH0_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_POFF_CH0_RESERVED_SHIFT  30
#define POS_CALC_DDS_POFF_CH0_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_POFF_CH0_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase offset parameter register for channel 1 */

/* definitions for field: DDS phase offset parameter register for channel 1 in reg: DDS phase offset parameter register for channel 1 */
#define POS_CALC_DDS_POFF_CH1_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_POFF_CH1_VAL_SHIFT       0
#define POS_CALC_DDS_POFF_CH1_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_POFF_CH1_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase offset parameter register for channel 1 */
#define POS_CALC_DDS_POFF_CH1_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_POFF_CH1_RESERVED_SHIFT  30
#define POS_CALC_DDS_POFF_CH1_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_POFF_CH1_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase offset parameter register for channel 2 */

/* definitions for field: DDS phase offset parameter register for channel 2 in reg: DDS phase offset parameter register for channel 2 */
#define POS_CALC_DDS_POFF_CH2_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_POFF_CH2_VAL_SHIFT       0
#define POS_CALC_DDS_POFF_CH2_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_POFF_CH2_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase offset parameter register for channel 2 */
#define POS_CALC_DDS_POFF_CH2_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_POFF_CH2_RESERVED_SHIFT  30
#define POS_CALC_DDS_POFF_CH2_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_POFF_CH2_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: DDS phase offset parameter register for channel 3 */

/* definitions for field: DDS phase offset parameter register for channel 3 in reg: DDS phase offset parameter register for channel 3 */
#define POS_CALC_DDS_POFF_CH3_VAL_MASK        WBGEN2_GEN_MASK(0, 30)
#define POS_CALC_DDS_POFF_CH3_VAL_SHIFT       0
#define POS_CALC_DDS_POFF_CH3_VAL_W(value)    WBGEN2_GEN_WRITE(value, 0, 30)
#define POS_CALC_DDS_POFF_CH3_VAL_R(reg)      WBGEN2_GEN_READ(reg, 0, 30)

/* definitions for field: Reserved in reg: DDS phase offset parameter register for channel 3 */
#define POS_CALC_DDS_POFF_CH3_RESERVED_MASK   WBGEN2_GEN_MASK(30, 2)
#define POS_CALC_DDS_POFF_CH3_RESERVED_SHIFT  30
#define POS_CALC_DDS_POFF_CH3_RESERVED_W(value) WBGEN2_GEN_WRITE(value, 30, 2)
#define POS_CALC_DDS_POFF_CH3_RESERVED_R(reg) WBGEN2_GEN_READ(reg, 30, 2)

/* definitions for register: Monit. Amplitude Value for channel 0 */

/* definitions for register: Monit. Amplitude Value for channel 1 */

/* definitions for register: Monit. Amplitude Value for channel 2 */

/* definitions for register: Monit. Amplitude Value for channel 3 */

/* definitions for register: Monit. X Position Value */

/* definitions for register: Monit. Y Position Value */

/* definitions for register: Monit. Q Position Value */

/* definitions for register: Monit. Sum Position Value */

/* definitions for register: Monit. Amp/Pos update trigger */

/* definitions for register: Monit. 1 Amplitude Value for channel 0 */

/* definitions for register: Monit. 1 Amplitude Value for channel 1 */

/* definitions for register: Monit. 1 Amplitude Value for channel 2 */

/* definitions for register: Monit. 1 Amplitude Value for channel 3 */

/* definitions for register: Monit. 1 X Position Value */

/* definitions for register: Monit. 1 Y Position Value */

/* definitions for register: Monit. 1 Q Position Value */

/* definitions for register: Monit. 1 Sum Position Value */

/* definitions for register: Monit. 1 Amp/Pos update trigger */

/* definitions for register: FIFO 'AMP FIFO Monitoring' data output register 0 */

/* definitions for field: Channel 0 Amplitude in reg: FIFO 'AMP FIFO Monitoring' data output register 0 */
#define POS_CALC_AMPFIFO_MONIT_R0_AMP_CH0_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT_R0_AMP_CH0_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT_R0_AMP_CH0_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT_R0_AMP_CH0_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring' data output register 1 */

/* definitions for field: Channel 1 Amplitude in reg: FIFO 'AMP FIFO Monitoring' data output register 1 */
#define POS_CALC_AMPFIFO_MONIT_R1_AMP_CH1_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT_R1_AMP_CH1_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT_R1_AMP_CH1_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT_R1_AMP_CH1_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring' data output register 2 */

/* definitions for field: Channel 2 Amplitude in reg: FIFO 'AMP FIFO Monitoring' data output register 2 */
#define POS_CALC_AMPFIFO_MONIT_R2_AMP_CH2_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT_R2_AMP_CH2_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT_R2_AMP_CH2_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT_R2_AMP_CH2_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring' data output register 3 */

/* definitions for field: Channel 3 Amplitude in reg: FIFO 'AMP FIFO Monitoring' data output register 3 */
#define POS_CALC_AMPFIFO_MONIT_R3_AMP_CH3_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT_R3_AMP_CH3_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT_R3_AMP_CH3_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT_R3_AMP_CH3_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring' control/status register */

/* definitions for field: FIFO full flag in reg: FIFO 'AMP FIFO Monitoring' control/status register */
#define POS_CALC_AMPFIFO_MONIT_CSR_FULL       WBGEN2_GEN_MASK(16, 1)

/* definitions for field: FIFO empty flag in reg: FIFO 'AMP FIFO Monitoring' control/status register */
#define POS_CALC_AMPFIFO_MONIT_CSR_EMPTY      WBGEN2_GEN_MASK(17, 1)

/* definitions for field: FIFO counter in reg: FIFO 'AMP FIFO Monitoring' control/status register */
#define POS_CALC_AMPFIFO_MONIT_CSR_USEDW_MASK WBGEN2_GEN_MASK(0, 4)
#define POS_CALC_AMPFIFO_MONIT_CSR_USEDW_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT_CSR_USEDW_W(value) WBGEN2_GEN_WRITE(value, 0, 4)
#define POS_CALC_AMPFIFO_MONIT_CSR_USEDW_R(reg) WBGEN2_GEN_READ(reg, 0, 4)

/* definitions for register: FIFO 'POS FIFO Monitoring' data output register 0 */

/* definitions for field: Channel X Position in reg: FIFO 'POS FIFO Monitoring' data output register 0 */
#define POS_CALC_POSFIFO_MONIT_R0_POS_X_MASK  WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT_R0_POS_X_SHIFT 0
#define POS_CALC_POSFIFO_MONIT_R0_POS_X_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT_R0_POS_X_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring' data output register 1 */

/* definitions for field: Channel Y Position in reg: FIFO 'POS FIFO Monitoring' data output register 1 */
#define POS_CALC_POSFIFO_MONIT_R1_POS_Y_MASK  WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT_R1_POS_Y_SHIFT 0
#define POS_CALC_POSFIFO_MONIT_R1_POS_Y_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT_R1_POS_Y_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring' data output register 2 */

/* definitions for field: Channel Q Position in reg: FIFO 'POS FIFO Monitoring' data output register 2 */
#define POS_CALC_POSFIFO_MONIT_R2_POS_Q_MASK  WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT_R2_POS_Q_SHIFT 0
#define POS_CALC_POSFIFO_MONIT_R2_POS_Q_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT_R2_POS_Q_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring' data output register 3 */

/* definitions for field: Channel Sum Position in reg: FIFO 'POS FIFO Monitoring' data output register 3 */
#define POS_CALC_POSFIFO_MONIT_R3_POS_SUM_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT_R3_POS_SUM_SHIFT 0
#define POS_CALC_POSFIFO_MONIT_R3_POS_SUM_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT_R3_POS_SUM_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring' control/status register */

/* definitions for field: FIFO full flag in reg: FIFO 'POS FIFO Monitoring' control/status register */
#define POS_CALC_POSFIFO_MONIT_CSR_FULL       WBGEN2_GEN_MASK(16, 1)

/* definitions for field: FIFO empty flag in reg: FIFO 'POS FIFO Monitoring' control/status register */
#define POS_CALC_POSFIFO_MONIT_CSR_EMPTY      WBGEN2_GEN_MASK(17, 1)

/* definitions for field: FIFO counter in reg: FIFO 'POS FIFO Monitoring' control/status register */
#define POS_CALC_POSFIFO_MONIT_CSR_USEDW_MASK WBGEN2_GEN_MASK(0, 4)
#define POS_CALC_POSFIFO_MONIT_CSR_USEDW_SHIFT 0
#define POS_CALC_POSFIFO_MONIT_CSR_USEDW_W(value) WBGEN2_GEN_WRITE(value, 0, 4)
#define POS_CALC_POSFIFO_MONIT_CSR_USEDW_R(reg) WBGEN2_GEN_READ(reg, 0, 4)

/* definitions for register: FIFO 'AMP FIFO Monitoring 1' data output register 0 */

/* definitions for field: Channel 0 Amplitude in reg: FIFO 'AMP FIFO Monitoring 1' data output register 0 */
#define POS_CALC_AMPFIFO_MONIT1_R0_AMP_CH0_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R0_AMP_CH0_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT1_R0_AMP_CH0_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R0_AMP_CH0_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring 1' data output register 1 */

/* definitions for field: Channel 1 Amplitude in reg: FIFO 'AMP FIFO Monitoring 1' data output register 1 */
#define POS_CALC_AMPFIFO_MONIT1_R1_AMP_CH1_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R1_AMP_CH1_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT1_R1_AMP_CH1_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R1_AMP_CH1_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring 1' data output register 2 */

/* definitions for field: Channel 2 Amplitude in reg: FIFO 'AMP FIFO Monitoring 1' data output register 2 */
#define POS_CALC_AMPFIFO_MONIT1_R2_AMP_CH2_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R2_AMP_CH2_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT1_R2_AMP_CH2_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R2_AMP_CH2_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring 1' data output register 3 */

/* definitions for field: Channel 3 Amplitude in reg: FIFO 'AMP FIFO Monitoring 1' data output register 3 */
#define POS_CALC_AMPFIFO_MONIT1_R3_AMP_CH3_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R3_AMP_CH3_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT1_R3_AMP_CH3_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_AMPFIFO_MONIT1_R3_AMP_CH3_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'AMP FIFO Monitoring 1' control/status register */

/* definitions for field: FIFO full flag in reg: FIFO 'AMP FIFO Monitoring 1' control/status register */
#define POS_CALC_AMPFIFO_MONIT1_CSR_FULL      WBGEN2_GEN_MASK(16, 1)

/* definitions for field: FIFO empty flag in reg: FIFO 'AMP FIFO Monitoring 1' control/status register */
#define POS_CALC_AMPFIFO_MONIT1_CSR_EMPTY     WBGEN2_GEN_MASK(17, 1)

/* definitions for field: FIFO counter in reg: FIFO 'AMP FIFO Monitoring 1' control/status register */
#define POS_CALC_AMPFIFO_MONIT1_CSR_USEDW_MASK WBGEN2_GEN_MASK(0, 4)
#define POS_CALC_AMPFIFO_MONIT1_CSR_USEDW_SHIFT 0
#define POS_CALC_AMPFIFO_MONIT1_CSR_USEDW_W(value) WBGEN2_GEN_WRITE(value, 0, 4)
#define POS_CALC_AMPFIFO_MONIT1_CSR_USEDW_R(reg) WBGEN2_GEN_READ(reg, 0, 4)

/* definitions for register: FIFO 'POS FIFO Monitoring 1' data output register 0 */

/* definitions for field: Channel X Position in reg: FIFO 'POS FIFO Monitoring 1' data output register 0 */
#define POS_CALC_POSFIFO_MONIT1_R0_POS_X_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT1_R0_POS_X_SHIFT 0
#define POS_CALC_POSFIFO_MONIT1_R0_POS_X_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT1_R0_POS_X_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring 1' data output register 1 */

/* definitions for field: Channel Y Position in reg: FIFO 'POS FIFO Monitoring 1' data output register 1 */
#define POS_CALC_POSFIFO_MONIT1_R1_POS_Y_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT1_R1_POS_Y_SHIFT 0
#define POS_CALC_POSFIFO_MONIT1_R1_POS_Y_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT1_R1_POS_Y_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring 1' data output register 2 */

/* definitions for field: Channel Q Position in reg: FIFO 'POS FIFO Monitoring 1' data output register 2 */
#define POS_CALC_POSFIFO_MONIT1_R2_POS_Q_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT1_R2_POS_Q_SHIFT 0
#define POS_CALC_POSFIFO_MONIT1_R2_POS_Q_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT1_R2_POS_Q_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring 1' data output register 3 */

/* definitions for field: Channel Sum Position in reg: FIFO 'POS FIFO Monitoring 1' data output register 3 */
#define POS_CALC_POSFIFO_MONIT1_R3_POS_SUM_MASK WBGEN2_GEN_MASK(0, 32)
#define POS_CALC_POSFIFO_MONIT1_R3_POS_SUM_SHIFT 0
#define POS_CALC_POSFIFO_MONIT1_R3_POS_SUM_W(value) WBGEN2_GEN_WRITE(value, 0, 32)
#define POS_CALC_POSFIFO_MONIT1_R3_POS_SUM_R(reg) WBGEN2_GEN_READ(reg, 0, 32)

/* definitions for register: FIFO 'POS FIFO Monitoring 1' control/status register */

/* definitions for field: FIFO full flag in reg: FIFO 'POS FIFO Monitoring 1' control/status register */
#define POS_CALC_POSFIFO_MONIT1_CSR_FULL      WBGEN2_GEN_MASK(16, 1)

/* definitions for field: FIFO empty flag in reg: FIFO 'POS FIFO Monitoring 1' control/status register */
#define POS_CALC_POSFIFO_MONIT1_CSR_EMPTY     WBGEN2_GEN_MASK(17, 1)

/* definitions for field: FIFO counter in reg: FIFO 'POS FIFO Monitoring 1' control/status register */
#define POS_CALC_POSFIFO_MONIT1_CSR_USEDW_MASK WBGEN2_GEN_MASK(0, 4)
#define POS_CALC_POSFIFO_MONIT1_CSR_USEDW_SHIFT 0
#define POS_CALC_POSFIFO_MONIT1_CSR_USEDW_W(value) WBGEN2_GEN_WRITE(value, 0, 4)
#define POS_CALC_POSFIFO_MONIT1_CSR_USEDW_R(reg) WBGEN2_GEN_READ(reg, 0, 4)
/* [0x0]: REG Config divisor threshold TBT register */
#define POS_CALC_REG_DS_TBT_THRES 0x00000000
/* [0x4]: REG Config divisor threshold FOFB register */
#define POS_CALC_REG_DS_FOFB_THRES 0x00000004
/* [0x8]: REG Config divisor threshold Monit. register */
#define POS_CALC_REG_DS_MONIT_THRES 0x00000008
/* [0xc]: REG BPM sensitivity (X axis) parameter register */
#define POS_CALC_REG_KX 0x0000000c
/* [0x10]: REG BPM sensitivity (Y axis) parameter register */
#define POS_CALC_REG_KY 0x00000010
/* [0x14]: REG BPM sensitivity (Sum) parameter register */
#define POS_CALC_REG_KSUM 0x00000014
/* [0x18]: REG DSP TBT incorrect TDM counter */
#define POS_CALC_REG_DSP_CTNR_TBT 0x00000018
/* [0x1c]: REG DSP FOFB incorrect TDM counter */
#define POS_CALC_REG_DSP_CTNR_FOFB 0x0000001c
/* [0x20]: REG DSP Monit. incorrect TDM counter part 1 */
#define POS_CALC_REG_DSP_CTNR1_MONIT 0x00000020
/* [0x24]: REG DSP Monit. incorrect TDM counter part 2 */
#define POS_CALC_REG_DSP_CTNR2_MONIT 0x00000024
/* [0x28]: REG DSP error clearing */
#define POS_CALC_REG_DSP_ERR_CLR 0x00000028
/* [0x2c]: REG DDS general config registers for all channels */
#define POS_CALC_REG_DDS_CFG 0x0000002c
/* [0x30]: REG DDS phase increment parameter register for channel 0 */
#define POS_CALC_REG_DDS_PINC_CH0 0x00000030
/* [0x34]: REG DDS phase increment parameter register for channel 1 */
#define POS_CALC_REG_DDS_PINC_CH1 0x00000034
/* [0x38]: REG DDS phase increment parameter register for channel 2 */
#define POS_CALC_REG_DDS_PINC_CH2 0x00000038
/* [0x3c]: REG DDS phase increment parameter register for channel 3 */
#define POS_CALC_REG_DDS_PINC_CH3 0x0000003c
/* [0x40]: REG DDS phase offset parameter register for channel 0 */
#define POS_CALC_REG_DDS_POFF_CH0 0x00000040
/* [0x44]: REG DDS phase offset parameter register for channel 1 */
#define POS_CALC_REG_DDS_POFF_CH1 0x00000044
/* [0x48]: REG DDS phase offset parameter register for channel 2 */
#define POS_CALC_REG_DDS_POFF_CH2 0x00000048
/* [0x4c]: REG DDS phase offset parameter register for channel 3 */
#define POS_CALC_REG_DDS_POFF_CH3 0x0000004c
/* [0x50]: REG Monit. Amplitude Value for channel 0 */
#define POS_CALC_REG_DSP_MONIT_AMP_CH0 0x00000050
/* [0x54]: REG Monit. Amplitude Value for channel 1 */
#define POS_CALC_REG_DSP_MONIT_AMP_CH1 0x00000054
/* [0x58]: REG Monit. Amplitude Value for channel 2 */
#define POS_CALC_REG_DSP_MONIT_AMP_CH2 0x00000058
/* [0x5c]: REG Monit. Amplitude Value for channel 3 */
#define POS_CALC_REG_DSP_MONIT_AMP_CH3 0x0000005c
/* [0x60]: REG Monit. X Position Value */
#define POS_CALC_REG_DSP_MONIT_POS_X 0x00000060
/* [0x64]: REG Monit. Y Position Value */
#define POS_CALC_REG_DSP_MONIT_POS_Y 0x00000064
/* [0x68]: REG Monit. Q Position Value */
#define POS_CALC_REG_DSP_MONIT_POS_Q 0x00000068
/* [0x6c]: REG Monit. Sum Position Value */
#define POS_CALC_REG_DSP_MONIT_POS_SUM 0x0000006c
/* [0x70]: REG Monit. Amp/Pos update trigger */
#define POS_CALC_REG_DSP_MONIT_UPDT 0x00000070
/* [0x74]: REG Monit. 1 Amplitude Value for channel 0 */
#define POS_CALC_REG_DSP_MONIT1_AMP_CH0 0x00000074
/* [0x78]: REG Monit. 1 Amplitude Value for channel 1 */
#define POS_CALC_REG_DSP_MONIT1_AMP_CH1 0x00000078
/* [0x7c]: REG Monit. 1 Amplitude Value for channel 2 */
#define POS_CALC_REG_DSP_MONIT1_AMP_CH2 0x0000007c
/* [0x80]: REG Monit. 1 Amplitude Value for channel 3 */
#define POS_CALC_REG_DSP_MONIT1_AMP_CH3 0x00000080
/* [0x84]: REG Monit. 1 X Position Value */
#define POS_CALC_REG_DSP_MONIT1_POS_X 0x00000084
/* [0x88]: REG Monit. 1 Y Position Value */
#define POS_CALC_REG_DSP_MONIT1_POS_Y 0x00000088
/* [0x8c]: REG Monit. 1 Q Position Value */
#define POS_CALC_REG_DSP_MONIT1_POS_Q 0x0000008c
/* [0x90]: REG Monit. 1 Sum Position Value */
#define POS_CALC_REG_DSP_MONIT1_POS_SUM 0x00000090
/* [0x94]: REG Monit. 1 Amp/Pos update trigger */
#define POS_CALC_REG_DSP_MONIT1_UPDT 0x00000094
/* [0x98]: REG FIFO 'AMP FIFO Monitoring' data output register 0 */
#define POS_CALC_REG_AMPFIFO_MONIT_R0 0x00000098
/* [0x9c]: REG FIFO 'AMP FIFO Monitoring' data output register 1 */
#define POS_CALC_REG_AMPFIFO_MONIT_R1 0x0000009c
/* [0xa0]: REG FIFO 'AMP FIFO Monitoring' data output register 2 */
#define POS_CALC_REG_AMPFIFO_MONIT_R2 0x000000a0
/* [0xa4]: REG FIFO 'AMP FIFO Monitoring' data output register 3 */
#define POS_CALC_REG_AMPFIFO_MONIT_R3 0x000000a4
/* [0xa8]: REG FIFO 'AMP FIFO Monitoring' control/status register */
#define POS_CALC_REG_AMPFIFO_MONIT_CSR 0x000000a8
/* [0xac]: REG FIFO 'POS FIFO Monitoring' data output register 0 */
#define POS_CALC_REG_POSFIFO_MONIT_R0 0x000000ac
/* [0xb0]: REG FIFO 'POS FIFO Monitoring' data output register 1 */
#define POS_CALC_REG_POSFIFO_MONIT_R1 0x000000b0
/* [0xb4]: REG FIFO 'POS FIFO Monitoring' data output register 2 */
#define POS_CALC_REG_POSFIFO_MONIT_R2 0x000000b4
/* [0xb8]: REG FIFO 'POS FIFO Monitoring' data output register 3 */
#define POS_CALC_REG_POSFIFO_MONIT_R3 0x000000b8
/* [0xbc]: REG FIFO 'POS FIFO Monitoring' control/status register */
#define POS_CALC_REG_POSFIFO_MONIT_CSR 0x000000bc
/* [0xc0]: REG FIFO 'AMP FIFO Monitoring 1' data output register 0 */
#define POS_CALC_REG_AMPFIFO_MONIT1_R0 0x000000c0
/* [0xc4]: REG FIFO 'AMP FIFO Monitoring 1' data output register 1 */
#define POS_CALC_REG_AMPFIFO_MONIT1_R1 0x000000c4
/* [0xc8]: REG FIFO 'AMP FIFO Monitoring 1' data output register 2 */
#define POS_CALC_REG_AMPFIFO_MONIT1_R2 0x000000c8
/* [0xcc]: REG FIFO 'AMP FIFO Monitoring 1' data output register 3 */
#define POS_CALC_REG_AMPFIFO_MONIT1_R3 0x000000cc
/* [0xd0]: REG FIFO 'AMP FIFO Monitoring 1' control/status register */
#define POS_CALC_REG_AMPFIFO_MONIT1_CSR 0x000000d0
/* [0xd4]: REG FIFO 'POS FIFO Monitoring 1' data output register 0 */
#define POS_CALC_REG_POSFIFO_MONIT1_R0 0x000000d4
/* [0xd8]: REG FIFO 'POS FIFO Monitoring 1' data output register 1 */
#define POS_CALC_REG_POSFIFO_MONIT1_R1 0x000000d8
/* [0xdc]: REG FIFO 'POS FIFO Monitoring 1' data output register 2 */
#define POS_CALC_REG_POSFIFO_MONIT1_R2 0x000000dc
/* [0xe0]: REG FIFO 'POS FIFO Monitoring 1' data output register 3 */
#define POS_CALC_REG_POSFIFO_MONIT1_R3 0x000000e0
/* [0xe4]: REG FIFO 'POS FIFO Monitoring 1' control/status register */
#define POS_CALC_REG_POSFIFO_MONIT1_CSR 0x000000e4
#endif
