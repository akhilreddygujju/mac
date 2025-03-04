// README.txt//


Question:1

Make sure mac1.v(design file) and mac_tb.v(testbench file) are included in the bin folder.

Commands:

For output verification:

	iverilog -o mac_tb.vvp mac_tb.v
	vvp mac_tb.vvp


Question:2

Make sure test1.v(design file) and 4matrix_tb.v, quant_tb.v, act_tb.v(testbench files) are included in the bin folder.

Commands:

For ouptut verification:


4x4 systolic matrix multiply unit:


	iverilog -o 4matrix_tb.vvp 4matrix_tb.v

	vvp 4matrix_tb.vvp


quantization unit:
		
		iverilog -o quant_tb.vvp quant_tb.v

		vvp quant_tb.vvp

activation unit:


		iverilog -o act_tb.vvp act_tb.v

		vvp act_tb.vvp


Question3:



	
