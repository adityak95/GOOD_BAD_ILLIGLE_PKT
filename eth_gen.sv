class eth_gen;
eth_good_pkt good_pkt;
eth_bad_pkt bad_pkt;
eth_ill_pkt ill_pkt;
bit[1:0]pkt_type_g;
//string testcase;
//int count;
task run();
case(common_pkt::testcase)
	"n_no_of_good_pkts":begin 
	  repeat(common_pkt::count)begin 
		good_pkt=new(); 
        good_pkt.randomize(); 
		common_pkt::gen2bfm.put(good_pkt);
		good_pkt.print("GOOD_PKT");
	  end
	end
	"n_no_of_bad_pkts":begin 
	  repeat(common_pkt::count)begin 
		bad_pkt=new();
        bad_pkt.randomize();
		common_pkt::gen2bfm.put(bad_pkt);
		bad_pkt.print("BAD_PKT");
	  end

	end
	"n_no_of_ill_pkts":begin 
	  repeat(common_pkt::count)begin 
		ill_pkt=new();
        ill_pkt.randomize();
		common_pkt::gen2bfm.put(ill_pkt);
		ill_pkt.print("ILLIGAL_PKT");
	  end
	end
	"Random_n_no_of_pkts":begin 
	  repeat(common_pkt::count)begin 
	    pkt_type_g=$urandom_range(0,2);
	    $display("####  pkt_type_g =%0d #######",pkt_type_g);
		case(pkt_type_g)
			0:begin
					good_pkt=new(); 
        	        good_pkt.randomize(); 
					common_pkt::gen2bfm.put(good_pkt);
					good_pkt.print("GOOD_PKT");
			end
			1:begin 
				bad_pkt=new();
                bad_pkt.randomize();
				common_pkt::gen2bfm.put(bad_pkt);
				bad_pkt.print("BAD_PKT");
			end
			2:begin 
				ill_pkt=new();
                ill_pkt.randomize();
				common_pkt::gen2bfm.put(ill_pkt);
				ill_pkt.print("ILLIGAL_PKT");
			end
        endcase
		end
		end
	endcase
endtask
endclass


