#include "Vsinegen.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env) {
    int i;
    int clk;


    Verilated::commandArgs(argc, argv);
    //init verilog instance
    Vsinegen* top = new Vsinegen;
    //init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace (tfp,99);
    tfp->open ("sinegen.vcd");

    //init vbuddy
    if (vbdOpen() !=1) return(-1);
    vbdHeader ("Lab 2: sinegen");

    //initialize
    top->clk = 1;
    top->rst = 1;
    top->en = 0;
    top->incr = 2;
    top->step = 64;


    //run simulation for many cycles
    for (i=0;i<1000000;i++) {
        //dump variables in VCD file and toggle variables
        for (clk=0; clk<2; clk++) {
            tfp->dump (2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }
        //plot sinewave
        vbdPlot(int(top->dout2), 0, 255);

        vbdPlot(int(top->dout), 0, 255);
        vbdCycle(i+1);
        //end input selection

        //change input stimuli
        top->rst = 0;
        top->en = vbdFlag();
        top->step = vbdValue();
        if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) exit(0);

    }

    vbdClose();
    tfp->close();
    exit(0);

}