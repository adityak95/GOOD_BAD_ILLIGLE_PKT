class eth_bfm;
	eth_good_pkt g_pkt;
	eth_bad_pkt b_pkt;
	eth_ill_pkt i_pkt;
	eth_pkt pkt;
  	
	/*task run();
		forever begin 
		gen2bfm.get(pkt);
          case(pkt.pkt_type)
            0:begin
              g_pkt=new();
              gen2bfm.get(g_pkt);
              g_pkt.print("g_pkt BFM");
            end
            1:begin
              b_pkt=new();
              gen2bfm.get(b_pkt);
              i_pkt.print("b_pkt BFM");
            end
            2:begin
              i_pkt=new();
              gen2bfm.get(i_pkt);
              i_pkt.print("i_pkt BFM");
            end
          endcase
		end
	endtask*/
/*task run();  // polymorphism
		forever begin 
			pkt=new();
			gen2bfm.get(pkt);
			pkt.print("BFM");
		end
endtask*/
	task run();
		forever begin 
		common_pkt::gen2bfm.get(pkt);
          case(pkt.pkt_type)
            common_pkt::GOOD:begin
				$cast(g_pkt,pkt);
				g_pkt.print("good");
            end
            common_pkt::BAD:begin
				$cast(b_pkt,pkt);
				b_pkt.print("bad");
            end
            common_pkt::ILL:begin
				$cast(i_pkt,pkt);
				i_pkt.print("ill");
            end
          endcase
		end
	endtask
endclass

