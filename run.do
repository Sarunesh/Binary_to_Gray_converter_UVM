# Functional coverage
#vlib work
#vlog +incdir+D:/Sarunesh/Projects/UVM/LRM/uvm-1.2/uvm-1.2/src list.svh
#vsim -novopt -suppress 12110 top\
#-sv_lib D:/Sarunesh/Software/Questasim_10.7/questasim64_10.7c/uvm-1.2/win64/uvm_dpi\
#+UVM_TESTNAME=test_30
#run -all

# Coverage
vlog +incdir+D:/Sarunesh/Projects/UVM/LRM/uvm-1.2/uvm-1.2/src list.svh
vopt work.top +cover=fcbest -o count_30
vsim -coverage count_30 \
-sv_lib D:/Sarunesh/Software/Questasim_10.7/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
+UVM_TESTNAME=test_30 \
+UVM_VERBOSITY=UVM_HIGH
coverage save -onexit count_30.ucdb
#add wave -position insertpoint sim:/top/pif/*
run -all
