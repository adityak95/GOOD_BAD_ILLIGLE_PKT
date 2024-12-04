class eth_bad_pkt extends eth_pkt;
static int count_bad;

function  new();
	super.new();//calling base class new method
	count_bad++;
endfunction
function void  print(string str="eth_bad_pkt");
		super.print(str);
		$display("\t count_bad=%0d",count_bad);
endfunction
constraint pkt_type_c{
		pkt_type==common_pkt::BAD;
}

endclass
