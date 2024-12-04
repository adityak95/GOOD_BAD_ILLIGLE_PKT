/*typedef enum bit [1:0]{
	GOOD,
	BAD,
	ILL
}pkt_type_t;*/	

class eth_pkt; 
rand bit[55:0]preamble;
rand bit[7:0]sof;
rand bit[47:0]da;
rand bit[47:0]sa;
rand bit[15:0]length;
rand bit[7:0]payload[$];
	 bit[15:0]crc;
	 static int count;
rand common_pkt::pkt_type_t pkt_type;

constraint preamble_c{
			preamble=={28{2'b10}};
}
constraint sof_c{
			sof==8'b10101011;
}
constraint len_c{
			length inside {[42:1500]};
}
constraint payload_c{
			payload.size()==length;
}


function new();
		count++;
endfunction


function void print(string str="eth_pkt");
	$display("print %s randamization",str);
	$display("preamble=%b",preamble);
	$display("sof=%b",sof);
	$display("da=%h",da);
	$display("sa=%h",sa);
	$display("length=%0d",length);
	$display("payload=%p",payload);
	$display("crc=%o",crc);
  $display("count=%0d",count);
  $display("pkt_type=%s",pkt_type);
  //$display("@@@@@#####@@@@@");
endfunction

endclass
