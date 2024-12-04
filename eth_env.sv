class eth_env;
eth_gen gen;
eth_bfm bfm;

	task run();
		gen=new();
		bfm=new();
		gen.run();
		bfm.run();
	endtask
endclass
