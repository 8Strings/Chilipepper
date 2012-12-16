/******************************************************************************
*
* (c) Copyright 2011 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
*******************************************************************************/
/*****************************************************************************/
/**
*
* @file nand.h
*
* This file contains the interface for the NAND FLASH functionality
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date        Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a ecm  01/10/10 Initial release
* 2.00a mb   30/05/12 added the flag XPAR_PS7_NAND_0_BASEADDR
* </pre>
*
* @note
*
******************************************************************************/
#ifndef ___NAND_H___
#define ___NAND_H___


#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/


#include "smc.h"

#ifdef XPAR_PS7_NAND_0_BASEADDR

#include "xnandps.h"
#include "xnandps_bbm.h"
/**************************** Type Definitions *******************************/

/************************** Constant Definitions *****************************/
#define NAND_CONTROLLER_BASE_ADDRESS    XPS_PARPORT_CRTL_BASEADDR

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/
#define NandIn8         Xil_In8
#define NandOut8        Xil_Out8

#define NandIn32        Xil_In32
#define NandOut32       Xil_Out32
#endif
/************************** Function Prototypes ******************************/
u32 InitNand(void);

u32 NandAccess( u32 SourceAddress,
                u32 DestinationAddress,
                u32 LengthWords);

/************************** Variable Definitions *****************************/
#ifdef __cplusplus
}
#endif


#endif /* ___NAND_H___ */

