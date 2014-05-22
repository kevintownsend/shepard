onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/stg4_pop_0
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/stg4_pop_1
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/stg4_pop_2
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/stg4_pop_3
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/is_match
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/r_req_st_res
add wave -noupdate -format Logic -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/tmp
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/stg4_ref_index
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/i
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/j
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/stg4_read
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/ref_check
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/r_ref_check
add wave -noupdate -format Literal -radix hexadecimal /testbench/cae_fpga0/ae_top/core/cae_pers/shepard0/check_unaligned
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
